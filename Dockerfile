FROM registry.access.redhat.com/ubi9/python-39@sha256:48cf1809a792009e8195155456088a8e7055be1f903cb15c9bfae55b422c4cca

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
