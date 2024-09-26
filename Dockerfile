FROM registry.access.redhat.com/ubi9/python-39@sha256:feda42148febbbadaf2ad594a342462b7d0260428e38503c0720610193fb24b6

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
