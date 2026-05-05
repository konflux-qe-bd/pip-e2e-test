FROM registry.access.redhat.com/ubi9/python-39@sha256:e3c169a0e82c383845d0ac1a4c6a6bbf9e4a9fe680c016c5301f3199ec2c59b3

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
