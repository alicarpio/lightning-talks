import React from 'react'
import styles from '../styles/login.module.css'
import kokoapet from '../assets/pet-kokoa.png'

export const Login = () => {
  return (
    <div className={styles.formContainer}>
        <div className={styles.welcomeLogin}>
            <h2>Welcome!</h2>
            <img src={kokoapet} alt='KOKOA pet'/>
        </div>
        <div className={styles.signIn}>
            <form action={}>
                <h2>Log in</h2>
                <label>USERNAME</label>
                <input type="email" name="email" placeholder="Email"/>
                <label>PASSWORD</label>
                <input type="password" name="pswd" placeholder="Password"/>
                <button>SING UP</button>
            </form>
        </div>
    
    
    </div>
  )
}
