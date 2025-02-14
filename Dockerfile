FROM registry.access.redhat.com/ubi9/python-39@sha256:c5180b2ecc2f662d614406498893b43e6914bf419e5605c0fe973cc610ea7369

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
