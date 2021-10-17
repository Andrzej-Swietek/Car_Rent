<script context="module">

export const setSesstion = ( payload ) => {
    sessionStorage.setItem('user_id', payload.user_id);
    sessionStorage.setItem('user_nickname', payload.user_nickname);
    sessionStorage.setItem('role', payload.role);
}

</script>