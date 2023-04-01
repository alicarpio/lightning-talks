import {Header} from "./components/Header"
import {Card} from "./components/Card.jsx";
import styles from "./styles/card.module.css"


function App() {

    return (
        <>
            <Header/>
            <main>
                <div className='Container'>
                    <Card/>
                </div>
            </main>
        </>


    )
}

export default App
