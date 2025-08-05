Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACCB1B4CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 15:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNxokgPnWeRHUe9vOnF9S9WHlvH3P8cbbCQt9akX0Js=; b=G03vaDAhfGqVyA+GTtGCX7v9/d
	nQiX6SrlWPHjvB4eCDqhUk7pYWfxATfpaqFfWRhG/ILxtNKCoMlB9auZ87cIBs2S1dFYj51/ve+o0
	qMabaOHKmQJaCUbUHlIGtgxxZDiNWXyRvXlu20MZuOtshLuXwU2sWdbAD3bCULD2IFvY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujHcl-0001PM-0i;
	Tue, 05 Aug 2025 13:22:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ujHci-0001PD-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 13:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fKv4O2xsVmZ5bvG6IZyf2bdMyWSUiJGdSyechm2xMDk=; b=Rqbd1tcJ06uVx0CXWC3sehhabt
 +8nP1cuui65mc/EO4k0cMe7o23tkzSMs1/O8sHWzAwVs0LcT9neL3Ax4Lfgqa1LielrhMd7OC0eTu
 r88BmijSMRgyYuhlObsAdPEqHFFkBlbCHleAwONUbUlpuQZ8gFSuWGccFp2NJ+ryll5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fKv4O2xsVmZ5bvG6IZyf2bdMyWSUiJGdSyechm2xMDk=; b=H
 VaTbFcz6azHQ0EPPDR20SBAkWAE91j76uU8Jz9t7O+dAYyeyaDMxt3x4vgWmfwxE9/7Aj9PkxeXWj
 iRHxtG3s1GllRzTyP18GBtkBp0mMOuZog4AeesHUK73YZPUZI0bvMZ+qFHbhAEOmjIQwe/vq4VcL/
 eQpxqwiDFtD2i8kQ=;
