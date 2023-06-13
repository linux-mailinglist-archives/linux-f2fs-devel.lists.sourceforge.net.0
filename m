Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46672DB8F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 09:52:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8ypH-0007ZY-QX;
	Tue, 13 Jun 2023 07:52:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q8yp9-0007ZK-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H+3RJUylxZ2BDv8qqONAc27GOdD9mtFjjjMhHozz6kY=; b=VlzwNcHo9wfL5Z134A5d7A5Asp
 RTS6IzHHyIJ+swgoY+4vr4BzElh+9l4kFOmvQ4ifig3bmc+lcLZ6iVgsnud5IRdWhH217TIuPVZjx
 jGxAn+hJvxmIuZdTKjnbTMsaRA5rG1pSgSwYE4Aa2X16EuBxfHDC/l5A/qK94EwUib/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H+3RJUylxZ2BDv8qqONAc27GOdD9mtFjjjMhHozz6kY=; b=Z4bdaJ1qIC5eYmnXudkMlwj33y
 GM4eDL6cEXVHJ4DV2rWAYFX9DT/Kfsu3cRC5ryAnmQHgw++J7NaSzvmd5JS4YAM5EL0Uok3PVeZ8X
 K3bQWLKT02y/+cjF82DZlaBhuOk7C0XXvOf1EYCiXxGbcWa6h9WDy5Ys1n5br7V/uW44=;
