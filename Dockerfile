FROM registry.access.redhat.com/ubi9/python-39@sha256:463c9ae02bb7aaefe1853444228a06ff6121e922a79ecd9c1bc4104f4147602d

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
