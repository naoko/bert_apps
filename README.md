Apps powered by Bert
---------------------

Bert as Service
https://github.com/hanxiao/bert-as-service

Bert Pre-trained models:
https://github.com/google-research/bert#pre-trained-models

Download model then unzip


Start bert serving 
```bash
bert-serving-start -model_dir models/uncased_L-12_H-768_A-12/ -num_worker=4
```
