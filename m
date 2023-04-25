Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9876EE63C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 18:59:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prM0m-0001rD-54;
	Tue, 25 Apr 2023 16:59:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prM0k-0001r5-66
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o1dlDommPAgZHDngDg0qri/MhVV9Spkft5xuTpvHOT0=; b=dqqqLdx7v38GeT5e9OuNK9JAN2
 pJ27a2cAsqbTIniuC6U0DY+oOSvRPSsO+iQJoTFLfvBLYqAy1cjgo93HokShY35bAwRiI7StXdv3P
 MJW2BxSdnTsvcdTYhznkzCU91Ij61Z300T1xygynO1nn0qrgd88tORNEwal2ae9AUssQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o1dlDommPAgZHDngDg0qri/MhVV9Spkft5xuTpvHOT0=; b=K
 lIW7UWQloYw95N6IoANMK4bV7CVA44L9hfZLicyy4oJgyHkS87nH71PEnRP8tiy3xY3GIyKWTTill
 i7x4y0Cc8jWl3eEEwzuewnfDTxwdlfay2aPNdnTC8ufWXzrk2Av7QeeYmnOBj3frwxm7ZxEE6xhGC
 8bEPlGNbV1rOs36E=;
Received: from mail-sgaapc01on2114.outbound.protection.outlook.com
 ([40.107.215.114] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prM0f-001LiX-Fc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:59:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkPdLTtKlpD/uVesLaygvBhsyq8DPgggIacJJW39x5Fy2TIbV73o347sUdKlZSNK2ez1Q6vHh1usi4bxHaTfc3N6aAqJqvNNepM5HDFURGfyYm7GgkFqN5uYENULOw2d3yV47GxDDZkMMhJ5PMq1E/w0hnCUsZPDuLHuY6OTPs0gW8JTXW11L0eyr8SV4T+OvAH5ta3K0dgtYrB4pcfCmtsokwbwspIkYC+R3XneimRKQnPqoyVx0DeyBPmDoAegY0pni9YpxfNH3wzl/w4gMGs2eV9GkKBMYWRfMEADB0UPHxtFnrmwf2AUdS7hB2u52ssDxnVApIgFr2pkLBcNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1dlDommPAgZHDngDg0qri/MhVV9Spkft5xuTpvHOT0=;
 b=gODyM5YAcYCuqgDhMMbHOMV3hKfg+4ztki4oH7zARCUfiPUXNT7cf5VjEfJPmrxQ3ElxTpqWTfLFp5oFLttiNi0AAxDTHNrcXgt0DNGXYnlu2lHqs9oLlPc++jfgvbbD1uLL3f2OhS5FTu7EjXJ7rBFoQ3lhYB3lG2UwLi7HUWHV63NuBVJ+s3yrBWQbKHHRj2VQuyfXDtWz3msDbOp1freT56/UjsEK4haBJTNbnafHkdRoZiD4+ylNZ7cTBvje1yD6MRKqnfuA3H5EMzlcRycKAld1doM/zEy3GuGGdKe+ZXmLBBfXGwRTVSYpCi+hzHnKUA3KH9nVzTGp0UIegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1dlDommPAgZHDngDg0qri/MhVV9Spkft5xuTpvHOT0=;
 b=OEVzQFcDaFdOAoKfSmXCzNuFp73FZfdLT/HGUWRlU7DDtXmHhV2HZGVodiPOFCBlt33X6BdOJhbMEdehOjxxMwwL86jOGt2sr368VFFnGn53AN+y8Gb2a6vw7pS0+Y73JRrHyqSviMfgv5/SF/QFyTQGNCT31rvBG3Y/QvP1upIIB2I8psRiibb9PBCFt28LggwzYb1P4qPrsAlmvc/v39fxP966apsPfRzclyWOybB3gaXqWUF7WFDjXfKRcDTgpTmo33EOR1gHUm1/j5NYWoJ8I7/c+iPIW2I5sDtIcjqVAM68ljOWqqaWSSb3VJbcmluYhaQiWBHu+LQqak7poA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4470.apcprd06.prod.outlook.com (2603:1096:301:86::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 16:59:09 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 16:59:09 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 26 Apr 2023 00:58:57 +0800
Message-Id: <20230425165857.29175-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d13e919-0f4f-426f-ade3-08db45ae6334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBB74o2X3N/gCJDvx2Jw9uigAgKwFXNiFPHZnSxignBkpKiRuOkgwCFGvqInonWOvk+o3aFSIFt5BCcjSq33Wc7nXoWlxI1pveYbEyioPqvaLb9Vimp4VXxK5/I+7Lt+W4GuAofqu+PGMHa16UJ3aQRGK0hQa/WJcM/xvlTz7t/mFUTKcurLxeqpXdVs18QFu5PQf/WADHREN6NzjD400XZhGQNqS3kWfVazREJw2VhPGcTC633RpyBxb1knT9+65SOHc5H5S9gopV7JmT99T5A+Q3eI6CJOX50yK8Gm34vNwU7XWCXAucqSpk9SBNjtmBZwugN7rmVn9J9qrazswhogBVSqtbkBs3k3595TPwoxSGFmAgpnyfISZxyX22Ci4JVlvbMBZfXM1A/zP4srjDIvydO4cQKybRLF+b5xQiQE3cg9WCjxt8jiI/SQBfIde6w0xSiedq8s43g2ARsGtRqqlL6K7505zcrFtH3fe5JweTo+WkP1uuVjZwZqsZobbpyj3fu6+LZCyX73hL4esHvjluG5h/Z8GU4iXcxU2ynvyHIwzFDQbR3q1r8eeBUo+5z6TyHrkLxM7/cGA7k9FYg/fEGkFFzexVfhFT9yrxAA0Pou3YtR01Cg4o+XZPaK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(83380400001)(66946007)(2906002)(6506007)(6512007)(26005)(52116002)(1076003)(316002)(66556008)(66476007)(6666004)(4326008)(2616005)(8676002)(41300700001)(38350700002)(38100700002)(5660300002)(8936002)(86362001)(478600001)(107886003)(36756003)(186003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OqCEyNnsBJPoXJP8vxp7k5zoNZfLoG8ns7Vypn3WxTQDkE9Ewn93gK6tD7DA?=
 =?us-ascii?Q?ZGMYHpObLvLxvvsEnzSkkQj6hRRAcHnAJhnn3nVkixgK3vjZVKDd9SB5nJUk?=
 =?us-ascii?Q?i8eh34y24C+7gBHPVTN5J4ajaXy3PlnaNiCsGhD6w+SQXV8a/Q8dirwpteta?=
 =?us-ascii?Q?ZTM7MsusBgnt1at/eQZl3Kt+DTlF3n/3ROgxIZDDvR8JmJ7dQEi6TjQ43Cqu?=
 =?us-ascii?Q?P+n3eb6yVy4bWAyPcB4D4UtsYs0zwbcRKQ6E0tqMhx1pgnGRlKIhN7Mkruir?=
 =?us-ascii?Q?KTMAxVPsVhCXBdLLPHMK8pxFJ84AVCT1paCgt35aXS2LtmMfNSiDLT3Lkfu3?=
 =?us-ascii?Q?F9e73SArqBRdoSyHUcXxihFf4raLva+aWcyHFkGno4BWEnqtjaBt0vwp8e3g?=
 =?us-ascii?Q?jEB/GDGNewvf6NSiNVzdsMNWLQ9cyCnYbrQqW85CaretYZhNo7AJVdG3OWmb?=
 =?us-ascii?Q?qz3EEl+kvZ1MlNJ+WGMmnwplzvdXa1ZL5sT8qjWz2TfhptPMSpiRQN92QUAK?=
 =?us-ascii?Q?lNu7cyx5RAl3vM5b1Gqcp0ZHl7b1FMKQ71S9entf13LnlxB7d4rG6xfxINws?=
 =?us-ascii?Q?v49MFvNT2bb84BlZoBiPFaRKEFjdQVlsXaDvmRdFFUyUBwyyBgGZAn4D+FGB?=
 =?us-ascii?Q?WMWHapz24uVTjLZRFNZKmWuO6ltMS+qinGdK2tnBBz1eOjJ/lxmJdLGM6U5Q?=
 =?us-ascii?Q?KzzJ5NwvpIO9UaYtaq/oV01Efp7LgsOax9oqXe59vBDLUaSWSiPpuI+jMwKR?=
 =?us-ascii?Q?tXcrAPYunfh6fsg7Nk4Goj9PVFMCQRWqyfFrKagaNkoCTgmd4qe4YZRk7gt4?=
 =?us-ascii?Q?4R+CFOCP46+RLJJanLdCC04fb0imP0hqbJmLib9Zmsr9GYR9DTFPLDBn8KmT?=
 =?us-ascii?Q?bNJ3rKyDpzulO1Z3sJLGv1lHC/cYmz9o0KhWSsUFgSWKXjfR+2Y8E8XCRSdJ?=
 =?us-ascii?Q?HtSaDfczpqEjDLi6vTkfpCKsRuFo2UXSUiAIZY4AAokqh4WRs/bHeKfr2XXH?=
 =?us-ascii?Q?xejoQ9oWxqfKfXZtiLG4naibvl0sOTne0zk/6s+xp9qw90IWk+YAcE6v25bb?=
 =?us-ascii?Q?XJAuDtA4Lv6xhquKLN166xK+TWImoguwNB6Q4TJ/TpmiOyLVKpwKvDPARjXE?=
 =?us-ascii?Q?nfAQmMmzioGo9C9F3X+RjBILXnHCQ2jjOFRWiL5Q4FeRV0zxvTOV/q2OufN+?=
 =?us-ascii?Q?UvEbjS06E/rIAA1/Qo9j2D18vR5m78gITELYcOXeTyh4yhNIWwqEfWLba4Pe?=
 =?us-ascii?Q?wP1BFBC5cW8jI4WL1OeQFJiv1zv5+Ks+0EJe6k3AS5/Cp66ZLSMWjmRzqeVU?=
 =?us-ascii?Q?8nRSwL4YBLgRZjv5+TrQyfpK/1wxaTOZic22R+13SabhwDvu4xMAjJgiLalm?=
 =?us-ascii?Q?4w0dg+lkUj8jU5qWCTfXmcv1iAMukiF7vN49LzXeya4DRXOyNCNw8JuZ1VIi?=
 =?us-ascii?Q?ORZefQQA8C6ZmOftQtvO/UmFRepNHbs411nH7i7XBZjfd9VgiSZhOvE4hsvV?=
 =?us-ascii?Q?Md8Z7MZTK9ixdchK1fju6s4wnnSZYz2iMHXQ11rvWXyQIO5oLb+Gfsp4CDF7?=
 =?us-ascii?Q?HF7dOcGsrKGJ6/DwTqO7q5/cRsHVeOTwji+IStvM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13e919-0f4f-426f-ade3-08db45ae6334
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 16:59:09.5312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uck7X9rIzM5Hyj3Lfh5TRDDVHMD0QWCU/yJYkLqj+fs8Ex61w2Qxh3Yr/GzQkeXn1UJfK1OQsI0xdXbGNz6RfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4470
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This information can now be obtained from the mount,
 and there
 isi no need to print it out every time the trace event is triggered.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.c | 3 +--
 include/trace/events/f2fs.h
 | 13 +++ 2 files changed, 4 insertions(+), 12 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.114 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.114 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1prM0f-001LiX-Fc
Subject: [f2fs-dev] [PATCH] f2fs: no need test opt for f2fs_issue_flush
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

This information can now be obtained from the mount, and there isi
no need to print it out every time the trace event is triggered.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c           |  3 +--
 include/trace/events/f2fs.h | 13 +++----------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6db410f1bb8c..2683c4dd3bd5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -519,8 +519,7 @@ static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 {
 	int ret = blkdev_issue_flush(bdev);
 
-	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
-				test_opt(sbi, FLUSH_MERGE), ret);
+	trace_f2fs_issue_flush(bdev, ret);
 	if (!ret)
 		f2fs_update_iostat(sbi, NULL, FS_FLUSH_IO, 0);
 	return ret;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 99cbc5949e3c..2a94c1d2e012 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1535,29 +1535,22 @@ TRACE_EVENT(f2fs_issue_reset_zone,
 
 TRACE_EVENT(f2fs_issue_flush,
 
-	TP_PROTO(struct block_device *dev, unsigned int nobarrier,
-				unsigned int flush_merge, int ret),
+	TP_PROTO(struct block_device *dev, int ret),
 
-	TP_ARGS(dev, nobarrier, flush_merge, ret),
+	TP_ARGS(dev, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
-		__field(unsigned int, nobarrier)
-		__field(unsigned int, flush_merge)
 		__field(int,  ret)
 	),
 
 	TP_fast_assign(
 		__entry->dev	= dev->bd_dev;
-		__entry->nobarrier = nobarrier;
-		__entry->flush_merge = flush_merge;
 		__entry->ret = ret;
 	),
 
-	TP_printk("dev = (%d,%d), %s %s, ret = %d",
+	TP_printk("dev = (%d,%d), ret = %d",
 		show_dev(__entry->dev),
-		__entry->nobarrier ? "skip (nobarrier)" : "issue",
-		__entry->flush_merge ? " with flush_merge" : "",
 		__entry->ret)
 );
 
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
