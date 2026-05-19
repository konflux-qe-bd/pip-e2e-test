FROM registry.access.redhat.com/ubi9/python-39@sha256:8829cfd1f126470f97831c44793054e6ab816d2cbe758f142721e6f7141b0349

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
