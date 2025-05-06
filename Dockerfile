FROM registry.access.redhat.com/ubi9/python-39@sha256:59f3aa83a24152eeee04c27d4cc5c2b9f50519a67acc153cdb382ac914f3d503

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
