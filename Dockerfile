FROM python:3.9

# Install transitive dependencies
RUN apt-get update \
 && apt-get install -y libspatialindex-dev gdal-bin libgdal-dev proj-bin libproj-dev

# Set environment variables for GDAL
ENV GDAL_CONFIG=/usr/bin/gdal-config \
    GDAL_VERSION=3.8 \
    PROJ_DIR=/usr

# Install pdgstaging from GitHub repo using pip
RUN pip install git+https://github.com/PermafrostDiscoveryGateway/viz-staging.git

# Set the working directory
WORKDIR /app

# Default command to execute when the container starts
CMD ["python3"]
