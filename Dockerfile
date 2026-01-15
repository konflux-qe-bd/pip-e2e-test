FROM registry.access.redhat.com/ubi9/python-39@sha256:b28387e6c2c66bf2092748bd618036ac48b287ba042f8f353d47118480d0eaf6

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
