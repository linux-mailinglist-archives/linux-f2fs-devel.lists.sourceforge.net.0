Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0F81FCB7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Dec 2023 04:15:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rJ3LB-0007A9-4u;
	Fri, 29 Dec 2023 03:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1rJ3LA-0007A2-7v
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 03:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4EpF9hvmVdzcrFSR5BcoJs2yQywPah5jHT+51PTUHvg=; b=Qo316bg/E37WZZMnkygcU56l10
 kAgxLY+RUF17EhwT0SVSYJZ0FbqeXnl5EFI7aJZlhrgQdvFRnb4TpWE84GUrYOII3WOt2PM+Z2eLr
 re7sLReYCVfatVrloCFSqeinI7BE6MjxP3yW+J7VHG2HAh6xXSPUyTpTxo4gIQrHczqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4EpF9hvmVdzcrFSR5BcoJs2yQywPah5jHT+51PTUHvg=; b=c
 aaJzdNyeqXdQUZ+r0gcJ8Og5nyuYmQay7iTplO/m5xYUSYSFqC36kChle3dgqo6otQpmrrtrNj8Cw
 ur7mCbHrimVC+5MI4mTGVEm3lekYYv2l8a2R8bEqzA0Nmj0n/+saawyA/aj74cS5pdcS/f+gP9X+r
 8GawRaH6KR2fGKPk=;
