'use strict';

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Trip = models.trip

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Trip.find()
    .then(trips => res.json({
      trips: trips.map((e) =>
        e.toJSON({ virtuals: true, user: req.user })),
    }))
    .catch(next);
}

const indexUser = (req, res, next) => {
  console.log('(/controllers/trips.js) Inside indexUser')
  const owner = { _owner: req.user._id }
  console.log('owner is: ', owner)
  Trip.find(owner)
    .then(trips => res.json({
      trips: trips.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    trip: req.trip.toJSON({ virtuals: true, user: req.user }),
  })
}

const create = (req, res, next) => {
  let trip = Object.assign(req.body.trip, {
    _owner: req.user._id,
  })
  Trip.create(trip)
    .then(trip =>
      res.status(201)
        .json({
          trip: trip.toJSON({ virtuals: true, user: req.user }),
        }))
    .catch(next)
}

const update = (req, res, next) => {
  delete req.body._owner;  // disallow owner reassignment.
  req.trip.update(req.body.trip)
    .then(() => res.sendStatus(204))
    .catch(next);
}

const destroy = (req, res, next) => {
  req.trip.remove()
    .then(() => res.sendStatus(204))
    .catch(next);
}

module.exports = controller({
  index,
  indexUser,
  show,
  create,
  update,
  destroy,
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Trip), only: ['show'] },
  { method: setModel(Trip, { forUser: true }), only: ['update', 'destroy'] },
], })
