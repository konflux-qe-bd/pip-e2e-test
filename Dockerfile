FROM registry.access.redhat.com/ubi9/python-39@sha256:c9e27387a522762a28ece41494070915066b335a47ecf474ebecb08e53e59dbe

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
