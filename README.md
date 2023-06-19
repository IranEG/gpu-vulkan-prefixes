# GPU-Vulkan-Prefixes
Select needed Vulkan implementation with vk_nvidia, vk_radv, vk_amdvlk, or vk_pro prefix.

## Index

1. [Introduction ](#intro)

<a name="intro"></a>
Introduction
------------
This builds upon Andrew Shark's [AMD-Vulkan-Prefix](https://gitlab.com/AndrewShark/amd-vulkan-prefixes) but adds the Nvidia Vulkan ICD path as well.

But why?
![](but-why.gif)
Well, in my new laptop I have an Nvidia dGPU and an AMD iGPU.
I noticed that when I used the AMD Vulkan Prefixes it would run certain games with the Radeon iGPU, but when I tried to switch to the Nvidia dGPU, I would have to set the VULKAN_ICD_FILENAMES environment variables for Nvidia manually.
This utility should take care of that use case.
