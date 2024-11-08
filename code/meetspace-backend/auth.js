const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const pool = require('../config/database');

router.post('/signup', async (req, res) => {
	  try {
		      const { username, email, password } = req.body;
		      const hashedPassword = await bcrypt.hash(password, 10);
		      
		      const result = await pool.query(
			            'INSERT INTO users (username, email, password_hash) VALUES ($1, $2, $3) RETURNING id, username, email',
			            [username, email, hashedPassword]
			          );

		      const token = jwt.sign(
			            { userId: result.rows[0].id },
			            process.env.JWT_SECRET,
			            { expiresIn: '24h' }
			          );

		      res.json({
			            user: result.rows[0],
			            token,
			          });
		    } catch (error) {
			        res.status(500).json({ error: error.message });
			      }
});

router.post('/login', async (req, res) => {
	  try {
		      const { email, password } = req.body;
		      
		      const result = await pool.query(
			            'SELECT * FROM users WHERE email = $1',
			            [email]
			          );

		      if (result.rows.length === 0) {
			            return res.status(401).json({ error: 'Invalid credentials' });
			          }

		      const user = result.rows[0];
		      const validPassword = await bcrypt.compare(password, user.password_hash);

		      if (!validPassword) {
			            return res.status(401).json({ error: 'Invalid credentials' });
			          }

		      const token = jwt.sign(
			            { userId: user.id },
			            process.env.JWT_SECRET,
			            { expiresIn: '24h' }
			          );

		      res.json({
			            user: {
					            id: user.id,
					            username: user.username,
					            email: user.email,
					          },
			            token,
			          });
		    } catch (error) {
			        res.status(500).json({ error: error.message });
			      }
});

module.exports = router;
