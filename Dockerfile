FROM registry.access.redhat.com/ubi9/python-39@sha256:e9cefd15e474e7782e6f5c9a1563c98d61aa5fd14975b498aefdeba583178d7d

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
