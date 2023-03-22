

## Notebook Magic

`%pip install <package>`


<br> 

## Plotly

#### Required
`pip install "notebook>=5.3" "ipywidgets>=7.2"`

<br>

#### Plotly rendering
```
import plotly.io as pio  
pio.renderers.default = 'notebook_connected'  
px.defaults.width, px.defaults.height = 950, 850  
```



<br><br>
