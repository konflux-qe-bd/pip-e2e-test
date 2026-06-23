FROM registry.access.redhat.com/ubi9/python-39@sha256:a82b87b49cb9864e11c0198e63008f1dbcbf03b1703f159b91982c49cf4c45a5

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
