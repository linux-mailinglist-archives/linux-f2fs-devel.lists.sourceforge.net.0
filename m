Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C527687621
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 08:03:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNTd2-0003sb-BQ;
	Thu, 02 Feb 2023 07:03:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNTd0-0003sU-Pc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ONGN2cZwwgqqjveANKQrenMi9E05WaJ4EnlDp7F1R8I=; b=m40Pahu8/KusJt5FN31n75nbx6
 tDv+K3LY+8N6UXsfuMXt3dPdjGks4ZLD4DrvXoriBSNQ+EgFQg5OzcEpd5L0D3iKyDa1huZ2b4JBt
 V93m0iJBr/Yd6lbOTgsvXXCj5wcs8SFVfJY9aiih4uFAGYCtlgLSzSHD5uBQtpFwYTT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ONGN2cZwwgqqjveANKQrenMi9E05WaJ4EnlDp7F1R8I=; b=A
 IEShAkajonGqLwyiqd6CmQ1YrZyH2SvLssfiSBc6uWqwvfb8340nMqQdPQUJZa1MOTRcnxzBSq2fH
 yMZhBn84B2eRpeN2s/EE9ZVkEqmGVEifCp8HLD+B7b5X7j1ZLOyZlOMX8bj/BsaPN6BdadifJZ3WG
 XI9eVZ+5IZuoyD10=;
