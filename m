Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD274A37E1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Jan 2022 18:24:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nEDvg-0003lI-J0; Sun, 30 Jan 2022 17:23:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <harryausten@hotmail.co.uk>) id 1nEDvf-0003lC-77
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Jan 2022 17:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Y9jqdiRg9J5jJ5hRFpMesnTTflROObRFBV+zNsVj4s=; b=bVRXzcfsWYb168qexSIewsq7uk
 8RTC4LqRFVrD3rFh2rxCbvzT/0xY6fApsfD+rGEUjFiXtsgObALIAH+DjeUIaM+QD5NBP5Aqa+P8C
 Xz7zE4KsfSN08A14FVLyIVjKm3xUqCjIkXEYS840zTUKCSov57Np+i0NErFcMCc0ktM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2Y9jqdiRg9J5jJ5hRFpMesnTTflROObRFBV+zNsVj4s=; b=V
 3KjxszFwu9EFonmhB1yrN+kwwfQvpeJyj+ZLz8cXWNtpygCRNCtIAA++/zvKAc44cUmHMeDtMQRuD
 2lWG0OCRr6fRDG7Mckx7H5VOR6r231fFDIKH9AWh4W7M9I9efAMAAY4ek9oPHTuoP3/5cmHRop/eC
 JWsZf0w3oW1w3518=;
Received: from mail-db8eur05olkn2040.outbound.protection.outlook.com
 ([40.92.89.40] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nEDvb-005k1t-2B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Jan 2022 17:23:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWHtBaWTDg7uFXkw9HLsWx99VX60nFiY7YE63qbLWcPgb2iY0wU70oDtz/k8PtCo9lxBPOtlJ5WVpM3BJEUmobkL17ORJleZ+gXj+1cFv8lyr4VHZ4vY0Drf3hpvCxnRhOFDFxvw9q5UfLjZl/NUmm7dU1AmNvDD6pXKbgfjxEw4BZTcCUkfBzjnLKR9G0xUiK2x2lCD6Jagec+d0pV/9zDrw1s2vURMIIQ/2tyPGwtjX4CRhWx6SzkoFvYg+2Qzme/hWtOkgy/YpcKt1SDabkoHE40INzR6k4wSk6fyVHvc5eCaSrrjotsNIzbKHqEM1wO3G0Npn8skRKJGvLRorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y9jqdiRg9J5jJ5hRFpMesnTTflROObRFBV+zNsVj4s=;
 b=BF6pcpXNYddprupbe7Cb9JriLaxiX66HFFoif0tX8w33/CyzzfZQUzfN17KuHX0iveg5kQWOMxv3GKcXE0T2VHeoJtDsr4X2WfSB/C9/zzMMjCPvtvjHXuhB9Z10hyQPY3BtfSmAsURrz8Pa/KOfxK97ii2D6oYQ6MhOQlgGPTqRIBJdYSfVQTTAVG5on0sj6k86fQKvYItY47Dl0JTg3y67C3udPXyR3tZp1HflmgD+Bn/eSN6/rSyUl6Ig4Uxzmfju4T00L2P8hIiAMBOXynPO56SdzEid8SELMTOUdqnnM1P+lD21sljIZ7KJNhZc8GoI4KNhhWUmGFj0nvuZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:a2::21)
 by DB8PR10MB2937.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 17:23:44 +0000
