# Base image με SageMath που περιέχει ήδη Python και Jupyter
FROM sagemath/sagemath:10.4

# Ενημέρωση pip και εγκατάσταση voila
RUN pip install --upgrade pip && \
    pip install voila

# Ορισμός του working directory μέσα στο container
WORKDIR /app

# Αντιγραφή όλων των αρχείων του repo στη ρίζα του container
COPY . /app

# Ορισμός της θύρας που θα "ακούει" η εφαρμογή (voila default 8866)
EXPOSE 8866

# Εκκίνηση του voila πάνω στο notebook
CMD ["voila", "second_order.ipynb", "--port=8866", "--no-browser", "--Voila.ip=0.0.0.0"]
