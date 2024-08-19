FROM registry.access.redhat.com/ubi9/python-39@sha256:dbaa6cb3c0e9f9e017aa9f3ed184a450e8103f07017c8061fbc65453924cf649

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
