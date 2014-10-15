import QtQuick 2.0
import Sailfish.Silica 1.0

Canvas {
    id: canvas

    property var items : ["one", "two", "three", "four", "five", "six", "seven", "eight"]

    onPaint: {
        var ctx = canvas.getContext('2d');

        for(var i = 0; i < canvas.items.length; i++)
        {
            ctx.fillStyle = d.colors[i % 2];

            var startingAngle = d.degreesToRadians(i * d.span);
            var arcSize = d.degreesToRadians(d.span);
            var endingAngle = startingAngle + arcSize;

            ctx.beginPath();
            ctx.moveTo(d.centerX, d.centerY);
            ctx.arc(d.centerX, d.centerY, d.radius, startingAngle, endingAngle, false);
            ctx.closePath();
            ctx.fill();
        }
    }

    // Private properties and functions
    QtObject {
        id: d

        property real span : 360.0 / canvas.items.length
        property real centerX : canvas.width / 2.0
        property real centerY : canvas.height / 2.0
        property real radius : canvas.width < canvas.height ? canvas.width / 2 : canvas.height / 2

        property var colors : [
            Theme.rgba(Theme.primaryColor,0.7),
            Theme.rgba(Theme.highlightColor,0.7),
            Theme.rgba(Theme.secondaryHighlightColor,0.7)
        ]

        function degreesToRadians(degrees) {
            return (degrees * Math.PI)/180;
        }
    }
}
