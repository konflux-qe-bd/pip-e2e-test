FROM registry.access.redhat.com/ubi9/python-39@sha256:525ab063375303f8f80aeb76ed7f4b6e9226677afbb806964dff4ffcb6ba38d2

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
