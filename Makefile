VULKAN_SDK_PATH = /home/nathan/Downloads/1.1.130.0/x86_64
TINYOBJ_INCLUDE_PATH = /home/nathan/VulkanTest/libraries
STB_INCLUDE_PATH = /home/nathan/VulkanTest/libraries
CAMERA_INCLUDE_PATH = /home/nathan/VulkanTest/libraries
GLAD = /home/nathan/VulkanTest

CFLAGS = -std=c++17 -O0 -I$(VULKAN_SDK_PATH)/include -g -I$(STB_INCLUDE_PATH) -I$(TINYOBJ_INCLUDE_PATH) -I$(CAMERA_INCLUDE_PATH) -I$(GLAD)

LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/vulkan/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest
