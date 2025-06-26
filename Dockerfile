FROM registry.access.redhat.com/ubi9/python-39@sha256:9eb89c743533d3f830c040a650a8506dd648bd240d598d38aba857d88d3db6b5

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
