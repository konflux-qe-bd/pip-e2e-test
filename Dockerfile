FROM registry.access.redhat.com/ubi9/python-39@sha256:796fe7f61b18571300928cc27595aa648c2d03f61894ff4087d9bc6ca3a50143

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