Received: from AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6]) by AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::29d8:5a1d:50be:a0b6%6]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 17:23:43 +0000
From: Harry Austen <harryausten@hotmail.co.uk>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 30 Jan 2022 17:21:39 +0000
Message-ID: <AM6PR10MB2838F71E6117BFFAD3FD5A69FA249@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.35.1
X-TMN: [HLE+bZ++4rZxYkzy05C7aZClBsgUSiNm]
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:a2::21)
X-Microsoft-Original-Message-ID: <20220130172136.6126-1-harryausten@hotmail.co.uk>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c46d4bc-6316-4659-b3b2-08d9e4154422
X-MS-TrafficTypeDiagnostic: DB8PR10MB2937:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eu7iaXN1z6WzmUyFO+roNvh9rbO367Zio9kSEkrXVbFHk8WLzSmPfK7Bj3iG5GB0XXdbvufx+KBU9kgqI6KBvcMaPUWhybUvp5Z3geOPYD7Lg05mu1dQNvgY//0Drm7h0Fls4xjKgAW5ZWEpGc3tWGl7xDFHzvMAMfgqufTo8wkSbqXmMOpaUtzyvSKJFhdsFzVyS6d95TNZT2klhB8joym7m/eJSy2wHvA2ik3JUxd9knztEg2uyf5Vyk9eTvDazLiildmUd7BOuJIY73SvI+FeBqpDvtSm0QewSNJp9S8m/iH5WIUvFH1tjlKaGsaMngnMuIIMw/2Y/5d06qZLmwG3dIRajgD9f5GHGOTHJwYcy9tBaFjmjKyU9FpBpIljIWNVkjWWJ9elUTmQtMdmIX521DwuGsBNIDIsqWjNaKASfRL9kkY8+P4KEjv22KjPD+cFS6EUL/T2vGBZVXzsstziszoYvBfqFX/4pEaoJO67/JutVlDHJDqF9rW/F7AVztD1RmVQCFrD8YBcjXfLkPB/r4wwKBQaoekvPgCO1NGB3HetQKSLEnIUn4Qnb+zEUaolcT7bkyDeeitFWvRT1hjhVwKMKFvjfSvdsxHn/To=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ou5aBKPZTGXrGEP4j8v74/794euk1CZi2erbCTDielOKrYnR55i6sB2X/An5?=
 =?us-ascii?Q?XtLEX2QU22GxRNHe/hlvblbWi1wkmY3cPc9KfF8HJzZKWTwI2CYxaqmIrxHN?=
 =?us-ascii?Q?JTOF5UgErR7DhuA5Sn4Ud84mCXefK9xxKynYlmVGGPXCToau/OnPVcvCJ022?=
 =?us-ascii?Q?6ZZYmtd/jXkui9nlePzOs6U+MplgKldG+oCCSJzrkk893PENVgrKFyq4Don4?=
 =?us-ascii?Q?kvYT92rDQkbvRIjCxS91jqhKCZ3yy3ZWR8KZyXNsWFB0HoGe9ceRpIgB2k7h?=
 =?us-ascii?Q?EiHQxxUJA7iJMQ5kZ5iYnjV10AOLABSzzY1e3lb+NHOSpioNu0PAGqFfNXDe?=
 =?us-ascii?Q?K4sVfsntm9SvCmiqDi3CSqWd+djHWn7C4mDeLZV/7XbMZk3aYcFKe4QzZNNz?=
 =?us-ascii?Q?mlTYCKhDuff65MnV0+kmxwcYTZ/6Cjd+pNgjWvNvBId58LoxjKbp3rQIA4dk?=
 =?us-ascii?Q?18t3SU2ajBSal1h5kCmjExD+FwjI34dsgo0/pmcMmC5BHrRbVvaA+xH/BYUr?=
 =?us-ascii?Q?NRJmggh70b0U98D4GoDOHWNBLH3bgxBdxHmhsZcapf3jwKoN06KrF2BncydZ?=
 =?us-ascii?Q?EyLAG3huD/ZtZKhdI2c/aBpcGY+w21nTOQbtPWg1be1cjaRwQb+JrrVQyqsM?=
 =?us-ascii?Q?bICXfAp/Jr1hQRQ7KaHO6E/kKUuzKd59gAg40MxMmKSAidcmcd3KHVc25WF6?=
 =?us-ascii?Q?HSC0ArCmGVA62Pts3EVoJ8iL6GuXl5zZLGhaDdYboKBQtykhvlR0oMNWFCzN?=
 =?us-ascii?Q?hpciLYuRAQXi9tqs4VnWLNQyH3I+nGwWwhWpFpROCF6cvfOrO4y0OQOus0Pd?=
 =?us-ascii?Q?AsF6AQLh2zbKGnY5xi+kYxAFBPvLj4z0RznnvKCgDsNfeabgTIc/Ydye0QtQ?=
 =?us-ascii?Q?xKo+ZNriVDoTdBw26vwgXKbqCe+UJXdGJlZDXP5aUDMpHuC9JedzxnSYa0UC?=
 =?us-ascii?Q?c8xPeuls4tLXJAigaFh6VA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c46d4bc-6316-4659-b3b2-08d9e4154422
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 17:23:43.9300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB2937
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After Eric kindly pointed out the reasons why my initial
 kernel
 patch attempt was incorrect ( I had a rethink as to if the current
 implementation
 could be improved in any way. I wondered whether something along the lines
 of the following patch would be more acceptable? It is intentionally verbose
 in order to demonstrate the concept as this is intended purely as an RFC.
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.89.40 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.89.40 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [harryausten[at]hotmail.co.uk]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nEDvb-005k1t-2B
Subject: [f2fs-dev] [RFC PATCH] f2fs: disallow setting unsettable file
 attributes
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
Cc: ebiggers@kernel.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 Harry Austen <harryausten@hotmail.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After Eric kindly pointed out the reasons why my initial kernel patch
attempt was incorrect
(https://lore.kernel.org/lkml/Ye79OLCFLR3H+GnY@gmail.com/), I had a
rethink as to if the current implementation could be improved in any
way.

I wondered whether something along the lines of the following patch
would be more acceptable? It is intentionally verbose in order to
demonstrate the concept as this is intended purely as an RFC.

What if SETFLAGS returned EOPNOTSUPP if userspace is actually trying to
*set* one of the unsettable flags (i.e. it isn't set already)? I believe
this would therefore not break chattr(1), as flags that are retrieved
from GETFLAGS can still be passed into SETFLAGS without error.

If there is some other ABI compatibility that needs to be maintained
that is broken by this, then please let me know. Also, I have not yet
determined whether there are any concerns with calling f2fs_fileattr_get
from inside f2fs_fileattr_set, e.g. speed/performance? so any thoughts
would be greatly appreciated.

Signed-off-by: Harry Austen <harryausten@hotmail.co.uk>
---
 fs/f2fs/file.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3c98ef6af97d..3f3d67c1dfda 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3079,6 +3079,18 @@ int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 	return 0;
 }
 
+static bool f2fs_contains_unsettable_flags_not_already_set(struct dentry *dentry, u32 fsflags)
+{
+	struct fileattr old;
+
+	/* Get current file attribute flags */
+	f2fs_fileattr_get(dentry, &old);
+	/* Mask away flags that are already set */
+	fsflags &= ~old.flags;
+	/* Return true if any of the remaining flags are unsettable */
+	return (fsflags & ~F2FS_SETTABLE_FS_FL);
+}
+
 int f2fs_fileattr_set(struct user_namespace *mnt_userns,
 		      struct dentry *dentry, struct fileattr *fa)
 {
@@ -3093,6 +3105,8 @@ int f2fs_fileattr_set(struct user_namespace *mnt_userns,
 		return -ENOSPC;
 	if (fsflags & ~F2FS_GETTABLE_FS_FL)
 		return -EOPNOTSUPP;
+	if (f2fs_contains_unsettable_flags_not_already_set(dentry, fsflags))
+		return -EOPNOTSUPP;
 	fsflags &= F2FS_SETTABLE_FS_FL;
 	if (!fa->flags_valid)
 		mask &= FS_COMMON_FL;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
