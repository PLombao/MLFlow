FROM python:3.6

ENV MLFLOW_VERSION 1.4
ENV TERM linux
ENV BUCKET bucket

RUN pip install mlflow==$MLFLOW_VERSION
RUN pip install google-cloud-storage
RUN mkdir -p /mlflow/

EXPOSE 5000

CMD mlflow server \
  --backend-store-uri mysql+pymysql://root:dxc.finsa@35.241.178.118/persistence \
  --default-artifact-root gs://plataformabidatafinsa-test-mlflow/mlflow \
  --host 0.0.0.0
