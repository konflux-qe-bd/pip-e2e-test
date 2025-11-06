FROM registry.access.redhat.com/ubi9/python-39@sha256:8093b0752e9cce0019c0708f55a032c158d70fefe31a2dcb13d179311e356e5e

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
