FROM registry.access.redhat.com/ubi9/python-39@sha256:8112ecca0a3c25a964de3999463404f4386a5e291655600d05e645c6b29a389f

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
