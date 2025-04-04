FROM registry.access.redhat.com/ubi9/python-39@sha256:dd4267b8fae4fbaeefbc5396057cf4acfcc6e4147a5e1c1eb54240e2d6c1b1e6

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
