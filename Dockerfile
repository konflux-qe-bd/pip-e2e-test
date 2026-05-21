FROM registry.access.redhat.com/ubi9/python-39@sha256:5c5b97289a7f7103ffccf7b7f350025f9d50dafcfdcf26f841ffa5916adefb51

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
