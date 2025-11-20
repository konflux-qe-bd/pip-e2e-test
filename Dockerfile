FROM registry.access.redhat.com/ubi9/python-39@sha256:e0eb6facd13ae75bd85e1258795f53b767847eb5d62601457d960609db0c2a7b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
