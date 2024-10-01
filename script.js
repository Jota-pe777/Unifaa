const mario = document.querySelector(".mario");
const pipe = document.querySelector(".pipe");
const startButton = document.querySelector(".start");
const gameOver = document.querySelector(".game-over");

let gameStarted = false; // Variável para controlar se o jogo começou
let loop; // Variável para armazenar o intervalo

const startGame = () => {
    if (!gameStarted) {
        gameStarted = true; // Marcar que o jogo começou
        pipe.style.right = '-80px'; // Reseta a posição do pipe
        pipe.classList.add('animationpipe'); // Inicia a animação do pipe
        startButton.style.display = 'none'; // Esconde o botão "Iniciar"
        gameOver.style.display = 'none'; // Esconde o game over quando começa

        // Inicia o loop de verificação de colisão
        loop = setInterval(checkCollision, 10);
    }
}

const restartGame = () => {
    gameOver.style.display = 'none';
    pipe.classList.remove('animationpipe'); // Remove a animação antes de reiniciar
    pipe.style.right = '-80px'; // Reseta a posição do pipe
    mario.src = './images/mario.gif';
    mario.style.width = '150px';
    mario.style.bottom = '0';

    // O botão "Iniciar" deve ser mostrado novamente
    startButton.style.display = 'block'; // Mostra o botão de iniciar
    gameStarted = false; // Reseta o estado do jogo
    clearInterval(loop); // Para o loop anterior
}



const jump = () => {
    if (gameStarted && !mario.classList.contains("jump")) { // Impede múltiplos saltos e verifica se o jogo começou
        mario.classList.add("jump");
        setTimeout(() => {
            mario.classList.remove("jump");
        }, 500);
    }
}

const checkCollision = () => {
    if (gameStarted) { // Apenas verifica a colisão se o jogo começou
        const pipePosition = pipe.offsetLeft;
        const marioPosition = +window.getComputedStyle(mario).bottom.replace("px", "");

        if (pipePosition <= 120 && pipePosition > 0 && marioPosition < 80) {
            pipe.classList.remove('pipe-animation'); // Para a animação do pipe
            mario.src = 'images/game-over.png';
            mario.style.width = '75px';
            mario.style.marginLeft = '50px';
            gameOver.style.display = 'flex'; // Exibe a tela de Game Over
            
            clearInterval(loop); // Para o loop
            gameStarted = false; // Reseta o estado do jogo
        }
    }
}

document.addEventListener("keydown", (e) => {
    if (e.key === 'Enter') { // Iniciar jogo ao pressionar Enter
        startGame();
    } else if (e.key === ' ') { // Permitir pular com a barra de espaço
        jump();
    }
});
