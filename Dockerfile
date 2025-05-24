FROM sagemath/sagemath:10.4

# Ενημέρωση pip και εγκατάσταση voila + nbformat
RUN sage -pip install --upgrade pip && \
    sage -pip install --upgrade voila nbformat

# Εγκατάσταση ipykernel
RUN sage -python -m pip install ipykernel

# Εγκατάσταση Sage kernel με αναγνωρίσιμο όνομα
RUN sage -python -m ipykernel install --name "sagemath" --display-name "SageMath" --user

WORKDIR /app
COPY . /app

EXPOSE 8866
# Στο τέλος του Dockerfile, ΠΡΙΝ το CMD
RUN mkdir -p /home/sage/.sage && chmod -R 777 /home/sage/.sage
ENV IPYTHONDIR=/home/sage/.sage

CMD ["sage", "-python", "-m", "voila", "--port=8866", "--no-browser", "--Voila.ip=0.0.0.0"]
