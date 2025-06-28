FROM registry.access.redhat.com/ubi9/python-39@sha256:a49364adae4cd27b1b4c469174f9bd4988ea4191c4dcb7da5a2d44513e590ba7

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
