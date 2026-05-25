FROM registry.access.redhat.com/ubi9/python-39@sha256:071694c67eab3bc53d0a267bc4970a21338f836af9f0a9536eefe320d727ed03

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
