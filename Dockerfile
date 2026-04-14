FROM registry.access.redhat.com/ubi9/python-39@sha256:c3d30a724ff5781cd470979300aa9b2700098c3a8ca1b0e4e5c75080294f33e5

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
