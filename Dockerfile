FROM registry.access.redhat.com/ubi9/python-39@sha256:b9108903952cd10cc4adc240da79db97f9f49075bfc8ff0f582348ab50959e0b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
