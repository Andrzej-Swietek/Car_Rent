<script>
    import SearchForm from "../../components/SearchForm.svelte";
    import CarReservaion from "../../components/CarReservaion.svelte";

    const user = {
        role: sessionStorage.getItem("role"),
        nickname: sessionStorage.getItem("user_nickname")
    }

    let cars = [ { id:1, image: 'https://a.allegroimg.com/s1024/0c2c12/0cb8fd9f4874a7b2e1c441c0a920', carName: 'Golf 3 1999', price: '25'} ]
</script>

<div class="container">
    <h1 class="welcome"> Hello { user.nickname } !!!</h1>
    <SearchForm />
    <div class="results">
        {#each cars as car}
        <CarReservaion id={car.id} image={car.image} carName={car.carName} price={car.price} />
        {/each}
    </div>
</div>

<style>

    .container {
        grid-column: 1 / -1;
        width: 100%;
        height: 90vh;
        overflow: scroll;
        background: var(--bg);
        box-shadow: var(--shadow4);
        display: grid;
        grid-template-columns: repeat(12, 1fr);
    }
    .welcome {
        grid-column: 1 / -1;
        height: 20vh;
        background: var(--primary);
        box-shadow: var(--shadow4);
        display: flex; flex-flow: row wrap; justify-content: center; align-items: center;
        font-weight: 900;
        font-size: 2vw;
        color: var(--bg);
        border-radius: 45px;
    }
    .results {
        grid-column: 1 / -1;
        min-height: 50vh;
        overflow-y: scroll;
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        justify-content: center;
        align-items: center;
        grid-gap: 1rem;
        padding: 1rem;
    }
    .car {
        grid-column: span 4;
        width: 100%;
        height: 40vh;
        border: 2px currentColor solid;
    }
</style>