import QtQuick

Rectangle {
    width: 32
    height: 32
    radius: width
    color: "#007aff"
    Canvas {
        id: canvas
        width: 15; height: 15
        contextType: "2d"
        anchors.centerIn: parent
        Path {
            id: myPath
            startX: 0; startY: 0
            PathSvg {
                id: githubIcon
                property string orginalPath: "M11.146 4V5.172C10.7685 5.25507 10.417 5.42912 10.122 5.679C9.87597 5.91472 9.6839 6.20095 9.55903 6.518C9.40773 6.9145 9.33537 7.33675 9.34603 7.761C9.58261 7.74194 9.82045 7.77625 10.042 7.86141C10.2635 7.94656 10.4631 8.08039 10.626 8.253C10.8887 8.53888 11.0381 8.91082 11.046 9.299C11.0503 9.50429 11.0115 9.70819 10.9323 9.89762C10.8531 10.0871 10.7351 10.2578 10.586 10.399C10.4466 10.5408 10.2802 10.6532 10.0966 10.7297C9.91296 10.8061 9.7159 10.845 9.51703 10.844C9.25257 10.8431 8.99187 10.7813 8.75515 10.6633C8.51843 10.5454 8.31206 10.3746 8.15203 10.164C7.74788 9.63038 7.54688 8.97031 7.58503 8.302C7.58088 7.62548 7.73498 6.95736 8.03503 6.351C8.32966 5.75297 8.74667 5.22353 9.25903 4.797C9.79847 4.35569 10.4536 4.07901 11.146 4V4ZM6.56003 4V5.172C6.1825 5.25507 5.83097 5.42912 5.53603 5.679C5.28997 5.91472 5.0979 6.20095 4.97303 6.518C4.82241 6.91464 4.75073 7.33688 4.76203 7.761C4.99927 7.74118 5.23793 7.77512 5.46024 7.86031C5.68255 7.94549 5.88278 8.07972 6.04603 8.253C6.30609 8.54006 6.45319 8.91171 6.46003 9.299C6.46426 9.50429 6.42552 9.70819 6.3463 9.89762C6.26709 10.0871 6.14914 10.2578 6.00003 10.399C5.86059 10.5408 5.69416 10.6532 5.51056 10.7297C5.32696 10.8061 5.1299 10.845 4.93103 10.844C4.66747 10.842 4.40786 10.7797 4.17211 10.6618C3.93637 10.544 3.73075 10.3737 3.57103 10.164C3.16366 9.63179 2.9607 8.97112 2.99903 8.302C2.99441 7.62673 3.14748 6.9597 3.44603 6.354C3.74147 5.75451 4.15989 5.22399 4.67403 4.797C5.21403 4.35534 5.86986 4.07863 6.56303 4H6.56003Z"
                path: orginalPath
            }
        }
        onPaint: {
            context.path = myPath;
            context.fillStyle = "white"
            context.fill();
        }
    }
}