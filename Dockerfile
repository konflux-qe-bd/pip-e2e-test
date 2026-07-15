FROM registry.access.redhat.com/ubi9/python-39@sha256:32a7b724c913a597e6f7dea80e2a8b43179b1bc055e1813f732c1c03f032b520

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
