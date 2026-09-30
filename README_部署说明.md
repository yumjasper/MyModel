# Qwen-Image-2.1-Uncensored-GGUF 本地部署

## 启动

1. 尽量关闭 Unreal Editor、Blender、游戏等占显存程序。
2. 双击 `start_comfyui.bat`。
3. 浏览器打开 <http://127.0.0.1:8188>。
4. 把下面的工作流 JSON 拖进 ComfyUI 页面：
   - 文生图：`workflow_presets\Qwen-Image-2.1-T2I-GGUF.json`
   - 图生图：`workflow_presets\Qwen-Image-2.1-I2I-GGUF.json`
5. 修改提示词，点击 Queue 生成。图片保存在 `ComfyUI\output`。

需要停止服务时，双击 `stop_comfyui.bat`。

如果显存不足，改为双击 `start_comfyui_lowvram.bat`。首次测试建议使用 512×512 或 1024×1024、25 步、CFG 1、Euler + Simple。

## 已安装组件

- ComfyUI
- leejet/ComfyUI-GGUF
- PyTorch 2.14.0 + CUDA 13.2
- `qwen-image-2.1-UC-Q4_K_M.gguf`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`

三个模型文件均已按发布仓库的 `SHA256SUMS` 完成校验。

具体上游版本、模型大小和 SHA256 记录在 `deployment-manifest.json`。Git 仓库有意不包含模型权重、虚拟环境、生成图片、日志和第三方源码目录，避免仓库体积膨胀。

## 常见问题

- 页面打不开：确认启动窗口仍在运行，访问地址必须是 `http://127.0.0.1:8188`。
- CUDA OOM：关闭其他 GPU 程序，再用 low-VRAM 启动脚本；同时降低分辨率。
- 第一次生成较慢：首次会加载约 14.6GB 权重；文本编码器可使用系统内存，属于正常现象。
- 模型无内容过滤器。请遵守适用法律、平台规则和 Qwen Research License，不要生成违法或伤害他人的内容。
