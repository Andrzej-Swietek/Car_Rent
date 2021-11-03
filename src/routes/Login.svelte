<script>
    import Blob from '../components/Blob.svelte'
    import { setSesstion } from '../modules/setSession.svelte'
    /**
     * Method that's responsible for login in procedure
     * @param e - event
     */
    async function onSubmit(e) {
        const formData = new FormData();
        formData.append("login",login);
        formData.append("password",password);
  
            const URL = "http://localhost:8888/Car_Rent_Project/car_rental_app/public/backend/Authenticate.php";
            try {
                const res = await(await fetch(URL, { method: 'POST', body: formData })).json(); 
                console.log(res);
                setSesstion(res);
                if( res.role == 'client' ){ document.location.href = '/#/dashboard'; }
                else if ( res.role == 'admin' ) { document.location.href = '/#/dashboard'; }
                else {

                }
            } catch( e ) {
                console.error( 'ERROR '+e );
            }
    }
    let login = null;
    let password = null;
</script>

<section>
    <h1 class="title"> LOGIN </h1>
    <form on:submit|preventDefault={onSubmit}>
        <label for="login">
            <input type="text" bind:value={login} name="login" id="login" placeholder="Login..."/>
        </label>
        <label for="password">
            <input type="text" bind:value={password} name="password" id="password" placeholder="Password..."/>
        </label>
        <input type="submit" name="login" id="login" value="Login"/>
        <a class="register-btn" href="#/register">Register</a>
    </form>
    
</section>
<Blob />

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
    .register-btn {
        margin-top: 3rem;
        grid-column: 1 / -1; 
        text-decoration: none;
        color: var(--bg);
    }
    form {
        grid-column-start: 2; 
        grid-column-end: 12;  
        height: auto;
        padding-block: 2rem;
        width: 100%;
        background: var(--primary);
        display: flex; flex-flow: column nowrap;justify-content: center; align-items: center;
        position: relative;
        box-shadow: var(--shadow4);
        border-radius: 45px;
    }
    form::after {
        content: '';
        clip-path: url(#mask);
        position: absolute;
        width: 100%;
        height: 100%;
        /* background: var(--secondary); */
        background: #000;
        /* z-index: -1; */
        top: -50%;
        left: -10%;
    }

    @media (max-width: 375px ) { 
        form {
            height: auto;
            padding-block: 1rem;
        }
        form::after {
            display: none;
         }
    }
    @media (max-width: 667px ) { 
        form::after {
            display: none;
         }
    }
    @media (max-width: 1200px ) { 
        form::after {
            display: none;
         }
    }
    @media (max-width: 1500px ) { 
        form::after {
            display: none;
         }
    }

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