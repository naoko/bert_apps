.PHONY: help
help:
	@echo "    download-model"
	@echo "        Download bert pre-trained model"
	@echo "    start-action-server"
	@echo "        Start action server container"
	@echo "        please set env var BOT_ACTION_META"
	@echo "    push-action-server-image"
	@echo "        Push action server image to repo"


.PHONY: download-model
download-model:
	@echo ">>> Downloading bert pre-trained model"
	mkdir  models
	cd models && \
	wget https://storage.googleapis.com/bert_models/2018_10_18/uncased_L-12_H-768_A-12.zip && \
	unzip uncased_L-12_H-768_A-12.zip && \
	rm uncased_L-12_H-768_A-12.zip
