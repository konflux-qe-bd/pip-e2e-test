FROM registry.access.redhat.com/ubi9/python-39@sha256:c2112827949a0f2deb040bc8f2a57631daaddd453db2198258275668996dd65f

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
