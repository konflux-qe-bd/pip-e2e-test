FROM registry.access.redhat.com/ubi9/python-39@sha256:dde5068ba8fd81eef41a9128ddad2b99e2e02e5869ffe925c605b609a0ad7bbb

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
