import logging
import azure.functions as func

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

def my_function():
    pd.plotting.register_matplotlib_converters()

    x = (np.random.normal(loc=1., scale=10, size=100))**2
    x_sqrt = np.sqrt(x)

    df = pd.DataFrame({"x": x, "x_sqrt": x_sqrt})

    fig, ax = plt.subplots(1, 1)
    ax.plot(df["x"])
    ax.plot(df["x_sqrt"])


    # Save to local
    fig.savefig("sample.svg")
    df.to_csv("sample.csv")

    # Dump to blob
    # TBA




def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    name = req.params.get('name')
    if not name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            name = req_body.get('name')

    if name:
        my_function()
        return func.HttpResponse(f"Hello {name}!")
    else:
        return func.HttpResponse(
             "Please pass a name on the query string or in the request body",
             status_code=400
        )


