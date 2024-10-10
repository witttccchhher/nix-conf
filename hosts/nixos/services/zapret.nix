{ pkgs, lib, config, ... }: {
	systemd.services.zapret = {
		after = [ "network-online.target" ];
		wants = [ "network-online.target" ];
		wantedBy = [ "multi-user.target" ];
		path = with pkgs; [ 
			iptables
			nftables
			zapret
			ipset
			curl
			gawk
		];
		serviceConfig = {
			Type = "forking";
			Restart = "no";
			TimeoutSec = "30sec";
			IgnoreSIGPIPE = "no";
			KillMode = "mixed";
			GuessMainPID = "no";
			ExecStart = "${pkgs.zapret}/bin/zapret start";
			ExecStop = "${pkgs.zapret}/bin/zapret stop";
			EnvironmentFile = pkgs.writeText "zapret-environment" ''
				FWTYPE="iptables"
				SET_MAXELEM=522288
				IPSET_OPT="hashsize 262144 maxelem $SET_MAXELEM"
				AUTOHOSTLIST_RETRANS_THRESHOLD=3
				AUTOHOSTLIST_FAIL_THRESHOLD=3
				AUTOHOSTLIST_FAIL_TIME=60
				AUTOHOSTLIST_DEBUGLOG=0
				MDIG_THREADS=30
				GZIP_LISTS=1

				MODE=nfqws
				MODE_HTTP=1
				MODE_HTTP_KEEPALIVE=0
				MODE_HTTPS=1
				MODE_QUIC=0
				MODE_FILTER=none

				DESYNC_MARK=0x40000000
				DESYNC_MARK_POSTNAT=0x20000000
				NFQWS_OPT_DESYNC="--dpi-desync=fake,split2 --dpi-desync-ttl=3"
				TPWS_OPT="--hostspell=HOST --split-http-req=method --split-pos=3 --oob"
				FLOWOFFLOAD=donttouch
				INIT_APPLY_FW=1
				DISABLE_IPV6=0
			'';
		};
	};
}
