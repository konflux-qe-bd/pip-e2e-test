FROM registry.access.redhat.com/ubi9/python-39@sha256:e72da40b5eb30d787e0c7fa6dc7eb61a62f1c61ac6b7c437957abaa80e6accf0

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
