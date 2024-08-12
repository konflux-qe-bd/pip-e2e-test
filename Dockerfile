FROM registry.access.redhat.com/ubi9/python-39@sha256:0176b477075984d5a502253f951d2502f0763c551275f9585ac515b9f241d73d

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
