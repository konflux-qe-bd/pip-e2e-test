FROM registry.access.redhat.com/ubi9/python-39@sha256:18e6b5602b6ebbc81713815bc509dba47fc9b0b609617ebfd57fa0434a6538de

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
