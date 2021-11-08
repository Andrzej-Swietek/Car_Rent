<script>

    const colors = [ 'red', 'orange-dark', 'orange-light', 'yellow', 'neon', 'green', 'teal', 'blue', 'blue-dark', 'purple', 'magenta' ]

    const setColor = (color) => {
        const style = getComputedStyle(document.querySelector('#colorsPallete'))
        // alert( style.getPropertyValue('--'+color) ) 
        document.body.style.setProperty('--primary', style.getPropertyValue('--'+color))
    }

</script>

<section class="grid-container" id="colorsPallete">
    <h1 class="title"> Settings </h1>

    <div class="colors-grid">
        {#each colors as color}
            <div class={color} on:click={() => setColor(color)}> { color.replaceAll('-',' ').toUpperCase() } </div>
        {/each}
    </div>
</section>

<style>
    section {
        --red:hsl(5, 100%, 50%); 
        --orange-dark: hsl(15, 100%, 50%);
        --orange-light: hsl(25, 100%, 50%);
        --yellow: hsl(55, 100%, 50%);
        --neon: hsl(75, 100%, 50%);
        --green: hsl(120, 100%, 50%); 
        --teal: hsl(170, 100%, 50%);
        --blue: hsl(195, 100%, 50%);
        --blue-dark: hsl(215, 100%, 50%);
        --purple: hsl(270, 100%, 50%);
        --magenta: hsl(337, 100%, 50%);
    }

    .red { background: var(--red); border: solid .25em #fff; }
    .orange-dark { background: var(--orange-dark); border: solid .25em #fff; }
    .orange-light { background: var(--orange-light); border: solid .25em #fff; }
    .yellow{ background: var(--yellow); border: solid .25em #fff; }
    .neon{ background: var(--neon); border: solid .25em #fff; }
    .green{ background: var(--green); border: solid .25em #fff; }
    .blue{ background: var(--blue); border: solid .25em #fff; }
    .blue-dark{ background: var(--blue-dark); border: solid .25em #fff; }
    .purple{ background: var(--purple); border: solid .25em #fff; }
    .magenta{ background: var(--magenta); border: solid .25em #fff; }
    .teal{ background: var(--teal); border: solid .25em #fff; }


    .grid-container {
        margin-block: 2rem;
        grid-column: 1 / -1;
        height: 85vh;
        background: rgba(243,243,243,.1);
        box-shadow: var(--shadow4);
        overflow-y: scroll;
        display: grid;
        grid-template-columns: repeat(6, 1fr);
    }
    .colors-grid {
        height: 75vh;
        grid-column: 1 / -1;
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        grid-gap: 1rem;
    }
    .colors-grid > div {
        box-shadow: var(--shadow4);
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        color: #fff;
        font-weight: 900;
        border-radius: 45px;
       
    }
    .colors-grid > div:hover {
        box-shadow: var(--shadow);
        border: #fff solid .25em; 
    }

</style>