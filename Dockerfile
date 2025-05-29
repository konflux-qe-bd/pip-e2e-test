FROM registry.access.redhat.com/ubi9/python-39@sha256:f29fbe7a5990f195a89dd1d0ae8cfdb5fb57bbadfe950d5e6f541f5c2aaf8cb5

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
