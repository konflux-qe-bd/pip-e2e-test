FROM registry.access.redhat.com/ubi9/python-39@sha256:bdc09052ddc6fca1b707b12672ce97c4ac538f412841a4d90c82e50d1bbf154f

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
