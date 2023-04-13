/** @type {import('tailwindcss').Config} */

module.exports = {
    content: ["./src/**/*.{html,js}"],
    theme: {
        extend: {
            colors: {
                blue: {
                    100: "#CFCFD6",
                    200: "#B7B7C2",
                    300: "#9F9FAE",
                    400: "#706E85",
                    500: "#585671",
                    600: "#403E5D",
                    700: "#282648",
                    800: "#1C1A3E",
                    900: "#100E34",
                },
            },
        },
    },
    plugins: [],
};
