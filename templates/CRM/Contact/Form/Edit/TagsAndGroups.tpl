AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
{if $title}
<div class="crm-accordion-wrapper crm-tagGroup-accordion crm-accordion-closed">
 <div class="crm-accordion-header">
  <div class="icon crm-accordion-pointer"></div> 
	<a href="#" class="whiteanchor">{$title}</a>
  </div><!-- /.crm-accordion-header -->
  <div class="crm-accordion-body" id="tagGroup">
{/if}
    <table class="form-layout-compressed{if $context EQ 'profile'} crm-profile-tagsandgroups{/if}" style="width:98%">
	<tr>
	    {foreach key=key item=item from=$tagGroup}
		{* $type assigned from dynamic.tpl *}
		{if !$type || $type eq $key }
		<td width={cycle name=tdWidth values="70%","30%"}><span class="label">{if $title}{$form.$key.label}{/if}</span>
		    <div id="crm-tagListWrap">
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
	<tr><td>{include file="CRM/common/Tag.tpl"}</td></tr>
    </table>   
{if $title}
 </div><!-- /.crm-accordion-body -->
</div><!-- /.crm-accordion-wrapper -->

{/if}
