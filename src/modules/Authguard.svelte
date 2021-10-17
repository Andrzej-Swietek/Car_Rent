<script>
	let user = window.sessionStorage.getItem("user_id");
</script>

{#if user}
	<slot name="authed"></slot>
{:else}
	<slot name="not_authed"></slot>
{/if}