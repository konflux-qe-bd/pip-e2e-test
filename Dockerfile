FROM registry.access.redhat.com/ubi9/python-39@sha256:cc46d2979862d93e9da4d021e9100c7feb542dac3157acb2715b8baf54730c2b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
