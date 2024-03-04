import mongoose from 'mongoose';

const clickSchema = new mongoose.Schema({
    timestamp: {
        type: Date,
        default: Date.now
    }
});

const Click = mongoose.model('Click', clickSchema);

export default Click;
