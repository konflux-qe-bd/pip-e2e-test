FROM registry.access.redhat.com/ubi9/python-39@sha256:124b315a2e5f5cf84da2d68f0fd4978eb4d64755162f5c60e154e7da5b080ae6

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
