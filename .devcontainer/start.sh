#!/bin/bash
# g2ray start script â€” keepalive: 180s
tmux kill-session -t g2ray 2>/dev/null || true
tmux new-session -d -s g2ray
tmux send-keys -t g2ray "sudo /usr/local/bin/xray run -c /etc/xray/g2ray.json &>/tmp/xray.log" Enter
sleep 2
show-link.sh

# Keepalive â€” ping every 180 seconds to prevent idle shutdown
tmux new-window -t g2ray -n keepalive
tmux send-keys -t g2ray:keepalive "while true; do curl -s --max-time 5 https://github.com/ -o /dev/null; sleep 180; done" Enter
echo "[g2ray] Keepalive ÙØ¹Ø§Ù„ Ø§Ø³Øª â€” Ù‡Ø± 180 Ø«Ø§Ù†ÛŒÙ‡ ÛŒÚ© Ø¨Ø§Ø± ping"
echo "[g2ray] Ø³Ø±ÙˆØ± Ø¯Ø§Ø®Ù„ tmux Ø§Ø¬Ø±Ø§ Ø´Ø¯"
echo "[g2ray] Ø¨Ø±Ø§ÛŒ Ø¯ÛŒØ¯Ù† log: tmux attach -t g2ray"
