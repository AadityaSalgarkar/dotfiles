# For pytorch based projects
- Use uv for setting up env
- Use the following template rather than starting from scratch
https://github.com/ashleve/lightning-hydra-template
- Use hydra code for config management and always stick to config based
  developement
- Always import the following 
import torch
import torch.nn as nn 
import torch.nn.functional as F
import torch.optim as optim

- Write nn.Module such that each forward pass operation is a pure function.
Example: ResidualAdd(x: Tensor_B_S_D, y: Tensor_B_S_D) -> Tensor_B_S_D
- Type hinting rules: Always use type hinting. The type should never be torch
  submodule directly. It should be a meaningful name that describes the type of
object and size. Use alias at the top of the file.
Example : Attention_B_N_N = torch.Tensor
Attention_B_N_N = F.scaled_dot_product_attention(...)
- Use einops ,reduce and rearrange. DO NOT use matmul, @ multiplication or transpose.
  Docs (https://einops.rocks/pytorch-examples.html)
- Always use wandb for tracking and give meaningful names to projects and experiment runs which include datetime dd_mm_yy_hh_mm at the end
- Reproducibility
import random, numpy as np, torch
seed = 42
random.seed(seed)
np.random.seed(seed)
torch.manual_seed(seed)
torch.backends.cudnn.deterministic = True
- Naming conventions:
Type 	Convention 	Example
Packages & Modules 	lower_with_under 	from prefetch_generator import BackgroundGenerator
Classes 	CapWords 	class DataLoader
Constants 	CAPS_WITH_UNDER 	BATCH_SIZE=16
Instances 	lower_with_under 	dataset = Dataset
Methods & Functions 	lower_with_under() 	def visualize_tensor()
Variables 	lower_with_under 	background_color='Blue'


