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
  }
  orders.init({
    spisok: {
      type: DataTypes.STRING,
    },
    sum_price: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    orders_date: {
      type: DataTypes.DATE,
      allowNull: false
    },
    buyer: {
      type: DataTypes.STRING,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'orders',
  });
  return orders;
};