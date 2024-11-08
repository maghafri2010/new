const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middleware
// app.use(cors());
// app.use(express.json());
//
// // Routes
// app.use('/api/auth', require('./routes/auth'));
// app.use('/api/rooms', require('./routes/rooms'));
// app.use('/api/reservations', require('./routes/reservations'));
//
// // Error handling
// app.use((err, req, res, next) => {
//   console.error(err.stack);
//     res.status(500).json({ error: 'Something went wrong!' });
//     });
//
//     const PORT = process.env.PORT || 3000;
//     app.listen(PORT, () => {
//       console.log(`Server running on port ${PORT}`);
//       }
