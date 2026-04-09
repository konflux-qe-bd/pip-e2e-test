FROM registry.access.redhat.com/ubi9/python-39@sha256:c094e08464403239242fe5d769c55c61079e0d6afcd6e4adb3d713971c5697f8

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
