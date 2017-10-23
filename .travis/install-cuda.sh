export CUDA=7.0-28
travis_retry wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1204/x86_64/cuda-7-0_${CUDA}_amd64.deb
travis_retry sudo dpkg -i cuda-7-0_${CUDA}_amd64.deb
travis_retry sudo apt-get update -qq
export CUDA_APT=${CUDA}
export CUDA_APT=${CUDA_APT/./-}
travis_retry sudo apt-get install -y cuda-drivers cuda-core-${CUDA_APT} cuda-cudart-dev-${CUDA_APT}
travis_retry sudo apt-get clean
export CUDA_HOME=/usr/local/cuda-${CUDA}
export LD_LIBRARY_PATH=${CUDA_HOME}/nvvm/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
export PATH=${CUDA_HOME}/bin:${PATH}

