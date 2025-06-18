FROM registry.access.redhat.com/ubi9/python-39@sha256:7d7dbfe4e208b4c71db010f2115d66aa6ba03034abe997ba274503f5283beb39

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
