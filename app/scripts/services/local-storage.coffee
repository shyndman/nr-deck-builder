# Thin wrapper around LocalStorage that provides JSON (de/)serialization.
class LocalStorageUtils

  getItem: (key) ->
    JSON.parse(localStorage.getItem(key) ? 'null')

  setItem: (key, obj) ->
    localStorage.setItem(key, JSON.stringify(obj))

  deleteItem: (key) ->
    localStorage.deleteItem(key)

  getDate: (key) ->
    if (isoDate = localStorage.getItem(key))?
      new Date(isoDate)
    else
      null

  setDate: (key, date) ->
    localStorage.setItem(key, date.toISOString())

  setNumber: (key, num) ->
    @setItem(key, Number(num))


angular.module('onoSendai')
  .service 'localStorage', ->
    new LocalStorageUtils(arguments...)