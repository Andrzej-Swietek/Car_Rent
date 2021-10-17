<script>
    let filter = "";
</script>

<form class="searchForm">
    <input type="text" placeholder="Search..." bind:value={filter}/>
    <button> <i class="fa fa-search"></i> </button>
</form>

<style>
form {
    grid-column: 1 /-1;
    height: 10vh;
    display: flex; flex-flow: row wrap; justify-content: center; align-items: center;
    font-weight: 900;
    transition: .5s;
    box-shadow: var(--shadow4);
    margin-bottom: 2rem;
}
form:focus-within {

}
input {
    width: 50%;
    background: var(--bg);
    border: none;
    padding: 1rem 2rem;
    border: 2px solid var(--primary);
    outline: none;
    border-radius: 45px;
    box-shadow: var(--shadow3);
    font-size: 1.2rem;
    color: var(--primary);
}
button {
    background: var(--primary);
    padding: 1rem;
    border: 2px solid var(--primary);
    outline: none;
    border-radius: 45px;
    color: var(--bg);
    font-size: 1.2rem;
    cursor: pointer;
}
button:hover {
    --primary: var(--dark);
}
</style>