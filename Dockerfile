FROM registry.access.redhat.com/ubi9/python-39@sha256:eb65add9b84a3d3ac104b7bc091f49faffe9e69aef8bafb0654547b1708c4841

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
