# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mfc_model=TblMfcModel.create(name: 'Brother MFC-L8600CDW' #Device Model name
                             )

user=TblUser.create(first_name: 'Kunal',
                  last_name: 'Arora',
                  email: 'kunalar@gmail.com',
                  country: 'Japan',
                  time_zone: 'Japan Time',
                  password: 'kunal',
                  mfc_id: mfc_model.id,
                  enabled: 1,  #Account Enabled(1- true, 0-false)
                  confirmation_code: 'brotherkunalmfc', #Confirmation code received on registration
                  last_login: '2010-05-14', #DateTime when user was last logged in
                  mfc_access: '1', # 1-active, 0-inactive
                  uid: '{3488664F-19AD-2D35-B3E2-A65B1D244417}' # User uuid
                  )

user_mfc=TblUserMfc.create(mfc: 0,
                         id_user: user.id,
                         name: 'Brother machine', #Automatically assigned Device name
                         status: 1, #Mfc status (-1)-Delete status
                         online: 1, #Connection state 1-online, 0-offline
                         last_presence: '1418939642866', #Last time when device was Online or Offline
                         serial: 'U63783H9A843433', # Device Serial number
                         mfc_specifications: { "FirmwareVersion": {
                                                                  "MAIN": "N1408251003:3FCE",
                                                                  "SUB1": "1.05",
                                                                  "SUB2": "J14082510" },
                                              },
                         device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4', #Device ID
                         id_model: mfc_model.id )

serial_mfc=TlbSerialMfc.create(serial: 'U63783H9A843433', #Device Serial number
                    id_model: mfc_model.id,
                    id_mfc: user_mfc.id,
                    name: 'Brother MFC-L8600CDW_U63783H9A843433', #Model name and serial concatenated string
                    uid: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                    api: '3.0.4' #Device API version
                    )

subscription_config=TblSubscriptionConfig.create(device_id: user_mfc.device_id,
                             object_id: '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', #MIB
                             registered_date: '2010-05-10', #Registered Date
                             updated_date: '2010-05-11', #Updated time
                             deleted: 0, #Delete flag
                             status: 1, #Device Registration state
                             status_message: 'Registered' #Message received from device during registration
                             )

device_status=TblDeviceStatus.create(device_id: user_mfc.device_id,
                       object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', #MIB
                       status: '630104000000011101040000014B41010400002710310104000000016F0104000021FC8101040000005A8601040000000F670104000000016B0104000027105401040000000166010400000001350104000000016A0104000027106C0104000027106D010400002710FF', #Data received from device
                       user_id: user.id,
                       registered_date: '2010-05-10', #Registered Date
                       updated_date: '2010-05-11', #Updated Date
                       )
