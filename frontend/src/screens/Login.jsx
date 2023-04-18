import React from 'react'
import styles from '../styles/login.module.css'
import kokoapet from '../assets/pet-kokoa.png'

export const Login = () => {
    return (
        <div className={styles.loginContainer}>
            <div className={styles.boxContainer}>
                <div className={styles.greeting}>
                    <h2>Welcome!</h2>
                    <img src={kokoapet} alt='KOKOA pet' />
                </div>
                <div className={styles.signIn}>
                    <form className={styles.form} action="#">
                        <h2>Log in</h2>
                        <div className={styles.credentials}>
                            <label>USERNAME</label>
                            <input className ={styles.email} type="email" name="email" placeholder=" Email" />
                            <label>PASSWORD</label>
                            <input type="password" name="pswd" placeholder=" Password" />
                        </div>
                        <button>SING UP</button>
                    </form>
                </div>
            </div>
        </div>
    )
}
