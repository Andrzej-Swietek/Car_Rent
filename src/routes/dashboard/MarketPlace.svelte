<script>
    import SearchForm from "../../components/SearchForm.svelte";
    import CarReservaion from "../../components/CarReservaion.svelte";

    import { onMount } from 'svelte';
    import CarDisplay from "../../components/CarDisplay.svelte";

    const user = {
        role: sessionStorage.getItem("role"),
        nickname: sessionStorage.getItem("user_nickname")
    }



    $: cars = [ ];

    const getAllCars = async () => {
        const res = await fetch(`http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetAllCars.php`);
		return await res.json();
    }

    onMount(async () => {
		// const res = await fetch(`http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetAllCars.php`);
		// cars = await res.json();
        cars = await getAllCars();
        cars.forEach(item => {
            item["CarName"] = item["Brand"] + " " + item["Model"] + "  " + item["Year"]
        });
        console.log(cars);
	});

    const filterCarsResults = async (event) =>{
        console.log(event.detail);
        cars = [];
        cars = await getAllCars();
        cars.forEach(item => ( item["CarName"] = item["Brand"] + " " + item["Model"] + "  " + item["Year"] ));
        (event.detail.brandFilter != "") && (cars = cars.filter( car => car.Brand == event.detail.brandFilter));
        (event.detail.filter != "") && (cars = cars.filter( car => car.CarName.includes(event.detail.filter) ));
        (event.detail.conditionFilter != "") && (cars = cars.filter( car => car.CarCondition.includes(event.detail.conditionFilter) ));
        (event.detail.priceFilter != "") && (cars = cars.filter( car => parseFloat(car.Price) < parseFloat(event.detail.priceFilter) ));
    }

</script>

<div class="container">
    <h1 class="welcome"> Hello { user.nickname } !!!</h1>
    <SearchForm on:filterCars={filterCarsResults} />
    <div class="results">
        {#if cars.length > 0}
            {#each cars as car}
            <CarReservaion id={car.ID} image={car.Image} carName={car.CarName} price={car.Price} carObject={car} />
            {/each}
        {:else}
            <h1 class="no-results">  Sorry! No results  💩</h1>
        {/if}


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
    .no-results {
        grid-column: 1 / -1;
        background: var(--primary);
        margin-block: 2rem;
        color: #fff;
        padding: 3rem;
    }
</style>