FROM registry.access.redhat.com/ubi9/python-39@sha256:db5a0fc74728e23de67f38fa864c9038ce61a93066599c1cd250e41a20507ce8

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
