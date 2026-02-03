FROM registry.access.redhat.com/ubi9/python-39@sha256:db255d9c5e3d4aa0f444af6a960befa1bb271b3472b3117e9562b8bcf7f6097b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
