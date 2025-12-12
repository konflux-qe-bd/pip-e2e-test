FROM registry.access.redhat.com/ubi9/python-39@sha256:8b817c728990c39e8e9a40a5b9ec0fc1ed78656b8cf052b1c06a88373ad1bde8

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
