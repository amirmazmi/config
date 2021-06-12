### one-liner to check for tensorflow  

execute this in the virtualenv AFTER installing tensorflow-gpu  
`python -c "import tensorflow as tf;print(f'\n\nRESULTS: {tf.reduce_sum(tf.random.normal([1000, 1000]))}\n\n' )"`

<br>  

### check physical devices
```  
import tensorflow as tf
tf.config.list_physical_devices('gpu')'
```

<br>  

how to run deviceQuery  
https://www.pascal-man.com/gpu-cuda/CUDA-installation.shtml
  
<br>  

Link to library  
https://forums.developer.nvidia.com/t/cannot-open-input-file-cudart-static-lib-or-cudart-lib-while-trying-to-run-devicequery/66735/3
