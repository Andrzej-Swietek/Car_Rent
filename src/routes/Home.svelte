<script>
    import Blob from "../components/Blob.svelte";
    import Footer from "../components/Footer.svelte";
    import CarDisplay from "../components/CarDisplay.svelte";
    import {push} from 'svelte-spa-router'
    const goToDashboard = () =>{
        push('/dashboard')
    }
</script>
<header>
    <div class="mini-blob">
        <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <path fill="var(--primary)" d="M37.3,-56.5C48.6,-50.8,58.2,-40.9,64.3,-29C70.4,-17,73.1,-3.1,70.1,9.3C67.1,21.6,58.4,32.4,50.5,46.5C42.5,60.6,35.3,78.1,22.8,85.4C10.2,92.6,-7.6,89.6,-24.6,84.4C-41.6,79.1,-57.9,71.7,-68.2,59.3C-78.5,47,-82.9,29.8,-80.3,14.6C-77.8,-0.6,-68.3,-13.7,-61.8,-28.3C-55.3,-42.8,-51.6,-58.8,-41.8,-65.1C-32,-71.4,-16,-68,-1.5,-65.7C13,-63.4,26,-62.1,37.3,-56.5Z" transform="translate(100 100)" />
          </svg>
    </div>
    <!-- FF4000 -->
    <h1 class="title"> WELCOME TO RENT<span>CAR</span></h1>
    <Blob />
    <div id="blob-shape"></div>
    <div class="description">  
        <h1>Best <span>cars</span> for the <span>smallest</span> price </h1>
        <button on:click={goToDashboard}> Check Out The Offer </button>
     </div>
</header>
<section class="offer">
    <h1 class="half-col"> PREMIUM OFFER </h1>
    <div class="other-half">
        <ul>
            <li>  <span>S</span> class models  </li>
            <li>  Driver <span> -50% </span> </li>
            <li>  For each 48h 1h for <span>FREE</span>  </li>
        </ul>
    </div>
</section>
<section id="car-display">
    <CarDisplay carName="Golf 3 1999" image="https://a.allegroimg.com/s1024/0c2c12/0cb8fd9f4874a7b2e1c441c0a920" price="25 zł/h" />
    <CarDisplay carName="Tesla model S" image="https://i.wpimg.pl/1200x0/m.autokult.pl/65cc9a70bbf881d901b6e2d3-a44a739.jpg" price="50 zł/h" />
    <CarDisplay carName="Chevrolet Camaro 2021" image="https://cdn.motor1.com/images/mgl/0lzY9/s1/camaro-ss-with-1le-package.jpg" price="40 zł/h" />
    </section>
<Footer />
<style>
    .mini-blob {
        position: absolute;
        top: -20%;
        right: -10%;
        width: 30%;
        height: 30vh;
        /* background: #000; */
    }
    .mini-blob::after{
        position: absolute;
        content: '';
        width: 75%;
        height: 70%;
        border-radius: 25% 50% 0 50%;
        background: var(--primary);
    }
    header {
        grid-column: 1 / -1;
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        align-items: center;
        justify-content: center;
        border-top: .25em solid var(--primary);
        border-bottom: .25em solid var(--primary);
        position: relative;
        height: 90vh;
    }
    h1 {
        position: relative;
    }
    h1::before {
        position: absolute;
        left: 30%;
        top: -5%;
        content: '';
        width: 10%;
        height: 5px;
        background: var(--primary);
    }
    h1 > span {
        color: var(--primary);
        position: relative;
    }
    h1 > span::after {
        position: absolute;
        left: 0;
        top: 100%;
        content: '';
        width: 100%;
        height: 5px;
        background: var(--primary);
    }
    .offer {
        grid-column: 1 / -1;
        height: 50vh;
        border: 1px solid var(--primary);
    }
    #blob-shape {
        grid-column: span 6;
        width: 100%;
        height: 100%;
        clip-path: url(#blob);
        /* background: var(--secondary); */
        position: relative;
    }
    #blob-shape::after {
        content: '';
        clip-path: url(#mask);
        position: absolute;
        transform: scale(2);
        width: 100%;
        height: 100%;
        background: var(--primary);
        /* top: -50%;*/
        left: -10%; 
    }
    .description {
        grid-column: span 5;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-flow: column nowrap;
        width: 100%;
    }
    .description > button {
        margin-block: 2rem;
        background: var(--primary);
        padding: 2rem 4rem;
        color: var(--bg);
        border: 1px solid var(--primary);
        outline: none;
        transition: .5s;
        cursor: pointer;
        box-shadow: var(--shadow4);
        border-radius: 45px;
        font-size: 1.2rem;
    }
    .description > button:hover {
        --primary: hsl(15, 100%, 40%)
    }
    .offer {
        margin-top: 50vh;
        grid-column: 1 / -1;
        width: 100%;
        height: 50vh;
        position: relative;
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        align-items: center;
        justify-content: center;
        position: relative;
        border: none;
        box-shadow: var(--shadow4);
    }
    .offer::before {
        position: absolute;
        width: 50%;
        height: 100%;
        border-radius: 50%;
        background: var(--secondary);
    }
    .half-col {
        grid-column: span 6;
        height: 100%;
        display: flex; justify-content: center; align-items: center;
        background: var(--primary);
        border-radius: 0 45px 45px 0;
        color: var(--bg);
        box-shadow: var(--shadow4);
        font-weight: 900;
        font-size: 3rem;
    }
    .other-half {
        grid-column: span 6;
        display: flex; justify-content: center; align-items: center;
    }
    .other-half > ul {
        width: 90%;
        border: .5em var(--primary) solid;
        display: flex; justify-content: center; align-items: center; flex-flow: column nowrap;
    }
    .other-half > ul > li {
        width: 90%;
        margin-block: 2rem;
        list-style: none;
        font-size: 2rem;
        /* background: gray; */
        display: flex; justify-content: flex-start; align-items: center;
    }
    .other-half > ul > li::before {
        content: '';
        width: 25px;
        height: 25px;
        background: var(--primary);
        display: block;
        margin-right: 2rem;
        border-radius: 45px;
    }
    .other-half > ul > li > span {
        color: var(--primary);
        margin-inline: 1rem;
        font-weight: 900;
    }

    #car-display {
        margin-block: 2rem;
        grid-column: 1 / -1;
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        align-items: center;
        justify-content: center;
        background: #fff;
        height: 80vh;
        box-shadow: var(--shadow4);
        padding: 1rem;
        grid-gap: 1rem !important;
    }
</style>