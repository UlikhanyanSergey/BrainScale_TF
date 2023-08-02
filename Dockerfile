# Use the Node.js image
FROM node:14

# Set the working directory
WORKDIR /app

# Install the application dependencies
RUN npm install
RUN npm install express ejs

# Copy the app.js file to the container
COPY brainscale-simple-app/app.js .

# Copy the views directory to the container
COPY brainscale-simple-app/views ./views

# Expose port 3000
EXPOSE 3000

# Start the Node.js application
CMD ["node", "app.js"]