Received: from mail-tyzapc01on2133.outbound.protection.outlook.com
 ([40.107.117.133] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8yp9-0006Uy-Kw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 07:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK7DAS3Nv5zVL4OO9rWRk15T7CvzbHZ0d523/UEbgN5LVikmrJe8XWbohpt+wXPRgBtMYYa0/upgv6aaMF55fLyAeT0k07AjL6IPpgauVUp91Nzs9GHZ/wqRDgDILAYJyj7uqXSwl1uzZzJmGrOKk7oG2umUowZDRVFjYokC/v+d9IGG6nEdmVhd7aK75FqfPCxxjjcS2FawQ59/AG5vki8YiIEitA/wyuSHoBBsZo1HKtESbMKdCzptBfuBXySqvQOghfpI+/LvCqw287YDH3iv6JxKdhDtd1BCfbBiaaUSJbEYYYnbE6UQyV201NVE05ztaCRcUCwU2BzJrFPHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+3RJUylxZ2BDv8qqONAc27GOdD9mtFjjjMhHozz6kY=;
 b=aFXnNGy3jqo588j6AxXjQLNpIWO2t175IpKlf1m3Dhw9kg4w6Fgxbd3NXUi8X+Vy2trndRtKUDapZ4kCQaWEfx5LI/3O9n4fWlggdNWJ4zlfg/KGMtUMUwqYhF1AoSOVNjCvaeiq3TweuUSSpvacQ4jvbk2SBUgdUUxpqKzOeRQrdLYdF96P2x06sfrN06bD6YWM0ugg3nwN3Ueu5033AwHSkS0NSlP0YKmNyQ+EWT+3NOHWtJzKB/a1yjba2o2nCYgDZHA8y1NtZn3W9w10Od65KTPS06Dqb7/FfP1Drf2ipJZsZzv8WPwknzmhMmQC2Uu3JqoVaKgeIOXwHqQEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+3RJUylxZ2BDv8qqONAc27GOdD9mtFjjjMhHozz6kY=;
 b=gtNwDCoGTj1Pq60w7frQAztr9femWGtf3Vx4pGuoSqAq7y5xRSzRM60m0xLysVjD6mot79RW8A3tqZNZgJ9jWIOFK0hUmVGrdA6ANGvm5jsrWO7lgBudMKGy+XI8g74jU0MFB3CpB50+JB5agz2oWKlgBCklIs6mphIgv4E7ZWynQMGQwZshetQTNCU6RED9hg/TeTqJjX1+qLHUxYLAxr4V4R0ypWLpR6sm/wyniWiZFWEaHs31q/49yPebe7s0fIVS3FH+p5+MxOkKsAhRz4yEhq4AfIqNUDrcvEVh6DoOjUkqENPnDq8JdXdb5RwhNJZPHw3attxYvFZdJ2QnXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6572.apcprd06.prod.outlook.com (2603:1096:101:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Tue, 13 Jun
 2023 07:52:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:52:12 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 13 Jun 2023 15:51:57 +0800
Message-Id: <20230613075157.41065-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230613075157.41065-1-frank.li@vivo.com>
References: <20230613075157.41065-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ea1f3e-9040-4824-2906-08db6be318d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3xdOIu/EUGY/IOflE+8i7kqofk6CiIv2OdayXMY9oRHExNDazhPprM4dBLH51vXLPG1C0UBJNIQeTRxKJsJT+TgcObYUGbTk5Yf8vGt0qU6Q2HI5zYK/WWCyUyBQ7LlcsZIM66VZ96f7zCtcCHylqpuw+lM1oVs9J5jvl+GbJ/iqByqj2JomvxIgIcHKzwIddYMtRZM/BIYaPDHMg7jsVN/c2+RSMANRIIpwAgqwoBnc7b6jPQD5Jh6aL9GiOJ4fr8wkLte4jhwUqED15s4PRNpLo5gbCwpBE5CRni0xfpcW7XHLjws4wo1DclWtXyK7d67JdvuCX0rJvKnmEyVNLtUVeRwKMXnqtqd0kNv53OJkMQsRkDERFwxvIomLWBTU5SW5QJPvjEbpvMM6QzHaN60vlXC+fSgSAixfBNAOutsqxxgXOVpbeSV0ovM9SJ5ILOmk0vwLVbyB5/MubI2k5Nkw8SgOvy8kLTnaZ2vcyr9XD9lGkikmhKolqtxdA4nxEKx6c+NUgcqtWwDi5zTs6ZB79A/vgeLRJNWu6e4wNeX2zlz+e6avhll6FiariucUxOQFtmoAd8Si+JtelkHDVCMAYiGAs4sV0gRl1OF1gxGpNB1pq+gsNlHp+U0C3c3E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(186003)(52116002)(2906002)(6666004)(83380400001)(478600001)(1076003)(36756003)(6486002)(2616005)(38100700002)(86362001)(26005)(6506007)(38350700002)(6512007)(66476007)(66946007)(66556008)(5660300002)(110136005)(8936002)(4326008)(8676002)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ARjeGxjwyEApYyIx5cIGpgHw/hxZrAYrkmqWqNdRJSGtb5aVoaqWUq9EwEIi?=
 =?us-ascii?Q?LyAoH55jBuOL1X2QUoeKqaAcpkUZdpgKu9lo78S9W+dRePzEXU7Fp4TCttkX?=
 =?us-ascii?Q?fKpfuCUjy0Mnoky80OPeyVKPKKFJuLjniIe3qKXoAyntKYGBKY2RXEbORWT3?=
 =?us-ascii?Q?OwVW4hVfWkxG9z/EIG4pjnNaM2xoD+oH0Cfxyb5otDd9R8rqUcN6ETJX1QiZ?=
 =?us-ascii?Q?WhRbpTni6k0gQYiAZvHHLzhu5xTyTWa2oPsGdSINQProYIlpC9XIErCsG+S1?=
 =?us-ascii?Q?I2PMJMfznXpK383FrAzuAfIJC7WhiV/36d2ZZatwItxOKiDZV5yCwnMJUg6L?=
 =?us-ascii?Q?8x9rDadrbdyVZxOrbhSwcq4Yy3j55v9rJ52yVuKNB1sPnjXnAvEvNMjUMRtg?=
 =?us-ascii?Q?MmTiBe3eCiL03Cm0P5umvsxjsSvQj2iRnMuxUgFNsX/YvWvR/3RuXTd0EwtG?=
 =?us-ascii?Q?mAkH3eBMxo0einA1PiKIJu5M8T+zGvC/8WJGRhuV0rcdQpJbEeVuf4KzA+Vh?=
 =?us-ascii?Q?HpVeL8XHRMIlTl/QPhGd2nRwlWX15SUBES1uzlzIhb3UsC4OhlHuxIhP5onP?=
 =?us-ascii?Q?LFobUFl3f+9x4B8OgiIX4syAGV6dVFSetKvnvs+jOC8TL+sMbhPD10Ik5vGN?=
 =?us-ascii?Q?EIOxASMBzQsifBVhH/nJXMFONPEyY8Um/U+WwlSvk7DStLvHhT3P7R43P8r4?=
 =?us-ascii?Q?iva0crHTRr0gmjkG+bPolSBtxXlAp1fe1LHAiUgxANAQ8omrJDJfutVxDMGU?=
 =?us-ascii?Q?dGD5VVmZ9sK4qhxc0xfZSB27DTGZom9a9lqoYA6lEJOpzRK5sAL6bnIuyt/W?=
 =?us-ascii?Q?vPEakwZu1MWHCEbK9Fz65Y6UaixJ2zpUruddSrdwtfNQPqraDZ1woEyjcGOb?=
 =?us-ascii?Q?4YqJShLmZ20Qi+RyuaHnSFEkA8xZzbVt+UzoivykQ43SXtgJHIhzD+bFvx68?=
 =?us-ascii?Q?z+Yi6yL9HkQh74YhTLuvi5HgsvNPswxaLn/EmXEWQxKsohkNNSmQy1dRkOlj?=
 =?us-ascii?Q?t73Voy0ONLI7m0+UO8PMv8eLpdAwPhpP7HdoFMAY/xw6+nixbbvU5fWLkMy/?=
 =?us-ascii?Q?QlytAmSmU0o1one2ceMjQ7d+uivBkClqnbKLv+tM4hd0Y5H1WOMROqQJVrbM?=
 =?us-ascii?Q?9deNrnVjnc1ZADD8undryqw3wt5pQ2qAffgOOuhOVOgwdCdPmcxwvqXZtwLn?=
 =?us-ascii?Q?enijWVe7qWtIOMgfF4u0TiG3RavF6CLbYi04BBrXB9uqWpk9z2SiDXu0FPaS?=
 =?us-ascii?Q?+wsmk8+xaTi6IYIPlFvVtqguvnePAdEg9Y6rh0g9rwy9TxTRQ1dFcoPqtOtr?=
 =?us-ascii?Q?vcVjdFe+DyPq3gjGDn9pvjhzdY6pdKs/jK3fjUTEUj5NFrTNjyKHLtCG+NRk?=
 =?us-ascii?Q?lWh8a9cQ0ODJp+dyx19beDWQSkIT84PmkIdRTk9MYHqy+VFR+uztS9EsNDGZ?=
 =?us-ascii?Q?fozK5hnrZLuTbY3iO/qpJK4MUSXSn6elN2dmOl2ApHg1hCX30luarHlxbBYv?=
 =?us-ascii?Q?z6xWFkAZo4YN7aJSFjxHgzeaFBsRO6MiY18vVrNCigd3WNDKFrYNVsZAfR48?=
 =?us-ascii?Q?hbHB+VfKVgjWHpEo9oJZTKUd4p1rbYp80Z5xOObh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ea1f3e-9040-4824-2906-08db6be318d3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:52:12.3435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00cfRnIVlkJEqlmxArBE3p0LSycnt8O6NpYpkzFsUyIKEPk+kvb1Nt+wEVjEbpElzpf1D0MKO+JydzhbRt8j5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6572
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS_I_SB(inode) is redundant. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/file.c | 12 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-)
 diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index 41e7c2b80f31..f45d05c13ae5
 100644 --- a/fs/f2fs/file.c +++ b/fs/f2fs/file.c @@ -3476, 7 +3476, 7 @@ static
 int f2fs_release_compress_blocks(struct file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.133 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.133 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8yp9-0006Uy-Kw
Subject: [f2fs-dev] [PATCH 2/2] f2fs: convert to use sbi directly
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS_I_SB(inode) is redundant.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 41e7c2b80f31..f45d05c13ae5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3476,7 +3476,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	int ret;
 	int writecount;
 
-	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!f2fs_compressed_file(inode))
@@ -3489,7 +3489,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
 
@@ -3646,7 +3646,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	unsigned int reserved_blocks = 0;
 	int ret;
 
-	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!f2fs_compressed_file(inode))
@@ -3662,7 +3662,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
 
@@ -4056,7 +4056,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
@@ -4131,7 +4131,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
