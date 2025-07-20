{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    settings = {
      theme_background = false;
      truecolor = true;
      force_tty = false;
      vim_keys = false;
      rounded_corners = false;
      graph_symbol = "block";
      shown_boxes = "proc mem";
      update_ms = 500;
      proc_sorting = "memory";
      proc_reversed = false;
      proc_tree = true;
      proc_colors = true;
      proc_gradient = true;
      proc_per_core = false;
      proc_mem_bytes = true;
      proc_cpu_graphs = false;
      proc_info_smaps = false;
      proc_left = true;
      proc_filter_kernel = false;
      proc_aggregate = false;
      clock_format = "/user@/host";
      background_update = false;
      mem_graphs = false;
      show_swap = true;
      swap_disk = false;
      show_disk = false;
      show_disks = false;
      only_physical = true;
      use_fstab = true;
      show_io_stat = false;
      io_mode = false;
      io_graph_combined = false;
      io_graph_speeds = "";
      show_battery = false;
    };
  };
}
