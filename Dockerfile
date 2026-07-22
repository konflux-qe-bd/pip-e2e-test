FROM registry.access.redhat.com/ubi9/python-39@sha256:bcee6e0332a1e70431496f6713e69ea84e8eb9c4c2f99c1176a85a4b073e1584

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
