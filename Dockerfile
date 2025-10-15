FROM registry.access.redhat.com/ubi9/python-39@sha256:dee7605bfc0cc89b83075937cd48ff7b61bf5e396f8bd2ae13e7f7299be53326

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
