#!/usr/bin/env python
# coding: utf-8

# In[132]:


cd


# In[133]:


cd C:/Users/ubaid.LAPTOP-60AEGHFJ/Desktop


# In[134]:


import pandas as pd
import numpy as np
import re


# In[135]:


df = pd.read_csv('New_York_City_Leading_Causes_of_Death_Original.csv')


# In[136]:


new_df = df.dropna()
print(new_df.to_string())


# In[137]:


new_df


# In[138]:


df.describe()


# In[139]:


new_df = df.replace(['M','F'],['Male','Female'])
new_df


# In[140]:


def remove_numbers(text):
    text = re.sub('[\d,(),I,J,-]', ' ', text)
    return text


# In[141]:


new_df['Leading Cause'] = new_df['Leading Cause'].apply(lambda x:remove_numbers(x))
new_df.head()


# In[142]:


new_df.set_index('Year', inplace = True)


# In[143]:


new_df


# In[144]:


new_df.to_csv('Process_Data')


# In[145]:


new_df


# In[ ]:




