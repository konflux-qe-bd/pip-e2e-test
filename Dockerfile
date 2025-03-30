FROM registry.access.redhat.com/ubi9/python-39@sha256:dd3722b119e6d79cdd1a1e9d3a4414f7cc2ae9ef674cc27076e73234cc61758e

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
