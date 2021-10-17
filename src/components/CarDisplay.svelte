<script>
    export let image;
    export let carName;
    export let price;
</script>
<div class="car">
    <img src={ image } alt="car image">
    <div> 
        <h1> { carName } </h1>
        <h2> { price } </h2> 
    </div> 
</div>

<style>
    .car {
        grid-column: span 4;
        width: 100%;
        height: 70vh;
        display: flex;
        justify-content: center; align-items: center; flex-flow: column nowrap;
        /* border: .25em solid var(--primary); */
    }

    .car > img {
        height: 50%;
        width: 100%;
        object-fit: cover;
    }

    .car > div {
        width: 100%;
        height: 30%;
        display: flex;
        justify-content: center; align-items: center; flex-flow: column nowrap;
        box-shadow: var(--shadow3);
    }
    .car > div > h2 { 
        color: var(--primary);
        margin-top: 1rem;
    }
</style>
   