Received: from mail-tyzapc01on2127.outbound.protection.outlook.com
 ([40.107.117.127] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rJ3L4-00051G-Gg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 03:15:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGIx4SQDO9wMwddwA+Rtfs+2msxxjp1bSDLikmeK31C5Ho/ojnJwPaqUywG5xeZhWvNlYbiUxrMZFchPCtLE9hRFVqWJDJXBDE/Igp6CaLP+YtHb/QcaiPdOcbcYwQqKq7s93xpKp2J/XV/ogM1NvvcqD2y3zgwwba4/+J7M/b+Ysi0RHEgem76AK3qIbciX2kFmEOFXBIXOYMtov4O7fHSSnIe0uwCe1MKihHjyOdKGwI4F+kVgh/vcS5eIpYwCPK3ucNBzaHkaxvZbB7COhh5Gja38VmzXlEM1JIyB8YSmzxJfDHXcaVnYqC8aN07uP+TYs0rycdppBSaSh+AM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EpF9hvmVdzcrFSR5BcoJs2yQywPah5jHT+51PTUHvg=;
 b=ZmsPhVv0QNIupbzWy8BaJ6vvdBkiJdxmfGAOXcdhcboQBtsjqSkJqrvQH/MDM6DiQ6/r3J7teHPny+iZmRHeyZ6x0IVHJ9iC2WMHVR1BbDcx/K+ZhWpXP4NWM2fArKoSFWHDK6JuW2H1zJ21mc0HMhk8JPS4RZdXIyZ6GFAF8E1TZHMTAxwFT+ivisU4Il9qq1B8XB3MRAq9g8dJe0bbrF74pgdBcCLC8r0rJGkoK82wB4x0qP2qzH6as5j36mO+bqdtw24FkiVsq6qfq5cj6PRm1tA+1DxB0zVh8QPf9DuHL1MxpvZjrabSl6TstJIPPNy8XSM2JKQsPNGC5hgMNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EpF9hvmVdzcrFSR5BcoJs2yQywPah5jHT+51PTUHvg=;
 b=UzKkMzPwX97NzXbK8uBcTCbDFFVFIrQ0suUgxJzqIMZ/yWZ6NVYcJhN88JZ3r4aNP/BwJdP7VdDjs/A9PjYoVv3YrPcrIQM9SFu5pixI2ykKhMsfg24jpfGh1//95DsevZjjjOIBEeu070hAqXybjbg65byR4G3vzaZ8QIvgd8ZpBNElsayWkRu2uO7RjrEfH50NGlqLFms4p6Kgnjy2i1TJ5D3e60bn0HBnnB73f4JqEceLf5lKCiRW+vM1SqcgyfEKiVotkJitHANcWSVYd//vP3VSzfgDmU13krIQdqso21jexxli/qXjfjc+BGYGSsUkKKiG/05/nqiqQbSHFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS2PR06MB3509.apcprd06.prod.outlook.com (2603:1096:300:67::17)
 by TY0PR06MB5593.apcprd06.prod.outlook.com (2603:1096:400:31e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 03:14:56 +0000
Received: from PS2PR06MB3509.apcprd06.prod.outlook.com
 ([fe80::5cc4:b440:9894:d19]) by PS2PR06MB3509.apcprd06.prod.outlook.com
 ([fe80::5cc4:b440:9894:d19%3]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 03:14:55 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Dec 2023 20:25:07 -0700
Message-Id: <20231229032507.2016012-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To PS2PR06MB3509.apcprd06.prod.outlook.com
 (2603:1096:300:67::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2PR06MB3509:EE_|TY0PR06MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: b40853f6-5bd8-4044-610b-08dc081c542c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tm1L2fYWSafsSeKmPSToQvnStWWrYxh4k7X28yT/wIPc5NZH+6ny5rryYlb6YPVQ44Xk8/g04g9AentdXv4rDceWAU51mezIgLrJ63Hj9ZiNRRjthJ1H41ueguni8NBCxqNlQosPxFaiiDwQpKTAOWpRoDNNPdoJOp9Ar+AgVAuhFQQRHXbka7SjZNBN5nakwfnSuN/XnS98T8phSFPvxLAi46K9hNedQIN39iKMpgZDhj5zXbYgSHDSG/x62vXnmfhrFABHsDhrNktSa6iwFeGBfH2mRnLhRBLvK9BNGmJ98pv6gBh0P9/pj+o8KTTLEuukQrM5AF/NffTM4X4hh2dbniJl2FZaYC+pnZL80TvnNfHXaH0ZcD8IKt0BGytFCur98+tnQPAeP7VIDHQjSQN4V2HVrtOC2cTASB1x9vCYvkIaZgPovRNwqqdds1OPI9QCkHgGC6cebhdpL7dX3GHHFGJ6yhRQ4isC28ENXPgediPG84l/gnPpp2HCdfYVZykKqEGGOjW6zo95/SPFJ2vrlqzV7GjRHivDcm1bTo3y0sMCqvOyoWNI8Gn7hNS3Ef70BDo4dSKeLO9BU6pOAlH9J97J0nBVQaacn8GI+ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR06MB3509.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(316002)(6486002)(54906003)(8676002)(8936002)(1076003)(2616005)(36756003)(26005)(6512007)(478600001)(107886003)(6506007)(86362001)(38100700002)(38350700005)(83380400001)(41300700001)(110136005)(6666004)(52116002)(4744005)(5660300002)(66946007)(2906002)(66476007)(66556008)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FBxW4OIIADQh2xNcfyooOLq+ZtwjwPi3w01qagzapVr42xsmOMWe0725GExM?=
 =?us-ascii?Q?oDFT/hP/0P65OuM7wYEo67A1cLQVIao3NLeBKsyzjt5DCDUMe+JxOm0wQX1s?=
 =?us-ascii?Q?g2FHqk0FT9whOnVOnUV1Xa1p0c0qyEKzIOWTZeZ2Pz3VPbTPLd8DSJ0xSta+?=
 =?us-ascii?Q?Yx6zl3Bvou7nyDhjoRnaxGXQmkQNxIvYuQErCc7J/huao24I2imnHtWnh6vI?=
 =?us-ascii?Q?G/GaqbNvukrNirYBQcJscRmMIi/akJqaKOmWtJgy+eIaV5b64vW/QN/P6AVn?=
 =?us-ascii?Q?t8MPMY/IVgCgKw2QzqPOqe1zLO1witYrE+p1249cvN+XSVJ1SHBhgkMl2TWH?=
 =?us-ascii?Q?Jb7g68fnBoUR1Ul/morfdqHv/wai7KIYoM4lZYM6+HyeIE7X/fiThMchKwDE?=
 =?us-ascii?Q?I4RIaQj3+MD13N0T1yYEiR5wvNwMByyQ9RKCmwiz+m/2ojsQpPcfXDtA4x0I?=
 =?us-ascii?Q?1voRWJkLrL6XNgkL5VLwlinfQ0qar9FGozMhH9YIGFRL3rK+8InxvqvV/dYG?=
 =?us-ascii?Q?VjmCoJe6ni9Zo3zNgcCQ9DPO8AVXAVZBnPkRQSedeplbMaJqs6SPNzV9YEw3?=
 =?us-ascii?Q?8FzzVMFLarVjX4MGKG4sSQdyeo3KEN4UQiWsQDuYq4TdJ+TsSGcSG8+4AINs?=
 =?us-ascii?Q?okhiDQAuXRTF3qNSevZDNh0amZvpwTgItj48T19xVR7wZq5FenOgvPFp/A6y?=
 =?us-ascii?Q?EotIcKU47qdVvyOW306ebRdTYbWWPhlNFs/YU6PmjRgfGZeX6sLA9sxgRAqI?=
 =?us-ascii?Q?QRR/9MJPm5DMsHR2HJfZTHt3ETGf4iyhmZdags1IKUtepflSoWHV9Q0P3xhe?=
 =?us-ascii?Q?g6TIV2VWBQqfzZTX4RA13OD8YWXZFHPhZCjHaajvqv4V+xDthh5SplCqMdN2?=
 =?us-ascii?Q?7u55LpzZLX8nnJ7Pc9xzM94yvYO6RhrYa7zf91OUEIxqSVjL1XF9QnJh69kb?=
 =?us-ascii?Q?mGd5Y3FCMyDMrOQxQSVYyS1Ix3mVQIzY97CMFTkJj3baUzWbBTce8aaUvprd?=
 =?us-ascii?Q?pJqUeT9wzweYWTUneBT7wzAlz1xYWxqB1yiuQLoI04zVaPJHupZhZb/F+ig3?=
 =?us-ascii?Q?vyIQhAbGD+vMqjSMnvKgomSDh1NsKGCT1deMIsFzqSJlj3Qpym0N+ARtMqtS?=
 =?us-ascii?Q?/L4KofOkcoUWPJZUNnwD2Bx/ro4RjM92W55K2Q9dHUE+NaEE6VFSuG0kebhF?=
 =?us-ascii?Q?iGH3IfvjXu/Vs6Mm1lmo7SoOT+EnQCrhuDUZzlz8Btcxc3O1+7Bj/BTSqd5p?=
 =?us-ascii?Q?TAeuWgBN9zjKMxzjpEC+CMxrnLDZm5bHs2fg1clwAku6pbdNA+Z1GwbqtcgD?=
 =?us-ascii?Q?KKxTIVTZ+/GfD6y+hY4KSuqaNGYV5AQMhiqHeZ9Jw73QEt4I6MrkOSCjAaHW?=
 =?us-ascii?Q?MdQQzADl0SD0ul0ZFX1G1/D5ql1dZvSijz6M+D6uDCwtanJ0q10iO2cTOBW/?=
 =?us-ascii?Q?IEbskJlOjM+Ipkc267V1l16faKlI9i2IHPjXPobpBdEglsXCP7W7X9weqGX5?=
 =?us-ascii?Q?UVnWxC2panu1sxyD9eGVbhSlrVgiAWcsIq5hPUw2cXVWIK6yvLxtA/frbiTr?=
 =?us-ascii?Q?Ql4aFhpEIkBHAgPLQGGIpA/wHnvGfh8+BKtKxdpp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40853f6-5bd8-4044-610b-08dc081c542c
X-MS-Exchange-CrossTenant-AuthSource: PS2PR06MB3509.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 03:14:55.3853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHTe1rx6DuA5n0G6qaqSVcyDjEuzCECbv2nHrLmI7ASiRAwZ5VQU2DH4QBO7hFZsapzoG0k4I8k6ejYAlW91eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5593
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 'f2fs_is_checkpoint_ready()' checks free sections. If there
 is not enough free sections, most f2fs operations will return -ENOSPC when
 checkpoint is disabled. It would be better to check free sections before
 disable checkpoint. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.127 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.127 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rJ3L4-00051G-Gg
Subject: [f2fs-dev] [PATCH] f2fs: check free sections before disable
 checkpoint
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

'f2fs_is_checkpoint_ready()' checks free sections. If there is not
enough free sections, most f2fs operations will return -ENOSPC when
checkpoint is disabled.

It would be better to check free sections before disable checkpoint.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 727d016318f9..8f8c0bb75be1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -906,6 +906,8 @@ int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable)
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK) &&
 		dirty_segments(sbi) > ovp_hole_segs)
 		return -EAGAIN;
+	if (has_not_enough_free_secs(sbi, 0, 0))
+		return -EAGAIN;
 	return 0;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
