FROM registry.access.redhat.com/ubi9/python-39@sha256:cb63177363df7917fd2eacb59036590ef2d736fb4c87abad2e6360975712b0c2

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
