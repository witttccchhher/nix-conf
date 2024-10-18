{
  xdg.configFile."neofetch/config.conf".text = ''
print_info() {
    prin "┌──────────────────────────────────────┐"
    info "os  " distro
    info "kr  " kernel
    info "us  " users
    info "sh  " shell
    info "pk  " packages
    prin "└──────────────────────────────────────┘"
    prin "\n"
    prin "┌──────────────────────────────────────┐"
    info "de  " de
    info "wm  " wm
    info "tr  " term
    info "th  " theme
    info "ic  " icons
    info "ft  " font
    prin "└──────────────────────────────────────┘"
    prin "\n"
    prin "┌──────────────────────────────────────┐"
    info "md  " model
    info "cp  " cpu
    info "gp  " gpu
    info "rl  " resolution
    info "mr  " memory
    info "ds  " disk
    info "up  " uptime
    prin "└──────────────────────────────────────┘"
}

title_fqdn="on"
kernel_shorthand="on"
distro_shorthand="off"
os_arch="off"
uptime_shorthand="on"
memory_percent="off"
memory_unit="Gib"
package_managers="on"
shell_path="off"
shell_version="on"
speed_type="scaling_cur_freq"
speed_shorthand="on"
cpu_brand="off"
cpu_speed="on"
cpu_cores="off"
cpu_temp="off"
gpu_brand="off"
gpu_type="all"
gtk_shorthand="on"
gtk2="on"
gtk3="on"
de_version="on"
disk_show=('/')
disk_subtitle="none"
disk_percent="off"
colors=(7 7 7 111 7 7)
separator=" "
cpu_display="on"
memory_display="on"
battery_display="on"
disk_display="on"
ascii_colors=(7 111 111 111 111 111)
  '';
}
