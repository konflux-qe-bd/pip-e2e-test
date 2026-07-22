FROM registry.access.redhat.com/ubi9/python-39@sha256:9fccf70864802116b387ee3b4a3748493b21f3d8ff8409bee9ebd15947726a31

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