Received: from mail-koreacentralazon11013043.outbound.protection.outlook.com
 ([40.107.44.43] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujHch-0000aB-B0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 13:22:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbwqft1wswKG788h/gyKHJGOxMPJ3zSkynlFYIYhPfPk0X/JV+1f4kR9H/WfY/j4aiYR/vt3NLWmnR/rWovclD7Lqip6fcedAWq82VlCsoVAwy2n4s45/uFHtbxGaO9Q2qkk3aM06Nhitb6TXGM8v7a5qedTMeYf4b6pg1XO8fT9x9dbElYcb8D2tCjCecCBrm6w42n/OLRQuWL8aYr2sz7cV0wKaFtHJvzVDs0dC8BIEbZNXfAiTEsdZrUgAsGwJtApMDTTp9L4cc93VQf0dKtDqKhkA7lF6idIzLqk7XnWrE2domlB14cMdNyfLQX0MCnlyRzkTMStwEDhLDKQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKv4O2xsVmZ5bvG6IZyf2bdMyWSUiJGdSyechm2xMDk=;
 b=zMIurkfUUgosyvFhc5eRiMvPmNFypPuWoY577Pxmzi9mgEFN/PaXYlvmfNNCDL68UpgG1TzUbZiqiSBhI2UakGVxMM8aRAb2aJnmOJnaZ4Utfd0ikAC+acqZfZt9MMullqas/hLf7VfHywBJCuJ3HIGs/qyJ6P3PtFc6WQMAsXI27Ku81arnWwWJo815EkuSfrpMG8LMYtJE97DoS/hEqj55I3wW0Od4CNfxu9wHzlQzM8PxI0Y6DA5QRUwIzDGhd+Tj27Bih0oSW3UIwtgyxUTwnNCGdHdRPLeQf9o34sDXpvSaCThssyOTpPrM4g4FLNnc9xBsO4A2GQl+OpFTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKv4O2xsVmZ5bvG6IZyf2bdMyWSUiJGdSyechm2xMDk=;
 b=fl6uuCBuJzOuoPdDrerlh1imfg2niwpQ1VRliYmI9VdoHxuHSRqCQBArx+Fch5jF/+BL1W8+3FNrck+8ERAZIvYhbltwIiCEQMnwp/s6tk2tNXWPS0BfkOoEWZPBfD/Tdr84jbaLMlukbiOmEv5JIeShLqLsmuReA6jjy5cxfb9m4W/eOQlOh0CslFBvFCk/pkmDRqzr8w5kNprr79asMgaIdSYm9WugSiEllh5JLZCy/oEjZPM39kr56Ut8z385LcG6AZWhqgSsNU+4ziuCZSaMmgk3nd7j2Dwn3E6rGRoPGv+pbQ8keVnu0g27s/9VDyF0eSh8EyCNJvpMWu4UzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB6464.apcprd06.prod.outlook.com (2603:1096:400:459::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 13:22:20 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:22:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  5 Aug 2025 21:22:08 +0800
Message-Id: <20250805132208.486601-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG3P274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::33)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cb898d-2e40-45b6-d40f-08ddd4231ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YlzuD/UybFcQjm02tHydWGndSTBCDTx/O4aqJweTEVhgDnDCGt3j8bdqXXvm?=
 =?us-ascii?Q?zZIkgt52xZxDFiuWnAz0Fg2Ot8V/1paRQasQWggdnYMSScw9QX5PxOddm4CA?=
 =?us-ascii?Q?+zHe1QKwtFn7BgFVRBhEhSl84bKlmHO5i6XwoZIMGQms6QIjgWvsjlq30RTH?=
 =?us-ascii?Q?fRkqlYYhXjjnN8Rt3YEmqVfQCJfAc7ScekAmjT7uSTdFxIDduhPFRKhxo8bK?=
 =?us-ascii?Q?fkTBvB2qqD2dLv/48dMNSELyQ5munNwdBL0KtC3It1ywE3LIIlTMC9bJhogk?=
 =?us-ascii?Q?AmvWubJzTLkSpPkAhzf+ZKOJvNUmMYqM4XSkO6HjJRiDqq9swuh4vr+Jt+lv?=
 =?us-ascii?Q?liIz++bZxe2f9czlKdpviXLGBZInHbGiaIO8ihMEMHHexEDgJ1SV97lmza/k?=
 =?us-ascii?Q?mlZcK1sn2a3uHHEj5TKbVVlKuAayjmZjgrM2o/UyxJxxBQgBCHtlMd9YIM/+?=
 =?us-ascii?Q?uz8sUIJ7KINUGncOlyGaISaZyJxQrwIWRh55OfFdjkpDctmvFYTde80/ld+4?=
 =?us-ascii?Q?wTq/iM624hkIiOuhCWHylMNWvh6hGC7hQhotRLN81ezQAxNFHWKR7J7fillT?=
 =?us-ascii?Q?saGw7p+oQwfmL62fnJ+492emq4Nwl1rX6a7zChVLzyTtgcMKawAl3iTueaT5?=
 =?us-ascii?Q?nsFYehgceJYlgiXZpFTt+YKvi+h5f2GsGeB3VJRXt/fgMsC+W3RfThXn43GV?=
 =?us-ascii?Q?DAUbkcj/BYbfLmgiFJheDDvHe5m+tmbnRcELKKcS6wb6rbU66i2ov/ydfHfy?=
 =?us-ascii?Q?wlvueovfQfXsMKGVYImGN61mMUczmwWYauotuc+s2puL0D4ErIJI0i7Iodyt?=
 =?us-ascii?Q?J/fC6AEw5Fh3HL/7s50z522yl5RPGxRbENN1tuNGjvA9PnuolKrDMbRNMMhJ?=
 =?us-ascii?Q?q78xy7BVqWLSbcDWo/bE/o3IlI9VzM1/OoQaFbqphLdvSxAMSoPp28xzRi3y?=
 =?us-ascii?Q?cedEMJUbXVdnDbeKQaGZVaaiKujl6Gs980lRpPopRDXcbBRjNEWti1GeSuxN?=
 =?us-ascii?Q?kh/Ya7IgNgG1ORDdzsD/6oNyVq2e4FLtvFkyVt9ujsJ82g22sjLdZS7wdJHo?=
 =?us-ascii?Q?9YTkuZrEQYokENZ3Y/CiOqVQfr/QGBXauPsjPj9iWH7FuX4UPhs/+f9A9/35?=
 =?us-ascii?Q?0pDvcAygIdgiz/u6j8rvbSckxHlK0tz30c92zTsVWy67Z2EjaGgNyBd8lF/9?=
 =?us-ascii?Q?EF95UqRpvD+4azHpVU5THVaqry/fJH/7/KzfOGgNzKmXxrZGo2LekBrrRbYB?=
 =?us-ascii?Q?qEskg3BCMRySkMW5m7amwWP04zltqzdp8PX1aO5DwLE5mRHFUn3oDbYZMK/x?=
 =?us-ascii?Q?r1kfDJPi2xwVyigQICXf10NNtKFC1/XSRdKx94KIwrtP4kDJysrjusvJzAls?=
 =?us-ascii?Q?wwt+jySTXOx0GktQRZHaDHoqRTs3ySPpAVv38LJR1J8RgbZl1CY85OCYA4yl?=
 =?us-ascii?Q?c5yg1MnrbL4Im1n0XJzPdqssKPi0ZQpmEurtxNGw2iFXzztya2EHNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ltI2l81PA1x8UethP4letytMlF+KOTyIpr/iNi/Pbz6AmG6qtKoqn0/lVb8i?=
 =?us-ascii?Q?qVkUTVc851qBRrNyTIt7hQNwF+6eT5fKOl7zM9gXIpYq5otHS6i53bbgP7W3?=
 =?us-ascii?Q?6fp99yx7qECmiW+socb4GidPGEvpDFyxztF7/TNb+cC7fkzkotAA//LoEJs+?=
 =?us-ascii?Q?4OsBWo1R6XrH6rxEfBccdDKmSIgFb0MnGF8AwjcEzm4SMBeBoJfGI3EeT9Xz?=
 =?us-ascii?Q?zsm6L1396x+Nsuc/LdY0XK5dbIEqcf6BEy9UVTz2CWAf0+a5SD8xuxSvSX8d?=
 =?us-ascii?Q?JLhdrnVw0XQka3D8+OpAyHicfq4eqwmq4rlZOPCZ+eQcNtX3X66eALGIw8S3?=
 =?us-ascii?Q?G4icuPiZQK72AqYXio9+2tb2HzwoLJkQjfMC+DBguvBPmc4CRlvknBQl/GTC?=
 =?us-ascii?Q?jqPLYHNCHXVGFD+bychwMQNNvlKgsV6R6oQAWdA1ry+urDeQjCyu+FqB2XLv?=
 =?us-ascii?Q?mRpwaLCoe1a2FIt5vINMI+Q8kr3qyB1GuX1+RM3fgJnVbC533j21BQLrFBmu?=
 =?us-ascii?Q?xY43dm5uKEIYzlpw4lfiFNJp1yYi03fA0uysf22KXcQ/TDl9sbRSh/AWQ5Ru?=
 =?us-ascii?Q?LmJ7i/2CeRoBAL5PWx6L5vCfHM0joTLhXnhTQ9zy4+8oomjtrXKysCQOvttb?=
 =?us-ascii?Q?vZ/j557TbzKFWfMKWKSx5i4XbLFm6dzME5/Fq0ogvnzVL25BTQkjVzdifMa2?=
 =?us-ascii?Q?Ts5hNyF35ijavrFMtjsP2M7ZszVKzzc1DXvhMgCWSd9cDAUHNpywSHUVDlo+?=
 =?us-ascii?Q?Xy94VAeGwgYPdTS4bqL3mHElCIJwgzX5R6CVtE1wW2xZ6EufO0EfKA3K5cF3?=
 =?us-ascii?Q?aKN9tChuUeR1z4KYfzmHUr99XDAcL4cuHmbvPmOC3d2AspE1BJM216epNMQy?=
 =?us-ascii?Q?yx9xicwxYcolk7JGwi1HqTxJ65LnYOgtQUUNB7DmFYV9Jpxt2gpfXL1NVt7E?=
 =?us-ascii?Q?2UC1zilVbipLC1g9D2JgMU0RMdGXAgCqq+lZ3XzZ1JROc6J35CN/Qtd6rUXX?=
 =?us-ascii?Q?AImk0T96lg9xh+h+gUOJOWcm5Henid6MRcJqBfL5ossHWQ9u8SQJ2XVaaQ5s?=
 =?us-ascii?Q?PASKhLvJ3pxFo6BoWYrsy6osnmlpBsylsYfSIQvZ0ExJKmdvboXPq2uW94lR?=
 =?us-ascii?Q?3eByhr+9if0ESz1G9JVsZE20ovQf5dd4loyrUNeKLvdeyo3HONqLCZKupdCX?=
 =?us-ascii?Q?hck+SPaX2wjgUc/l6ejFuMOoapO4eAgaMvSJ+lQvIIRcInH7UCcUWIAjmyx0?=
 =?us-ascii?Q?0ghpL1RGpEhk+8V2nwpma90JndvGJyX6Jx39uNzApAvwk6Ctt++I95n/rRPT?=
 =?us-ascii?Q?r7OvzwfMDjSOHJxU7qELo1DXSpUTrfiDoYFmZ7T8WjTUUQqayZLlbv12+Y7I?=
 =?us-ascii?Q?xdpCSYUerecvJH3Mm2luSU69NJSMi/+53btTjPIT8Kb9OmUPvjT8ct5eutnF?=
 =?us-ascii?Q?xWasIg/fRQIx+tzmU3I4YTQHVaqaXIY2gUfsgk/e2janhh6uks/+Lf2gyb5C?=
 =?us-ascii?Q?NiijrLXvpqEWvmpUJGd4dtM8d/VpN8Xn7AvKZECH+PIHGmbE0VDSq6SoBlfJ?=
 =?us-ascii?Q?MUO36xqoqbIalZAd/nbv9VVPsKomboHKwPLcFsCL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cb898d-2e40-45b6-d40f-08ddd4231ae2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:22:19.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9+jDEsDxBp8L0jVCaNuq0NweFPM1OMGDSZAqM0ptkD8kJ3IlIl6XRL/F4WJ+JMfIzbhNJQ1i3Pl4gcjqD/5AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6464
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 we have encountered some issues while testing ZUFS.
 In situations near the storage limit (e.g., 50GB remaining),
 and after simulating
 fragmentation by repeatedly writing and deleting data, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.43 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1ujHch-0000aB-B0
Subject: [f2fs-dev] [PATCH] f2fs: Add bggc_block_io to adjust the priority
 of BG_GC when issuing IO
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: linux-kernel@vger.kernel.org, liaoyuanhong@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we have encountered some issues while testing ZUFS. In
situations near the storage limit (e.g., 50GB remaining), and after
simulating fragmentation by repeatedly writing and deleting data, we found
that application installation and startup tests conducted after idling for
a few minutes take significantly longer several times that of traditional
UFS. Tracing the operations revealed that the majority of I/Os were issued
by background GC, which blocks normal I/O operations.

Under normal circumstances, ZUFS indeed requires more background GC and
employs a more aggressive GC strategy. However, I aim to find a way to
minimize the impact on regular I/O operations under these near-limit
conditions. To address this, I have introduced a bggc_block_io feature,
which controls the prioritization of background GC in the presence of I/Os.
This switch can be adjusted at the framework level to implement different
strategies. If set to ALL_IO_PRIOR, all background GC operations will be
skipped during active I/O issuance. The default option remains consistent
with the current strategy, ensuring no change in behavior.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/f2fs.h                          | 12 +++++++++++-
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..12fda11d4da5 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,16 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/bggc_block_io
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
+		of 1.
+
+		==================  =============================================
+		value				description
+		bggc_block_io = 0   Prioritize background GC
+		bggc_block_io = 1   Stop background GC only when issuing read I/O
+		bggc_block_io = 2   Stop background GC when issuing I/O
+		==================  =============================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..22ea648436ec 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
 	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
 };
 
