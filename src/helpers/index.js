module.exports = {
  response: (response, status, message, data = {}) => {
    const result = {
      status: status || 200,
      message,
      data,

    };
    return response.status(result.status).json(result);
  },
};