Received: from mail-sgaapc01on2123.outbound.protection.outlook.com
 ([40.107.215.123] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNTcs-008CY6-Cu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 07:03:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNLX/8Aa1C8onHkbW7u0RB+QdWKnE2tJUATME1BrFjwFyhks3CS8T+gkrhsImjyFxGjQJrHkE8QT4yPtUjiNjq9JBgPuu83dNzlylzZ09tQ8O9rNZPLAUvle45ZSUXon37iFMHQKPFMr0vvSO7k/o6c1RWLd7EIYD5f7pn2MKRLSOLvAnk09UmZj4erer/ZSPbkmXvzU+tbyHKOhEJQRQkaKvge4fhyCgCnycwUD54SocUOPdKgog3nkc0Wtb3ut33yPIhQhRdOtFMlWZXXpUlRAElE9TFnvh0ZSefTgO2bj+CC5FOD51bQXCBFFF9ZXP7TtDON6eKQqDKjgs1iSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONGN2cZwwgqqjveANKQrenMi9E05WaJ4EnlDp7F1R8I=;
 b=PyoV3jgRig4HCTctsZzulVDySw+z7bfBYyM+Uh+vqWLZ3U7wxB7FEWXmeBcXzSUKxOyGrGlQPS4AuIOXXEfZc66pyym38faQPYyydSa+mV1bkp+by8zllm9fouU1yOb9HUmD9jk6nk3JslsWfoQRwds5jSFy1frvLE53WAhig2qa0qqBKHHkLqVXdb4C0TsHkDATPSD0l6ZPdVsoFoh28g3zRFbV1dLY3eqcM+Rek9gS4Zj7rrpstsHe+KtY3EOir3KMK7Nz1auyQhcoASflrRHYFC8QNwpRFe4i3XN8Ue5zlm3VwI2Zx15GJ4oB0NqXG7cwhBBtxa86tRHSAMH9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONGN2cZwwgqqjveANKQrenMi9E05WaJ4EnlDp7F1R8I=;
 b=h9NYYgv/Qls/UoHM4wRR0hidrtQ2ZdN4SnszwXQY8e+ukdPPB+UEtBF1dnXcfx1Bw/QGshrxrGckcN9ojDGPuSpMwfFGBfXRXfnjBBjay9cOMElmjecPJKauQX1NcOAc+9z6/m4hC+WkVSWY4vJ1UpC2eOe2tZtAKwdG4yMbFmRdqQXgR1I72czv5Gfch8VQvH4jyGBqyq6u2zZyB1NZ+seYOsCzFa0dXvQSta4dK2XL/D7McooCefS1H9U2pMmYOH/0RLWy1W2PtPSLT5iZtYHlO2mdSGG1PQagmAeDlSn93c551QkrGlVRryPMQGUaABzVbJeTz3ocbMrmb1U2DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4140.apcprd06.prod.outlook.com (2603:1096:4:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 07:03:07 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 07:03:07 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 15:02:53 +0800
Message-Id: <20230202070253.41291-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: c2bbf4b5-abf1-4d08-ddc4-08db04eb895b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBb2jp8ShwTPtDE+tU/fBROf9RZhlV+M8gt+Dvbp0RJkGvP5OT6zmQrtE8vquT6vzm6Tv5GSdOy+sa3ZToK5EA/9XdeDCSNrhmpmTQaTmN3X27Bn0Ra4xJUVUkKNQnQ68w8PNPZJkekw3SlMo9weEkQUTM8OrkKG/Jaok0ZnmT1zj8+i9Z2b9Ee40izpSxbON4g6+dhFPmbHjdNafFl0LJWQ+ZJjuHKRa5MDjld6PaiIdWSndEfk+ueuCN3dAQTNPjHL2GwbC9s62XD4gUqI+ZoqKisiclu5IR7uIMzc2GddtDTNcyKHt/jImATlLMEohvplZV3nQofK4dJ22Whp3v3w93Md4S22WzMdZBWxC7svEBMpsSLF3x+w+VWdcREjZ7Ld/0JNcxWVu+D9WuSFiccOprkgK+9bARC7anryyMkWSVFJM59Z25saZuRtbcQnMjThUi7IkRk+FXtFUjqSSZWT1kGiPd8gKYaomLvyhIZXuK6npaNaRDg2gHVri1sONx7K2/vQ0kuZ/xPyQl7NjcOV5NVmLm0ZmPMEbocBTfx9q1SduJIf9ZL3TXu8oXXBB3Q79u7/L6c/xcfZX7PyS3bjcrATV/C3cl7KYvCMjl10zjzuchtD3lACbRzhdXTkNmNju07A3golQPZ8Q/9H6vE0GCyw4GiSkU6wBdkghSIrZVg2JwbRZwQQ8FqSSdQqoH1ijpL23BLcGS74Q60ZmjGiLAf8IZ5Q3aIB7SRKlTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(36756003)(8936002)(5660300002)(86362001)(41300700001)(38350700002)(38100700002)(2906002)(478600001)(4326008)(966005)(6486002)(26005)(6506007)(2616005)(1076003)(52116002)(186003)(6512007)(6666004)(107886003)(316002)(83380400001)(66946007)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gs/l9cArqrj2fQhBWRwdm/eVi3RcrvM+vIrj4VTAGo4s6CU7yZ4hxmfPhdj2?=
 =?us-ascii?Q?HrrEh0415s9ceb0gEZAn8VaZILGJxPdEklgyTzEVqhV9ab+KMEyr9xVD5ccq?=
 =?us-ascii?Q?QhewoJ/6+AFe0vITYL2ooBt/tflTn1Wzy8f0t74IS/oJXvZl9c4RbGF/xki0?=
 =?us-ascii?Q?+T1NYLb/Lsjp6qItigsO1q722cG0sABPonJQVji4BwPPvHLhOEjN1ALKmMjW?=
 =?us-ascii?Q?5z0+DYDQGKP/N+B29GCnKUOKM6o09o/fCDwcbQo8Ld+E/V3OTcJ55vNscVsL?=
 =?us-ascii?Q?KfEMj6tC8GN14/vKROlHXcfHygJ6XRoS8tEMgP5Dazk2DLByEtFeksTrAJL3?=
 =?us-ascii?Q?Gu1BQUsdjIE1GKpHE6LTixKJ8r7ZL0WxJPQzybE99zWSJXEY1U4e8gmbeyfn?=
 =?us-ascii?Q?fpn6kRMQ2sYh0Awowm1r2C12ZWQmfZis9usU6CwCR/78Fj/nDT8Sjll/7bM7?=
 =?us-ascii?Q?65ylS2rHTrVXQaf52GXKut7OJ/PZso/Xim+rzNjUs25QQfDaFyaVXDexssd1?=
 =?us-ascii?Q?tvd06RQvZaUNZSLboDYPydIcgV8qXagwMXCDQCj19fgx2tkuh5CouoCUSLBs?=
 =?us-ascii?Q?bA2IwOqIWBlRWK3ecGb2rJSOBb3D2eDkQP/zNE1fCQaDRT7+RLjDt39LWddn?=
 =?us-ascii?Q?m7YetWw4m2D3DgdJDZjVEJ9CNt/tgUqWt7n6L03SbGkF4rTtCI0+LCjfvr/S?=
 =?us-ascii?Q?jd0y/3/AIu4Wf5ZS7kbZQwgzJ1vMkTkkplxwHZ7ewar1IF+5ZJaGLHwNVzLd?=
 =?us-ascii?Q?KQL0zqK9yKj34ljOgdLJOnIx0riS/qeWDdCyH+A26OEH6KJNmoEIFNacn17g?=
 =?us-ascii?Q?rZ2ZJBJD3XtBwoSuQlMFnWug+I48FsQhQl/AyNR3+KMqasTtCqkzbMnnb7VF?=
 =?us-ascii?Q?WFdr1gCUnJTnhLnGH0pVBMRGJd408Z6v4SOJGUd0haWHvyQF1tUaapmJId8m?=
 =?us-ascii?Q?1CSEdJuUqYKaOxMofCjUX78ZrQeMGuxeJJWRuHkx7G7/0b8wok8jE7gu8u5m?=
 =?us-ascii?Q?YBZ0phvdOf+U9XatQLdbfd4g/jwJACQWWyLQSDnM6H5wLkuVgfw0mmK4rPNh?=
 =?us-ascii?Q?IETNn2NeSqphshpHtdKYH23NTW4zHY9qMM+bMap+8WHg7vQJk2Z8jCb39Cum?=
 =?us-ascii?Q?6WmBWLMvDJFrE+7dHCJO47D8N7XmBbeOg9+4Kj6e4CZLsQcJ/Q5d+nRfNoja?=
 =?us-ascii?Q?Nyu1TPiS2uoK9jCZLSUE/sq9x3UL7pZYAbvyKBthP/86eTqFh6Ecy0Qxob7l?=
 =?us-ascii?Q?3OHGHBOVi4wLF3hBrcg213MUh0UVb2v5ovd3uhyQx4TEZkbLMiZbyB9fN2uI?=
 =?us-ascii?Q?lhdJMaqmCj7qkxu7tGB/g/7tXSwOIMoWelYaHIQDDRTZlpiQ73O+REDm3c6W?=
 =?us-ascii?Q?SvAt50MXmDEm/dLiqnRWz7saY1nu+4p24AwJ6GJsnaJxWy13kWjmxgiBr1VJ?=
 =?us-ascii?Q?IotMJ1xERy+9g3K74TH6CgMgVSeaOGIRqLRYzQ0h2lrBqtX1QlMasR19V+Zl?=
 =?us-ascii?Q?q+NpNHgU+QiDumON5EKpptNmgtyVTRpZuvTYcV/GGdmgnNWh/L/UNr61vbkf?=
 =?us-ascii?Q?mkcogG7z22t8K8EYFqAIp3b+d6IrUYu/DOFhQpLv?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2bbf4b5-abf1-4d08-ddc4-08db04eb895b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:03:07.4506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AITxF5Y1/5RpD29jcnTvKfm0BXVawdAHm7jBHCg7R29/9tovMpr8cY2bXZiylzGxbwdcMvwCURFG9pGB7dLSow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4140
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To fix: WARNING: It's generally not useful to have the
 filename
 in the file + * fs/f2fs/super.c WARNING: quoted string split across lines
 + f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, " + "please
 run fsck v1.13.0 or higher to repair, chksum_offset: %u, " 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.123 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pNTcs-008CY6-Cu
Subject: [f2fs-dev] [PATCH] f2fs: fix some format WARNING in super.c
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

To fix:

WARNING: It's generally not useful to have the filename in the file
+ * fs/f2fs/super.c

WARNING: quoted string split across lines
+               f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, "
+                         "please run fsck v1.13.0 or higher to repair, chksum_offset: %u, "

WARNING: quoted string split across lines
+                         "please run fsck v1.13.0 or higher to repair, chksum_offset: %u, "
+                         "fixed with patch: \"f2fs-tools: relocate chksum_offset for large_nat_bitmap feature\"",

WARNING: quoted string split across lines
+                                "can't mount with superblock charset: %s-%u.%u.%u "
+                                "not supported by the kernel. flags: 0x%x.",

WARNING: quoted string split across lines
+               f2fs_info(sbi, "Using encoding defined by superblock: "
+                        "%s-%u.%u.%u with flags 0x%hx", encoding_info->name,

WARNING: quoted string split across lines
+                                       f2fs_err(sbi, "Need to recover fsync data, but "
+                                               "write access unavailable, please try "

WARNING: quoted string split across lines
+                                               "write access unavailable, please try "
+                                               "mount w/ disable_roll_forward or norecovery");

WARNING: printk() should include KERN_<LEVEL> facility level
+               printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fddff5deaed2..6f65beec78ff 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/f2fs/super.c
- *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
+
+#define pr_fmt(fmt) "F2FS: " fmt
+
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/fs.h>
@@ -3584,9 +3585,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 
 	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
 		le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
-		f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, "
-			  "please run fsck v1.13.0 or higher to repair, chksum_offset: %u, "
-			  "fixed with patch: \"f2fs-tools: relocate chksum_offset for large_nat_bitmap feature\"",
+		f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap\n"
+			  "  please run fsck v1.13.0 or higher to repair, chksum_offset: %u\n"
+			  "  fixed with patch: \"f2fs-tools: relocate chksum_offset for large_nat_bitmap feature\"",
 			  le32_to_cpu(ckpt->checksum_offset));
 		return 1;
 	}
@@ -4048,20 +4049,15 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 		encoding = utf8_load(encoding_info->version);
 		if (IS_ERR(encoding)) {
 			f2fs_err(sbi,
-				 "can't mount with superblock charset: %s-%u.%u.%u "
-				 "not supported by the kernel. flags: 0x%x.",
-				 encoding_info->name,
-				 unicode_major(encoding_info->version),
+				 "can't mount with superblock charset: %s-%u.%u.%u not supported by the kernel. flags: 0x%x.",
+				 encoding_info->name, unicode_major(encoding_info->version),
 				 unicode_minor(encoding_info->version),
-				 unicode_rev(encoding_info->version),
-				 encoding_flags);
+				 unicode_rev(encoding_info->version), encoding_flags);
 			return PTR_ERR(encoding);
 		}
