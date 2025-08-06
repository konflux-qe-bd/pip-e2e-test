FROM registry.access.redhat.com/ubi9/python-39@sha256:d472177f6de3e683f6b68fb0a45f0c0644302e89888933f85520b95c16ef7cfe

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
