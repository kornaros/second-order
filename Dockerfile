FROM sagemath/sagemath:10.4

RUN sage -pip install --upgrade pip && \
    sage -pip install --upgrade voila nbformat ipykernel && \
    sage -python -m ipykernel install --name "sagemath" --display-name "SageMath" --user

WORKDIR /app
COPY . /app
RUN sage -python -m jupyter trust /app/second_order.ipynb
RUN mkdir -p /home/sage/.sage && chmod -R 777 /home/sage/.sage
ENV IPYTHONDIR=/home/sage/.sage

EXPOSE 8866

CMD ["sage", "-python", "-m", "voila", "second_order.ipynb", \
     "--port=8866", "--no-browser", "--Voila.ip=0.0.0.0"]
