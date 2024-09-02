FROM registry.access.redhat.com/ubi9/python-39@sha256:3d7c53f679117193d072a93eeb38efdc3c3f7ad8c1e7adc0c6360319fa263b49

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
