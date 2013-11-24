{literal}
<script>
cj(function($) {
  $("#crm-tagGroupTable").hide();
  $("#crm-tagGroupTable input:checked").each(function(i,tag) {
    var id=$(tag).attr("id").substring(4);
    $("#tagtree #check_"+id).attr("checked","checked");
    $("#tagtree input").click(function() {
      var id=$(this).attr("id").substring(6);
      $("#crm-tagGroupTable #tag_"+id).attr("checked",$(this).is(':checked'));
    });
  });
});
</script>
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
                        </ul>{/if}
                    </li>
                  {/foreach}
             </ul>
            {/if}
       </li>
       {/foreach}
</ul>
</div>
