Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF276947D3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 15:19:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRZfc-0004Em-Hd;
	Mon, 13 Feb 2023 14:19:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pRZfX-0004EV-G9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JlCxayYuiOOj+jFvI1Rm47GeEAecPD8aHPepanFpsSg=; b=OPR14zQXVUvAFRb+NTRWYh51jj
 bLu3+Gf/aipQz7+dtFrDbUL2p5I1h2RU4Ea+tdhCm9I9c/khrFF4fUYxjbMTYtIbFDHDBxVnyCBAB
 +pg6GMZ5JJIVnC8ivotHMK3qq+zVpCAKc9aijf42EgLfGEoz+STA/QcWTjOBZLl472cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JlCxayYuiOOj+jFvI1Rm47GeEAecPD8aHPepanFpsSg=; b=SsWc+6r90YXu3AFh08Hl5M4aij
 OHVVQWSY4N0sFUm++ildj7H0yW6324vl2Zl/kInvird9QPyXfu5eTw6d/o1eVXI8ZMQ5d5EzYFSaL
 B7+ZxFHbl9bAORkXoxKh2as10VY177K8VstisEapMPdjkok63+VPbrCcxOoDu3+ZRZ8Y=;
Received: from mail-psaapc01on2109.outbound.protection.outlook.com
 ([40.107.255.109] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRZfT-002opR-Gp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=av6XFshqj9p5zg8pVZpi6JurJfolFevBz4/MOYUmWGbLjHcXgNTnF/C8KLl9fSyfgudZYOJZLe6lnuYQMo2XpWgJdMB9Vj1Z8p4oB9QU4nRFgmQy07A9CgZv/zEsYOM8uKd6W/5lNrb6i421SQ25mL8nH1dJy2TEd2EyU/lRPQV/blxBRAaY64lVSzBA4KdC5dTLox6lSI5cRiRTU/WUxz7pcy8C9VkQKN3VEZkN34BjGRXXNpPFLxI0qSm/HQ7JO7jBgqR5f2nAQSr6JKz0lxud52WokbQzo3wweVcaePChk9r2nYXWO3NlQLp6tvVTc4wlCWH7UMshTgVVusi8UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlCxayYuiOOj+jFvI1Rm47GeEAecPD8aHPepanFpsSg=;
 b=hbRFiKB295n61ZoDP+B3lwoSy4xXKpCU2t8+TJb5h+rC6bCDUPtTKyPoMHsxyvKrESNxGivflieXxAeEf+AOjXtjCUmKsTS7IHAg5zj+xhtWMVCZN19XBGuYLqx2YvJdkZBMT7vZsSZQAfapgI85ljBdJh+qet0Kzc9apDA8klzqDtcHkFKLgvr22HIszUGqhlRgnNPWJWYCa+30r6GzFeF8pMZ/8+/G7xnkBHWs1zGHbpMxg7zZqq0UzsF3qn7J/vZ6LjH/L9XEdUAdRoiy2+7wgocd2axu9j6YyWmXr8JbGsovtUtnlP16DpElqt4S5SInOsXITCwduTvIvQT57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlCxayYuiOOj+jFvI1Rm47GeEAecPD8aHPepanFpsSg=;
 b=ONlaUJj3WbARRbPWql8HXHEcBle77/X5b64W6NnqxpHWpKYS3NdmTNxBzdXGQZVb6ZS3TV7YG7EPzWSsxR6gd8Qwc91UdF48Va0IMYQW1HVGop/nW8Txtqca6o29/Xke8TUUB49iP+0hit5nbksvjOEKynLjA/tSzwEQnaVaqMkXrkgOp9jEGWQI6bsAvQZKJirLbe3Oy1oRB2jI5V4s0AoKCI8IgDPsn1uPv/buc/FEfWP/tTDdOPAIEFmGcjXzWZ+FJCXiiUjArHqFZ1JNDr0ktQzdxis63YCRHTR4Y7kf5t08SqDvaRpva5ictSk++4f2rRNf5DX0iSPBY7xRDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4233.apcprd06.prod.outlook.com (2603:1096:4:156::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:18:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:18:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 13 Feb 2023 22:18:25 +0800
Message-Id: <20230213141825.22858-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230213141825.22858-1-frank.li@vivo.com>
References: <20230213141825.22858-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: 012688d4-8801-4d34-636e-08db0dcd360b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SWjheXt7NZ2udZ1TmnOQma//jlBto7dooJlipqGu/fJfxCJ3c6n8f6e7gdjVx9HEy+p1cxEEcjdg5y/vYPQ6yPXfwtTjRipBUgTN3gW19VMkx7Xm+zMQP3N7yjxvppUTXq8JPtpE90ZN10yLk5DF25UwmOhMfED8ydjBXpq6CNN+s5B9ntGi7gkMG8rIdJ2ivBdwJhl0JwUFkTrAiTxk06qy3/jfqpzBir+4zl8V90VefUS3bD2+yLir+F4EHWS8D5rGs5foe6+bblgJW69UtcKjWHe/52j8nmXIP0xanEMr62SUL7+qc57rnzntade5kKuNbChaG5nRk2+O53txMtbPYUSBDSsY4HQj2zmgsjAvZI4JPA8mVkQg5ZFbqH09YvOHqWLuWQMdm12JCGOEMYV3zf87ve0fIOi7osATbrqfKNfwMgY4qiG6tVa+zqyeBmeeoRwpSbSSFrlhOCGnDQtkP7a10is6Wog5vmjy13ccv2U0f1fic+fC8TAB9qLad6HdGmQrpjsBS+uza/EkAl/84S+bK7NZsVPZtRZ09EIrVZPh41AsMBXGuMWn+Fw1fNEny7/o9cEiavMC2zwbcQpmhk/svgV4l8JTzQqXgNj1+e9txW7vbxVVGUGM7qnYoJHPv0KlV5XSmKIzyYeA7X86Maytjhmap2HF1+BPTSUhSAwF4qaTWh566EJjGzcBIg3IlkZdc38HUknDXPYjjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199018)(36756003)(2616005)(83380400001)(38350700002)(38100700002)(6666004)(8936002)(41300700001)(5660300002)(2906002)(107886003)(6506007)(6512007)(186003)(1076003)(26005)(8676002)(6486002)(316002)(52116002)(86362001)(66556008)(66946007)(66476007)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?baeLqoSknjQ3/cKQdyiUh5wxYccAq1r/8ChyyW+SWnQwSjTBR2TRCYmfvjPt?=
 =?us-ascii?Q?q/hG3LQQTorXpF/rurTqrH7pgXNUBS+65gyZL8ISinajf4e5Jkt8M7zogpnu?=
 =?us-ascii?Q?3a59kO086iiGmzlprvHYZ8EuEn100qtQQk8gANL7jhto4H8ImF38aLVzvKRN?=
 =?us-ascii?Q?N0BbUfcwKH0BRQArUkhiB9eRTA3jILjGzVBFYSG2tidjvSo3PPwdDJIcG8cP?=
 =?us-ascii?Q?37qP5ZTcgSNlRJzIiXgKX5qulgGBAtF8xyb4SKB3EHEoi+nqDeuvhUwJ3Eu6?=
 =?us-ascii?Q?1dfD+G4G4SiwkXVW0GE21F93wmzbC8nwnlmwXTySfh84tPmktpXDcSVVXpcj?=
 =?us-ascii?Q?mmc2eNAzFGJPcnu0M4JeHnbcRIL1TixDjHF/yxf4ERR40wP0vO/e90GieEbI?=
 =?us-ascii?Q?d+KYvIU/rTOWi4ieacLCkT2yrVXTNZDXNQLmsRmqHz8mbbcpc4iBAPsnWI8n?=
 =?us-ascii?Q?Z6HOOjJmEBiQSHlJm4+afD86keV72zGVGNI8S6yEOFuXcVh0wQjH1h5URfcf?=
 =?us-ascii?Q?l9VuwbSar65FuUkIrh9YBnwVqPrmHJzsfpCLqiZ/zO0BJc5o56466SSTlbhe?=
 =?us-ascii?Q?AMDIlsvp/LXDBpnBbRXHZ6WZrwPTr96Xmz32cIkZPtEtiwKC3jrLF0lRQogL?=
 =?us-ascii?Q?5tbNSTpqzwDfA9FqLAAe8x5S0IOUg/DaIR7VeBVRRNfRYe88Eg4EZBXc1Ms4?=
 =?us-ascii?Q?R2b71C9wzx+fDEJT2HMLs6gu9VV+zRDtc+lDTUXpoUGZPs3uewo843IGMvVi?=
 =?us-ascii?Q?3C7ihfaUz2dwRyKoX+U52tw35SYrEwYV+Jw5XDUtV2jgdU7Qs3PbsftDG6xR?=
 =?us-ascii?Q?PF/xDR/BEPyvWBCCur2Knn1efZMg26PYe+6k4UQMQHV6qoNANgGH3fUNsxpm?=
 =?us-ascii?Q?6m/yC0QahJbL+dezYk7UWYEZiz4MLU+6fduAjXc0qaiTK4FZLtgSb3HZPe4Q?=
 =?us-ascii?Q?22SlCQOO8KF/5oAaHjzeTJB5VNw6ic/Tsn/Y0BJ70Mg3/2lhkr/xHVLtotTR?=
 =?us-ascii?Q?G0HTq9lfsC9V2gTcu5x+QYIXOEm8am1tvbXKizbamn/7t4nhDdAsuxeTLfYh?=
 =?us-ascii?Q?w/Y3u/H1a4mA1U+VSmABes6V9KvgNik3BvWrerCdfXZ4nQjl77+vM2rUYcUc?=
 =?us-ascii?Q?P98yhVKLZo6cwSaF5z8mHJjSm/C3InbNChipdz0Zghq2ysYgk99yhkrQ96mb?=
 =?us-ascii?Q?fpDrmKxLSEjvwTjpWyidPU0A7SvFoLmrS11pcxVLP5htoMYLhT1AhNVCXOok?=
 =?us-ascii?Q?tUEoyGQ2/MR8LpARX78MmqwR6JHl9LJu2FMwYM9P4cBuD5ReEc8QNjTWbx5/?=
 =?us-ascii?Q?IL7aboYl+JhlDJ3WlOUrskHZAUOiKd+rWPxEVPHAyabBCMdy5XTvGrlgargC?=
 =?us-ascii?Q?HduSm7JxcIsWVQp3KGiA/3UNQlxgsJ1/4zaAm52S1melarj5sZmCrtcqQ5s9?=
 =?us-ascii?Q?NrE/5uJJQA6yi/8+aPmwObfpepBkWmRXyQgDzrTSvGPpRteVtQ6/UVHKgLeT?=
 =?us-ascii?Q?+a40FWxfV0YGcAtv1OOPCh52b2BEF7tgF9BspV7dGo8vg5kk4vzuYvXH04d6?=
 =?us-ascii?Q?vV+RB78DY/ZCzVsDXOZN9PGKBoDfcSh0BbtzZpYM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012688d4-8801-4d34-636e-08db0dcd360b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:18:43.0635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na72zl2CaW6f21weVUkuR256T7ErR5MN4eXrC5ZHZWFCPIT64g7kqP8g8+jbxl1nRavYnF6KqI/OLvHPfzNSYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4233
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: For each loop add a local f2fs_sb_info pointer insted of
 looking
 it up. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/debug.c
 | 44 +++++++++++++++++++++++ 1 file changed, 23 insertions(+), 21 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.109 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pRZfT-002opR-Gp
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: replace si->sbi w/ sbi in
 stat_show()
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

For each loop add a local f2fs_sb_info pointer insted of looking it up.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index ff5995cb9560..30a77936e3c5 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -373,16 +373,18 @@ static int stat_show(struct seq_file *s, void *v)
 
 	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
-		update_general_status(si->sbi);
+		struct f2fs_sb_info *sbi = si->sbi;
+
+		update_general_status(sbi);
 
 		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
-			si->sbi->sb->s_bdev, i++,
-			f2fs_readonly(si->sbi->sb) ? "RO" : "RW",
-			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
-			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
-		if (si->sbi->s_flag) {
+			sbi->sb->s_bdev, i++,
+			f2fs_readonly(sbi->sb) ? "RO" : "RW",
+			is_set_ckpt_flags(sbi, CP_DISABLED_FLAG) ?
+			"Disabled" : (f2fs_cp_error(sbi) ? "Error" : "Good"));
+		if (sbi->s_flag) {
 			seq_puts(s, "[SBI:");
-			for_each_set_bit(j, &si->sbi->s_flag, 32)
+			for_each_set_bit(j, &sbi->s_flag, 32)
 				seq_puts(s, s_flag[j]);
 			seq_puts(s, "]\n");
 		}
@@ -394,21 +396,21 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->overp_segs, si->rsvd_segs);
 		seq_printf(s, "Current Time Sec: %llu / Mounted Time Sec: %llu\n\n",
 					ktime_get_boottime_seconds(),
-					SIT_I(si->sbi)->mounted_time);
+					SIT_I(sbi)->mounted_time);
 
 		seq_puts(s, "Policy:\n");
 		seq_puts(s, "  - IPU: [");
