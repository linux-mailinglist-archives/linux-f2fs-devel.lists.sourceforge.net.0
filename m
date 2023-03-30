Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D6F6D0C03
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 18:57:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phvaR-0008E3-28;
	Thu, 30 Mar 2023 16:57:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phvaJ-0008Dr-WC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VNbhbDFL9G1K0B8zaUErPG7sd7zS75bMfAjMF5LMKb8=; b=FwwL9MtaLh4bPgfS0tbP3qdPQ/
 eSElKNmMPFfKLAvo/9xIVcbrp8lYhcfdqazG2SfvjrUfWGRFAGO6Y6Wcmaewa1GcYDtPtn/rPGnAI
 ismQC6Hv2pZa/2VkxhteYLcCDwVDMx4KTZjP+VZ6mRc44SNay/kd7LfqHfupBisEMTGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VNbhbDFL9G1K0B8zaUErPG7sd7zS75bMfAjMF5LMKb8=; b=K
 WV4AE9Rbv56vXjTXps3AjMJ6bFO884PYCP0Uj/gdV3oAftUSnz3QApfHcTgr0+Lpq+OZz0qMfCCdq
 C9bciW3B+A8btCjSf3eQWor4e96Ut1gFLjhlqNp5mIowb/07sZizryUoMr8pgMtJomdck5IURteTU
 6KsEwnZNIkXObSsI=;
