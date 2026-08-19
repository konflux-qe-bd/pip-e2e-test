FROM registry.access.redhat.com/ubi9/python-39@sha256:8bb41ebd443ea7666ab09db410fb6e2c8de1599ad22af70491b95df1decd6b0e

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
