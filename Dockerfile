FROM registry.access.redhat.com/ubi9/python-39@sha256:842eeb962621099270f52246499b16c7da5204b76d4a33c94d59339061404827

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
