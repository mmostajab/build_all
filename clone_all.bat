@echo off
pushd ..

:: do something cool, then log it
CALL :nvfolder build_all
CALL :nvfolder shared_sources
CALL :nvfolder shared_external

CALL :nvfolder gl_cadscene_rendertechniques
CALL :nvfolder gl_commandlist_basic
CALL :nvfolder gl_dynamic_lod
CALL :nvfolder gl_multicast
CALL :nvfolder gl_occlusion_culling
CALL :nvfolder gl_path_rendering_CMYK
CALL :nvfolder gl_render_vk_direct_display
CALL :nvfolder gl_ssao
CALL :nvfolder gl_vk_bk3dthreaded
CALL :nvfolder gl_vk_chopper
CALL :nvfolder gl_vk_meshlet_cadscene
CALL :nvfolder gl_vk_raytrace_interop
CALL :nvfolder gl_vk_simple_interop
CALL :nvfolder gl_vk_supersampled
CALL :nvfolder gl_vk_threaded_cadscene
CALL :nvfolder nvml_enterprise_gpu_check
CALL :nvfolder vk_async_resources
CALL :nvfolder vk_denoise
CALL :nvfolder vk_device_generated_cmds
CALL :nvfolder vk_mini_path_tracer
CALL :nvfolder vk_offline
CALL :nvfolder vk_order_independent_transparency
CALL :nvfolder vk_raytrace
CALL :nvfolder vk_raytracing_tutorial
CALL :mmfolder vk_raytracing_tutorial_KHR
CALL :nvfolder vk_shaded_gltfscene
CALL :nvfolder vk_toon_shader

:: force execution to quit at the end of the "main" logic
EXIT /B %ERRORLEVEL%

:: a function to write to a log file and write to stdout
:nvfolder
IF EXIST %* GOTO NOWINDIR
	echo "--------------------------------------------"
	git clone https://github.com/nvpro-samples/%*.git --recursive
	GOTO DONE
:mmfolder
IF EXIST %* GOTO NOWINDIR
	echo "--------------------------------------------"
	git clone https://github.com/mmostajab/%*.git --recursive
	GOTO DONE
:NOWINDIR
	echo "--------------------------------------------"
	echo %* already there... pulling
	pushd %*
	git pull
	git submodule update --init --recursive
	popd
EXIT /B 0
:DONE
EXIT /B 0