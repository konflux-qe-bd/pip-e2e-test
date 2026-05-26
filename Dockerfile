FROM registry.access.redhat.com/ubi9/python-39@sha256:8901772a583584f39da31d2798cb638d16355667deb242817013ed401a4b0ed2

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
