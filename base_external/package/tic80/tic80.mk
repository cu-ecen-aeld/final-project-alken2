# Referenced from Claude Chat Log: https://claude.ai/share/dcab2d1f-6627-4877-890a-af3e6facc60e

TIC80_VERSION = v1.1.2837
TIC80_SITE = https://github.com/nesbox/TIC-80.git
TIC80_SITE_METHOD = git
TIC80_GIT_SUBMODULES = YES

TIC80_DEPENDENCIES = sdl2 libcurl

TIC80_CONF_OPTS = \
    -DBUILD_WITH_ALL=On \
    -DBUILD_SDLGPU=Off \
    -DBUILD_PLAYER_STANDALONE=Off \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DUSE_SYSTEM_SDL2=ON \
    -DSDL2_DIR=$(STAGING_DIR)/usr/lib/cmake/SDL2 \
    -DSDL2_INCLUDE_DIR=$(STAGING_DIR)/usr/include/SDL2 \
    -DSDL2_LIBRARY=$(STAGING_DIR)/usr/lib/libSDL2.so \
    -DBUILD_WITH_MRUBY=Off

define TIC80_PATCH_CMAKELISTS
	sed -i '/THIRDPARTY_DIR.*sdl2/d' $(@D)/CMakeLists.txt
	sed -i 's/if(BUILD_SDL AND BUILD_PLAYER AND NOT RPI)/if(FALSE)/' $(@D)/CMakeLists.txt
	sed -i 's/find_package(CURL REQUIRED)/find_package(CURL)/' $(@D)/CMakeLists.txt
	sed -i 's/set(USE_NAETT TRUE)/set(USE_NAETT FALSE)/' $(@D)/CMakeLists.txt
	sed -i 's/target_link_libraries(tic80 SDL2-static)/target_link_libraries(tic80 SDL2)/' $(@D)/CMakeLists.txt
	sed -i '/SYSROOT_PATH.*local.*SDL2/d' $(@D)/CMakeLists.txt
	sed -i 's|target_link_libraries(tic80 tic80studio)|target_link_libraries(tic80 tic80studio)\n    target_include_directories(tic80 PRIVATE $(STAGING_DIR)/usr/include/SDL2)|' $(@D)/CMakeLists.txt
	sed -i '/SYSROOT_PATH.*usr\/local\/lib\|SYSROOT_PATH.*opt\/vc\/lib/d' $(@D)/CMakeLists.txt
	sed -i 's/target_link_libraries(tic80 libSDL2.a bcm_host)/target_link_libraries(tic80 SDL2)/' $(@D)/CMakeLists.txt
	sed -i 's|$${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/prj2cart|$(@D)/build-host/bin/prj2cart|g' $(@D)/CMakeLists.txt
	sed -i 's|$${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/bin2txt|$(@D)/build-host/bin/bin2txt|g' $(@D)/CMakeLists.txt
	sed -i 's|$${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/wasmp2cart|$(@D)/build-host/bin/wasmp2cart|g' $(@D)/CMakeLists.txt
	sed -i 's/DEPENDS bin2txt prj2cart/DEPENDS/' $(@D)/CMakeLists.txt
	sed -i 's/DEPENDS bin2txt wasmp2cart/DEPENDS/' $(@D)/CMakeLists.txt
endef

TIC80_POST_PATCH_HOOKS += TIC80_PATCH_CMAKELISTS

define TIC80_BUILD_HOST_TOOLS
	env -i HOME="$(HOME)" PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
		bash $(BR2_EXTERNAL_project_base_PATH)/package/tic80/build-host-tools.sh $(@D)
endef

TIC80_PRE_BUILD_HOOKS += TIC80_BUILD_HOST_TOOLS

$(eval $(cmake-package))
