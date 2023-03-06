'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class orders extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  orders.init({
    id: DataTypes.INTEGER,
    spisok: DataTypes.STRING,
    sum_price: DataTypes.INTEGER,
    orders_date: DataTypes.DATE,
    buyer: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'orders',
  });
  return orders;
};