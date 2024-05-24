FROM python:3.9-slim

# Install transitive dependencies
RUN apt-get update \
 && apt-get install -y git libspatialindex-dev gdal-bin libgdal-dev proj-bin libproj-dev

# Set environment variables for GDAL
ENV GDAL_CONFIG=/usr/bin/gdal-config \
    GDAL_VERSION=3.8 \
    PROJ_DIR=/usr

# Install pdgstaging from GitHub repo using pip
RUN pip install git+https://github.com/PermafrostDiscoveryGateway/viz-staging.git

WORKDIR /app

CMD ["python3"]
