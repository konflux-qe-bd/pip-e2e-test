FROM registry.access.redhat.com/ubi9/python-39@sha256:c934d87840b237cb56f6ff87cbc963cc64e7156337edd3040452f1be817f2891

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
