FROM registry.access.redhat.com/ubi9/python-39@sha256:351f14d057c0c017b9153c81ef9a7a1a8c1356a4c63ec92e9db5f6397c027a89

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
