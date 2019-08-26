Apps powered by Bert
---------------------

Bert as Service
https://github.com/hanxiao/bert-as-service

Bert Pre-trained models:
https://github.com/google-research/bert#pre-trained-models

#### Download model then unzip
```
make download-model
```

#### Install requirements
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

#### Start bert serving - English
```bash
bert-serving-start -model_dir models/uncased_L-12_H-768_A-12/ -num_worker=4
```

#### Start bert serving - Multilingual
```bash
https://storage.googleapis.com/bert_models/2018_11_23/multi_cased_L-12_H-768_A-12.zip

bert-serving-start -model_dir models/uncased_L-12_H-768_A-12/ -num_worker=4
```