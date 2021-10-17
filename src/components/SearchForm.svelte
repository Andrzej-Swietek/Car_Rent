<script>
    import { createEventDispatcher } from 'svelte';

    let filter = "";
    let brandFilter = "";
    let conditionFilter = "";
    let formUnfold = false;
    let priceFilter = "";
    $: shouldFilterPrice = false;

    const getBrands = async () => {
        return await( (await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetBrandsList.php')).json() );
    }
    const getConditions = async () => {
        return await( (await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetConditionsList.php')).json() );
    }

    let brandsPromise = getBrands();
    let conditionsPromise = getConditions();

    const setBrandFilter = (e) => {
        const value = e.target.value;
        brandFilter = ( value === 'All' )? "" : value
    }

    const setConditionFilter = (e) => {
        const value = e.target.value;
        conditionFilter = ( value === 'All' )? "" : value
    }

    const setPriceFilter = (e) => {
        const value = e.target.value;
        priceFilter = ( value === '' )? "" : value
    }

    const dispatch = createEventDispatcher();
    const submitSearchForm = () =>{
        dispatch('filterCars', {
                brandFilter,
                filter,
                conditionFilter,
        })
    }

    const toggleFold = () =>{
        formUnfold = !formUnfold;
        (formUnfold)? document.body.style.setProperty('--filterFormHeight', '30vh'): document.body.style.setProperty('--filterFormHeight', '10vh')
    }

    const shouldIFilterPrice = () => {
        shouldFilterPrice = !shouldFilterPrice;
        (shouldFilterPrice == false) && (priceFilter = "");
    }
</script>

<form class="searchForm" on:submit|preventDefault={submitSearchForm}>
    <input type="text" placeholder="Search... " bind:value={filter}/>
    <select on:change={setBrandFilter}>
        <option value="All">All Brands</option> 
        {#await brandsPromise}
            loading ...
        {:then brands} 
            {#each brands as brand}
                <option value="{brand}">{brand}</option>
            {/each}
        {/await}
    </select>
    <select on:change={setConditionFilter}>
        <option value="All">All Contitions</option>
        {#await conditionsPromise}
            loading ...
        {:then conditions} 
            {#each conditions as condition}
                <option value="{condition}">{condition}</option>
            {/each}
        {/await}
    </select>
    <button> <i class="fa fa-search"></i> </button>
    <button class="unfoldButtton" on:click={toggleFold}>
        {#if formUnfold}
            <i class="fas fa-caret-up"></i>
         {:else}
            <i class="fas fa-caret-down"></i>
         {/if}
    </button>
    {#if formUnfold}
    <div class="unfloded-stuff">
        <input type="checkbox" id="price-check" on:click={shouldIFilterPrice}/>
        <label for="price-check">Filter Price: {shouldFilterPrice}</label>
        <input type="range" id="price-range" min="0" max="100" value="0" step="1" on:input={setPriceFilter} disabled={!shouldFilterPrice}/>
        <label for="price-range">Max price range: {(priceFilter=="")?'0':priceFilter} zł</label>

    </div>
    {/if}
</form>

<style>
:root {
    --filterFormHeight: 10vh;
}
form {
    grid-column: 1 /-1;
    height: var(--filterFormHeight);
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
    margin-inline: 1rem;
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
select {
    padding: 1rem;
    margin-inline: 1rem;
    border: 2px solid var(--primary);
    border-radius: 45px;
    outline: none;
    font-size: 1.1rem;
    background: none;
    color: var(--primary);
    accent-color: var(--primary);
    cursor: pointer;
    transition: .5s;
}
select:hover {
    background: var(--primary);
    color: var(--bg);
}
.unfloded-stuff {
    width: 100%;
    display: flex; flex-flow: row wrap; justify-content: center; align-items: center;
}

.unfoldButtton {
    border-radius: 0 !important;
    transition: .5s;
}
#price-range {
    accent-color: var(--primary);
    margin-inline: 1rem;
    outline: 3px solid var(--primary);
    padding-inline: 0;
}

#price-check {
    /* outline: 1px solid var(--primary); */
    /* -moz-appearance:none; */
    /* -webkit-appearance:none; */
    /* -o-appearance:none; */
    accent-color: var(--primary);
    border: none !important;
    width: auto !important;
    padding: 2rem;
    box-shadow: none;
    font-size: 2rem;
    margin: 0 2rem;
    position: relative;

    -moz-appearance:none;
	-webkit-appearance:none;
	-o-appearance:none;
	outline: none;
	content: none;	
}
#price-check::after {
    position: absolute;
    width: 25px;
    height: 25px;
    top: 25% !important;
    border: 2px solid var(--primary);
    content: '';
    cursor: pointer;
    /* border-radius: 50%; */
}
#price-check:checked::after {
    border: 2px solid var(--primary);
    content: 'x';
    display: flex; flex-flow: row wrap; justify-content: center; align-items: center;
    background: var(--primary);
    color: #fff;
    font-size: 1rem;
    outline: 2px solid var(--primary);
    outline-offset: 5px;
}
</style>