FROM registry.access.redhat.com/ubi9/python-39@sha256:08d36504594394fc17d515cf89bf5d4acc08d5fd42afea2d7b6aa478f6a95f54

# Test disabled network access
RUN if curl -IsS www.google.com; then echo "Has network access!"; exit 1; fi

WORKDIR /opt/test_package_cachi2
COPY . .

RUN pip install -r requirements.txt

CMD ["python", "/opt/test_package_cachi2/src/test_package_cachi2/main.py"]
