DIR =${shell pwd}

VULKAN_SDK_PATH = $(HOME)/libs/1.1.130.0/x86_64
LIBRARY_PATH=$(DIR)
LIBRARY_PATH :=libraries

CFLAGS = -std=c++17 -O0 -I$(VULKAN_SDK_PATH)/include -g -I$(LIBRARY_PATH)

LDFLAGS = -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/vulkan/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest
