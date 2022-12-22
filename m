Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BA3653CDC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 09:19:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8GnX-0001Si-Mr;
	Thu, 22 Dec 2022 08:19:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p8GnS-0001SV-12
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 08:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6rbzt6PNOYtXfIFChp7Ox5pFWGHtIuFwGv0WQS4m+g=; b=Rg4XvQBgsSQ2yzExAQ34A6xCku
 9RLNLOiXu5dnUcYrXr6alCiT/cI4Q52VQBvgPHEV1QxQGOUDvO8ECzT28Xh2AXWg5H0GUch7r0cVA
 JCeZljMCTSupFLPb/lySUaHIPmqmEnbmKAqVJ0ZR7v9NZxLafoTtUpiF7pXpKep1YIvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d6rbzt6PNOYtXfIFChp7Ox5pFWGHtIuFwGv0WQS4m+g=; b=C
 IZ9stZMHhebfM+npUSj7LJuZ+sP2te6Hnazal2xxh87IoyCJYR2ZkgAu6EO/mz2Dv1r2U0PcBxoCu
 TqbeZHjH6FwH0Bife51v9tqzL7nF23KGw/gft9S3dxgax8uIov8LRpGjxhf1YGC0yI7tW0Wti6k+N
 4sGGnkyBGvMOyqKM=;
