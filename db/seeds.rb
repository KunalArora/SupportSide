# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mfc_model=TblMfcModel.create(
                            [{id: 1,
                              name: 'Brother MFC-L8600CDW' #Device Model name
                             },
                             {id: 2,
                              name: 'Brother MFC-J5720DW'
                             }])

user=TblUser.create(
                  [{id: 1,
                  first_name: 'Kunal',
                  last_name: 'Arora',
                  email: 'kunalar@gmail.com',
                  country: 'Japan',
                  time_zone: 'Japan Time',
                  password: 'kunal',
                  mfc_id: 1,
                  enabled: 1,  #Account Enabled(1- true, 0-false)
                  confirmation_code: 'brotherkunalmfc', #Confirmation code received on registration
                  last_login: '2010-05-14', #DateTime when user was last logged in
                  mfc_access: '1', # 1-active, 0-inactive
                  uid: '{3488664F-19AD-2D35-B3E2-A65B1D244417}' # User uuid
                  },
                  {id: 2,
                  first_name: 'Suleman',
                  last_name: 'Sikhi',
                  email: 'suleman@gmail.com',
                  country: 'Japan',
                  time_zone: 'Japan Time',
                  password: 'suleman',
                  mfc_id: 2,
                  enabled: 1,  #Account Enabled(1- true, 0-false)
                  confirmation_code: 'brotherkunalmfc', #Confirmation code received on registration
                  last_login: '2010-07-14', #DateTime when user was last logged in
                  mfc_access: '1', # 1-active, 0-inactive
                  uid: '{56789876-19AD-2D35-B3E2-A65B1D244417}' # User uuid
                  }])

user_mfc=TblUserMfc.create(
                       [{id: 1,
                         mfc: 0,
                         id_user: 1,
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
                         id_model: 1
                         },
                         {id: 2,
                          mfc: 0,
                          id_user: 2,
                          name: 'Brother machine', #Automatically assigned Device name
                          status: 1, #Mfc status (-1)-Delete status
                          online: 0, #Connection state 1-online, 0-offline
                          last_presence: '1418939642866', #Last time when device was Online or Offline
                          serial: 'U63783H9A843433', # Device Serial number
                          mfc_specifications: { "FirmwareVersion": {
                                                                   "MAIN": "NG34RTYU:86RT",
                                                                   "SUB2": "F456" },
                                               },
                          device_id: 'a5ef4d02-440e-44cc-6e05-0265bbed7cc3', #Device ID
                          id_model: 2
                          }])

serial_mfc=TlbSerialMfc.create(
                    [{serial: 'U63783H9A843433', #Device Serial number
                    id_model: 1,
                    id_mfc: 1,
                    name: 'Brother MFC-L8600CDW_U63783H9A843433', #Model name and serial concatenated string
                    uid: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                    api: '3.0.4' #Device API version
                    },
                    {serial: 'U63783H9A843433', #Device Serial number
                    id_model: 2,
                    id_mfc: 2,
                    name: 'Brother MFC-J5720DW_E73183L4F138463', #Model name and serial concatenated string
                    uid: 'a5ef4d02-440e-44cc-6e05-0265bbed7cc3',
                    api: '2.8' #Device API version
                    }])

subscription_config=TblSubscriptionConfig.create!(
                            [{device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                             object_id: '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0', #MIB
                             registered_date: '2010-05-10', #Registered Date
                             updated_date: '2010-05-11', #Updated time
                             deleted: 0, #Delete flag
                             status: 1, #Device Registration state
                             status_message: 'Registered' #Message received from device during registration
                             },
                             {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                              object_id: '1.3.6.1.2.1.25.1.1.0', #MIB
                              registered_date: '2010-05-10', #Registered Date
                              updated_date: '2010-05-11', #Updated time
                              deleted: 0, #Delete flag
                              status: 2, #Device Registration state
                              status_message: 'Registered' #Message received from device during registration
                              },
                              {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                               object_id: '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', #MIB
                               registered_date: '2010-05-10', #Registered Date
                               updated_date: '2010-05-11', #Updated time
                               deleted: 0, #Delete flag
                               status: 0, #Device Registration state
                               status_message: 'Registered' #Message received from device during registration
                               }])

device_status=TblDeviceStatus.create(
                       [{device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                        object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', #MIB
                        status: '7601040000000177010400000001780104000000017F0104000000016801040000000155010400000001310104000000013201040000000133010400000001340104000000017001040000238C82010400000064710104000017708301040000003C720104000010CC840104000000326F01040000258081010400000064790104000027107A0104000027107B01040000271080010400002710690104000013247301040000002C7401040000002C7501040000002C7E01040000002C54010400000001350104000000016A0104000027106D010400002710FF', #Data received from device
                        user_id: 1,
                        registered_date: '2010-05-10', #Registered Date
                        updated_date: '2010-05-11', #Updated Date
                        },
                       {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                        object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0', #MIB
                        status: '0001040001A1860201040000B8FF0101040000E8871601040003BD131301040000B6BF1401040000B78B1501040000ADEA1201040001A0DFFF', #Data received from device
                        user_id: 1,
                        registered_date: '2010-05-10', #Registered Date
                        updated_date: '2010-05-11', #Updated Date
                        },
                       {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                        object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0', #MIB
                        status: 'A4010400003A6CA5010400003A6CA6010400003A6CA7010400003A6C88010400005F037301040000C2FA7701040000C2F7FF', #Data received from device
                        user_id: 1,
                        registered_date: '2010-05-10', #Registered Date
                        updated_date: '2010-05-11', #Updated Date
                        },
                        {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                         object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0', #MIB
                         status: '870101A10117A20116A30117A40107A50107A60107A70107A00133880102730102770102FF', #Data received from device
                         user_id: 1,
                         registered_date: '2010-05-10', #Registered Date
                         updated_date: '2010-05-11', #Updated Date
                         }])
