#!/bin/bash

set -xeuo pipefail

/etc/eks/bootstrap.sh --apiserver-endpoint ${endpoint} --b64-cluster-ca ${certificate_authority} ${cluster-name}

