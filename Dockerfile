FROM registry.access.redhat.com/ubi9/python-39@sha256:84c028923cd3c8554c9b5c1423a553a4cb8f3ee88c17a3d87756c9b08f5e8fe7

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
