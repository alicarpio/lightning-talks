import {Header} from "./components/Header"
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import {Login} from "./screens/Login.jsx";
import {HomeScreen} from "./screens/HomeScreen.jsx";
import {useState} from 'react'

function App() {
    const [isButtonClicked, setIsButtonClicked] = useState(false);

    function handleButtonClick() {
        setIsButtonClicked(true);
      }

    return (
        <Router>
           {!isButtonClicked && <Header onButtonClick={handleButtonClick}/>}
            <main>
                <div className='Container'>
                    <Routes>
                        <Route path="/" element={<HomeScreen/>}/>
                        <Route path="/login" element={<Login/>}/>
                    </Routes>
                </div>
            </main>
        </Router>
    )
}

export default App
