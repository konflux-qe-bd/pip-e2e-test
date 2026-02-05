FROM registry.access.redhat.com/ubi9/python-39@sha256:a28f1a4db5e2c62f5d2fc2e764c1d763b5570eb498c3b16bfa0fdc887248b500

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
