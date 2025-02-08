FROM registry.access.redhat.com/ubi9/python-39@sha256:9a31f03f8b27d9065c3488bbd3650c67271c3b868eacf816ddea07ababd9fbc0

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
