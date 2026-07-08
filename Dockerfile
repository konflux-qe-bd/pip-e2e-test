FROM registry.access.redhat.com/ubi9/python-39@sha256:aff70451c14d33a006683334e7afbe30d7725d4ff30bee8f9699630e10ea5488

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
