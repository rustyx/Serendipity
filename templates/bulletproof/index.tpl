{if $is_embedded != true}
    {if $is_xhtml}
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    {else}
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    {/if}

    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
    <head>
        <title>{$head_title|@default:$blogTitle}{if $head_subtitle} - {$head_subtitle}{/if}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity v.{$head_version}" />
        <link rel="alternate"  type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
        <link rel="alternate"  type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />
        {if $entry_id}<link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />{/if}
        <!-- uncomment the line below if your site uses a favicon -->
        <!--   <link rel="shortcut icon" href="{$serendipityBaseURL}favicon.ico" /> -->
        <!-- base styles needed for bulletproof -->
        <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="base.css"}" />
        <!-- style.css -->
        <link rel="stylesheet" type="text/css" href="{$head_link_stylesheet}" />
        <!--[if IE 5]>
            <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie5.css"}" />
        <![endif]-->
        <!--[if IE 6]>
            <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie6.css"}" />
        <![endif]-->
        <!--[if IE 7]>
            <link rel="stylesheet" type="text/css" href="{serendipity_getFile file="ie7.css"}" />
        <![endif]-->
        <!-- additional colorset stylesheet -->
        <link rel="stylesheet" type="text/css" href="{$serendipityHTTPPath}templates/{$template}/{$template_option.colorset}_style.css" />
        {if $template_option.custheader == 'true'}
        <style type="text/css">
            #serendipity_banner {ldelim}
            background-image: url({$template_option.headerimage});
            background-position: {$template_option.headerposhor} {$template_option.headerposver};
            {if $template_option.headertype == 'banner'}
                background-repeat: no-repeat;
            {elseif $template_option.headertype == 'htiled'}
                background-repeat: repeat-x;
            {elseif $template_option.headertype == 'vtiled'}
                background-repeat: repeat-y;
            {elseif $template_option.headertype == 'btiled'}
                background-repeat: repeat;
            {/if}{rdelim}
        </style>
        {/if}
        {if $template_option.jscolumns == 'true'}<script type="text/javascript" src="{$serendipityHTTPPath}templates/{$template}/js/p7_eqCols2_10.js"></script>{/if}
        {serendipity_hookPlugin hook="frontend_header"}
    </head>

    <body{if $template_option.jscolumns == 'true'} onload="P7_equalCols2(0,{if $template_option.layouttype != '1col'}'content','DIV',{/if}'serendipityLeftSideBar','DIV','serendipityRightSideBar','DIV')"{/if}>
{else}
    {serendipity_hookPlugin hook="frontend_header"}
{/if}
{if $is_raw_mode != true}

    <!-- #skiplinks: these are links used to navigate quickly in text-based browsers -->
    <!--             they are of little use in modern graphical browsers, so the are -->
    <!--             hidden using CSS                                                -->
    <div id="skiplinks">
        <ul>
            {if $template_option.sitenavpos != 'none'}<li><a href="#skipnav">Skip to site navigation</a></li>{/if}
            <li><a href="#skipent">Skip to blog entries</a></li>
            <li><a href="{$serendipityBaseURL}index.php?/archive">Skip to archive page</a></li>
            {if $template_option.layouttype != '2bs'}<li><a href="#skiplsb">Skip to left sidebar</a></li>{/if}
            {if $template_option.layouttype != '2sb'}<li><a href="#skiprsb">Skip to right sidebar</a></li>{/if}
        </ul>
    </div>

    <!-- #wrapper: this wrapper div holds the actual blog content; it can be used to -->
    <!--           give the blog a width in px or % plus an additional max-width in  -->
    <!--           order to limit the width in high resolutions to limit the length  -->
    <!--           of a line                                                         -->
    <div id="wrapper">
        <div id="wrapper_top"></div>

        {if $template_option.sitenavpos == 'above'}
            <!-- #sitenav: this holds a list of navigational links which can be customized   -->
            <!--           in the theme configurator                                         -->
            <a name="skipnav"></a>
            <div id="sitenav" class="snabove">
                <ul>
                    {foreach from=$navlinks item="navlink" name=navbar}
                        <li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.navbar.first} navlink_first{/if}{if $smarty.foreach.navbar.last} navlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
                    {/foreach}
                </ul>
                <!-- quicksearch option in the navigational link menu bar only when navbar is    -->
                <!-- above or below the banner                                                   -->
                {if $template_option.sitenav_quicksearch == 'true'}
                    <form id="navbarsearchform" action="{$serendipityBaseURL}" method="get"><input type="hidden" name="serendipity[action]" value="search" /><input alt="{$CONST.QUICKSEARCH}" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';" /></form>
                {/if}
            </div>
        {/if}

        <!-- #serendipity_banner: this is the header area. it holds the blog title and   -->
        <!--                      description headlines                                  -->
        <div id="serendipity_banner">
            <h1><span class="{if $template_option.firbtitle == 'false'}in{/if}visible"><a class="homelink1" href="{$serendipityBaseURL}">{$head_title|@default:$blogTitle|truncate:80:" ..."}</a></span></h1>
            <h2><span class="{if $template_option.firbdescr == 'false'}in{/if}visible"><a class="homelink2" href="{$serendipityBaseURL}">{$head_subtitle|@default:$blogDescription}</a></span></h2>
        </div>
        <div id="serendipity_below_banner"></div>

        {if $template_option.sitenavpos == 'below'}
            <!-- #sitenav: this holds a list of navigational links which can be customized   -->
            <!--           in the theme configurator                                         -->
            <a name="skipnav"></a>
            <div id="sitenav" class="snbelow">
                <ul>
                    {foreach from=$navlinks item="navlink" name="navbar"}
                        <li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.navbar.first} navlink_first{/if}{if $smarty.foreach.navbar.last} navlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
                    {/foreach}
                </ul>
                <!-- quicksearch option in the navigational link menu bar only when navbar is    -->
                <!-- above or below the banner                                                   -->
                {if $template_option.sitenav_quicksearch == 'true'}
                    <form id="navbarsearchform" action="{$serendipityBaseURL}" method="get"><input type="hidden" name="serendipity[action]" value="search" /><input alt="{$CONST.QUICKSEARCH}" type="text" name="serendipity[searchTerm]" value="{$CONST.QUICKSEARCH}..." onfocus="if(this.value=='{$CONST.QUICKSEARCH}...')value=''" onblur="if(this.value=='')value='{$CONST.QUICKSEARCH}...';" /></form>
                {/if}
            </div>
        {/if}

        <!-- this is the actual content of the blog, entries column plus one or two      -->
        <!-- sidebars, depending on how users configure their sidebar plugins            -->

        {if $template_option.layouttype == '3sbs'}
            <!-- case 1: 3 columns, sidebar-content-sidebar -->
            <a name="skiplsb"></a>
            <div id="serendipityLeftSideBar" class="threeside layout3sbs_left">
                {if $template_option.sitenavpos == 'left'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="left"}
            </div>
            <a name="skipent"></a>
            <div id="content" class="threemain layout3sbs_content">
                {$CONTENT}
            </div>
            <a name="skiprsb"></a>
            <div id="serendipityRightSideBar" class="threeside layout3sbs_right">
                {if $template_option.sitenavpos == 'right'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>    
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="right"}
            </div>
        {/if}

        {if $template_option.layouttype == '3bss'}
            <!-- case 2: 3 columns, content-sidebar-sidebar -->
            <a name="skipent"></a>
            <div id="content" class="threemain layout3bss_content">
                {$CONTENT}
            </div>
            <a name="skiplsb"></a>
            <div id="serendipityLeftSideBar" class="threeside layout3bss_left">
                {if $template_option.sitenavpos == 'left'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>    
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="left"}
            </div>
            <a name="skiprsb"></a>
            <div id="serendipityRightSideBar" class="threeside layout3bss_right">
                {if $template_option.sitenavpos == 'right'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="right"}
            </div>
        {/if}

        {if $template_option.layouttype == '3ssb'}
            <!-- case 3: 3 columns, sidebar-sidebar-content -->
            <a name="skiplsb"></a>
            <div id="serendipityLeftSideBar" class="threeside layout3ssb_left">
                {if $template_option.sitenavpos == 'left'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="left"}
            </div>
            <a name="skiprsb"></a>
            <div id="serendipityRightSideBar" class="threeside layout3ssb_right">
                {if $template_option.sitenavpos == 'right'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="right"}
            </div>
            <a name="skipent"></a>
            <div id="content" class="threemain layout3ssb_content">
                {$CONTENT}
            </div>
        {/if}

        {if $template_option.layouttype == '2sb'}
            <!-- case 4: 2 columns, left sidebar only -->
            <a name="skiplsb"></a>
            <div id="serendipityLeftSideBar" class="twoside layout2sb_left">
                {if $template_option.sitenavpos == 'left' or $template_option.sitenavpos == 'right'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="left"}
                {serendipity_printSidebar side="right"}
            </div>
            <a name="skipent"></a>
            <div id="content" class="twomain layout2sb_content">
                {$CONTENT}
            </div>
        {/if}

        {if $template_option.layouttype == '2bs'}
            <!-- case 5: 2 columns, right sidebar only -->
            <a name="skipent"></a>
            <div id="content" class="twomain layout2bs_content">
                {$CONTENT}
            </div>
            <a name="skiprsb"></a>
            <div id="serendipityRightSideBar" class="twoside layout2bs_right">
                {if $template_option.sitenavpos == 'left' or $template_option.sitenavpos == 'right'}
                    <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                    <a name="skipnav"></a>
                    <div id="sbsitenav" class="serendipitySideBarItem">
                        <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                        <div class="serendipitySideBarContent">
                            <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                            <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                        </div>
                        <div class="serendipitySideBarFooter"></div>
                    </div>
                {/if}
                {serendipity_printSidebar side="left"}
                {serendipity_printSidebar side="right"}
            </div>
        {/if}

        {if $template_option.layouttype == '1col'}
            <!-- case 6: 1 column, sidebar(s) below -->
            <a name="skipent"></a>
            <div id="content" class="onemain layout1col_content">
                {$CONTENT}
            </div>

            {if $leftSidebarElements > 0}
                <a name="skiplsb"></a>
                <div id="serendipityLeftSideBar" class="{if $rightSidebarElements > 0}oneside layout1col_left_side{else}onefull layout_1col_left_full{/if}">
                    {if $template_option.sitenavpos == 'left'}
                        <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                        <a name="skipnav"></a>
                        <div id="sbsitenav" class="serendipitySideBarItem">
                            <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                            <div class="serendipitySideBarContent">
                                <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                                <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                            </div>    
                            <div class="serendipitySideBarFooter"></div>
                        </div>
                    {/if}
                    {serendipity_printSidebar side="left"}
                </div>
            {/if}

            {if $rightSidebarElements > 0}
                <a name="skiprsb"></a>
                <div id="serendipityRightSideBar" class="{if $leftSidebarElements > 0}oneside layout1col_right_side{else}onefull layout1col_right_full{/if}">
                    {if $template_option.sitenavpos == 'right'}
                        <!-- #sbsitenav: like #sitenav, but placed within the sidebar                    -->
                        <a name="skipnav"></a>
                        <div id="sbsitenav" class="serendipitySideBarItem">
                            <h3 class="serendipitySideBarTitle">{$template_option.sitenav_sidebar_title}</h3>
                            <div class="serendipitySideBarContent">
                                <!-- the line below must remain as a single uninterrupted line to display correctly in ie6 -->
                                <ul>{foreach from=$navlinks item="navlink" name="sbnav"}<li class="{if $currpage==$navlink.href}currentpage{/if}{if $smarty.foreach.sbnav.first} sbnavlink_first{/if}{if $smarty.foreach.sbnav.last} sbnavlink_last{/if}"><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>{/foreach}</ul>
                            </div>
                            <div class="serendipitySideBarFooter"></div>
                        </div>
                    {/if}
                    {serendipity_printSidebar side="right"}
                </div>
            {/if}
        {/if}

        <!-- #footer: the page footer can be used for additional information             -->
        <div id="footer">
            {if $template_option.footer_text_toggle == 'true'}
                <p>{$template_option.footer_text}</p>
            {/if}

            <!-- ************************************************************** -->
            <!-- The image and link below must remain if you use this template  -->
            <!-- or create your own template based on the bulletproof framework -->
            <!-- ************************************************************** -->

            <div id="serendipity_bulletproof_button"><a href="http://s9y-bulletproof.com" title="Based on the s9y Bulletproof template framework"><img src="{$serendipityHTTPPath}templates/{$template}/img/bulletproof_button.png" alt="Based on the s9y Bulletproof template framework" width="100" height="28" /></a></div>

            <!-- ************************************************************** -->
            <!-- Feel free to insert your own "Template by" name and link below -->
            <!-- if you create a custom template based on bulletproof.          -->
            <!-- ************************************************************** -->

            <div id="serendipity_credit_line">{$CONST.POWERED_BY} <a href="http://www.s9y.org">s9y</a> &ndash; Template by <a href="http://s9y-bulletproof.com">Bulletproof development team</a>.</div>
            {if $template_option.counter_code_toggle == 'true'}
                <div class="counter_code">{$template_option.counter_code}</div>
            {/if}
            <!-- option to display navigation links in the footer                            -->
            {if ($template_option.sitenavpos != 'none' and $template_option.sitenav_footer == 'true')}
                <div id="footer_sitenav">
                    <ul>
                        {foreach from=$navlinks item="navlink" name=navbar}
                            <li{if $currpage == $navlink.href} class="currentpage"{/if}><a href="{$navlink.href}" title="{$navlink.title}">{$navlink.title}</a></li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
        <div id="wrapper_footer"></div>
    </div>
{/if}

{$raw_data}
{serendipity_hookPlugin hook="frontend_footer"}
{if $is_embedded != true}
    </body>
    </html>
{/if}