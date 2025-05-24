# Base image με SageMath που περιέχει ήδη Python και Jupyter
FROM sagemath/sagemath:10.4

# Ενημέρωση pip και εγκατάσταση voila
RUN pip install --upgrade pip && \
    pip install voila

# Ορισμός του working directory μέσα στο container
WORKDIR /app

# Αντιγραφή ολόκληρου του repo (δηλαδή τον φάκελο second-order)
COPY . /app
#δημιουργεί σφάλμα! COPY second-order /app/second-order

# Ορισμός της θύρας που θα "ακούει" η εφαρμογή (voila default 8866)
EXPOSE 8866

# Command για να τρέξει το Voila με το notebook σου
CMD ["voila", "second-order/second_order.ipynb", "--port=8866", "--no-browser", "--Voila.ip=0.0.0.0"]
