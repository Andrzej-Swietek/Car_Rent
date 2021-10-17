<script>
  import Router from "svelte-spa-router";
  import logo from './assets/svelte.png';
  import Dashboard from "./routes/Dashboard.svelte";
  import Home from "./routes/Home.svelte";
  import Login from './routes/Login.svelte';
  import NotFound from "./routes/NotFound.svelte";
  import Register from "./routes/Register.svelte";

</script>

<main>
  <nav>
    <a href="#/" class="mr-5 hover:text-gray-900">Home</a>
    <a href="#/login" class="mr-5 hover:text-gray-900">Login</a>
  </nav>

  <Router routes={{
    "/": Home,
    "/login": Login,
    "/register": Register,
    "/dashboard": Dashboard,
    "/dashboard/*": Dashboard,
    "*": NotFound
  }} />
</main>

<style>
  :root {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
      Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    --primary: hsl(15, 100%, 50%);
    /* --primary: teal; */
    --secondary: hsl(120, 2%, 20%);
    --bg: hsl(0, 0%, 95%);
    --shadow1: 0px 0px 5px rgba(0, 0, 0, 0.56);
    --shadow2:rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
    --shadow3:rgba(0, 0, 0, 0.08) 0px 4px 12px;
    --shadow4:rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
    --shadow-light: hsl(0, 0%, 95%) 0px 0px 10px;
  }

  :global(*) {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  :global(body){
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		min-height: 100vh;
		background: var(--bg);
	}
  :global(#app){
    width: 100%;
    height: 100%;
  }
  :global(.title) {  
    grid-column: 1 / -1; 
    font-weight: 900;
    font-size: 3rem;
    letter-spacing: .5rem;
    }

  main {
    width: 100%;
    height: 100vh;
    display: flex;
    text-align: center;
    background: var(--bg);
    display: grid;
    grid-template-columns: repeat(12, 1fr);
    overflow-x: hidden;
  }
  nav {
    grid-column: 1 / -1;
    margin: 1rem;
  }
  nav a {
    color: inherit;
    margin-inline: 1rem;
    text-decoration: none;
    padding: 1rem;
  }
  img {
    height: 16rem;
    width: 16rem;
  }

  h1 {
    color: var(--primary);
    text-transform: uppercase;
    font-size: 4rem;
    font-weight: 100;
    line-height: 1.1;
    margin: 2rem auto;
    max-width: 14rem;
  }

  p {
    max-width: 14rem;
    margin: 1rem auto;
    line-height: 1.35;
  }

  @media (min-width: 480px) {
    h1 {
      max-width: none;
    }

    p {
      max-width: none;
    }
  }
</style>
