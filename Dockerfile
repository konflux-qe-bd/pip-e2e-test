FROM registry.access.redhat.com/ubi9/python-39@sha256:5b0da78d4d141cda7bde177b311743ae4e57685c33766d6b364fd0e8e4b56167

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