+enum bggc_block_io_policy {
+	BGGC_PRIOR,
+	READ_IO_PRIOR,
+	ALL_IO_PRIOR,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1608,6 +1614,8 @@ struct f2fs_sb_info {
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
 	/* For adjust the priority writing position of data in zone UFS */
 	unsigned int blkzone_alloc_policy;
+	/* Used to adjust the BG_GC priority when issuing IO */
+	unsigned int bggc_block_io;
 #endif
 
 	/* for node-related operations */
@@ -2999,7 +3007,9 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 		return true;
 
 	if (zoned_gc) {
-		if (is_inflight_read_io(sbi))
+		if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
+			return false;
+		if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
 			return false;
 	} else {
 		if (is_inflight_io(sbi, type))
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..99f46b8855ec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4632,6 +4632,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
+	sbi->bggc_block_io = READ_IO_PRIOR;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..efea15209788 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -674,6 +674,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		sbi->blkzone_alloc_policy = t;
 		return count;
 	}
+
+	if (!strcmp(a->attr.name, "bggc_block_io")) {
+		if (t < BGGC_PRIOR || t > ALL_IO_PRIOR)
+			return -EINVAL;
+		sbi->bggc_block_io = t;
+		return count;
+	}
 #endif
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1172,6 +1179,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
+F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
@@ -1342,6 +1350,7 @@ static struct attribute *f2fs_attrs[] = {
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
 	ATTR_LIST(blkzone_alloc_policy),
+	ATTR_LIST(bggc_block_io),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compr_written_block),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
