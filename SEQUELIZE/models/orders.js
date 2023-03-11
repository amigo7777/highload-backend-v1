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
    static associate({customers, carts}) {
      // define association here
      this.belongsTo(customers, {foreignKey: 'cstomerId'})
      this.belongsTo(carts, {foreignKey: 'cartId'})
    }

    toJSON(){
      return { ...this.get(), id: undefined, cstomerId: undefined}
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
      allowNull: false,
      defaultValue: DataTypes.DATE, // это просто чтобы развязать руки
    },
    cartId: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    cstomerId: {
      type: DataTypes.INTEGER,
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