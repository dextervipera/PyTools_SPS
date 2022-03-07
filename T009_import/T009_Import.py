# -*- coding: utf-8 -*-
#Dataclasses

"""
Spyder Editor

The basic load data example
"""

import pandas as pd

# Importatnt: the original file end-of line is LF, may change to CRLF if needed

Cu_data=pd.read_csv("kolumny_Cu_slupek-objetosc.csv", sep=',',header=0)
NiAl_data=pd.read_csv("kolumny_Cu_slupek-objetosc.csv", sep=',',header=0)