const boardSize = 4;
const board = document.getElementById("board");

function createEmptyBoard() {
  for (let i = 0; i < boardSize * boardSize; i++) {
    const tile = document.createElement("div");
    tile.classList.add("tile");
    tile.dataset.index = i;
    tile.textContent = "";
    board.appendChild(tile);
  }
}

function getTiles() {
  return Array.from(document.querySelectorAll(".tile"));
}

function getTile(row, col) {
  return getTiles()[row * boardSize + col];
}

function getBoardValues() {
  return getTiles().map(t => t.textContent || "");
}

function setBoardValues(values) {
  const tiles = getTiles();
  tiles.forEach((tile, i) => {
    tile.textContent = values[i] || "";
    tile.dataset.value = values[i] || "";
  });
}


function rotateLeft(matrix) {
  return matrix[0].map((_, i) => matrix.map(row => row[i])).reverse();
}

function rotateRight(matrix) {
  return matrix[0].map((_, i) => matrix.map(row => row[row.length - 1 - i]));
}

function slide(row) {
  let newRow = row.filter(val => val !== "");
  for (let i = 0; i < newRow.length - 1; i++) {
    if (newRow[i] === newRow[i + 1]) {
      newRow[i] = (parseInt(newRow[i]) * 2).toString();
      newRow[i + 1] = "";
    }
  }
  return newRow.filter(val => val !== "").concat(new Array(boardSize - newRow.filter(val => val !== "").length).fill(""));
}

function move(direction) {
  const tiles = getTiles();
  const values = getBoardValues();
  let matrix = [];
  for (let i = 0; i < boardSize; i++) {
    matrix.push(values.slice(i * boardSize, (i + 1) * boardSize));
  }

  if (direction === "up") matrix = rotateLeft(matrix);
  if (direction === "down") matrix = rotateRight(matrix);

  let newMatrix = matrix.map(row => direction === "right" ? slide(row.reverse()).reverse() : slide(row));

  if (direction === "up") newMatrix = rotateRight(newMatrix);
  if (direction === "down") newMatrix = rotateLeft(newMatrix);

  const newValues = newMatrix.flat();

  animateDiff(values, newValues, direction);

  if (JSON.stringify(newValues) !== JSON.stringify(values)) {
    setTimeout(() => {
      setBoardValues(newValues);
      addRandomTile();
    }, 150);
  }
}

function animateDiff(oldVals, newVals, direction) {
  const tiles = getTiles();
  for (let i = 0; i < tiles.length; i++) {
    if (oldVals[i] !== "" && newVals[i] === "") {
      tiles[i].dataset.moving = "true";
    } else {
      tiles[i].dataset.moving = "false";
    }
  }

  const offset = {
    left: [-1, 0],
    right: [1, 0],
    up: [0, -1],
    down: [0, 1],
  };

  const [dx, dy] = offset[direction];

  tiles.forEach((tile, index) => {
    const val = oldVals[index];
    if (val !== "") {
      const row = Math.floor(index / boardSize);
      const col = index % boardSize;
      let newRow = row;
      let newCol = col;

      while (true) {
        const nextRow = newRow + dy;
        const nextCol = newCol + dx;
        const nextIndex = nextRow * boardSize + nextCol;
        if (
          nextRow < 0 || nextRow >= boardSize ||
          nextCol < 0 || nextCol >= boardSize ||
          newVals[nextIndex] !== ""
        ) {
          break;
        }
        newRow = nextRow;
        newCol = nextCol;
      }

      const deltaX = (newCol - col) * 110;
      const deltaY = (newRow - row) * 110;
      if (deltaX !== 0 || deltaY !== 0) {
        tile.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
        tile.dataset.moving = "true";
        setTimeout(() => {
          tile.style.transform = "translate(0, 0)";
        }, 150);
      }
    }
  });
}

function getEmptyTiles() {
  return getTiles().filter(tile => tile.textContent === "");
}

function addRandomTile() {
  const emptyTiles = getEmptyTiles();
  if (emptyTiles.length === 0) return;
  const index = Math.floor(Math.random() * emptyTiles.length);
  emptyTiles[index].textContent = "2";
}

// Initialize
createEmptyBoard();
addRandomTile();
addRandomTile();

document.addEventListener("keydown", (event) => {
  const key = event.key.toLowerCase();
  if (key === "arrowleft" || key === "a") move("left");
  else if (key === "arrowright" || key === "d") move("right");
  else if (key === "arrowup" || key === "w") move("up");
  else if (key === "arrowdown" || key === "s") move("down");
});
