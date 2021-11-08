<script>
import Authguard from "../modules/Authguard.svelte";
import { fade, fly } from 'svelte/transition';
import avatar from '../assets/avatar.png';
import Router from "svelte-spa-router";
import MarketPlace from "./dashboard/MarketPlace.svelte";
import Reservations from "./dashboard/Reservations.svelte";
import ManageUsers from "./dashboard/ManageUsers.svelte";
import ManageReservations from "./dashboard/ManageReservations.svelte";
import Settings from "./dashboard/Settings.svelte";
const user = {
    role: sessionStorage.getItem("role"),
    nickname: sessionStorage.getItem("user_nickname")
}
const toggleNav = () => {
    navState = !navState;
    (navState)? document.body.style.setProperty('--asides-width', '3') : document.body.style.setProperty('--asides-width', '1');
    (navState)? document.body.style.setProperty('--buttons-orientation', 'row') : document.body.style.setProperty('--buttons-orientation', 'column-reverse')
}
let navState = true;
const logout = () =>{
    window.sessionStorage.clear();
    location.reload();
}
</script>
   
<Authguard>
			
    <section class="dashboard" slot="authed">
        <aside>
            <div class="buttons">
                <a class="btn" href="/#/dashboard/settings"><i class="fas fa-user-cog"></i></a>
                <div class="btn" on:click={logout}>
                    <i class="fas fa-sign-out-alt"></i>
                </div>
                <div id="hamburger" on:click={toggleNav} >
                    <i class="fas fa-bars"></i>
                </div>
            </div>
            {#if navState}
            <div class="avatar" in:fly="{{ y: 200, duration: 2000 }}" > <img src={ avatar } alt="avatar"> </div>
            <h1 class="nickname" in:fly="{{ y: 200, duration: 2000 }}" > { user.nickname } </h1>
            <nav in:fly="{{ y: 200, duration: 2000 }}">
                <a href="/#/dashboard/">Market Place</a>
                <a href="/#/dashboard/reservations">My Reservations</a> 
                {#if user.role == "admin"}
                <a href="/#/dashboard/manageReservations">Manage Reservations</a>
                <a href="/#/dashboard/manageusers">Manage Users</a>
                {/if}
            </nav>
            {/if}
        </aside>

        <main>
            <Router routes={{
                "/dashboard/": MarketPlace,
                "/dashboard/reservations": Reservations,
                "/dashboard/manageReservations": ManageReservations,
                "/dashboard/manageusers": ManageUsers,
                "/dashboard/settings": Settings
              }} />
        </main>   
    </section>
    
    <section class="dashboard" slot="not_authed">
        <div class="login-btn" in:fly="{{ y: 200, duration: 2000 }}">
            <a href="/#/login">Login</a>
        </div>
    </section>
    
</Authguard>


<style>
    :root{
        --asides-width: 3;
        --buttons-orientation: row;
        --dark: hsl(0, 0%, 15%);
    }
.login-btn{
    grid-column: 1 / -1;
    height: 40vh;
    display: flex;
    align-items: center;
    justify-content: center;
}
.login-btn > a{ 
    background: var(--primary);
    padding: 2rem 5rem;
    color: var(--bg);
    text-decoration: none;
    border-radius: 45px;
    box-shadow: var(--shadow4);
    transition: .5s;
}

.login-btn > a:hover{ 
    background: var(--dark);
}

.dashboard {
    grid-column: 1 / -1;
    display: grid;
    grid-template-columns: repeat(12, 1fr);
    width: 100%;
    height: 95vh;
    grid-gap: 1rem;
}
aside {
    grid-column: span var(--asides-width);
    background: var(--primary);
    border-radius: 0 45px 45px 0;
    box-shadow: var(--shadow2);
    display: flex;
    flex-flow: column nowrap;
    justify-content: center;
    align-items: center;
    padding-block: 2rem;
    position: relative;
}


.avatar {
    box-shadow: var(--shadow4);
    flex: 1;
    background: var(--primary);
    border-radius: 50%;
    aspect-ratio: 1/ 1;
    margin-block: 2rem;
    /* display: flex; */
}

.avatar > img {
    width: 25vh;
    object-fit: contain;
    overflow: hidden;
}
.nickname {
    color: var(--bg);
    font-size: 2.4rem;
    font-weight: 900;
    position: relative;
}
.nickname::after{
    position: absolute;
    bottom: -2rem;
    left: 50%;

    content: '';
    height: 1vh;
    border-radius: 45px;
    width: 50%;
    background: var(--bg);
}
nav {
    width: 90%;
    flex: 5;
    border-radius: 45px;
    display: flex;
    flex-flow: column nowrap;
    justify-content: center;
    align-items: center;
}
nav > a{
    text-decoration: none;
    cursor: pointer;
    color: var(--primary);
    padding: 2rem 1rem;
    width: 100%;
    background: var(--primary);
    background: var(--bg);
    margin-block: .4rem;
    border-radius: 40px;
    position: relative;
    border: 3px solid var(--bg);
}
nav > a::before,
nav > a::after { 
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0%;
    left: 0%;
    border-radius: 45px;
    border: 3px solid var(--bg);
    transition: .5s;
}
nav > a:hover {
    box-shadow: var(--shadow4);
    --bg: hsl(0, 0%, 15%);
    /* z-index: 3; */
}
nav > a:hover::after{ 
    top: 1rem;
    left: 1rem;
    /* z-index: 5; */
    /* box-shadow: var(--shadow-light); */
}
nav > a:hover::before{ 
    top: -2rem;
    left: -1rem;
    /* z-index: 5; */
    /* box-shadow: var(--shadow-light); */
}
.buttons {
    width: 100%;
    display: flex;
    flex-flow: var(--buttons-orientation) wrap;
    justify-content: flex-end;
    align-items: center;
    padding: 0 10%;
    transition: .5s;
}
.buttons > #hamburger,
.btn {
    background: var(--bg);
    padding: 1rem;
    aspect-ratio: 1 / 1;
    border-radius: 50%;
    color: var(--dark);
    display: flex;
    flex-flow: row wrap;
    justify-content: center;
    margin-inline: .1rem;
    cursor: pointer;
    transition: .5s;
    outline: 2px solid var(--bg);
    outline-offset: -.5rem;
}

.buttons > #hamburger:hover,
.btn:hover {
    --dark: var(--primary);
    box-shadow: var(--shadow4);
    outline: 2px solid var(--dark);
    outline-offset: -.5rem;
    transform: scale(1.2);
    /* color: var(--primary); */
 }
 main {
    width: 100%;
    grid-column: span calc( 12 - var(--asides-width) );
    display: grid;
    grid-template-columns: repeat(12, 1fr);
    padding-right: 1rem;
 }
</style>