FROM registry.access.redhat.com/ubi9/python-39@sha256:e93cdc219b86c4c4ff5b2637e6d845d2fdfdee26ecfec8cb7f19af7b8e890f1e

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
