apt update
apt install git wget
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b
export PATH=/root/miniconda3/bin:$PATH
conda init

git clone https://github.com/JonathonLuiten/Dynamic3DGaussians.git
cd Dynamic3DGaussians

conda env create --file environment.yml
conda activate dynamic_gaussians

git clone https://github.com/JonathonLuiten/diff-gaussian-rasterization-w-depth.git
cd diff-gaussian-rasterization-w-depth
python setup.py install
pip install .

