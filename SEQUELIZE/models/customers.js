'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class customers extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({carts, orders}) {
      // define association here
      this.hasOne(carts, {foreignKey: 'customerId'})
      this.hasMany(orders, {foreignKey: 'cstomerId'})
    }

    toJSON(){
      return { ...this.get(), id: undefined}
    }
  }
  customers.init({
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {msg: 'У пользователя должно быть имя'},
        notEmpty: {msg: 'Имя пользователя не может быть пустым'}
      }
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {msg: 'У пользователя должен быть пароль'},
        notEmpty: {msg: 'Пароль пользователя не может быть пустым'}
      }
    },
    uuid: {
      type: DataTypes.UUID,
      allowNull: false,
      defaultValue: DataTypes.UUIDV4,
    },
  }, {
    sequelize,
    modelName: 'customers',
  });
  return customers;
};