#!/bin/bash

# This script applies amdvlk-pro/amdvlk/radv/nvidia Vulkan driver for specific application.
# You can see the list of available drivers with vulkaninfo utility, see the driverName and driverID lines.
# 
# Usage:
#   <vk_radv|vk_amdvlk|vk_pro|vk_nvidia> <app and its parameters>
# For example:
#   $ vk_pro vkmark
# This will start vkmark with AMDGPU PRO vulkan driver.

# When amdvlk is installed, then VK_ICD_FILENAMES is ignored and AMD_VULKAN_ICD is read instead. However, AMD_VULKAN_ICD does not allow you (afaics) select pro driver.
# So we revert this behavior to standard one.
export DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1

ICD_DIR="/usr/share/vulkan/icd.d"

vk_radv() {
    export VK_ICD_FILENAMES="${ICD_DIR}/radeon_icd.i686.json:${ICD_DIR}/radeon_icd.x86_64.json"
}

vk_amdvlk() {
    export VK_ICD_FILENAMES="${ICD_DIR}/amd_icd32.json:${ICD_DIR}/amd_icd64.json"
}

vk_pro() {
    export VK_ICD_FILENAMES="${ICD_DIR}/amd_pro_icd32.json:${ICD_DIR}/amd_pro_icd64.json"
}

vk_nvidia() {
    export VK_ICD_FILENAMES="${ICD_DIR}/nvidia_icd.json"
}

if [[ $(basename $0) == vk_radv ]]; then
    vk_radv
elif [[ $(basename $0) == vk_amdvlk ]]; then
    vk_amdvlk
elif [[ $(basename $0) == vk_pro ]]; then
    vk_pro
elif [[ $(basename $0) == vk_nvidia]]; then
    vk_nvidia
else
    echo "Unknown function"
    exit 1
fi

# applied variables, now execute the rest of the command
"$@"
