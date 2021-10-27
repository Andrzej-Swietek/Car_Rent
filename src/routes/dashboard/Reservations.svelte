<script>
import ReservedItem from "../../components/ReservedItem.svelte";

    const user = {
    id: sessionStorage.getItem("user_id"),
    role: sessionStorage.getItem("role"),
    nickname: sessionStorage.getItem("user_nickname")
}
    const getMyReservations = async () =>{
        const res = await fetch( 'http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/GetUsersReservations.php?user_id='+user.id)
        const json = await res.json();
        return json;
    }
    ( async ()=>{
        console.log( await getMyReservations() );
    } )()

    
</script>

<div class="container">
    <div class="reservationsContainer">
    {#await getMyReservations()}
        Loading ...
    {:then reservations} 
        {#if reservations.length > 0}
            {#each reservations as reservation }
                <ReservedItem 
                    ID={ reservation.ID }
                    Brand={ reservation.Brand }
                    Model={ reservation.Model }
                    Year={ reservation.Year }
                    CarCondition={ reservation.CarCondition }
                    DateStart={ reservation.DateStart }
                    DateEnd={ reservation.DateEnd }
                    Price={ reservation.Price }
                    Status={ reservation.Status }
                    Time={ reservation.Time }
                    Image={ reservation.Image }
                />
            {/each}
            {:else}
            <h1> No Reservations </h1>
        {/if}


    {/await}
    </div>  


</div>

<style>
    .container {
        grid-column: 1 / -1;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
    }
    .reservationsContainer {
        width: 100%;
        height: 90vh;
        overflow-y: scroll;
        padding: 2rem;
    }

</style>