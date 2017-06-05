'use strict';

const mongoose = require('mongoose');

const tripSchema = new mongoose.Schema({
  tripDate: {
    type: Date,
    required: true,
  },
  resort: {
    type: String,
    required: true,
  },
  equipmentType: {
    type: String,
    required: true,
  },
  conditions: {
    type: String,
    required: true,
  },
  numberOfRuns: {
    type: Number,
    default: 1,
    required: true,
  },
  favoriteRun: {
    type: String,
    required: true,
  },
  comments: {
    type: String,
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      let userId = (options.user && options.user._id) || false;
      ret.editable = userId && userId.equals(doc._owner);
      return ret;
    },
  },
})

// tripSchema.virtual('length').get(function length() {
//   return this.text.length;
// });

const Trip = mongoose.model('Trip', tripSchema)

module.exports = Trip
