-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 16 Jun 2025 pada 19.03
-- Versi server: 9.1.0
-- Versi PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luxora`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` varchar(6) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `customerImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customerID`, `Name`, `gender`, `PhoneNumber`, `Address`, `Email`, `Password`, `customerImage`) VALUES
('CUS001', 'Christiano Ronaldo', 'Male', '081908196194', 'Jl. Bendungan Hilir 14 No.23, RT.4/RW.3, Bend. Hil', 'ronaldo@gmail.com', '$2y$10$A0r97TLJn6/7qH/fXhMFG.UNDuBk4JqjqOgRYCOT0.azHvY56MPOO', 'C001.png'),
('CUS002', 'Marteen Paes', 'Male', '088912345678', 'Avenida de Concha Espina No. 1, Apartemen 12B, Cha', 'paes@gmail.com', '$2y$10$NLt.XfIcCAayOpIUOZ25BO5NrO0geORA/KsQqdrelvQV8LzM8Sxma', 'C002.png'),
('CUS003', 'Emil Audero', 'Male', '087323456789', 'Calle de Serrano No. 45, Lantai 5, Salamanca, Madr', 'audero@gmail.com', '$2y$10$GgNSzAgQVF9x.p2vXHDCJuC26aduhPnrOh6e9ik2i2Eyhg2OOo.3C', 'C003.png'),
('CUS004', 'Ragnar Oratmangoen', 'Male', '082134567890', 'Calle de Velázquez No. 120, Blok C, Apartemen 8A, ', 'oratmangoen@gmail.com', '$2y$10$q2l2k7W0fbeodKT5TV.u/O8iai8gdsyCP2/L33tcI8eRzE1U3zVdK', 'C004.png'),
('CUS005', 'Marselino Ferdinan', 'Male', '089145678901', 'Paseo de la Castellana No. 200, Lantai 10, Tetuán,', 'ferdinan@gmail.com', '$2y$10$ujXdEgS7b5eQqfb621g/y.Z78MW0kgtINTH9pgfHXcB.qDFpoDHG2', 'C005.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `deliveryID` varchar(2) NOT NULL,
  `deliveryType` varchar(50) DEFAULT NULL,
  `deliveryFee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `delivery`
--

INSERT INTO `delivery` (`deliveryID`, `deliveryType`, `deliveryFee`) VALUES
('FE', 'FedEx', 5.00),
('LP', 'Lion Parcel', 3.00),
('NE', 'Ninja Express', 2.00),
('SC', 'Sicepat', 2.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotdeals`
--

DROP TABLE IF EXISTS `hotdeals`;
CREATE TABLE IF NOT EXISTS `hotdeals` (
  `productID` varchar(6) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `finalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `hotdeals`
--

INSERT INTO `hotdeals` (`productID`, `discount`, `finalPrice`) VALUES
('PRO005', 21.00, 27.65),
('PRO006', 35.00, 20.15),
('PRO007', 50.00, 14.50),
('PRO009', 50.00, 75.00),
('PRO012', 20.00, 19.20),
('PRO013', 27.00, 153.30),
('PRO014', 44.00, 106.40),
('PRO015', 10.00, 31.50),
('PRO016', 19.00, 557.09),
('PRO019', 13.00, 217.50),
('PRO032', 28.00, 324.00),
('PRO033', 47.00, 42.40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `orderID` varchar(6) NOT NULL,
  `customerID` varchar(6) DEFAULT NULL,
  `paymentTypeID` varchar(50) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `orderDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `customerID` (`customerID`),
  KEY `paymentTypeID` (`paymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`orderID`, `customerID`, `paymentTypeID`, `tax`, `totalPrice`, `orderDate`) VALUES
('TRX001', 'CUS003', 'BC', 3.80, 49.30, '2023-01-14 17:57:49'),
('TRX002', 'CUS002', 'OV', 24.74, 282.64, '2023-01-26 03:00:00'),
('TRX003', 'CUS004', 'DA', 39.74, 446.14, '2023-03-16 06:00:00'),
('TRX004', 'CUS003', 'BC', 18.41, 212.01, '2023-10-12 08:00:00'),
('TRX005', 'CUS005', 'SB', 29.20, 330.73, '2023-10-19 10:00:00'),
('TRX006', 'CUS001', 'GP', 16.92, 194.42, '2024-02-05 11:00:00'),
('TRX007', 'CUS002', 'DA', 25.00, 277.50, '2024-06-15 11:10:00'),
('TRX008', 'CUS003', 'BC', 13.50, 148.00, '2024-07-01 11:20:00'),
('TRX009', 'CUS004', 'OV', 20.00, 210.50, '2024-07-16 11:30:00'),
('TRX010', 'CUS005', 'SB', 12.00, 120.50, '2024-03-20 11:40:00'),
('TRX011', 'CUS001', 'GP', 14.50, 170.00, '2024-12-30 12:00:00'),
('TRX012', 'CUS002', 'DA', 18.00, 200.50, '2025-02-18 12:05:00'),
('TRX013', 'CUS003', 'BC', 22.10, 245.60, '2025-03-08 12:10:00'),
('TRX014', 'CUS004', 'OV', 16.80, 185.30, '2025-06-16 12:15:00'),
('TRX015', 'CUS005', 'SB', 20.00, 220.00, '2025-06-16 12:20:00'),
('TRX016', 'CUS002', 'BC', 19.50, 215.00, '2025-07-01 03:00:00'),
('TRX017', 'CUS004', 'OV', 25.00, 270.00, '2025-07-01 04:00:00'),
('TRX018', 'CUS003', 'DA', 15.00, 165.00, '2025-07-01 05:00:00'),
('TRX019', 'CUS001', 'SB', 22.00, 242.50, '2025-07-02 02:00:00'),
('TRX020', 'CUS005', 'GP', 18.50, 205.00, '2025-07-02 03:30:00'),
('TRX021', 'CUS004', 'DA', 27.00, 292.00, '2025-07-02 04:15:00'),
('TRX022', 'CUS001', 'BC', 10.30, 106.45, '2025-07-04 03:00:00'),
('TRX023', 'CUS002', 'BC', 6.23, 64.15, '2025-07-04 04:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `orderDetailID` varchar(6) NOT NULL,
  `subOrderID` varchar(6) DEFAULT NULL,
  `productID` varchar(6) DEFAULT NULL,
  `size` varchar(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`orderDetailID`),
  KEY `subOrderID` (`subOrderID`),
  KEY `productID` (`productID`),
  KEY `size` (`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `orderdetail`
--

INSERT INTO `orderdetail` (`orderDetailID`, `subOrderID`, `productID`, `size`, `quantity`, `price`) VALUES
('DTL001', 'SUB001', 'PRO012', 'M', 1, 19.20),
('DTL002', 'SUB001', 'PRO012', 'S', 1, 19.20),
('DTL003', 'SUB002', 'PRO008', '41', 1, 187.00),
('DTL004', 'SUB002', 'PRO012', 'M', 1, 19.20),
('DTL005', 'SUB002', 'PRO012', 'L', 1, 19.20),
('DTL006', 'SUB003', 'PRO025', 'M', 1, 22.00),
('DTL007', 'SUB004', 'PRO022', '41', 1, 105.00),
('DTL008', 'SUB004', 'PRO028', 'XL', 2, 125.00),
('DTL009', 'SUB005', 'PRO033', '100ml', 1, 42.40),
('DTL010', 'SUB006', 'PRO025', 'M', 2, 22.00),
('DTL011', 'SUB006', 'PRO027', 'L', 1, 17.92),
('DTL012', 'SUB007', 'PRO010', '41', 1, 122.18),
('DTL013', 'SUB008', 'PRO019', '43', 1, 217.50),
('DTL014', 'SUB008', 'PRO020', '44', 1, 36.58),
('DTL015', 'SUB009', 'PRO031', '40oz', 1, 37.95),
('DTL016', 'SUB010', 'PRO008', '41', 1, 127.16),
('DTL017', 'SUB010', 'PRO009', '42', 1, 47.34),
('DTL018', 'SUB011', 'PRO030', 'M', 1, 19.92),
('DTL019', 'SUB012', 'PRO022', 'L', 1, 89.25),
('DTL020', 'SUB013', 'PRO013', 'M', 1, 153.30),
('DTL021', 'SUB013', 'PRO026', 'S', 1, 10.00),
('DTL022', 'SUB014', 'PRO028', '15oz', 1, 72.50),
('DTL023', 'SUB014', 'PRO029', 'M', 1, 7.50),
('DTL024', 'SUB015', 'PRO014', '43', 1, 106.40),
('DTL025', 'SUB016', 'PRO033', '100ml', 2, 42.40),
('DTL026', 'SUB017', 'PRO031', '40oz', 1, 37.95),
('DTL027', 'SUB018', 'PRO024', '38', 1, 53.72),
('DTL028', 'SUB019', 'PRO023', 'L', 1, 48.50),
('DTL029', 'SUB020', 'PRO008', '41', 1, 127.16),
('DTL030', 'SUB020', 'PRO010', '42', 1, 122.18),
('DTL031', 'SUB021', 'PRO028', '15oz', 1, 72.50),
('DTL032', 'SUB022', 'PRO030', 'M', 2, 19.92),
('DTL033', 'SUB023', 'PRO022', 'L', 1, 89.25),
('DTL034', 'SUB024', 'PRO014', '43', 1, 106.40),
('DTL035', 'SUB025', 'PRO033', '100ml', 1, 42.40),
('DTL036', 'SUB026', 'PRO031', '40oz', 2, 37.95),
('DTL037', 'SUB027', 'PRO008', '41', 1, 127.16),
('DTL038', 'SUB027', 'PRO010', '42', 1, 122.18),
('DTL039', 'SUB028', 'PRO028', '15oz', 1, 72.50),
('DTL040', 'SUB028', 'PRO029', 'M', 1, 7.50),
('DTL041', 'SUB029', 'PRO022', 'L', 1, 89.25),
('DTL042', 'SUB029', 'PRO023', 'M', 1, 48.50),
('DTL043', 'SUB030', 'PRO031', '40oz', 1, 37.95),
('DTL044', 'SUB031', 'PRO030', 'M', 2, 19.92),
('DTL045', 'SUB032', 'PRO025', 'M', 1, 22.00),
('DTL046', 'SUB032', 'PRO027', 'L', 1, 17.92),
('DTL047', 'SUB033', 'PRO014', '43', 1, 106.40),
('DTL048', 'SUB033', 'PRO019', '43', 1, 217.50),
('DTL049', 'SUB034', 'PRO033', '100ml', 1, 42.40),
('DTL050', 'SUB034', 'PRO032', 'L', 1, 324.00),
('DTL051', 'SUB035', 'PRO023', 'L', 1, 48.50),
('DTL052', 'SUB035', 'PRO030', 'M', 1, 19.92),
('DTL053', 'SUB036', 'PRO025', 'M', 1, 22.00),
('DTL054', 'SUB036', 'PRO027', 'L', 1, 17.92),
('DTL055', 'SUB037', 'PRO028', '10oz', 2, 125.00),
('DTL056', 'SUB038', 'PRO031', '40oz', 1, 37.95),
('DTL057', 'SUB039', 'PRO005', 'M', 2, 27.65),
('DTL058', 'SUB039', 'PRO006', 'L', 1, 20.15),
('DTL059', 'SUB039', 'PRO007', 'S', 3, 14.50),
('DTL060', 'SUB040', 'PRO005', 'L', 1, 27.65),
('DTL061', 'SUB040', 'PRO006', 'M', 1, 20.15),
('DTL062', 'SUB040', 'PRO007', 'XL', 1, 14.50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentTypeID` varchar(2) NOT NULL,
  `paymentType` varchar(50) DEFAULT NULL,
  `adminFee` decimal(10,2) DEFAULT NULL,
  `paymentIcon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paymentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`paymentTypeID`, `paymentType`, `adminFee`, `paymentIcon`) VALUES
('BC', 'BCA', 2.50, 'bca.png'),
('DA', 'Dana', 2.00, 'dana.png'),
('GP', 'Gopay', 2.00, 'gopay.png'),
('OV', 'OVO', 3.50, 'OVO.png'),
('SB', 'SeaBank', 1.50, 'seabank.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `productID` varchar(6) NOT NULL,
  `productTypeID` varchar(2) DEFAULT NULL,
  `storeID` varchar(6) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productDescription` text,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `productImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `productTypeID` (`productTypeID`),
  KEY `storeID` (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`productID`, `productTypeID`, `storeID`, `productName`, `productDescription`, `price`, `stock`, `productImage`) VALUES
('PRO001', 'TO', 'STR004', 'Rasant Rib Long Sleeve Dress', 'A stylish ribbed long sleeve dress, perfect for both casual and formal occasions.', 85, 400, 'adidas1.png'),
('PRO002', 'TO', 'STR005', 'Crew Neck T-Shirt', 'Classic crew neck t-shirt made from soft, breathable fabric for everyday comfort.', 75, 250, 'uniqlo1.png'),
('PRO003', 'TO', 'STR005', 'Fleece Full-Zip Jacket | Color Block', 'Warm fleece jacket with a full-zip front and modern color block design.', 125, 150, 'uniqlo2.png'),
('PRO004', 'TO', 'STR005', 'Boston Combination Sunglasses', 'Trendy Boston-style sunglasses with a combination frame for a fashionable look.', 55, 125, 'uniqlo3.png'),
('PRO005', 'TO', 'STR006', 'Long Navy Blazer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 35, 109, 'product3.png'),
('PRO006', 'JT', 'STR006', 'Oversize Baggy Trousers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 31, 100, 'product2.png'),
('PRO007', 'TO', 'STR006', 'Green Sweetshirt Zipper Collar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 29, 150, 'product1.png'),
('PRO008', 'SH', 'STR001', 'Nike Air Force 1', 'Comfortable, durable and timeless—its number one for a reason. The classic 80s construction pairs smooth leather with bold details for style that tracks whether youre on court or on the go.', 187, 100, 'NikeProduct1.png'),
('PRO009', 'SH', 'STR001', 'Nike Air Force 1 1\\\'07 LV8', 'Comfortable, durable and timeless—it\\\'s number one for a reason. The classic \\\'80s construction pairs with bold details for style that tracks whether you\\\'re on court or on the go.', 150, 200, 'AF1 1\'07 LV8.png'),
('PRO010', 'SH', 'STR001', 'Nike Air Force 1 LV8', 'Comfortable, durable and timeless—it\\\'s number one for a reason. The classic \\\'80s construction pairs with bold details for style that tracks whether you\\\'re on court or on the go.', 149, 200, 'AF1 LV8.png'),
('PRO011', 'SH', 'STR001', 'Nike Cortez SE', 'You spoke. We listened. Based on your feedback, we\\\'ve revamped the original Cortez while maintaining the retro appeal you know and love. It has a wider toe area and firmer side panels, so you can comfortably wear them all day without any warping. This special edition features smooth leather and debossed branding for an elevated, monochromatic finish. Cortez fans—this one\\\'s for you.', 125, 350, 'C SE.png'),
('PRO012', 'TO', 'STR001', 'Jordan Shirt', 'Made from soft cotton, this classic tee puts heritage Jordan graphics front and centre. What more do you need?', 24, 500, 'Jordan tops.png'),
('PRO013', 'SH', 'STR001', 'Air Jordan 1 Low SE', 'This fresh take on the AJ1 brings new energy to neutrals. Smooth, premium leather and classic Nike Air cushioning give you the quality and comfort you\\\'ve come to expect from Jordan.', 210, 90, 'Air Jordan low SE.png'),
('PRO014', 'SH', 'STR001', 'Nike Air Jordan Mid 1', 'Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.', 190, 100, 'Air Jordan Mid 1.png'),
('PRO015', 'SH', 'STR001', 'Nike Slides Offcourt Adjust', 'Post game, errands and more—adjust your comfort on the go. The adjustable, padded strap lets you perfect your fit, while the lightweight foam midsole brings first-class comfort to your feet.', 35, 255, 'Offcourt Adjust.png'),
('PRO016', 'AC', 'STR007', 'Medusa Biggie necklace', 'The model is 1.88 m wearing size OS', 689, 25, 'Versace.png'),
('PRO017', 'AC', 'STR008', 'Daytona Desert Eagle', 'A new take on a classic style, the Daytona is named after Daytona Beach, the city where the International Speedway Race takes place. Defined by its tachymeter scale and multiple chronograph counters, this edition takes on a new nickname dubbed the Desert Eagle Arabic that is comfortable and made from lightweight carbon fiber with a fabric strap.', 65250, 10, 'Rolex.png'),
('PRO018', 'AC', 'STR008', ' GMT-Master II Oasis 40mm', 'Designa Individual is known for its customised approach towards some of the world\\\'s most instantly recognisable timepieces. The label takes this Rolex GMT-Master II 40mm and gives it a stealthy new finish, with a two-tone carbon design of beige and black, with a durable fabric strap.', 1580, 250, 'Rolex2.png'),
('PRO019', 'SH', 'STR009', ' 1461 Quad Polished Black', 'Shoes by Dr Martens This item is excluded from promo Lace-up fastening Round toe Contrast stitching Chunky sole Signature textured tread', 250, 45, 'drMartens.png'),
('PRO020', 'SH', 'STR009', '1461 Smooth Quad', 'Shoes by Dr Martens This item is excluded from promo Lace-up fastening Round toe Contrast stitching Chunky sole Signature textured tread', 59, 120, 'drMartens2.png'),
('PRO021', 'SH', 'STR003', 'Vintage Golden Goose', 'Limited signature star patch to the sides', 617, 34, 'GoldenGoose.png'),
('PRO022', 'SH', 'STR003', 'Chuck Taylor Lit Lether', 'kon Converse dari tahun 1970 yang dikerjakan ulang untuk masa kini dengan pembuatan superior dan bahan-bahan premium. Yang terbaik dari yang terbaik', 105, 300, 'converse2.png'),
('PRO023', 'BU', 'STR003', 'Streetwear Set Chuck Taylor ', 'Converse streetwear bundling set', 350, 70, 'converse3.png'),
('PRO024', 'AC', 'STR007', 'Embossed Denim Cap', 'Signature original versace cap ', 68, 150, 'Versace2.png'),
('PRO025', 'TO', 'STR006', 'Textured Cream Polo Shirt', 'Kemeja polo regular fit. Kerah lapel dengan belahan depan. Lengan pendek. Bagian bawah selesaian rib.', 25, 1500, 'catShirts.png'),
('PRO026', 'JT', 'STR006', 'Oversize Button Trousers', 'Relaxed fit trousers made of high-elastic cotton technical fabric. Elastic waistband with drawstring. Front pockets and back patch pocket details.', 32, 1500, 'catTrousers.png'),
('PRO027', 'OW', 'STR006', 'Zipper Bomber Jacket', 'Regular fit jacket made of linen fabric. Stand collar and long sleeves. Passpoil pockets at hips and inner pocket details. Rib finish. Zipper front closure.', 28, 1500, 'catOuterwear.png'),
('PRO028', 'BU', 'STR003', 'Forest Edition Bundling Set', 'Converse bundling set style', 125, 1500, 'catBundling.png'),
('PRO029', 'SH', 'STR003', 'Biege Anniversary Edittion', 'Converse shoes anniversary edittion', 235, 2000, 'catShoes.png'),
('PRO030', 'SO', 'STR003', 'Cargo Biege Street Shorts', 'converse shorts collection', 24, 1200, 'catShorts.png'),
('PRO031', 'BA', 'STR009', 'Business Man Snake Leather Bag', 'Authentic Snake Leather bags dedicated for business man', 55, 2500, 'catBags.png'),
('PRO032', 'AC', 'STR007', '5 Carats Gold Bracelet And Ring', 'Versace Premium Accessories 5 Carats Of Golds', 450, 1000, 'catAccessories.png'),
('PRO033', 'PE', 'STR007', 'SI Soft And Sweet Fragrance', 'Versace perfume collection', 80, 2500, 'catPerfume.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
CREATE TABLE IF NOT EXISTS `productcategory` (
  `productTypeID` varchar(6) NOT NULL,
  `productType` varchar(50) DEFAULT NULL,
  `sizeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`productTypeID`),
  KEY `sizeType` (`sizeType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `productcategory`
--

INSERT INTO `productcategory` (`productTypeID`, `productType`, `sizeType`) VALUES
('AC', 'Accessories', 'general'),
('BA', 'Bag', 'bags'),
('BU', 'Bundling', 'general'),
('JT', 'Jeans & Trousers', 'general'),
('OW', 'Outerwear', 'general'),
('PE', 'Perfume', 'fragrance'),
('SH', 'Shoes', 'footwear'),
('SO', 'Shorts', 'general'),
('TO', 'Tops', 'general');

-- --------------------------------------------------------

--
-- Struktur dari tabel `productreview`
--

DROP TABLE IF EXISTS `productreview`;
CREATE TABLE IF NOT EXISTS `productreview` (
  `orderDetailID` varchar(6) NOT NULL,
  `rating` int DEFAULT NULL,
  `review` text,
  `reviewDate` date DEFAULT NULL,
  PRIMARY KEY (`orderDetailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `productreview`
--

INSERT INTO `productreview` (`orderDetailID`, `rating`, `review`, `reviewDate`) VALUES
('DTL001', 4, 'The cotton material is very comfortable and absorbs sweat, highly recommended', '2023-01-17'),
('DTL002', 5, 'Nike Air Max 90 sangat nyaman dan cocok untuk aktivitas sehari-hari.', '2023-01-17'),
('DTL003', 4, 'Nike Air Max 90 tampilannya keren dan kualitasnya bagus.', '2023-01-28'),
('DTL004', 5, 'Nike Sportswear Club T-shirt sangat nyaman dipakai dan bahannya adem.', '2023-01-28'),
('DTL005', 3, 'Nike Sportswear Club T-shirt warnanya bagus tapi bahannya agak tipis.', '2023-01-28'),
('DTL006', 4, 'Textured Cream Polo Shirt sangat cocok untuk acara santai, bahannya lembut.', '2023-01-28'),
('DTL007', 5, 'Chuck Taylor Lit Lether sangat nyaman dan desainnya klasik.', '2023-03-18'),
('DTL008', 4, 'Forest Edition Bundling Set sangat menarik dan lengkap.', '2023-03-18'),
('DTL009', 5, 'SI Soft And Sweet Fragrance wanginya enak dan tahan lama.', '2023-03-18'),
('DTL010', 5, 'Textured Cream Polo Shirt sangat nyaman dipakai, recommended!', '2023-10-10'),
('DTL011', 4, 'Zipper Bomber Jacket desainnya keren dan hangat.', '2023-10-18'),
('DTL012', 5, 'Nike Air Force 1 LV8 sangat stylish dan nyaman.', '2023-10-18'),
('DTL013', 4, 'Adidas Adilette Aqua Slides sangat nyaman untuk dipakai di rumah.', '2023-10-18'),
('DTL014', 3, 'Adidas Adilette Aqua Slides kurang pas di kaki saya, agak sempit.', '2023-12-20'),
('DTL015', 5, 'Rolex Oyster Perpetual jam tangan mewah dengan kualitas terbaik.', '2023-12-20'),
('DTL016', 5, 'Nike Air Force 1 LV8 sangat nyaman dipakai dan desainnya keren, recommended!', '2024-02-05'),
('DTL017', 4, 'Nike Air Max 90 tampilannya keren dan kualitasnya bagus.', '2025-06-18'),
('DTL018', 5, 'Nike Sportswear Club T-shirt sangat nyaman dipakai dan bahannya adem.', '2024-02-05'),
('DTL019', 4, 'Chuck Taylor Lit Lether tampil klasik dan nyaman dipakai seharian.', '2024-02-05'),
('DTL020', 5, 'Forest Edition Bundling Set sangat lengkap dan cocok untuk hadiah, sangat puas!', '2024-02-20'),
('DTL021', 3, 'Textured Cream Polo Shirt warnanya bagus tapi bahannya agak tipis.', '2024-05-15'),
('DTL022', 5, 'Forest Edition Bundling Set sangat menarik dan lengkap.', '2024-05-15'),
('DTL023', 2, 'Produk kurang sesuai ekspektasi, kualitasnya biasa saja.', '2024-08-01'),
('DTL024', 4, 'Adidas Stan Smith tampilannya bagus dan nyaman dipakai.', '2024-08-01'),
('DTL025', 5, 'SI Soft And Sweet Fragrance wanginya tahan lama dan sangat elegan.', '2024-08-02'),
('DTL026', 5, 'Rolex Oyster Perpetual benar-benar jam tangan mewah, sangat puas dengan kualitasnya.', '2024-08-02'),
('DTL027', 4, 'Dr Martens 1460 sangat kuat dan nyaman dipakai.', '2024-10-25'),
('DTL028', 5, 'Chuck Taylor Lit Lether sangat nyaman dan desainnya klasik.', '2024-10-25'),
('DTL029', 5, 'Nike Air Force 1 LV8 sangat nyaman dipakai dan desainnya keren, recommended!', '2024-12-30'),
('DTL030', 4, 'Nike Air Force 1 LV8 tampil stylish, kualitas bahan bagus.', '2024-12-30'),
('DTL031', 5, 'Forest Edition Bundling Set sangat lengkap dan cocok untuk hadiah, sangat puas!', '2025-02-15'),
('DTL032', 2, 'Nike Sportswear Club T-shirt ternyata bahannya agak tipis dan kurang nyaman.', '2025-02-15'),
('DTL033', 4, 'Chuck Taylor Lit Lether tampil klasik dan nyaman dipakai seharian.', '2025-04-12'),
('DTL034', 3, 'Adidas Stan Smith tampilannya bagus tapi agak kurang nyaman di kaki saya.', '2025-06-09'),
('DTL035', 5, 'SI Soft And Sweet Fragrance wanginya tahan lama dan sangat elegan.', '2025-06-18'),
('DTL036', 5, 'Rolex Oyster Perpetual benar-benar jam tangan mewah, sangat puas dengan kualitasnya.', '2025-06-18'),
('DTL037', 5, 'Nike Air Force 1 is always comfortable and stylish. The classic design never disappoints.', '2025-07-03'),
('DTL038', 4, 'Nike Air Force 1 LV8 offers great comfort and a bold look. Perfect for daily wear.', '2025-07-03'),
('DTL039', 5, 'Forest Edition Bundling Set from Converse is unique and perfect for streetwear lovers.', '2025-07-03'),
('DTL040', 4, 'Biege Anniversary Edition shoes are comfortable and the anniversary design is special.', '2025-07-03'),
('DTL041', 5, 'Chuck Taylor Lit Lether is a classic Converse with premium materials. Very comfortable.', '2025-07-03'),
('DTL042', 4, 'Streetwear Set Chuck Taylor is a great bundle for Converse fans. Stylish and practical.', '2025-07-03'),
('DTL043', 5, 'Business Man Snake Leather Bag is authentic and looks very professional. Highly recommended.', '2025-07-03'),
('DTL044', 4, 'Cargo Biege Street Shorts are comfortable and perfect for casual outings.', '2025-07-03'),
('DTL045', 5, 'Textured Cream Polo Shirt is soft and fits perfectly. Great for daily wear.', '2025-07-03'),
('DTL046', 4, 'Zipper Bomber Jacket is stylish and warm. The linen fabric feels premium.', '2025-07-03'),
('DTL047', 5, 'Nike Air Jordan Mid 1 has an iconic look and is very comfortable for all-day use.', '2025-07-03'),
('DTL048', 4, '1461 Quad Polished Black by Dr Martens is sturdy and stylish. The chunky sole is a plus.', '2025-07-03'),
('DTL049', 5, 'SI Soft And Sweet Fragrance by Versace smells elegant and lasts long.', '2025-07-03'),
('DTL050', 5, '5 Carats Gold Bracelet And Ring from Versace is luxurious and beautifully crafted.', '2025-07-03'),
('DTL051', 4, 'Streetwear Set Chuck Taylor is a cool bundle, perfect for a casual look.', '2025-07-03'),
('DTL052', 4, 'Cargo Biege Street Shorts are comfortable and match well with any top.', '2025-07-03'),
('DTL053', 5, 'Textured Cream Polo Shirt is soft and comfortable, suitable for any occasion.', '2025-07-03'),
('DTL054', 4, 'Zipper Bomber Jacket is trendy and the fit is just right. Recommended for cool weather.', '2025-07-03'),
('DTL055', 5, 'Forest Edition Bundling Set is a must-have for Converse collectors. Very satisfied.', '2025-07-03'),
('DTL056', 5, 'Business Man Snake Leather Bag is elegant and perfect for business meetings.', '2025-07-03'),
('DTL057', 5, 'Long Navy Blazer sangat nyaman dipakai, desainnya elegan dan cocok untuk berbagai acara formal maupun kasual.', '2025-07-04'),
('DTL058', 4, 'Oversize Baggy Trousers sangat nyaman, bahannya adem dan potongannya kekinian. Cocok untuk gaya santai.', '2025-07-04'),
('DTL059', 5, 'Green Sweetshirt Zipper Collar bahannya lembut, nyaman dipakai, dan modelnya trendy. Sangat direkomendasikan.', '2025-07-04'),
('DTL060', 5, 'Long Navy Blazer sangat cocok untuk tampilan formal, bahannya berkualitas dan nyaman dipakai seharian.', '2025-07-04'),
('DTL061', 4, 'Oversize Baggy Trousers potongannya modern dan sangat nyaman untuk aktivitas sehari-hari.', '2025-07-04'),
('DTL062', 5, 'Green Sweetshirt Zipper Collar desainnya keren, bahan adem, dan sangat cocok untuk gaya kasual.', '2025-07-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `customerID` varchar(6) NOT NULL,
  `productID` varchar(6) NOT NULL,
  `size` varchar(6) NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`customerID`,`productID`,`size`),
  KEY `productID` (`productID`),
  KEY `size` (`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sizecategory`
--

DROP TABLE IF EXISTS `sizecategory`;
CREATE TABLE IF NOT EXISTS `sizecategory` (
  `sizeType` varchar(50) NOT NULL,
  PRIMARY KEY (`sizeType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `sizecategory`
--

INSERT INTO `sizecategory` (`sizeType`) VALUES
('bags'),
('footwear'),
('fragrance'),
('general');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sizelist`
--

DROP TABLE IF EXISTS `sizelist`;
CREATE TABLE IF NOT EXISTS `sizelist` (
  `size` varchar(6) NOT NULL,
  `sizeType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`size`),
  KEY `sizeType` (`sizeType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `sizelist`
--

INSERT INTO `sizelist` (`size`, `sizeType`) VALUES
('10oz', 'bags'),
('15oz', 'bags'),
('20oz', 'bags'),
('30oz', 'bags'),
('40oz', 'bags'),
('37', 'footwear'),
('38', 'footwear'),
('39', 'footwear'),
('40', 'footwear'),
('41', 'footwear'),
('42', 'footwear'),
('43', 'footwear'),
('44', 'footwear'),
('100ml', 'fragrance'),
('150ml', 'fragrance'),
('15ml', 'fragrance'),
('20ml', 'fragrance'),
('50ml', 'fragrance'),
('L', 'general'),
('M', 'general'),
('S', 'general'),
('XL', 'general'),
('XS', 'general'),
('XXL', 'general');

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `storeID` varchar(6) NOT NULL,
  `storename` varchar(50) DEFAULT NULL,
  `storePhoneNum` varchar(20) DEFAULT NULL,
  `storeEmail` varchar(50) DEFAULT NULL,
  `storeAddress` varchar(50) DEFAULT NULL,
  `storeDescription` text,
  `password` varchar(255) DEFAULT NULL,
  `storeImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`storeID`, `storename`, `storePhoneNum`, `storeEmail`, `storeAddress`, `storeDescription`, `password`, `storeImage`) VALUES
('STR001', 'Nike', '829182729', 'nike@gmail', 'Jl. Asia Afrika No.19, RT.1/RW.3, Gelora, Kecamata', 'A leading global sports brand delivering innovation and style in every shoe, apparel, and accessory. Nike inspires athletes and fashion enthusiasts alike with cutting-edge technology, bold designs, and a commitment to sustainability. From performance gear to lifestyle essentials, Nike empowers everyone to push their limits and express their individuality.', '$2y$10$3jO5Iq0HbEKYfSOAFchqueGmwKRPwzRi7Af7.Gozn7BLL0YaMmfrm', 'nikeLogo.png'),
('STR002', 'Puma', '231892739', 'puma@gmail', 'Jl. Jenderal Sudirman No.52-53, RT.5/RW.3, Senayan', 'Puma offers modern fashion and sports collections with dynamic designs for an active and trendy lifestyle. Blending sport and street culture, Puma is recognized for its creative collaborations and bold approach to style. The brand continuously redefines athletic wear, making it accessible and appealing to people of all ages.', '$2y$10$91Z/uAju96dO4FsS4NTIpe5A/bWQe0uFM1R5zX/imp9YdlGkQCJ3i', 'pumaLogo.png'),
('STR003', 'Converse', '203189389', 'converse@gmail', 'Jl. Puri Indah Raya Unit 25, RT.3/RW.2, South Kemb', 'Con1verse, a classic streetwear icon, presents timeless footwear and apparel for every generation. Known for its legendary Chuck Taylor All Star sneakers, Converse celebrates individuality and self-expression. The brand’s versatile products seamlessly transition from casual to creative, making them a staple in wardrobes worldwide.', '$2y$10$aTaFOUUVVeS9SBxuKB6SCeHo8SIrAdERFp.monDaX93/WlGNaRDCO', 'converseLogo.png'),
('STR004', 'Adidas', '231029389', 'adidas@gmail.com', 'Jl. Puri Indah Raya Blok U1 17, RT.3/RW.2, Kembang', 'Adidas delivers top innovation and performance in sports products, shoes, and apparel with a modern touch. Driven by a passion for sport and a relentless pursuit of excellence, Adidas combines advanced technology with contemporary design. The brand supports athletes at every level and inspires a culture of movement and creativity.', '$2y$10$5Kzzw0WR/rC0n27DJtpGM.BhTQYOHUta0y8wPqc4JRWUg3Xs1TYRS', 'adidasLogo.png'),
('STR005', 'Uniqlo', '21312314', 'uniqlo@gmail', 'Mal Taman Anggrek - UGF, Jl. Letjen S. Parman No.K', 'Uniqlo is known for high-quality casual wear, minimalist designs, and innovative technology for everyday comfort. The brand focuses on simplicity, longevity, and functionality, offering versatile pieces that fit any lifestyle. Uniqlo’s LifeWear philosophy ensures that every product enhances daily life through thoughtful design and superior materials.', '$2y$10$mLsSuqXg4.BvXneEYiluV.VgTkkYXOgqg9HHlJk96vSULVIGE11XG', 'uniqloLogo.png'),
('STR006', 'Zara Official', '97284917', 'zara@gmail', 'Plaza Senayan, Jl. Asia Afrika No.8 Lt. 2, RT.1/RW', 'Zara Official features the latest fashion collections with elegant and modern designs for every occasion. Renowned for its fast-fashion approach, Zara brings runway trends to the street with remarkable speed and quality. The brand’s sophisticated collections cater to diverse tastes, making high-end style accessible to everyone.', '$2y$10$zOOP2iJ/ouOoG2roXv/wgeqLHFrIPa0Cg.PRPUaFGFptMfE8i5KnS', 'zaraLogo.png'),
('STR007', 'Versace', '288498', 'versace@gmail', 'Plaza Indonesia, Unit L1-15F, Jl. M.H. Thamrin No.', 'Versace, a symbol of luxury and premium lifestyle, offers world-class fashion, accessories, and fragrances. With its bold prints, vibrant colors, and unmistakable Medusa logo, Versace stands at the forefront of Italian glamour. The brand’s creations embody confidence, opulence, and a daring sense of style.', '$2y$10$uH4ipg5Sk.iju7kGx/4OPuBiFCSwfpr7cXGWpXvsPtyBUaT9wGPx.', 'versaceLogo.png'),
('STR008', 'Rolex', '21313111', 'rolex@gmail', 'Chem. du Pont-du-Centenaire 113, 1228 Genève, Swis', 'Rolex, the legendary Swiss luxury watchmaker, is renowned for precision, innovation, and timeless elegance. Each Rolex timepiece is a masterpiece of craftsmanship, combining cutting-edge technology with classic design. The brand’s enduring legacy is built on a commitment to excellence and a passion for horological perfection.', '$2y$10$ubHXsNBjfxaIW1LNac9/OegmMj4aHuVP053BmdRbBtDr4bGvCSvym', 'rolexLogo.png'),
('STR009', 'Dr Martens', '22299489', 'drmartens@gmail', 'Via Torino, 49, 20123 Milano MI, Italia', 'Dr Martens delivers iconic footwear with strong design, comfort, and character for authentic urban style. Famous for its durable boots and distinctive yellow stitching, Dr Martens has become a symbol of rebellion and individuality. The brand’s products are loved by diverse communities, from musicians to fashion-forward youth.', '$2y$10$jb1nXKvhEe4YhqTp2Mw7ledagf3GhXUGR5a/AiEWkx1JEDoNBh2pK', 'drmartensLogo.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `storereview`
--

DROP TABLE IF EXISTS `storereview`;
CREATE TABLE IF NOT EXISTS `storereview` (
  `subOrderID` varchar(6) NOT NULL,
  `review` text,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`subOrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `suborder`
--

DROP TABLE IF EXISTS `suborder`;
CREATE TABLE IF NOT EXISTS `suborder` (
  `subOrderID` varchar(6) NOT NULL,
  `orderID` varchar(6) DEFAULT NULL,
  `storeID` varchar(6) DEFAULT NULL,
  `deliveryID` varchar(2) DEFAULT NULL,
  `subTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`subOrderID`),
  KEY `orderID` (`orderID`),
  KEY `storeID` (`storeID`),
  KEY `deliveryID` (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `suborder`
--

INSERT INTO `suborder` (`subOrderID`, `orderID`, `storeID`, `deliveryID`, `subTotal`) VALUES
('SUB001', 'TRX001', 'STR001', 'FE', 43.40),
('SUB002', 'TRX002', 'STR001', 'FE', 230.40),
('SUB003', 'TRX002', 'STR006', 'SC', 24.00),
('SUB004', 'TRX003', 'STR003', 'NE', 357.00),
('SUB005', 'TRX003', 'STR007', 'FE', 47.40),
('SUB006', 'TRX004', 'STR006', 'SC', 63.92),
('SUB007', 'TRX004', 'STR001', 'FE', 127.18),
('SUB008', 'TRX005', 'STR004', 'LP', 257.08),
('SUB009', 'TRX005', 'STR008', 'FE', 42.95),
('SUB010', 'TRX006', 'STR001', 'FE', 174.50),
('SUB011', 'TRX006', 'STR002', 'NE', 19.92),
('SUB012', 'TRX007', 'STR005', 'SC', 89.25),
('SUB013', 'TRX007', 'STR006', 'LP', 163.25),
('SUB014', 'TRX008', 'STR003', 'FE', 80.00),
('SUB015', 'TRX008', 'STR004', 'NE', 52.00),
('SUB016', 'TRX009', 'STR007', 'FE', 120.00),
('SUB017', 'TRX009', 'STR008', 'SC', 70.50),
('SUB018', 'TRX010', 'STR009', 'LP', 60.00),
('SUB019', 'TRX010', 'STR002', 'NE', 48.50),
('SUB020', 'TRX011', 'STR001', 'FE', 120.00),
('SUB021', 'TRX011', 'STR003', 'NE', 50.00),
('SUB022', 'TRX012', 'STR002', 'SC', 100.00),
('SUB023', 'TRX012', 'STR005', 'LP', 82.50),
('SUB024', 'TRX013', 'STR004', 'FE', 150.00),
('SUB025', 'TRX014', 'STR007', 'SC', 80.00),
('SUB026', 'TRX015', 'STR008', 'FE', 200.00),
('SUB027', 'TRX016', 'STR001', 'FE', 120.00),
('SUB028', 'TRX016', 'STR003', 'NE', 75.50),
('SUB029', 'TRX017', 'STR005', 'SC', 150.00),
('SUB030', 'TRX017', 'STR008', 'FE', 95.00),
('SUB031', 'TRX018', 'STR002', 'LP', 80.00),
('SUB032', 'TRX018', 'STR006', 'SC', 70.00),
('SUB033', 'TRX019', 'STR004', 'FE', 130.00),
('SUB034', 'TRX019', 'STR007', 'SC', 90.50),
('SUB035', 'TRX020', 'STR002', 'LP', 110.00),
('SUB036', 'TRX020', 'STR006', 'FE', 76.50),
('SUB037', 'TRX021', 'STR003', 'NE', 140.00),
('SUB038', 'TRX021', 'STR008', 'SC', 125.00),
('SUB039', 'TRX022', 'STR006', 'SC', 103.95),
('SUB040', 'TRX023', 'STR006', 'SC', 61.65);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `customerID` varchar(6) DEFAULT NULL,
  `productID` varchar(6) DEFAULT NULL,
  KEY `customerID` (`customerID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hotdeals`
--
ALTER TABLE `hotdeals`
  ADD CONSTRAINT `hotdeals_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`paymentTypeID`) REFERENCES `payment` (`paymentTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`subOrderID`) REFERENCES `suborder` (`subOrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_3` FOREIGN KEY (`size`) REFERENCES `sizelist` (`size`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productTypeID`) REFERENCES `productcategory` (`productTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `productcategory`
--
ALTER TABLE `productcategory`
  ADD CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`sizeType`) REFERENCES `sizecategory` (`sizeType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `productreview`
--
ALTER TABLE `productreview`
  ADD CONSTRAINT `productreview_ibfk_1` FOREIGN KEY (`orderDetailID`) REFERENCES `orderdetail` (`orderDetailID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shoppingcart_ibfk_3` FOREIGN KEY (`size`) REFERENCES `sizelist` (`size`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sizelist`
--
ALTER TABLE `sizelist`
  ADD CONSTRAINT `sizelist_ibfk_1` FOREIGN KEY (`sizeType`) REFERENCES `sizecategory` (`sizeType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `storereview`
--
ALTER TABLE `storereview`
  ADD CONSTRAINT `storereview_ibfk_1` FOREIGN KEY (`subOrderID`) REFERENCES `suborder` (`subOrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `suborder`
--
ALTER TABLE `suborder`
  ADD CONSTRAINT `suborder_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suborder_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `suborder_ibfk_3` FOREIGN KEY (`deliveryID`) REFERENCES `delivery` (`deliveryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
