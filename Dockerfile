FROM registry.access.redhat.com/ubi9/python-39@sha256:739f23a2ce5ac4ed5e4de6ec60ff583598fcfccb0d4ab591ff1b9c77477b3f7a

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