-		if (IS_F2FS_IPU_DISABLE(si->sbi)) {
+		if (IS_F2FS_IPU_DISABLE(sbi)) {
 			seq_puts(s, " DISABLE");
 		} else {
-			unsigned long policy = SM_I(si->sbi)->ipu_policy;
+			unsigned long policy = SM_I(sbi)->ipu_policy;
 
 			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
 				seq_printf(s, " %s", ipu_mode_names[j]);
 		}
 		seq_puts(s, " ]\n\n");
 
-		if (test_opt(si->sbi, DISCARD))
+		if (test_opt(sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
 				si->utilization, si->valid_count, si->discard_blks);
 		else
@@ -515,15 +517,15 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - node segments : %d (%d)\n",
 				si->node_segs, si->bg_node_segs);
 		seq_puts(s, "  - Reclaimed segs :\n");
-		seq_printf(s, "    - Normal : %d\n", si->sbi->gc_reclaimed_segs[GC_NORMAL]);
-		seq_printf(s, "    - Idle CB : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_CB]);
+		seq_printf(s, "    - Normal : %d\n", sbi->gc_reclaimed_segs[GC_NORMAL]);
+		seq_printf(s, "    - Idle CB : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_CB]);
 		seq_printf(s, "    - Idle Greedy : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
-		seq_printf(s, "    - Idle AT : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_AT]);
+				sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
+		seq_printf(s, "    - Idle AT : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_AT]);
 		seq_printf(s, "    - Urgent High : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
-		seq_printf(s, "    - Urgent Mid : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_MID]);
-		seq_printf(s, "    - Urgent Low : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
+				sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
+		seq_printf(s, "    - Urgent Mid : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_MID]);
+		seq_printf(s, "    - Urgent Low : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
 		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
 				si->bg_data_blks + si->bg_node_blks);
 		seq_printf(s, "  - data blocks : %d (%d)\n", si->data_blks,
@@ -589,7 +591,7 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->ndirty_imeta);
 		seq_printf(s, "  - fsync mark: %4lld\n",
 			   percpu_counter_sum_positive(
-					&si->sbi->rf_node_block_count));
+					&sbi->rf_node_block_count));
 		seq_printf(s, "  - NATs: %9d/%9d\n  - SITs: %9d/%9d\n",
 			   si->dirty_nats, si->nats, si->dirty_sits, si->sits);
 		seq_printf(s, "  - free_nids: %9d/%9d\n  - alloc_nids: %9d\n",
@@ -616,12 +618,12 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->block_count[LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
-		f2fs_update_sit_info(si->sbi);
+		f2fs_update_sit_info(sbi);
 		seq_printf(s, "\nBDF: %u, avg. vblocks: %u\n",
 			   si->bimodal, si->avg_vblocks);
 
 		/* memory footprint */
-		update_mem_info(si->sbi);
+		update_mem_info(sbi);
 		seq_printf(s, "\nMemory: %llu KB\n",
 			(si->base_mem + si->cache_mem + si->page_mem) >> 10);
 		seq_printf(s, "  - static: %llu KB\n",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
