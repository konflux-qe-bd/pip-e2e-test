FROM registry.access.redhat.com/ubi9/python-39@sha256:9cea5d0cbe82176d5f21781f440ddf077f03beff304f051aa698640731404db7

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
