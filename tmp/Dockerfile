ARG CUDA_VERSION=12.4.1
#################### BASE BUILD IMAGE ####################
# prepare basic build environment
FROM image-registry.openshift-image-registry.svc:5000/buildkite/nvidia-cuda:${CUDA_VERSION}-devel-ubuntu20.04 AS base

RUN if [ "$RUN_WHEEL_CHECK" = "true" ]; then \
        python3 check-wheel-size.py dist; \
    else \
        echo "Skipping wheel size check."; \
    fi
