.PHONY: help
help:
	@echo "    download-model"
	@echo "        Download bert pre-trained model"
	@echo "    download-model-multi"
	@echo "        Download bert pre-trained multi-lingual model"
	@echo ""
	@echo "    start-bert-serving"
	@echo "        Start bert serving with English model"
	@echo "    start-bert-serving-multi"
	@echo "        Start bert serving with English model"


.PHONY: download-model
download-model:
	@echo ">>> Downloading bert pre-trained model"
	mkdir -p models
	cd models && \
	wget https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip && \
	unzip uncased_L-12_H-768_A-12.zip && \
	rm uncased_L-12_H-768_A-12.zip

.PHONY: download-model
download-model-multi:
	@echo ">>> Downloading bert pre-trained multi-lingual model"
	mkdir -p models
	cd models && \
	wget https://storage.googleapis.com/bert_models/2018_11_23/multi_cased_L-12_H-768_A-12.zip && \
	unzip multi_cased_L-12_H-768_A-12.zip && \
	rm multi_cased_L-12_H-768_A-12.zip

.PHONY: start-bert-serving
start-bert-serving:
	@echo ">>> Starting bert serving with English model"
	bert-serving-start -model_dir models/uncased_L-12_H-768_A-12/ -num_worker=4

.PHONY: start-bert-serving-multi
start-bert-serving-multi:
	@echo ">>> Starting bert serving with English model"
	bert-serving-start -model_dir models/multi_cased_L-12_H-768_A-12/ -num_worker=4
