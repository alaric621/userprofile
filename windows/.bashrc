# 1. 基础过滤：不记录简单命令 (确保 ssh 不在过滤名单中)
# 只有完全匹配以下单词的命令才会被忽略
export HISTIGNORE="ls:ll:la:l:pwd:clear:exit:history"

# 2. 强力去重与忽略空格
# ignoreboth = ignoredups (忽略连续重复) + ignorespace (忽略以空格开头的命令)
# erasedups = 在整个历史记录中只保留唯一的该命令（防止历史记录臃肿）
export HISTCONTROL=ignoreboth:erasedups

# 3. 存储上限 (对标现代 Linux 默认值)
export HISTSIZE=10000
export HISTFILESIZE=20000

# 4. 时间戳格式 (Linux 标准格式：年-月-日 时:分:秒)
export HISTTIMEFORMAT="%F %T "

# 5. 实时同步与高性能写入 (解决卡顿的关键)
# shopt -s histappend: 允许追加而不是覆盖文件
shopt -s histappend

# PROMPT_COMMAND 逻辑：
# history -a: 每次回车后立即将新命令写入硬盘（确保 SSH 等命令不丢失）
# history -n: 仅读取硬盘中“其他窗口”新产生的记录（实现多窗口同步且不卡顿）
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"


