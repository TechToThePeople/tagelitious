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
