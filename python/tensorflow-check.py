# one-liner to check for tensorflow

# execute this in the virtualenv AFTER installing tensorflow-gpu
python -c "import tensorflow as tf;print(f'\n\nRESULTS: {tf.reduce_sum(tf.random.normal([1000, 1000]))}\n\n' )"
