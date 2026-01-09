FROM registry.access.redhat.com/ubi9/python-39@sha256:54ce28c1544eac8a1779841c7590a597c42609b96454a13bf0ba20438fd17f71

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
