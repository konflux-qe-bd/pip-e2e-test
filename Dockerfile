FROM registry.access.redhat.com/ubi9/python-39@sha256:ec9233964295623af757a5d1d522010f130e0e5d528a2521e731686a86b7953b

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
