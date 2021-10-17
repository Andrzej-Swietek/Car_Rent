<script>
    /**
     * Function responsible for registration procedure
     * @param e - event
     */
    const onSubmit = async (e) => {
        const formData = new FormData(e.target);
        const URL = "http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/Register.php";
        try {
            const res = await(await fetch(URL, { method: 'POST', body: formData })).json(); 
            console.log(res);
        } catch( e ) {
            console.error( 'ERROR '+e );
        }
    }
</script>
<section>
    <h1 class="title"> REGISTER </h1>
    <form on:submit|preventDefault={onSubmit}>
        <label for="login">
            <input type="text" name="login" id="login" placeholder="Login..."/>
        </label>

        <label for="password">
            <input type="text" name="password" id="password" placeholder="Password..."/>
        </label>

        <label for="nickname">
            <input type="text" name="nickname" id="nickname" placeholder="Nickname..."/>
        </label>


        <label for="role">
            <input type="text" name="role" id="role" placeholder="Role..."/>
        </label>


        <input type="submit" name="login" id="login" value="Register"/>
    </form>
    
</section>

<style>
    section {
        grid-column: 1 / -1;
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        align-items: center;
        justify-content: center;
    }
    h1.title {  
        grid-column: 1 / -1; 
        font-weight: 900;
        font-size: 3rem;
        letter-spacing: .5rem;
    }
    form {
        grid-column-start: 2; 
        grid-column-end: 12;  
        height: 80vh;
        width: 100%;
        background: var(--primary);
        display: flex; flex-flow: column nowrap;justify-content: center; align-items: center;
        position: relative;
        box-shadow: var(--shadow4);
        border-radius: 45px;
    }
    /* form::after {
        content: '';
        clip-path: url(#mask);
        position: absolute;
        width: 100%;
        height: 100%;
        background: #000;
        top: -50%;
        left: -10%;
    } */
    label {
        width: 100%;
    }
    input[type='text'],
    input[type='password']{
        border: 3px solid var(--bg);
        background: var(--bg);
        padding: 2rem 3rem;
        margin-block: 1rem;
        width: 50%;
        border-radius: 45px;
        font-size: 1.2rem;
        color: var(--secondary);
        transition: .5s;
        outline: none;
    }
    input[type='submit'] {
        border: 3px solid var(--bg);
        background: var(--bg);
        padding: 1.5rem 4rem;
        margin-block: 1rem;
        /* width: 100%; */
        border-radius: 45px;
        font-size: 1.2rem;
        color: var(--secondary);
        transition: .5s;
        cursor: pointer;
    }
    input:focus {
        border: 3px solid var(--secondary);
    }
    input[type='submit']:hover {
        border: 3px solid var(--secondary);
        color: var(--primary);
    }


</style>