FROM registry.access.redhat.com/ubi9/python-39@sha256:1274f0a1d993191e5e1d0f6b0b039b02ca71bb70ef0c85061a3c4492bacf54c3

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
