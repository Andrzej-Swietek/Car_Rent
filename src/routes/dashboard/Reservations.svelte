<script>

import ReservedItem from "../../components/ReservedItem.svelte";
import QRCode from "../../components/QRJS.svelte"

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

    $: showQRModal = false;
    $: modalCode = "12354234562345"
    const hideModal = ()=> showQRModal = false;
    function handleModalOpen(event) {
		// alert(event.detail.text);
        modalCode = event.detail.text;
        showQRModal = true; 
	}
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

                    on:qr-open={handleModalOpen}
                />
            {/each}
            {:else}
            <h1> No Reservations </h1>
        {/if}


    {/await}
    </div>  
    {#if showQRModal}
        <div class="qr-modal" on:click={hideModal}>
            <QRCode codeValue={modalCode} squareSize=200/>
        </div>
    {/if}
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

    .qr-modal {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        backdrop-filter: blur(25px);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 10000;
    }
    .qr-modal > * {
        border: 0.25em solid var(--primary);
    }

</style>