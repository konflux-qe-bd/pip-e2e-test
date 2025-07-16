FROM registry.access.redhat.com/ubi9/python-39@sha256:d3a8113accb685a6b4c6fb23fc465821a408869e877dbba3e07283f3c3cdbf4e

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
