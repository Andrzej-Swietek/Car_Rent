
<script>
    const getUsersList = async () => {
        const res = await fetch('http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/GetUsers.php')
        const json = await res.json();
        return json;
    }

    const editUserPermitions = async (id, permitions) => {
        const newRole = (permitions === 'admin')? 'client':'admin';
        const res = await fetch('http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/EditUsers.php?id='+id+'&perm='+newRole)
        location.reload();
    } 

    const deleteUser = async (id) => {
        const res = await fetch('http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/DeleteUser.php?user_id='+id)
        location.reload();
    } 
    const usersList = getUsersList()
</script>

<section>
    <h1> MANAGE USERS </h1>

    <div class="list">
        <div class="title">Users List</div>
        <div class="user-item header">
            <div> ID </div>
            <div> Nickname </div>
            <div> Login </div>
            <div> Role </div>
            <div> Change Premisions </div>
            <div> Delete User </div>
        </div>
        {#await usersList}
            Loading ...
        {:then users} 
            {#each users as user}
            <div class="user-item"> 
                <div class="id"> { user.ID } </div>
                <div> { user.Nickname } </div>
                <div> { user.Login } </div>
                <div> { user.Role } </div>
                <div> <button class="btn" on:click={ ()=> editUserPermitions(user.ID, user.Role ) } > Edit </button> </div>
                <div> <button class="btn" on:click={ ()=> deleteUser(user.ID) }> Delete </button> </div>
            </div>
            {/each}

        {/await}
    </div>

</section>


<style lang="postcss">
    .id {
        background: var(--primary);
        color: #fff;
        padding: 1rem 0;
    }
    .header {
        height: 10vh !important; 
        margin-block: 1rem;
    }
    section {
        grid-column: 1 / -1;
        height: 80vh;
        overflow-y: scroll;
    }
    .list {
        grid-column: 1 / -1;
        overflow-y: scroll;
    }
    .title {
        width: 100%;
    }
    .user-item {
        width: 100%;
        grid-column: 1 / -1;
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        align-items: center;

        box-shadow: var(--shadow3);
        height: 30vh; 
        margin-block: 1rem;
        font-size: 1.6rem;
    }
    .btn {
        padding: 1rem 2rem;
        border: var(--primary) .25em solid;
        background: none;
        color: var(--primary);
        transition: .5s;
        cursor: pointer;
        box-shadow: var(--shadow4);
        position: relative;

    }
    .btn::before,
    .btn::after { 
        position: absolute;
        content: '';
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        border: none .25em solid;
        transition: .5s;
    }
    .btn:hover::before { 
        border: var(--primary) .25em solid;
        top: -1rem;
        left: -1rem;
    }
    .btn:hover::after { 
        border: var(--primary) .25em solid;
        top: .5rem;
        left: .5rem;
    }
    .btn:hover {
        color: var(--bg);
        background: var(--primary);
    }
</style>