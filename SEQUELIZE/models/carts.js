'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class carts extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({customers}) {
      // define association here
      this.belongsTo(customers, {foreignKey: 'customerId'})
    }
  }
  carts.init({
    list: {
      type: DataTypes.STRING,
    },
    sumprice: {
      type: DataTypes.INTEGER,
    },
    customerId: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'carts',
  });
  return carts;
};