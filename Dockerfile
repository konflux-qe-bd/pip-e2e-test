FROM registry.access.redhat.com/ubi9/python-39@sha256:0758ea0a2e5f931c33635a37592ea8672b998a58af5f032463852b296242f510

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
