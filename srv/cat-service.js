const cds = require('@sap/cds');


async function NewRecord(req) {
    console.log('req', req.data);
    const { Books } = cds.entities; // Assuming Books entity is defined in your CDS model
  
    const userData = req.data;
  
    try {
      const newUser = await cds.transaction(req).run(
        INSERT.into(Books).entries({
          ID: userData.ID,
          title: userData.title,
          stock: userData.stock,
          author: userData.author
        })
      );
  
      console.log('New user inserted:', newUser.results[0]);
      // Construct response object
      const response = {
        message: 'User signed up successfully'
      };
  
      // Return response object
      return response;
      // return { id: newUser.id }; // Return only the ID of the new user
    } catch (error) {
      console.error('Error inserting user:', error);
      throw new Error('Failed to insert user');
    }
  };
async function EditRecord(req) {
    console.log('req', req.data);
    const { Books } = cds.entities; // Assuming Books entity is defined in your CDS model
  
    const userData = req.data;
  
    try {
      const newUser = await cds.transaction(req).run(
        INSERT.into(Books).entries({
          ID: userData.ID,
          title: userData.title,
          stock: userData.stock,
          author: userData.author
        })
      );
  
      console.log('New user inserted:', newUser.results[0]);
      // Construct response object
      const response = {
        message: 'User signed up successfully'
      };
  
      // Return response object
      return response;
      // return { id: newUser.id }; // Return only the ID of the new user
    } catch (error) {
      console.error('Error inserting user:', error);
      throw new Error('Failed to insert user');
    }
  };

module.exports = cds.service.impl(srv => {
    srv.on('CustomCreateUnbound', NewRecord);
    srv.on('CustomInbound', EditRecord);
  });