Received: from mail-tyzapc01on2133.outbound.protection.outlook.com
 ([40.107.117.133] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8GnL-007Xre-GN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 08:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrwAjoEghr61A2tDSqwfA7UqbckD0n8Cm6Cjn+UjK2ZA2w0kTuJXZCHtMIgENNfSX1OEHVuHUK4LJnm/GMbt2VXbZC44QVK3VGbuNX07sozt3q5wfWIe89EzW7tbqVtUqbZb3rUtiwMNxG00/4s9ON5bL2TnrSfYWvGfCaPBPrI6frWGiDT0zpseG02h6GXMgA035ZtVrt2Pl+aQfbyo3E/gUyca10Ei1h4wdgq9fJr8GBnzoBbXhwylxvphSRK9UxTjwgZDo7+DwVkhD6xJO9XY/G47pZOAfQREMl38LRFwuhN2DvkRr8AUJdhFDyaX1CjdVCxuIaxTNudUe1wbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6rbzt6PNOYtXfIFChp7Ox5pFWGHtIuFwGv0WQS4m+g=;
 b=XDwqNPHzST6/2lhEHM6vH2vxRM4Sf9zSLG6H2KvBpY1hR4EcQuOb82x8PWpx+bEc+8BfblhVHMTc3Pzh20t/wg7xmw7Obz62NMSfc2ts0jwj/YLYg4w1UjpBPSArmwwSzpyhXVWvCDhAHwb8Aj4hHquDTwgDb43KgMw7pRmjT1P9xWpdv2FS1nQwyE3e0b5vy8n4KuzzHemeCO/LAi3RdrbSnuApJKQRhSys/ZHsR8m8xKrVmSRoJ7/dmAuEwFVu2BPcglqBAzgtXcFuz06vihu7qcoE5JScql7PvpuvfIDiwsjfIJ0qg+JOsiqii+YTqO/virItuqR68Lv6huOhQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6rbzt6PNOYtXfIFChp7Ox5pFWGHtIuFwGv0WQS4m+g=;
 b=BkAfJ5X2jkSaCJOSZzjlRrSOzMFsHi9QddN5ICGFLvTID7A5WY09KIluwqdYkGHDFNnrRireSjT9dAze8LZ3ni0fXOfdMr3jt6UlvAaHpBd7k+z2h/+pulc5W/lqKgKFj/eV1fwK1jcE1TOaZCQ9LIylrWwG9sXbMQl+AFMzkgnBdfyjnW0h7raLT5IG1V5E+qX94IBjz335EZv0GS1/gUvBFWLo7vuyD4MEC6dkq4/pelgGxRa7OGRiQ6cp3kHRxChwPIV2Ns3QtvDKMQocw3kZJsUbdSyHnIcFsM6CXTNd/rzM25CmuoQuecq3xeu34uDd6pUGiHPqT3GVlIiEOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4280.apcprd06.prod.outlook.com (2603:1096:301:85::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 08:19:06 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 08:19:06 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 22 Dec 2022 16:18:55 +0800
Message-Id: <20221222081855.81553-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1713597b-c6d9-42cc-b0b7-08dae3f5312e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PoAQwXJjMqxGW1WulXD8DNNegTLcLqWYhA7ZsyZilheEqoCqBXGCkBKYDZOhisx9CutS0qgry/D5d07Bg8wzRwIF/+ro6xbdviaPXIgTFKAJyTvfvq4PCQC4PfF56PvwPMQETvtc7X2wAKiBApFcjHdEycK8YiNNguoZinnqtj6on7qhJdiCph2yDgtZ4GKYftr2YRIzpNFZGCcyfZjHll8lYiphAFTGnGowfwLtZAUnEO7CmQQV6nLf0/svdUHnXPGc6U4dRkIUpdm0IDKdkh0j16E+CvwVTSdXCCUo2lZF8YmZ42WYafmb06RkHjJzdmtj8w2U0f4Dm4Ro9fzgSM4yUsLmkQKo4dJduOfXGTjAt6LQ5bPYhVCZ0j9IEEroI2rtz75kl8uBUxBVJ1PZ26M2cE/ShoQyYKdQdG4s08dWAe5fOEHUBvDvTvRdWLT+j+xcdhEc62y60joH0v1dUTV6q2+bXa+/iTO0gY++cw0ihA2BYvMnYyX6Met50cKtTFiVueQOVnHEilFkvGg86Z8NCgUw6Y/fIfuIwMNakWb5eg64iN9SsI/nPAnzn9Xu28ttyih7W6Ad7JWsMWCdBrbtj6J0JXW7FjFkvxC0d0z5J2DyUxr9NmACoEAjTak3mhVEf+KZ5jEaUIKCfZTQ+zdDQNORqM3Uq2cB4iu5LxieRDgEulEfxurYTLpx0wPZMBtDdqxeZUqmjgpUjJitg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(451199015)(36756003)(316002)(8676002)(4326008)(66556008)(41300700001)(66476007)(66946007)(83380400001)(38350700002)(38100700002)(86362001)(107886003)(478600001)(6666004)(8936002)(5660300002)(2906002)(6506007)(2616005)(1076003)(52116002)(6486002)(186003)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cq0HoCfrIssMpwj4vOMmvPuRBe2Cs597OJ4ByWid+gDLmO0nmORxMpmfSutZ?=
 =?us-ascii?Q?Dfu0+Bw467T44LBUoPfTk6pmFUzmzwahCvmVRaAnvJc2Pd4K8On0/CYxEKMf?=
 =?us-ascii?Q?QTt8jecJVN5ffO6n5cbwElY0m2k4dL/U4GMXV4/wIqnXCzO2j9Xg9U4m5SXb?=
 =?us-ascii?Q?ifl2W2UUqv2IztCpWWZR21RP4vgEKyqCzlmVLmcphLUG0jjJFrKhXlkBFzBh?=
 =?us-ascii?Q?83cqnTwQwflyHq5qkujqheFLfilVVw+Fa5m8Mx+vsQPUXNHj37pRIRkvbykd?=
 =?us-ascii?Q?S4pQ7jIowZ5AJsLsrdU40greEnMqVFaU7YWl9ZfWG0v8HHkj0wR5sJ/8vgBJ?=
 =?us-ascii?Q?CyBgt7xmHYt0yQyXMzHfkZV9rZ5i+c9sxAfqWSdj6eNac9HukrkTrvOiAAl4?=
 =?us-ascii?Q?UGbL5MaIwxWHgU9+3vTH1gF6DZ8E/gZsYmNZR34oUbSBbGjFWzw2aCOd5B8/?=
 =?us-ascii?Q?aoDuvs3w4yJ+VA/UDQIG7L6Bd+wYqNPvYJ8Dj/mt9gSIq9dEIHkoWi3dAPeW?=
 =?us-ascii?Q?Mpu2UhKGuzMumJOQtSnu8lWV5h4mxGS+d1KjYjBr3fg1p6+PhH/Kmy3CLRJD?=
 =?us-ascii?Q?otFTY8RJrr3G2PtsKosHCuj8NsuPxDrUwx5Dz07NGWKlWGFoOEtVJRn6SoJb?=
 =?us-ascii?Q?VyvSe2izkbQI/5Z2bKb2Gh9cgdLX0eg5PtuiiVeXX8hN6REIQgQqpRGHBoc1?=
 =?us-ascii?Q?0yp+6PNVtsFhhg/5WbwprfRYnZPYiF0+XDoj21ibQtbBTXg/QAFoo/tuUQjF?=
 =?us-ascii?Q?b4BPw9mlb26qzAYtt+NIolIsjL+15n/VA5cR+1cAX2PLbwIOvXWrrIxIDic7?=
 =?us-ascii?Q?Xy5Kz72weZn8nuraARQm9f57T90Jtng5SG3pc2x87LDsIPN4n1wzfB6vCEMI?=
 =?us-ascii?Q?X+Zvy2LL49u9PUsCDDLtYoKrgXvyjY2W59cCBwQJw8Q7xyJ2YAUtU7EaCePX?=
 =?us-ascii?Q?e9oJDmRJ2Mz6x15UVzgzWQg8q4zxTKx/H7cwJwW0WM77XL/OtL5Tpi0g8hqs?=
 =?us-ascii?Q?dEJ9V6NWJi/EAa+so9CVQ+/AS8hGCDKjGIvw171OUDix7lsezwL/u6Ro2YRf?=
 =?us-ascii?Q?M07M3rVhek5QqsrXSB7WoVUHDNeG1nwW491f3VFSchAs8Spj8c26fnmowolA?=
 =?us-ascii?Q?PI3tL+K9EnsiUBLQS/t8nlF//GzLOiD5QtlNuQZRVWWR9UoWDtBFxCg94Xnu?=
 =?us-ascii?Q?Vfq2tjdWtjyGNwaG3c7ROCfnay4eORm8ky4FffR4EWM630trU2U9i7+Kfoee?=
 =?us-ascii?Q?ZBs1akkf3kzjdVNkDe9IuZ5OFaXTi510GlxBlOb1EP2L68PVwOuAXlM2C5gY?=
 =?us-ascii?Q?zD4PXPcPdwqspWwRQR1IYp7XwG5riGzfQC6hSlXDB4jJ3jt3kcpsv2gmauG4?=
 =?us-ascii?Q?IKLmxNrz0JR1mYBt2dB9ThbsgIY2zLGNwnwLI1WavAWhNaaPrX5nmenWjmWY?=
 =?us-ascii?Q?bSbrHh5KoEl1PexShxk7515KYHEu7LGm9ZaU9+2jrvxVbP5DjiQpnWKCxq5Q?=
 =?us-ascii?Q?JaTWGeXl/DTsEjvmTx/NmiLJagX/XT+2gQzP3l31X3Uh8bhmqaJw8W6Da55g?=
 =?us-ascii?Q?XX4toYZYa7BYYWXfVN9co6y14UN86phWQVlT819o?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1713597b-c6d9-42cc-b0b7-08dae3f5312e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 08:19:06.0182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGzqahqgcY7IZZCpvp8O99IRD1AfBPEPqNRzafp2dIz+HP1VZ9Ggmfxfb8HdxJ6E/IUMvVUrf9RYCiSejzF/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4280
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No need to initialize idx twice. BTW, remove the unnecessary
 cnt variable. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/iostat.c
 | 10 ++++------ 1 file changed, 4 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.133 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.133 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1p8GnL-007Xre-GN
Subject: [f2fs-dev] [PATCH] f2fs: drop useless initializer and unneeded
 local variable
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No need to initialize idx twice. BTW, remove the unnecessary cnt variable.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/iostat.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3166a8939ed4..335b055ffe7d 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -97,8 +97,7 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 {
-	int io, idx = 0;
-	unsigned int cnt;
+	int io, idx;
 	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
 	unsigned long flags;
@@ -106,12 +105,11 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
 	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
 		for (io = 0; io < NR_PAGE_TYPE; io++) {
-			cnt = io_lat->bio_cnt[idx][io];
 			iostat_lat[idx][io].peak_lat =
 			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
-			iostat_lat[idx][io].cnt = cnt;
-			iostat_lat[idx][io].avg_lat = cnt ?
-			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / cnt : 0;
+			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
+			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
+			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;
 			io_lat->sum_lat[idx][io] = 0;
 			io_lat->peak_lat[idx][io] = 0;
 			io_lat->bio_cnt[idx][io] = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
