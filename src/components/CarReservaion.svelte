<script>
    import { fade, fly } from 'svelte/transition';
   export let id
   export let image
   export let carName;
   export let price;
   export let carObject;
   let startDate = ""
   let endDate = ""
   let counter = 1

   const changeCounter = (sign) => {
       if(sign == '-' && counter > 0)
            counter--;
        else if (sign == '+')
            counter++;
   }

   const bookCar = async() => {
        if( counter >= 1 ) {
            const payload = {
                car_id: id,
                time: `${counter}`,
                user: window.sessionStorage.getItem("user_id"),
                startDate,
                endDate
            };
            const res = await fetch( 'http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/MakeReservation.php', {
                method: 'POST',
                body: JSON.stringify(payload)
            })
            const jsonresponse = await res.json()
            console.log(payload,jsonresponse);
        }
       
   }


</script>
<div class="car" in:fly="{{ y: 200, duration: 2000 }}">
    <img src={ image } alt="car">
    <div> 
        <h1> { carName } </h1>
        <h2> { price } zł/h</h2> 
        <div class="dates">
            <input type="date" id="datestart" bind:value={startDate} name="reservation-start"  min="2021-01-01" max="2050-12-31">
            <input type="date" id="dateend"  bind:value={endDate} name="reservation-end"  min="2021-01-01" max="2050-12-31">
        </div>
    </div> 

    <div class="submitRow">
        <div class="counter"> {counter} </div>
        <div class="btn" on:click={()=> changeCounter('-')}> <i class="fa fa-minus"></i> </div>
        <button on:click={bookCar}> Reseve </button>
        <div class="btn" on:click={()=> changeCounter('+')}> <i class="fa fa-plus"></i> </div>
    </div>
</div>
<style>
  .car {
        grid-column: span 4;
        height: auto;
        height: 100%;
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
        padding: 2rem 0;
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
    .submitRow {
        width: 100%;
        height: 15% !important;
        display: flex;
        justify-content: center; 
        align-items: center; 
        flex-flow: row nowrap !important;
        padding-inline: 1rem;
    }

    .counter {
        flex: 2;
        background: var(--primary);
        margin-right: .1rem;
        height: 100%;
        padding: 2rem 0;
        display: flex;
        justify-content: center; 
        align-items: center; 
        flex-flow: row nowrap !important;
        color: var(--bg);
        font-weight: 900;
        font-size: 1.6rem;
    }
    .btn {
        flex: 1;
        /* padding: .2rem; */
        background: var(--bg);
        box-shadow: var(--shadow4);
        cursor: pointer;
        border-radius: 50%;
        border: 2px solid var(--primary);
        aspect-ratio: 1 / 1;
        display: flex;
        justify-content: center; 
        align-items: center; 
        flex-flow: row nowrap !important;
        font-size: 1.5rem;
        color: var(--primary);
        transition: .5s;
    }
    .btn:hover {
        background: var(--primary);
        color: var(--bg);
    }
    button {
        flex: 3;
        margin-inline: .3rem;
        background: var(--primary);
        padding: 1rem 2rem;
        border: 3px solid var(--primary);
        cursor: pointer;
        border-radius: 45px;
        color: var(--bg);
        position: relative;
        transition: .5s;
    }
    button:hover {
        box-shadow: var(--shadow4);
        --bg: hsl(0, 0%, 15%);
        background: var(--bg);
        color: #fff;
        z-index: 6;
    }
    .dates {
        margin-block: 1rem;
    }
    input[type='date']{
        accent-color: var(--primary);
        padding: 1rem;
        border: var(--primary) solid 2px;
        color: var(--primary);
    }    
    input[type='date']:focus{
        border: 1px solid var(--primary);
        outline: 1px solid var(--primary);
    }

</style>