Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED82697633
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Feb 2023 07:17:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSB6i-0006LD-Kb;
	Wed, 15 Feb 2023 06:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSB6h-0006L6-Kd
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 06:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sn0I/NrXBD4hUhrYrUSv41cu1BtQRt3p3t1+aHNNi3w=; b=L+Klf5LOM0nhykTz5/OYXSAI1h
 +K7GGW6joDFyN08KPP5ArBhLfmvrmO9MQEtAEGBjubRzycFwSuFO4U9WCpML/Il3jZkKSrQLHYu/1
 dD8yrUeGE47Khr0GY04HVLu+CEMIb+3RVHCL7VEk0LXzxlNJ8fLs1BG3wJkZceQ6laHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sn0I/NrXBD4hUhrYrUSv41cu1BtQRt3p3t1+aHNNi3w=; b=U
 lv4LD3n2+1s34+JfdmhMNCxuFoQo9oBKtGup1qnqutrAFKTyovlVtZapD/ob8KwYICivcZMWCPnix
 Q0fUK3IaqJGLZxczTGb3luTIWFv5+5epsyIe0Zk8XicnflY8HwL7OLDHvBe+Skf4AUkqFeb6+nAz8
 2g3PpvTbCGKlexnE=;
Received: from mail-psaapc01on2091.outbound.protection.outlook.com
 ([40.107.255.91] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSB6b-004sh9-Lf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Feb 2023 06:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSZzyBsX2uPeDj8QRuw2Hiq2iiuWq0/uUKAlrkqfGBn7mWtAU0KfbHttxVCnYtolcaUb/ggHoKgsRRdMbHLjlikF9aXe4MJa8qGfJR/rvEvID0Zgbx10IsbpfoK3K40IaHxVKui/Wnsj5X+8iUJCCgLeyEbTrrlmQ7AnTleZ10wCGdoba41T9dsslh7XFDvjqyzYNgumtLCzcodrcssx/Cl3K7KIbx9arRjQArrJXtI+gERydTD5vdBeRX7LO0m0vtY0NhNxcj4WJhltW/FPQmAUD2yFiKcNj51jEL0QgW7WiRc1IrAYZN6bJm0dHi53HIUHUNyo8KjbuoKjKM2Z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sn0I/NrXBD4hUhrYrUSv41cu1BtQRt3p3t1+aHNNi3w=;
 b=C317Qykprew7HgTg4HBxt6Iso+X7tCfKQRBfUtYNTHEm/zstXI/qNMZQEvuo7mmdqZzoQ8CPhscXerH0KWf4gS6h6jvFuE7fjFOHOnKTqTvWQuztJeJ2pBI7zV/UQ1LT9jQDpi9Ux13Ww3H28295Xwja099T33AURpMv1r4sD1yi/9EWfozT7kT0y2sFi1TlT0TuNBGu/eVUdDnKLavFr9qX3yP08+il7EzhDjyoNsJfIAm1u0rYIOSFgZ7NA6oUMqOWOBReOzIk2EfQWEaBrPUb5kg3fSnV1a04VQDiQo+ITy5Us5L3T8HfkcZMlaJUDgNV9hxS3dQYvUnl4AG4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sn0I/NrXBD4hUhrYrUSv41cu1BtQRt3p3t1+aHNNi3w=;
 b=H8TxzFGwNvD0/+NdCLU55nlzloNoZ+irBKRD4zI/k0rCTKf83wG6xFDfKZzP3D1w88O0lFp8E/D3cYGF071I0SwYUV1710nlcDCoF/YoFrxq8vfADNlbpBLg84wparQMeHLuQyQEdwwx8+yIbcR8obHNgcwSH9Iy1CJwJkyKDd3S6D/X1anQv9QELseSjf8FahaYD9yqA9Qqwqe7evkfEQd41rLgpB9GLDjfIHOmVoj7uceWKnC+qmxU3EHjVgvkjVZ6YARHxiSic08KfLIduCbqqErAFMVOyTPjd2ZvHmMgcndeeh5iSWVMgT5l4zWm4DbocfD2P3e/a/iuBR683w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5390.apcprd06.prod.outlook.com (2603:1096:101:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Wed, 15 Feb
 2023 06:17:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Wed, 15 Feb 2023
 06:17:17 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 15 Feb 2023 14:17:01 +0800
Message-Id: <20230215061701.1433-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: eade175d-890d-4d57-c496-08db0f1c4998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ajp0kDhizQmecyjLd6NLa95kiTPPz0vWgwNelXWSvEQoy3zYqO5BemxqcN0sUeL1riSm8Qr/H7BqO2Oo2GCuEk+CVIbu/iTifB3DU5dNOHKhm0Tf47hd1dPchm1wpljnNupnsEHvT+hHEUdLFwSUKM1AZgTTgGtD+o6FiXRZyh4fSchAJtr8npeNn/tIi33BSQ4Q9cHvqzcRV0ZB0KzEgkiZScG/l6Mfz2KFQ1fJ3BjEUzx+yNgXGybbDvMnpeOJ3/bB56m/OvtyUWU/yDSq6/ukun0B3kSanZ15cILJjeNCMHBfRXcmC7R4++mC+wX716E+7whRwx69RvOk1Fa07fWUPRJMO5BX4dAmYY7DsppFOPIxMK/8HJYfIgGoIp3vK0u8idNYiK7ItLvlhsQJUyBseXY+PSKgn0h8Jadhb07UQEPLRo2p01lihdo1/uzMDcOesnW51kYPATUkybiqGue5MqPSzIn4k1/wtbqE6CwPO7sM4IrmW/uOlUm74qVeb0ACU7zU6rSL33+Dz45SLxz5fGrUYgNvNSXTN/oL1rIykIV1M4Bfk5KccInj7/BDko7uUqRUUAWI3lXrlt1TxocObmSvIEFLR3jovQSLQ0zwk7ifBoYEXKV+NgZeUq6Dozu/R//ToaX9+18/1vvztExxUAQuDJvb+Hn056clvuGVWgEw/fSQU6jM4y183wB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199018)(83380400001)(316002)(66556008)(38350700002)(38100700002)(2906002)(36756003)(86362001)(4326008)(8676002)(66476007)(66946007)(5660300002)(41300700001)(8936002)(6666004)(107886003)(52116002)(2616005)(478600001)(6486002)(26005)(186003)(6512007)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4oFZO2fJQ8Cp/DjKh38ItxwF31kCO2HzJl2bD/h6sPSTqpM5lsH4FO2uNEZY?=
 =?us-ascii?Q?ViAHGtChDYTM5bFDPG0UQ+EiUWVotZBYFcUwj80YdZZIQCoMZICSiF7hW4Uy?=
 =?us-ascii?Q?N9KLeDSiq92eHCg2PcpkavQU4xWztrU+5/A9c6pHAkagI/1M6AiCk/3SXSoC?=
 =?us-ascii?Q?EXHftBa+w54AiBW6gcCn4pcN5T1089ghwLXzkLDBQ76JBiw0lj5WCI6zHE94?=
 =?us-ascii?Q?K2JfPzGCRZ3RAHnDEwroV7jQHSCT1Z01ABpHz4Zb58EQeSW6tGM8WmJJrVI7?=
 =?us-ascii?Q?AXSl5jUfy4Hnp7eIoiTkTxhR9n4phDt0uo1B6leQNET1DdC6m8HzZXutBd/F?=
 =?us-ascii?Q?5y6fQhZSdWjn7Q29zCY/ZHT1y1/ZL+JpHb/apeLM4j0/72tr52cK3g2hg/nk?=
 =?us-ascii?Q?yUPLHV9uFXO5gnqOdC04KnN0bhADeu262+iCX5qJE/EOL/nE3Lh6YNqHuWls?=
 =?us-ascii?Q?FizagE/w7NP1QU9cxoegjJckWswASryS0kL9jk8I7eGWd2Pdy8jiOaOeP64T?=
 =?us-ascii?Q?+tzXL+uF7mkstN6Y/MQFsD6ZxpBiDxCwBW3eXDsxISEJErwk2QCFDtXQSY/L?=
 =?us-ascii?Q?3QWtvtNgSV3Hd1/6LpSTncAoliSvBGVJCAJzMLeyyWU942PTjSNpiyTDHEsH?=
 =?us-ascii?Q?SZHy3AAP4FoAEyZaAc2+SFm2k++1hX711sPMs3t0J/BD8uTOBVxZNJxlsPh1?=
 =?us-ascii?Q?Kv9hc5LqRjd0Wm6cNzi95e60EQyijr8HaAN4NVBESlJgdPWypgNDkiH/ZXva?=
 =?us-ascii?Q?6Zqo31Xsx8TJmGiKbfTVcdYQZZq6PmyMrXa37/OAR3NqxvIw32WCrXh98DSQ?=
 =?us-ascii?Q?HcNGfS6eS3SyaS1QiKK0KnWME22j02SYe9WLVU7o+DNjiWedzpW7/7bsvK5y?=
 =?us-ascii?Q?7IM9TvUSmjnwu8mv05uIjHmsIg5vRGqrk7Khh3Auhrq7VPXKwFA3PcldIYW6?=
 =?us-ascii?Q?4s5Z32U2NU5qqu2jeJx6umeexVPDOOdQHKERM+RYcK4ykY7FMRLGL3CTnhWE?=
 =?us-ascii?Q?euZaIyRoiQ+pOS71il3iqQeNzYPU5uapxiMIFLleT6tytpXDDbrA8Jg9cCTf?=
 =?us-ascii?Q?M3nWF8jcPZmPSUr9bmicJ98+eS6PRK8qegHqZv2waRFCkxdfARmzoWI6kZ7M?=
 =?us-ascii?Q?OOPR+917kFzq2g14rJeg7P2cOZ2CJTXPM6bIy/YjwPxEanc0JwgFaQbrx5OW?=
 =?us-ascii?Q?qa5G8oRPDcAQnzKknlclihCtvSSpV7Iw+9r2YBlOAe8r1t5ppO6VmiirSDCj?=
 =?us-ascii?Q?uULsCw+WiJpMmOFDPN66JfWd0aEohKhWqOQfddbYKwTBqq9jfZdzXIqBM+Eh?=
 =?us-ascii?Q?RyjlauxX8WbKsQIhFBe7Qad6zDoYCQpJvZNQyhWbJQAh2RUqGWg4bj/NhvFu?=
 =?us-ascii?Q?nnEm4dfPVNsyQl6yV/dPZzm8z8L8L23I1qiw9J1fwDFnvJiNoqnK997jSHpC?=
 =?us-ascii?Q?FeDqsT3BjAXGaXnM60M/ekn1CIsgtCRyLYF6cDQhoW88j6KEBMYKek6GpbKv?=
 =?us-ascii?Q?HQKRWc/b6xwZQRZwuhDg/ss3Z2PseFIpHqTDFizy/VDdGTDtwpejlnUl7pRs?=
 =?us-ascii?Q?uzqgtaC76ktd9vItSiGWDJQ0ieO+W8KCxSzLVlny?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eade175d-890d-4d57-c496-08db0f1c4998
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 06:17:17.2868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sH8anegzInmt0Orcq2IdLHPXWGI0URNe01k2aTmPx0xZIrJhxCGUF3gCX/+BetBEaTc2QlVqm3W19PXbbkEqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5390
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  They are not used, let's remove them. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/file.c | 16 ++++++++-------- 1 file changed,
 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index 6436c52e7913..ca1720fc1187 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -2539,7 +2539,7 @@ static int f2fs_ioc_gc_range(struct file *filp, uns
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.91 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSB6b-004sh9-Lf
Subject: [f2fs-dev] [PATCH] f2fs: drop unnecessary arg for f2fs_ioc_*()
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

They are not used, let's remove them.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6436c52e7913..ca1720fc1187 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2539,7 +2539,7 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 	return __f2fs_ioc_gc_range(filp, &range);
 }
 
-static int f2fs_ioc_write_checkpoint(struct file *filp, unsigned long arg)
+static int f2fs_ioc_write_checkpoint(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -3253,7 +3253,7 @@ int f2fs_precache_extents(struct inode *inode)
 	return 0;
 }
 
-static int f2fs_ioc_precache_extents(struct file *filp, unsigned long arg)
+static int f2fs_ioc_precache_extents(struct file *filp)
 {
 	return f2fs_precache_extents(file_inode(filp));
 }
@@ -4010,7 +4010,7 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 	return ret;
 }
 
-static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
+static int f2fs_ioc_decompress_file(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -4083,7 +4083,7 @@ static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
+static int f2fs_ioc_compress_file(struct file *filp)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -4199,7 +4199,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
 		return f2fs_ioc_gc_range(filp, arg);
 	case F2FS_IOC_WRITE_CHECKPOINT:
-		return f2fs_ioc_write_checkpoint(filp, arg);
+		return f2fs_ioc_write_checkpoint(filp);
 	case F2FS_IOC_DEFRAGMENT:
 		return f2fs_ioc_defragment(filp, arg);
 	case F2FS_IOC_MOVE_RANGE:
@@ -4213,7 +4213,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_PIN_FILE:
 		return f2fs_ioc_set_pin_file(filp, arg);
 	case F2FS_IOC_PRECACHE_EXTENTS:
-		return f2fs_ioc_precache_extents(filp, arg);
+		return f2fs_ioc_precache_extents(filp);
 	case F2FS_IOC_RESIZE_FS:
 		return f2fs_ioc_resize_fs(filp, arg);
 	case FS_IOC_ENABLE_VERITY:
@@ -4239,9 +4239,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_COMPRESS_OPTION:
 		return f2fs_ioc_set_compress_option(filp, arg);
 	case F2FS_IOC_DECOMPRESS_FILE:
-		return f2fs_ioc_decompress_file(filp, arg);
+		return f2fs_ioc_decompress_file(filp);
 	case F2FS_IOC_COMPRESS_FILE:
-		return f2fs_ioc_compress_file(filp, arg);
+		return f2fs_ioc_compress_file(filp);
 	default:
 		return -ENOTTY;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
