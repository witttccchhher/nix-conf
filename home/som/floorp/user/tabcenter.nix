{ ... }:
{
  css = ''
  :root {

  /* These colours are (mainly) used by the
     Container Tabs Plugin */
     --uc-identity-colour-blue:      #8DA3B9;
     --uc-identity-colour-turquoise: #8AA6A2;
     --uc-identity-colour-green:     #8C977D;
     --uc-identity-colour-yellow:    #D9BC8C;
     --uc-identity-colour-orange:    #D9BC8C;
     --uc-identity-colour-red:       #B66467;
     --uc-identity-colour-pink:      #A988B0;
     --uc-identity-colour-purple:    #A988B0;

     /*  Cascades main Colour Scheme */
     --uc-base-colour:               #151515;
     --uc-highlight-colour:          #1F1F1F;
     --uc-inverted-colour:           #E8E3E3;
     --uc-muted-colour:              #BBB6B6;
     --uc-accent-colour:             var(--uc-identity-colour-purple);
     --uc-shadow-colour:             #151515;

}


#topmenu { display: none !important; }


#tablist-wrapper,
#pinnedtablist { background: var(--uc-base-colour); }

.tab:hover,
.tab.active { background: var(--uc-highlight-colour); }



#tablist-wrapper .tab-title-wrapper {

  opacity: 0;
  transform: translateX(-10px);

  transition: all 200ms ease;
  transition-delay: 0ms;

}


body:hover #tablist-wrapper .tab-title-wrapper {

  opacity: 1;
  transform: translateX(0);

  transition-delay: 50ms;

}



.tab,
.tab.active { border-bottom: none !important; }



#pinnedtablist:not(.compact) .tab { padding: 6px; }
#tablist .tab { padding: 0 0 0 6px; }



.tab { overflow: visible; }



#pinnedtablist:not(.compact) .tab[data-identity-color] .tab-context::before,
#tablist .tab[data-identity-color] .tab-context::before {

  position: absolute;
  top: 4px; bottom: 4px;

  width: 2px;

  background: var(--identity-color);

  content: '';

}

# tablist .tab[data-identity-color] .tab-context::before { left: -3px; }


# pinnedtablist:not(.compact) .tab .tab-pin,
.tab-close,
.tab-loading-burst { display: none; }

#pinnedtablist:not(.compact) .tab[data-identity-color] .tab-context { box-shadow: none !important; }

[data-identity-color="blue"]      { --identity-color: var(--uc-identity-colour-blue); }
[data-identity-color="turquoise"] { --identity-color: var(--uc-identity-colour-turquoise); }
[data-identity-color="green"]     { --identity-color: var(--uc-identity-colour-green); }
[data-identity-color="yellow"]    { --identity-color: var(--uc-identity-colour-yellow); }
[data-identity-color="orange"]    { --identity-color: var(--uc-identity-colour-orange); }
[data-identity-color="red"]       { --identity-color: var(--uc-identity-colour-red); }
[data-identity-color="pink"]      { --identity-color: var(--uc-identity-colour-pink); }
[data-identity-color="purple"]    { --identity-color: var(--uc-identity-colour-purple); }

.can-scroll-top #tablist { mask: linear-gradient(transparent, var(--uc-shadow-colour) 40px); }
.can-scroll-bottom #tablist { mask: linear-gradient(var(--uc-shadow-colour) calc(100% - 40px), transparent); }
.can-scroll-bottom.can-scroll-top #tablist { mask: linear-gradient(transparent, var(--uc-shadow-colour) 40px calc(100% - 40px), transparent); }
#topshadow, #bottomshadow { display: none; }
  '';
}
