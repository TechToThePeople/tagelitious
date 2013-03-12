{literal}
<style>
.jstree-default.jstree-focused {background:transparent;}
</style>
{/literal}
{if $title}
<div class="crm-accordion-wrapper crm-tagGroup-accordion crm-accordion-closed">
 <div class="crm-accordion-header">
  <div class="icon crm-accordion-pointer"></div> 
	<a href="#" class="whiteanchor">{$title}</a>
  </div><!-- /.crm-accordion-header -->
  <div class="crm-accordion-body" id="tagGroup">
{/if}

{literal}
<style>
.hit {ldelim}padding-left:10px;{rdelim}
.tree li {ldelim}padding-left:10px;{rdelim}
#Tag .tree .collapsable .hit {ldelim}background:url('{$config->resourceBase}i/menu-expanded.png') no-repeat left 8px;padding-left: 9px;cursor:pointer{rdelim}
#Tag .tree .expandable .hit {ldelim}background:url('{$config->resourceBase}i/menu-collapsed.png') no-repeat left 6px;padding-left: 9px;cursor:pointer{rdelim}
#Tag #tagtree .highlighted {ldelim}background-color:lightgrey;{rdelim}
</style>
<script>
cj(function($){
  $("#tagtree").jstree({"plugins" : ["themes", "html_data"]});
});
</script>
{/literal}

    <div id="tagtree">
    <ul class="tree">
        {foreach from=$tree item="node" key="id"}
        <li id="tag_{$id}">
            {if ! $node.children}<input name="tag[{$id}]" id="check_{$id}" type="checkbox" {if $tagged[$id]}checked="checked"{/if}/>{/if}
            {if $node.children}<input name="tag[{$id}]" id="check_{$id}" type="checkbox" {if $tagged[$id]}checked="checked"{/if}/>{/if}
            {if $node.children} <span class="hit"></span> {/if} <label for="check_{$id}" id="tagLabel_{$id}">{$node.name}</label> 
            {if $node.children}
            <ul>
                {foreach from=$node.children item="subnode" key="subid"}
                    <li id="tag_{$subid}">
                        <input id="check_{$subid}" name="tag[{$subid}]" type="checkbox" {if $tagged[$subid]}checked="checked"{/if}/>
                        {if $subnode.children} <span class="hit"></span> {/if} <label for="check_{$subid}" id="tagLabel_{$subid}">{$subnode.name}</label> 
                        {if $subnode.children}
                        <ul>
                            {foreach from=$subnode.children item="subsubnode" key="subsubid"}
                                <li id="tag_{$subsubid}">
                                    <input id="check_{$subsubid}" name="tag[{$subsubid}]" type="checkbox" {if $tagged[$subsubid]}checked="checked"{/if}/>
                                    <label for="check_{$subsubid}" id="tagLabel_{$subsubid}">{$subsubnode.name}</label>
                                </li>
                            {/foreach} 
                        </ul>
                        {/if}
                    </li>	 
                {/foreach} 
            </ul>
            {/if}
        </li>	 
        {/foreach} 
    </ul>
    </div>

    <table class="form-layout-compressed{if $context EQ 'profile'} crm-profile-tagsandgroups{/if}" style="width:98%">
{*
	<tr>
	    {foreach key=key item=item from=$tagGroup}
		{if !$type || $type eq $key }
		<td width={cycle name=tdWidth values="70%","30%"}><span class="label">{if $title}{$form.$key.label}{/if}</span>
		    <div id="crm-tagWrap">
		    <table id="crm-tagGroupTable">
			{foreach key=k item=it from=$form.$key}
			    {if $k|is_numeric}
				<tr class={cycle values="'odd-row','even-row'" name=$key} id="crm-tagRow{$k}">
				    <td>
					<strong>{$it.html}</strong><br />
					{if $item.$k.description}
					    <div class="description">
						{$item.$k.description}
					    </div>
					{/if}
				    </td>
				</tr>
			    {/if}
			{/foreach}   
		    </table>
		    </div>
		</td>
		{/if}
	    {/foreach}
	</tr>
*}
	<tr><td>{include file="CRM/common/Tag.tpl"}</td></tr>
    </table>   
{if $title}
 </div><!-- /.crm-accordion-body -->
</div><!-- /.crm-accordion-wrapper -->

{/if}
