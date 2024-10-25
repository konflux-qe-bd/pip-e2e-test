FROM registry.access.redhat.com/ubi9/python-39@sha256:12644d1a2d214bd1be7eac3a9b1e983a987d9452b78e4c6be9c863d5038b9338

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
