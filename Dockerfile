FROM registry.access.redhat.com/ubi9/python-39@sha256:828611e40d69b213679cbd47ac1042eff6b5d138429f5ba686f3944492eb6e47

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
