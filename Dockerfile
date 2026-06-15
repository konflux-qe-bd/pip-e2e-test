FROM registry.access.redhat.com/ubi9/python-39@sha256:91419cebe40f8ae7a688ba4dd5cf1aab1371550bf6d0dd3b652c19d1c5a37f4d

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
