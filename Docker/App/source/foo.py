"""
Script using Python scientific packages to do stuff.
"""

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


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
