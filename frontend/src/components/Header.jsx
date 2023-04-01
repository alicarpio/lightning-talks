import React from 'react'
import kokoalogo from '../assets/logo-kokoa-50dpi.png'
import styles from '../styles/header.module.css';

export const Header = () => {
    return (
        <nav className={styles.header}>
            <div className={styles.container}>
                <div className={styles.titleNav}>
                    <img src={kokoalogo} alt='KOKOA logo'/>
                    <h1>Lightning Talks</h1>
                </div>
                <button className={styles.login}><a href='/login'>Log In</a></button>
            </div>
        </nav>
    )
}
