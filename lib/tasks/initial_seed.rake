require 'rake'

namespace :db do
  desc "Create initial database for BOC Support Site local development and testing"
  task :initial_seed => :environment do
    if (Rails.env.development?)
      TblMfcModel.create(name: 'Brother MFC-L8600CDW')
      TblUser.create(first_name: 'Kunal', last_name: 'Arora', email: 'kunalar@gmail.com',
                    country: 'Japan', time_zone: 'Japan Time', password: 'kunal',
                    mfc_id: 1, enabled: 1,  #Account Enabled(1- true, 0-false)
                    confirmation_code: 'brotherkunalmfc', #Confirmation code received on registration
                    last_login: '2010-05-14', #DateTime when user was last logged in
                    mfc_access: '1', # 1-active, 0-inactive
                    uid: '{3488664F-19AD-2D35-B3E2-A65B1D244417}') # User uuid
      TblUserMfc.create(mfc: 0, id_user: 1, name: 'Brother machine', #Automatically assigned Device name
                    status: 1, #Mfc status (-1)-Delete status
                    online: 1, #Connection state 1-online, 0-offline
                    last_presence: '1418939642866', #Last time when device was Online or Offline
                    serial: 'U63783H9A843433',
                    mfc_specifications: { "FirmwareVersion": { "MAIN": "N1408251003:3FCE", "SUB1": "1.05", "SUB2": "J14082510" },},
                    device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4', id_model: 1 )
      TlbSerialMfc.create(serial: 'U63783H9A843433', id_model: 1, id_mfc: 1,
                    name: 'Brother MFC-L8600CDW_U63783H9A843433', #Model name and serial concatenated string
                    uid: 'da23bd9a-86da-2580-cefa-d05acfff7eb4', api: '3.0.4') #Device API version
      TblSubscriptionConfig.create!(
                    [{device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4', object_id: '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0', #MIB
                      registered_date: '2010-05-10', updated_date: '2010-05-11',
                      deleted: 0, #Delete flag
                      status: 1, #Device Registration state
                      status_message: 'Registered' }, #Message received from device during registration
                     {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id: '1.3.6.1.2.1.25.1.1.0', registered_date: '2010-05-10',
                      updated_date: '2010-05-11', deleted: 0, status: 2, status_message: 'Registered'},
                     {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id: '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', registered_date: '2010-05-10',
                      updated_date: '2010-05-11', deleted: 0, status: 0, status_message: 'Registered'}
                    ])
      TblDeviceStatus.create(
                    [{device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0', #MIB
                      status: '7601040000000177010400000001780104000000017F0104000000016801040000000155010400000001310104000000013201040000000133010400000001340104000000017001040000238C82010400000064710104000017708301040000003C720104000010CC840104000000326F01040000258081010400000064790104000027107A0104000027107B01040000271080010400002710690104000013247301040000002C7401040000002C7501040000002C7E01040000002C54010400000001350104000000016A0104000027106D010400002710FF',
                      user_id: 1, registered_date: '2010-05-10', updated_date: '2010-05-11'},
                     {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0', #MIB
                      status: '0001040001A1860201040000B8FF0101040000E8871601040003BD131301040000B6BF1401040000B78B1501040000ADEA1201040001A0DFFF',
                      user_id: 1, registered_date: '2010-05-10', updated_date: '2010-05-11'},
                     {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0', #MIB
                      status: 'A4010400003A6CA5010400003A6CA6010400003A6CA7010400003A6C88010400005F037301040000C2FA7701040000C2F7FF',
                      user_id: 1, registered_date: '2010-05-10', updated_date: '2010-05-11'},
                     {device_id: 'da23bd9a-86da-2580-cefa-d05acfff7eb4',
                      object_id:  '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0', #MIB
                      status: '870101A10117A20116A30117A40107A50107A60107A70107A00133880102730102770102FF',
                      user_id: 1, registered_date: '2010-05-10', updated_date: '2010-05-11'}
                    ])
    end
  end
end
