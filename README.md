## Waffle-Stay-Hotel-Accommodation-Voucher

### Overview

For NFTs representing art pieces, ownership alone is not enough if there is no place to appreciate the artwork. This is because NFTs represent digital ownership of the artwork. Therefore, a venue such as an exhibition or gallery is necessary to appreciate the artwork, and the NFT can be used as an exchange voucher at that venue.

For hotel accommodation NFTs, they can be provided as exchange vouchers that can only be used at the respective hotel. In this case, the NFT owner has the right to stay at that specific hotel, and cannot use the NFT at other hotels. This type of NFT represents the hotel's accommodation service as an exchange voucher, and the owner also has the right to use the service. Therefore, if the owner wants to stay at that hotel, they can use the NFT as an exchange voucher to do so.

Usage rights represent the potential for digital assets represented by NFTs to be used, and the usage and conditions can vary depending on the type of NFT. NFTs in the form of exchange vouchers have limited places where the asset can be exchanged, and can only be used if the appropriate environment is provided. Therefore, when purchasing an NFT, it is important to thoroughly check the usage and conditions of the NFT and purchase accordingly.

Waffle Stay proposes an NFT system that can provide an environment for exchanging and using NFTs at hotel venues, thus allowing owners to have the right to stay at the hotel by using the NFT as an exchange voucher.

### Waffle Stay Hotel Accommodation NFT

Chain: Goerli Ethereum Testnet

Smart contract address: 0x9A6873BC05ef30f6853C529b7c71Ae9aef297C02

Token Standard: ERC721

---

### Metadata schema

| Key                    | Value                                                        |                    description                    |
| :--------------------- | :----------------------------------------------------------- | :-----------------------------------------------: |
| image                  | https://wafflestay-content-bucket.s3.ap-northeast-2.amazonaws.com/nft/asset/20230404/389be2cd-3f8a-4d9e-9cf7-3d6e28f3eeec/upload.jpg |                      NFT 이미지                       |
| name                   | WaffleStay-Hotel-Voucher                                     |                     NFT name                      |
| description            | - The accommodation voucher you purchased is for one night at the hotel on weekdays during the off-season and is only available on the waffle stay app.<br/> - A separate additional charge may be imposed on the hotel's overnight stay during the peak season or holidays than the purchase amount of the voucher, which will increase by more than 20%.<br/> - You can make a reservation after installing the waffle stay app and entering the accommodation exchange ticket number on your page and the accommodation exchange ticket registration menu.<br/> - When inquiring about the accommodation exchange ticket number on the Froome app, it cannot be transferred or sold to other people.<br/> - The voucher registered on the Waffle Stay app is treated as used and cannot be used with the same voucher number.<br/> - If you have any inconvenience or questions, please contact 1533-7901. |                      NFT description                        |
| attributes             |                                                              |                       NFT attributes                        |
| Hotel_Voucher_Code     | szSdJojt73nuNhhlQj+9dBiH/JSL8UjJxxHlF+4=                     |                  hotel voucher code                  |
| Hotel_Name             | Sokcho Marina Bay Hotel                                         |                     hotel name                     |
| Hotel_Address          | Cheongchohoban-ro 24, Sokcho-si, Gangwon-do, 24885                         |                     hotel address                     |
| Hotel_price            | 97000                                                        |                     hotel price                     |
| Room_Type              | Deluxe Twin Room, Lake View                                     |                      room type                      |
| Start_Date             | 2023-05-01                                                   |                  Validity period start date                  |
| Due_Date               | 2023-10-31                                                   |                  Validity period end date                  |
| Peak_Season_Start_date | 2023-07-17                                                   |                   Peak season start date                   |
| Peak_Season_Due_date   | 2023-08-18                                                   |                   Peak season end date                   |
| Peak_Season_Setting    | true                                                         |                 Peak season status                  |
| Voucher_Amount         | 0                                                            |                  hotel voucher amount                  |
| Mileage                | 0                                                            | Miles to be paid when booking a hotel |
| Caution                | Examples of precautions                                      |                     caution                     |
| Used                   | false                                                        |                     use status                     |
| Proved_By              | Waffle-Stay                                                  |                      provider                       |

---

### How to use Hotel Voucher NFT

- [ STEP 1]

WaffleStay uses voucher code as a metadata attribute for the hotel accommodation NFT product, and signs the hash value of the message by the owner's wallet address to generate a signed hash value.

<img width="1200" alt="image" src="https://user-images.githubusercontent.com/99451647/236444370-381a79dc-39d2-4236-9e5a-bd3eaaf87833.png">

- [ STEP 2] 

To use WaffleStay's hotel accommodation NFT, the voucher code of the NFT and the signed hash value generated from the owner's wallet address must be entered into the hotel's internal system. Through this process, the hotel can verify whether the user has the authority to exchange and use the NFT. Entering the combined words is a necessary security measure during this process.

<img width="1200" alt="image" src="https://user-images.githubusercontent.com/99451647/236444912-e40bf883-2fa7-4a7e-8b69-7c2ebe013220.png">

- [ STEP3 ]

By verifying the signed hash value, one can confirm the validity of the owner's wallet and the voucher code message, and thereby confirm the ability to use the corresponding NFT through the validation process of the voucher code message and the owner's wallet validation.

<img width="1200" alt="image" src="https://user-images.githubusercontent.com/99451647/236448802-60f5a2f8-1950-43d0-8f7b-f0f0744f5341.png">


