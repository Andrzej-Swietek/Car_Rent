<script>
import AdminReservation from "../../components/AdminReservation.svelte";
import CarReservaion from "../../components/CarReservaion.svelte";
import { each, onMount } from "svelte/internal";


    const fetchPendingReservations = async () => {
       const res = await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetPendingReservations.php'); 
       const json = await res.json();
       return json;
    }
    const fetchAcceptedReservations = async () => {
        const res = await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/GetAcceptedReservations.php');
        const json = await res.json();
        return json;
    }
    let reservations = []
    let accepted = []

    onMount( async()=> {
        reservations = await fetchPendingReservations();
        accepted = await fetchAcceptedReservations();
        console.log(reservations);
    })
    let accepted_pending = 'Pending'
</script>

<section class="grid-container"> 
    <h1 class="title">Manage Reservations <button on:click={ ()=> accepted_pending = accepted_pending=="Pending"?'Accepted':'Pending' } class="toggleList">{accepted_pending}</button></h1>
    {#if accepted_pending=='Pending'}
        {#each reservations as reservation}
            <AdminReservation carReservation={reservation} />
        {/each}
        {:else}
        {#each accepted as reservation}
            <AdminReservation carReservation={reservation} />
        {/each}
        
    {/if}

</section>


<style>
    .grid-container {
        margin-block: 2rem;
        grid-column: 1 / -1;
        height: 85vh;
        background: rgba(243,243,243,.1);
        box-shadow: var(--shadow4);
        overflow-y: scroll;
    }
    h1 {
        margin-block: 1rem;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .toggleList {
        height: 100%;
        padding: 1rem 2rem;
        background: var(--primary);
        border: var(--primary) 2px solid;
        border-radius: 45px;
        color: #fff;
        transition: .5s;
        cursor: pointer;
        margin-inline: 2rem;
    } 
    .toggleList:hover{
        --primary: hsl(15, 100%, 20%);
    }
</style>