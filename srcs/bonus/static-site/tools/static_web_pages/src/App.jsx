// src/App.jsx

import './App.css';
import claraPhoto from './assets/clara.png';

function App() {
  return (
    <div className="container">
      <header>
        <div className="header-content">
          <img src={claraPhoto} alt="Clara Prando" className="profile-pic" />
            <div className="header-text">
              <h1>Clara Prando</h1>
              <p>CS student looking for a 6-month internship in software engineering, starting from September 2025</p>
              <p><a href="mailto:prandoclara.inbox@gmail.com">prandoclara.inbox@gmail.com</a> | (+33) 6 47 07 24 44 | prandoclara</p>
            </div>
        </div>
      </header>

      <section>
        <h2>Skills</h2>
        <ul>
          <p><strong>PROGRAMMING LANGUAGES:</strong> C, C++, JavaScript/TypeScript, Bash</p>
          <p><strong>TOOLS & FRAMEWORKS:</strong> Git, HTML/CSS, Docker, Nginx, SQL, React, Figma</p>
          <p><strong>CLOUD PLATFORMS:</strong> Google Cloud, Microsoft Azure</p>
          <p><strong>CONCEPTS:</strong> Unix Systems, Low-level Programming, Network Programming, Computer Graphics, Virtualization, Concurrency, Complexities</p>
        </ul>
      </section>

      <section>
        <h2>Education</h2>
        <div className="highlighted-title">42 PARIS - COMMON CORE PROGRAM</div>
          <p>#PEER‑TO‑PEER #PROJECT‑BASED #C‑PROGRAMMING #ALGORITHMS #UNIX‑SYSTEMS #DEVOPS #FULLSTACK‑WEB</p>
          <p>Completed the two-year intensive curriculum in just one year (Bac +3 level). Focused on autonomy, collaboration, and real-world problem solving.</p>
            
            <p><strong>   INCEPTION:</strong></p>
            <p>#DOCKER #DEVOPS #NGINX #WORDPRESS #REDIS #FTP #ADMINER #STATIC‑SITE #BONUS</p>

            <ul>
              <li>Designed a secure multi-container architecture using Docker and Docker Compose</li>
              <li>Deploying Nginx, WordPress, and MariaDB with isolated volumes and networks.</li>
              <li>Configured SSL, firewall rules, and Linux services to simulate a production-like environment.</li>
              <li>Implemented bonus services: Redis, FTP, Adminer</li>
              <li>Developed and deployed a custom static site (non-PHP) to showcase a personal portfolio.</li>
            </ul>
            
            <p><strong>   MINISHELL:</strong></p>
            <p>#C‑PROGRAMMING #BASH #SYSTEM‑CALLS #PROCESS‑MANAGEMENT #PARSING #SIGNALS</p>
            <ul>
              <li>Built a functional Unix shell supporting built-in commands, pipelines, redirections, and environment variables.</li>
              <li>Developed a robust parser and implemented signal-safe execution flows with fork/exec patterns.</li>
              <li>Managed process control and file descriptors while ensuring memory safety.</li>
            </ul>
            
            <p><strong>   IRC:</strong></p>
            <p>#C++ #SOCKETS #TCP‑COMMUNICATION #CLIENT‑SERVER #MULTI‑THREADING</p>
          
            <ul>
              <li>Developed a TCP-based IRC server handling multiple clients with concurrent socket connections.</li>
              <li>Implemented client management, message broadcasting, and real-time chat functionality.</li>
              <li>Used multithreading and non-blocking sockets to handle simultaneous I/O efficiently.</li>
            </ul>
            
            <p><strong>   PHILOSOPHERS:</strong></p>
            <p>#C‑PROGRAMMING #POSIX‑THREADS #MUTEX #MULTITHREADING #CONCURRENCY</p>
          
            <ul>
              <li>Simulated the Dining Philosophers problem using POSIX threads and mutexes to avoid race conditions and deadlocks.</li>
              <li>Focused on thread synchronization, starvation prevention, and efficient CPU utilization.</li>
              <li>Monitored performance and ensured clean thread lifecycle management.</li>
            </ul>

          <h3>ESMOD - BACHELOR IN FASHION BUSINESS STRATEGY AND COMMUNICATION</h3>
          <p>2017 - Institut Supérieur Européen de la Mode (ISEM)</p>
      </section>

      <section>
        <h2>Work Experiences</h2>
          <h3>PR MANAGER</h3>
          <p>2017-2022 - Public Relations at OBCM, PR CONSULTING, ACNE STUDIOS</p>
          <ul>
            <li><strong>Project management:</strong> coordinated events (fashion shows, press days), influencer campaigns, and KPI reporting</li>
            <li><strong>Communication & stakeholder relations:</strong> daily interface with clients, agencies, influencers, and stylists</li>
            <li><strong>Analytical mindset:</strong> conducted competitive intelligence and performance analysis of media coverage</li>
            <li><strong>Leadership & autonomy:</strong> recruited and managed an intern, led multi-channel digital campaigns independently</li>
          </ul>
      </section>
      <section>
        <h2>Activities & Interests</h2>
        
          <p><strong>BOXING:</strong> Practiced regularly, rooted in a family legacy with a world champion father. Develops resilience, self-discipline, and mental endurance — key assets in high-pressure environments.</p>
          <p><strong>FASHION & ART:</strong> Curious and attentive to visual culture. Fuels creativity, sense of aesthetics, and attention to detail — valuable in UI/UX thinking and presentation.</p>
          <p><strong>KNITTING & CROCHET:</strong> Mindful and structured creative outlet. Enhances patience, precision, and focus — qualities transferable to coding and debugging.</p>
          <p><strong>TECH-CURIOUS:</strong> Interested in exploring how everyday tech works — recently refurbished an old laptop and set up a Linux distro just for fun.</p>
    
      </section>
    </div>
  );
}

export default App;
