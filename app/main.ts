import express, { Request, Response } from 'express';
import mongoose from 'mongoose';
import Click from './click';

const app = express();
const mongoUrl = process.env.MONGO_URI || 'mongodb://mongodb:27017/testapp';

const connectToMongoDB = async () => {
    try {
        await mongoose.connect(mongoUrl);
        console.log('MongoDB connected...');
    } catch (err) {
        console.error('Error connecting to MongoDB', err);
        process.exit(1);
    }
};

connectToMongoDB();

app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());


app.post("/click", async (req, res) => {
    try {
        const newClick = new Click();
        await newClick.save();
        res.json(newClick);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

app.get('/click', async (req, res) => {
    try {
        const clicks = await Click.find();
        const timestamps = clicks.map(click => click.timestamp.getTime()); // Convert to Unix Epoch time
        res.json({ timestamps });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});


const PORT =  3000;
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});