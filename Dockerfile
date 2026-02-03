FROM registry.access.redhat.com/ubi9/python-39@sha256:fecb260bdb384c3ae58925b6b6b3a8b519fd53ad88ca98e3bc44fa4bbd4722ea

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
