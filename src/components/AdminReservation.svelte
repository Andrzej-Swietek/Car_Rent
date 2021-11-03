<script>
  export let carReservation; 
  const accept = async (id) => {
      const res = await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/AcceptReservation.php?id='+id);
      location.reload();
    }
  const decline = async (id) => {
      const res = await fetch('http://localhost:8888/car_Rent_Project/car_rental_app/public/backend/CancelReservation.php?id='+id); 
      location.reload();
  }
</script>


<div class="reservation">

    <img src={carReservation.Image}  alt="car image" />
    <div class="id"> { carReservation.ID } </div>
    <div> { carReservation.DateStart } - { carReservation.DateEnd } | { carReservation.Time } </div>
    <div class="status"> { carReservation.Status } </div>
    <div> { carReservation.Brand } { carReservation.Model } { carReservation.Year } </div>
    <div> { carReservation.Price } zł/h </div>
     {#if carReservation.Status=='Pending'}
        <div class="buttons"> <button on:click={ ()=> accept(carReservation.ID) }> Accept </button> <button on:click={ ()=> decline(carReservation.ID) }> Decline </button> </div>
    {/if}
</div>

<style>
    .reservation {
        display: grid;
        grid-template-columns: repeat(8, 1fr);
        margin-block: 1rem;
        padding: 1rem;
        grid-gap: 2rem;
    }
    img {
        grid-column: span 2;
        width: 100%;
        object-fit: cover;
    }
    div {
        grid-column: span 1;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
    }
    .buttons {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-flow: column nowrap;
    }
    .buttons > button {
        width: 100%;
        margin-block: 1rem;
        padding: 1rem;
        background: var(--primary);
        border: 2px solid var(--primary);
        color: #fff;
        border-radius: 45px;
        transition: .5s;
        cursor: pointer;
    }
    .buttons > button:hover{
        --primary: hsl(15, 100%, 20%);
    }

    .id {
        font-weight: 900;
        color: var(--primary);
    }
    .status {
        border-left: .3em solid var(--primary);
        border-right: .3em solid var(--primary);
        border-radius: 45px;
    }

</style>