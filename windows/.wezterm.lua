local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.color_scheme = 'Batman'

-- 设置默认程序为 Git Bash
-- 注意：这里路径中的反斜杠需要写成双反斜杠 "\\" 或者直接用正斜杠 "/"
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '--login', '-i' }
-- 如果你想让 Git Bash 启动时就在当前目录（比如从文件夹右键打开时）
config.default_cwd = wezterm.home_dir

-- 设置窗口装饰：将其设为 "NONE" 即可实现无边框
-- 可选值有 "NONE" (无边框), "RESIZE" (有边框可缩放但无标题栏), "TITLE" (有标题栏)
config.window_decorations = "NONE"
config.window_decorations = "RESIZE"
-- 隐藏标签页（当只有一个标签页时自动隐藏）
config.hide_tab_bar_if_only_one_tab = true
-- (可选) 建议配合 padding，否则文字会紧贴屏幕边缘
-- config.window_padding = {
--   left = 10,
--   right = 10,
--   top = 10,
--   bottom = 10,
-- }
config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local selection = window:get_selection_text_for_pane(pane)
      if selection ~= "" then
        -- 如果有选中文本，执行复制到剪贴板
        window:perform_action(wezterm.action.CopyTo 'Clipboard', pane)
        -- 复制后取消选中（可选，根据习惯决定是否注释掉下面这行）
        window:perform_action(wezterm.action.ClearSelection, pane)
      else
        -- 如果没有选中文本，发送正常的 CTRL+C 中断信号
        window:perform_action(wezterm.action.SendKey { key = 'c', mods = 'CTRL' }, pane)
      end
    end),
  },
  -- 顺便把 Ctrl+V 也配上，保持操作习惯统一
  {
    key = 'v',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}



return config