Received: from mail-psaapc01on2116.outbound.protection.outlook.com
 ([40.107.255.116] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phvaG-0004n5-3E for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 16:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6eu2g0cAC15WusrZpHzI+9un63rjRnEop+kU/0pCLhk4fgs5w4ip/6KLXieO6qQueyLdFeHrNuLYu30X3fLP2HH1FJbyfYRq7fOe+4by8bx+sVQq2zxM/NXhCLUGS9JgDZMeKRI5Cutpq7+f53QfSdnSFtpAl04CvHjC4Ht2JdASGTdpoNQwdWuecYqhD6uVPscO2nF6OD6ON35w8Me/I5ySRGnoSXASUwpdOuYJ0BxE/OKq+pjeaXhdw6V5X33hVdH4c7mnuhcn8l7RWufAT1n6KfR0QDzYbw7NNX4w5wt6D5T0opbyvamsNV6vmUHYkN7WSjWliJ0ORlsZPpmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNbhbDFL9G1K0B8zaUErPG7sd7zS75bMfAjMF5LMKb8=;
 b=fH7azx71c3rE0ZEPODwjFTLw1zhyjf5jegtV0BUQBmIHvk5jUP+tg1ugzoKkhMeEz/d/G64ECfehH7i8p63L8FiDySi00yJk3tcTy4bz1GAynGLfrThDF4K9JBWZAMylT3p1n+xxRz721T4/USw4K7a7NW6ZaSqPvV3rhJKbNiHSH19Yzt9tJol7W+M97IzPDr26k/6p35+8i+pA8YVGSIUAi9oHE3D2fvE/+00xyNIMn40pyJSkLuNuQMxK8f9cqVspdDHHeyDW/ptkmWKtDuN5n0RGkYuZjub9U8V0iis+bK8EoDNeAdWGK/+f4bpblU3YlNVs80yc+n+6Sfe4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNbhbDFL9G1K0B8zaUErPG7sd7zS75bMfAjMF5LMKb8=;
 b=j0qE8mlJ63TkKctSIv1x1ig0f7QzM+D9yhl2H/C28gtB1C4BR6tb0vnKObUEz80Mg8MNqGzdNvoVMB/CiAFFFzPKV+ucH+YYhClgkVdBEl1iJhs7MfC09XQiV+QpUes5jVlxd2zDb2PLrStG8zpLTJax4wApoRpu0rJWgOrAxxgbv4TnpwDZh4Ww6VALSHVnJvzbRWqJI+XFF0b7+bWMkUZ7b2f4Xyf3LiShF7cq9w+1GSDhbDHi1A5ffJM9/YnWhgWNE9w9EUXuxdSLzBFnAUNo7fkXRzjLeVFFbfMZGfm4CeGebVOQn1fB+EdxtQwldmZRp7kbO04xkJz4oz5EEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 16:57:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 16:57:00 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 31 Mar 2023 00:56:48 +0800
Message-Id: <20230330165648.33907-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a369de-1b4a-4b77-4796-08db313fc75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBwVLPLhRyZ0P83TiPWQAaSXH/OnAX1Xvh6MxNHmTy4UYGxjDmiGlu3vyow3gjPW7GoljrWn7q/nTfeLYOmG/QZfvLG8FlfPHJ4c/SLMP8otnbC84yZ7WwNaEvrE0596MWW5D2O7ceTOrp/LkT3aPYBgOGHRcJ9HY5GPV8mnE3t64+7Eh+8IQ1WeIjd/aZcRn3cU23E5WFu1Oabizf08zxpF8RyCgUNRihBhXVfumHT9R9FdHSOShNsCXUufs4e6yRx3mCB/gFR7rh+HSAxLb21gL6E3TzTVOCJlnGN3+4EIfpqYTkqIjUYphMYo8AvLIBNg0q9fclIsbc1UNXe0kPLpuSYFBgv1Wp8ILWk9WUYp5aLOmK1fmrbFblS1R4YdsS2O4RNvmhXcs2cRjiS7WqxZlMjwRSjxzjwTciBi6VqW467wFPdbCUquJ8YcDxZzr753e5d9q7kd10JEy6UeJGYr+D9ZE4GLm/x24dApO3Exr8oczJpg+UTJvWajATmiTuhQp4YJn//4zUqt5ezQUIc4+k4AtDRyFDiVnlFVOhWvdVGXcWulRQN2oefDbFCSBzhP0VzwYlokUr4rrtiWmQrIym/MxcJAKySCoVGBijj9O2XYeyY6KnM+4c4eKfO7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199021)(41300700001)(4326008)(66946007)(478600001)(316002)(66476007)(66556008)(8676002)(5660300002)(2906002)(8936002)(110136005)(6486002)(52116002)(6666004)(26005)(1076003)(6506007)(186003)(6512007)(2616005)(36756003)(83380400001)(38100700002)(86362001)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUB/zX+nio7yyrQJvwWcDacK5Van5KacR1zPiOcf+Yti1JD/CRRgnlQ7Bgsh?=
 =?us-ascii?Q?L8MtWNsCXgoOpZMzBpyI+TVUljBMan2GJKzLXJw1kZZPHupXzCEMsLNAQPbc?=
 =?us-ascii?Q?E+tfHC1KQ78zqxmQNks6l2qVHDdIsX0OPNH0glJ0eiXllN3ESSQzQylwEk42?=
 =?us-ascii?Q?e07ASLvm7T+KYGEcts9uhXjvttqNtm7iDVtDnWVf0zGeGkj0evI39+14tvHt?=
 =?us-ascii?Q?k1lk9TqcVMX+9iSOqK3l3gVegZEvO2nQ/CAegIrbgEw22TDeXUlmK5aKR8ap?=
 =?us-ascii?Q?3s5tkRyOBGB+qOYTeEC1GoabzptCYfvTnOYXQIWnrWAEcv4g1p4y5onMyree?=
 =?us-ascii?Q?nhvOlfbNLdn0fblCuCDtxxDOEyqtqW3K23+NYLq21qQRCXr0/mssbzLugvBJ?=
 =?us-ascii?Q?WT98/T5L7io0hYWEnYLv2pm0O8x/xI/Y95Pj0pR0RkWEdxZn8n7DyujBg1vD?=
 =?us-ascii?Q?pK0xlf4R+ZJxudjFOgF2BOrrrB7jM8tV0OxFMvXNJaTC2Xjn0ddFBcnnumb1?=
 =?us-ascii?Q?wCTA4tS9wqgVIxJ9/wZkKeYQFu3wx6YcqWHwNJ+MRYmdg3oeI6soFYjHkbkb?=
 =?us-ascii?Q?lA4Se8yKjwrz++idnu2V21vlMUSHEGJJ8TH+0NeAee2ucOyPErprksGAKuIl?=
 =?us-ascii?Q?noWQGPoeWSssPsQ7QX8ZyiyuYzIOXz30RM7XdZfTbClVq6y+0x7wNgWjdO3K?=
 =?us-ascii?Q?Zvh0hcUSgfL49RtK9dSIwyIkJQ6K69Yyqv2yTvYyN0sobXJFLCzD02P7qmHV?=
 =?us-ascii?Q?Cd1KczuQrEZjFqhAoKk/CxczCRkY1nlh+Hq65c8r+lBaZfVDyID/dLo60rvD?=
 =?us-ascii?Q?qi0hspSNXH7MYapA1qAY+Hz3J5w1YHB9PSy0G0R+NFxJBYBB+k3SfumQX35p?=
 =?us-ascii?Q?tc6kF3aQLrKoASc+smkRzoldsEiGJ6Co1eUi8f3Plshqyvj+xjUdcHSgQmT8?=
 =?us-ascii?Q?UnyjiCdLWBftC6NMwTdaXOm9bV7p2gkRIMrEXYWTcfph2EgkITAGgXk6e9GC?=
 =?us-ascii?Q?DYeoVpw/HAuREGtTlb1ib0/DoIsn8ptLE/9Y2exDyceGhEpnlNxG0VpCxqi6?=
 =?us-ascii?Q?KGfWtYktZeLTDp+m0cW3NCrlR/fmy7XNPjfqM0ELWyUlne+mZzKAHy+3OuRo?=
 =?us-ascii?Q?oZo2nYmdfsGVyf0DbnYsdB39dtCzUUlxLeQUAGgk675fmVN/ZDCV/DVAS6dc?=
 =?us-ascii?Q?ascPZ48sMH6QHtfea7Ep+R7ejMttnvpfME5iGPAWYLa5H0RGiBsXjuxysKem?=
 =?us-ascii?Q?VcVECGAcKK4Y1FKn/fzsyJV2RroFokmOVfz0G163WMQD682t5cMbJvnsXLto?=
 =?us-ascii?Q?yBYMxpmReMJ9ZfS99B6odDRTLBgkVzpFpMpxUSqf+oy4au+nRfBLATHJ59Ye?=
 =?us-ascii?Q?FQDjb2TFZlAk87Sb4IIguOKMRaAMF4rBB33bugcpwYHucylZHLYNGTjSidUc?=
 =?us-ascii?Q?ni00Ocva+CvPVxEYKpvxBIT8lROGWSkwkPEhrmTG+jd8rAxqiWRiUHAy8O0x?=
 =?us-ascii?Q?bYoEHilcVe0133PhI7sQHGmkNeFXXdHrhf7HLKsumKl4V3U01PLjU8FVd+oF?=
 =?us-ascii?Q?GIdZw+uMuHSU49K9DpBcmmX8vDSRhrjaAGJnrluK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a369de-1b4a-4b77-4796-08db313fc75c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 16:57:00.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov308mS9QopDQ9HNC44y8RoVIpGoaQKcKTHf5Y+HivrHCvyC4XZC+aoNBygEBapNNDLRYZioQEGM2hFBdfJR/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If the compress feature is not enabled, there is no need to
 set compress-related parameters. Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- fs/f2fs/super.c | 10 ++++++---- 1 file changed, 6 insertions(+),
 4 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.116 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.116 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phvaG-0004n5-3E
Subject: [f2fs-dev] [RESEND] f2fs: set default compress option only when
 sb_has_compression
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

If the compress feature is not enabled, there is no need to set
compress-related parameters.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 768be1c76a47..b5828a67f7c1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2073,10 +2073,12 @@ static void default_options(struct f2fs_sb_info *sbi)
 	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
 	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
 	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
-	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
-	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
-	F2FS_OPTION(sbi).compress_ext_cnt = 0;
-	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
+	if (f2fs_sb_has_compression(sbi)) {
+		F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
+		F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
+		F2FS_OPTION(sbi).compress_ext_cnt = 0;
+		F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
+	}
 	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
