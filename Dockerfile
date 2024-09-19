FROM registry.access.redhat.com/ubi9/python-39@sha256:278ae38e8f28ccba3cb7cd542f684d739a84f771e418fc8018d07a522205b05c

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
