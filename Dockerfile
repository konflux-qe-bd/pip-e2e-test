FROM registry.access.redhat.com/ubi9/python-39@sha256:089d74899673657f24e2f5ebd843322ff344065ab711a932be40d4d3fb83a88d

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
