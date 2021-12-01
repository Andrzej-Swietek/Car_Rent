<script>
    import { createEventDispatcher } from 'svelte';

    export let ID;
    export let Brand;
    export let Model;
    export let Year;
    export let CarCondition;
    export let DateStart;
    export let DateEnd;
    export let Price;
    export let Status;
    export let Time;
    export let Image;

    const dispatch = createEventDispatcher();

    const cancelReservation = () => {
        ( async()=> {
            const res = await fetch( `http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/CancelReservation.php?reservation_id=${ID}` );
            console.log( await res.text() );
            location.reload();
        } )()
    }

    const openModal = () =>{
        dispatch('qr-open', {
			text: ID + ";" + Brand + ";" + Model +";" + Year
		});
    }

    const editDate = (e) => {
        const newDate = e.target.value;
        ( async()=> {
            const res = await fetch( `http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/EditDate.php?id=${ID}&newDate=${newDate}` );
            console.log( await res.text() );
            location.reload();
        } )()
    }
</script>

<div class="reserverdItem">
    <img src={ Image } alt="car image" />
    <div class="description">
        <div> <span> ID: </span> { ID } </div>  
        <div> <span> Name: </span> { Brand + " " + Model + " " + Year } </div>
        <div> <span> Car Condition: </span> { CarCondition } </div>
        <div> <span> Date: </span> { DateStart }  </div>
        <div> <span> Price: </span> { Price } zł/h</div>
        <div> <span> Time: </span> { Time } h</div>
        <div> <span> Status: </span> { Status } </div>
        <div> <span class="total"> TOTAL TO PAY: </span> { Price*Time } zł</div>

        <div class="buttons">
            <input type="date" class="newDate" value={DateStart} on:change={ editDate } /> 
            <button on:click={cancelReservation}> Cancel </button>
            <button class="btn" on:click={openModal}> QR Code </button>
        </div>
    </div>

</div>

<style>
    .reserverdItem {
        margin-block: 1rem;
        width: 100%;
        height: 50vh;
        background: #eaeaea;
        box-shadow: var(--shadow4);
        display: flex;
        align-items: center;
        justify-content: center;
        flex-flow: row wrap;
        padding: 2rem;
    }
    .description {
        flex: 5;
        /* padding: 2rem; */
        display: flex;
        align-items:  flex-start;
        justify-content: center;
        flex-flow: column nowrap;
    }
    .description > div {
        padding: 0 3rem;
        font-size: 1.4rem;
        margin-block: .5rem;
    }
    .description > div > span {
        color: var(--primary);
        margin-inline: 1rem;
        font-weight: 900;
    }

    img {
        flex: 3;
        width: 10%;
        box-shadow: var(--shadow4);
        object-fit: cover;
    }
    .buttons {
        width: 100%;
    }
    .buttons > button {
        padding: 1rem 2rem;
        cursor: pointer;
        background: none;
        box-shadow: var(--shadow4);
        color: var(--primary);
        border: 2px solid var(--primary);
        transition: .5s;
    }
    .buttons > button:hover {
        background: var(--primary);
        color: #fff;
    }
    .btn {
        background: var(--primary) !important;
        color: #fff !important;
        transition: .5s;
        position: relative;
        z-index: 1;
    }

    .btn:hover {
        --primary: hsla(15, 90%, 50%, 1);
        border: 2px solid var(--primary) !important;
        /* background: var(--bg) !important; */
        /* color: var(--primary) !important; */
    }

    .btn::after {
        content: '';
        position: absolute;
        transition: .5s;
        --primary: hsla(15, 90%, 50%, .4);
        background: var(--primary);
        top: 0;
        left: 0;
        transition: .5s;
    }

    .btn:hover::after {
        content: '';
        position: absolute;
        top: .5rem;
        left: .5rem;
        width: 100%;
        height: 100%;
        --primary: hsla(15, 90%, 50%, .4);
        background: var(--primary);
        z-index: -1;
    }

    .btn::before {
        content: '';
        position: absolute;
        transition: .5s;
        --primary: hsla(15, 90%, 50%, .4);
        background: var(--primary);
        top: 0;
        left: 0;
        transition: .5s;
    }
    
    .btn:hover::before {
        content: '';
        position: absolute;
        top: -.5rem;
        left: -.5rem;
        width: 100%;
        height: 100%;
        --primary: hsla(15, 90%, 50%, .4);
        background: var(--primary);
        z-index: -1;
    }
    .total{
        position: relative;
    }
    .total::after {
        position: absolute;
        top: 0;
        left: 0;
        width: 40%;
        height: 101%;
        content: '';
        border-bottom: var(--primary) solid .4rem;

    }

    input[type='date']{
        accent-color: var(--primary);
        padding: 1rem;
        border: var(--primary) solid 2px;
        color: var(--primary);
        font-family: sans-serif;
        text-transform: uppercase;
    }    
    input[type='date']:focus{
        border: 1px solid var(--primary);
        outline: 1px solid var(--primary);
    }
</style>