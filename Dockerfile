FROM registry.access.redhat.com/ubi9/python-39@sha256:fbd060d93f4b0d973a34baf14e45a2b66dc913f9671ea40f8cf99dd9719fde54

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
