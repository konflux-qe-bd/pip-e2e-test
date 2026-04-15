FROM registry.access.redhat.com/ubi9/python-39@sha256:eec611b46ccef89b2d7bd9967542630689cd39981e9b4f36b4493f1cacfeba60

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