-		f2fs_info(sbi, "Using encoding defined by superblock: "
-			 "%s-%u.%u.%u with flags 0x%hx", encoding_info->name,
-			 unicode_major(encoding_info->version),
-			 unicode_minor(encoding_info->version),
-			 unicode_rev(encoding_info->version),
+		f2fs_info(sbi, "Using encoding defined by superblock: %s-%u.%u.%u with flags 0x%hx",
+			 encoding_info->name, unicode_major(encoding_info->version),
+			 unicode_minor(encoding_info->version), unicode_rev(encoding_info->version),
 			 encoding_flags);
 
 		sbi->sb->s_encoding = encoding;
@@ -4415,9 +4411,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 				err = f2fs_recover_fsync_data(sbi, true);
 				if (err > 0) {
 					err = -EROFS;
-					f2fs_err(sbi, "Need to recover fsync data, but "
-						"write access unavailable, please try "
-						"mount w/ disable_roll_forward or norecovery");
+					f2fs_err(sbi, "Need to recover fsync data, but write access unavailable\n"
+						"  please try mount w/ disable_roll_forward or norecovery");
 				}
 				if (err < 0)
 					goto free_meta;
@@ -4666,8 +4661,7 @@ static int __init init_f2fs_fs(void)
 	int err;
 
 	if (PAGE_SIZE != F2FS_BLKSIZE) {
-		printk("F2FS not supported on PAGE_SIZE(%lu) != %d\n",
-				PAGE_SIZE, F2FS_BLKSIZE);
+		pr_err("not supported on PAGE_SIZE(%lu) != %d\n", PAGE_SIZE, F2FS_BLKSIZE);
 		return -EINVAL;
 	}
 
@@ -4790,4 +4784,3 @@ MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
 MODULE_SOFTDEP("pre: crc32");
-
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
