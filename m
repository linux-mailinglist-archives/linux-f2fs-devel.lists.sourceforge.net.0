Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4BF652663
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 19:39:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7hWa-0001gl-O4;
	Tue, 20 Dec 2022 18:39:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p7hWY-0001ge-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 18:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5sSqnPOdgL3ak0wp4NE3B9fb65uOTZ5oCn2FmlqQGDs=; b=bPOdW/KClSnc08fkSnxnw2cHV1
 LgUvIYEceQKR7nqXxIUyG+k95uPE4mL7VOCdkPNxU+p6bQFqWsiKNUz34W3HaBHEkdggWUk4XSnWY
 OYPbBhvwHjHzBUCQiJQ7M9eeVZ1MHJLRXAKP0jeoHPGIxuzWPJLLsPuov051sb5Otjyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5sSqnPOdgL3ak0wp4NE3B9fb65uOTZ5oCn2FmlqQGDs=; b=T
 pcWFDSRcjFigQtE39obVH+W4TjwPznNmuq/5lGgilSxo6if/GlFZEP0y8jqdr3M4AimO44nSGdprc
 r6Oq1NMR8Z2MbBseSS3Qyp5Ws+il25t8UQjd7HsA3WBa3SmBlamxRI6YhH+Dxevfy5Ons2yOm4SF8
 BrlflB/R1qTKTuSo=;
Received: from mail-psaapc01on2094.outbound.protection.outlook.com
 ([40.107.255.94] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7hWS-0003Qs-9j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 18:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFIMiJ8QGZRQ4R7BuE8n/dphFvzx6v9dH2tMJ/KLniZqSbif1LCtwAehqBZHBaooVkYrByccM7PouBhX+3GgbkwUl9+HqPXGchw2A4qoQkKqOOR14H8ASG+v0uIobc5XDkrPwS1R5sZroZuFQ8v1cTMnqoHQK/r2YZ0JoaRJxsU12Xb9kJpxNJWPQNkDfqBRsnsHfwybq+sSvMdF/VzpPXYf8AMY8bQEXDCRCSWgc2Bnzpa/kZLG6vmrxrGFctBXhKvi2L6lGlB3T1sFzCn6ybYymCzOzQDOwpEvDuZkmWEIlRTHGRg1eqebKQVcfon3/mEmP+47dMyTy1cbHH6kQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sSqnPOdgL3ak0wp4NE3B9fb65uOTZ5oCn2FmlqQGDs=;
 b=iF45TAZN6n5qvaofJhWLowszHO3j3ovCt91HH3AK5FeLiat/1mrn6aqPx+e4GQiYUgh//7hinprU6M59uzJoAXQuUfFAHi7t8gC2DgwiqK2CPtx7CUyfug1PdhABUAjSRxu+6xfdx9HmlmShwQRLYhk9rq756DJyHvlSfnyTdygPBk5lhVRU1DeSVcMlgtSQkdON8njjQbzgQq2erDmG+jvju+Gn9dlrT+TnwrF1uMbee4CASk4igJkqzF5i6U+X+6d5hQH3qiX+Vydf4rJdFHEWCJQPqJnCafhSdiUEA8zpKZXVx1J9QBtEDluO9hxat4ADL5jxDRJvjQ7zuvkzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sSqnPOdgL3ak0wp4NE3B9fb65uOTZ5oCn2FmlqQGDs=;
 b=lijLkU2g+5EUu7+xhhM28mr/cwMYBaZWeTNvJi7lmEVdSVAx+ug212Ym+TyP0n1kt1CYtqv/KF6XUMDSV35pwOiZfeIT/cJXRSINSKPz6FXHpZuAnBnCDpSXwTxVEhWJG1Bk5i7TmSWBl/6/W88JVtOASg3HLMftJ01yjq2G59nOECLRBG7k39q7iV1U2l1uWqtl/tqm4zxRxWODyqyASOOI8wnUi4eF8SJ6BUdctIwKPgqo15r9cxmoKFBkv8ysdSkxqXR0bdHcGptI74eKM7/k5atnfCYWedZw80mZ5CBb2Ca9m0bOKuDo0Ke8jn83hRASnp9mPidPDl2MOYhPQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5658.apcprd06.prod.outlook.com (2603:1096:400:276::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 18:39:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 18:39:15 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Dec 2022 02:39:04 +0800
Message-Id: <20221220183904.53908-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e28623-090e-4bfa-492d-08dae2b97f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf3Ke1IybZC8Z7VvUAGXqBJ6z6vmpOqA9PmK9pOqDsjSmnt04j5197It701YDeszdG9BrDosHsniyrsgB0TjqGdWOKVzLZe0Iyvlbd2jPmYSWzaUhxFVRSlAPPqCIpeUeaMY/zaU/zQYbPrPAhajLh4T2sHCTxZSLfDyL25MXKqveOSiefof8poimyEE5VyXUOCa+5cjpPpXpoDY5/Gb0JFMMhUHvQR7femO+jm8B0iQCsz8xpwl5h5+Q2oisVAjwDQ1fAQqwcasdRk+VXCvOvynpiaLxEeaSXL8poMX519UTJt2GzdL4+I3Pv3UbMrYeBhxTXGHr33yCM0XAEyEGwIUfuE/EG3ETPSjr684VMAkBFmQdb+JPi9K6P7hnmg6MevW7mrQHVB8nKGYGczTGT0oAR4CnxAFrPmMaDjGtDuP7iHQzOV0GdpPQ2aPzRmtjL3YeSKVT2pmtFMxCGex62mL3uUQ5zIS2h8j9vybkCG3w8HKxITKg72+wUfycl4Hzn5Oc8JZKW1u9ZkNKJz0wb391JNqGWc3MXaExp0UWf/Mkr3Bloep6RDHVKgK/HdKb9naxjG293YgF/NuX0IvyKWm/Hd0g+dB4ZXKemjbY96l/9h4KbSDCIstQZDtDKEElxQgcdD2AbYsLPChqUHzH+NwZPDYgFWZTNhFEYLm8Dkx30E0fdgU2bE6ecx2I6Fp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(478600001)(6506007)(6666004)(6512007)(52116002)(8676002)(66556008)(26005)(2616005)(66476007)(6486002)(316002)(4326008)(66946007)(1076003)(83380400001)(38100700002)(38350700002)(30864003)(41300700001)(8936002)(5660300002)(2906002)(186003)(107886003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jxjL3m2m/V6rpVAEDhi8IgmEpegfDH/GMObc/v0WHgu2QUjfmtTLCa4HUPJ5?=
 =?us-ascii?Q?2fw6aOLpc2tjPLVwF33KyZV/JNXpteexgcQk1oCt4tgT/VJQ4nKrwOZhz3u3?=
 =?us-ascii?Q?Fcx4hLboRsT07U/teKXnm44R5zWmF5LsyrA68JhcXuVulzNq3AfV0MXLoqP4?=
 =?us-ascii?Q?8Qmznz2HQocx5589WQsHE31G0BQ576/cMhfq7zrzEH+Z9eJz8ILUBdgOfkEg?=
 =?us-ascii?Q?/jaIeEhKqzrfm8DPBIHRYVNOzOHnkvw0SR9uDqmwtgCGiSP4aPDk/UX6MjCE?=
 =?us-ascii?Q?22d0qKo/Dyr88gCbg6YOG2Cc8Ju9AMTRSiEi1tQAM4zRiAzjS/z3jupzd9bk?=
 =?us-ascii?Q?LJMP0xPaJWD+AP5zth5Me+xtvDpoV57TfVZzdqKqsZ4DO48xtxg8P7qEaNQJ?=
 =?us-ascii?Q?ftv8GPBcRIdi9ob28BB1wAVaMRE42z96p2pmB46jGgcRYvH2OGLsfP60fUTY?=
 =?us-ascii?Q?6hyqfG2vEobG+51Zj12DiMFhhwUaB3cOwPUiroEOAq+UzTyJe4jwRlOF+p+P?=
 =?us-ascii?Q?CwX3YeNrwIeFCJE946/oDvJO6sGJMF9YsrzOTjhFJWuLJ258D9IM2Y8iRvKD?=
 =?us-ascii?Q?PPR17JCSnHeB5RcmlhR2gK19YxOrmjy8jNIWOwHzVCm16F53LMGc35wPXBuC?=
 =?us-ascii?Q?4K2HZu5EIHCyYcPaZHxvxjhUoAmyDOQbL/tfB5KEh+0rOJ1hVi7HNL3R4av3?=
 =?us-ascii?Q?I23ATtNU/AWcgRRphXnFbxkvJha1BLGNA2/254mRO7fbWErV5A+DtYP72cMK?=
 =?us-ascii?Q?+64xOKySIpolqagPjeijmnKiJ5fNVya92rsyN+QhQeOY+/uN3U0u2QLEfsBC?=
 =?us-ascii?Q?v4nsWzUF2/rPwTpAwgEn06jNk8xY9Q/qLlefFNwK68YEI/887kB62H7AkRww?=
 =?us-ascii?Q?h3XNcaE+v6KVnela60DbxL8I+CROve3SxWus8N2mx/T4d2DPLHNc5N69kwz2?=
 =?us-ascii?Q?zNmaxVuaWWi8hZ1UIr88dhzeCogn3FsX1k8l+fJ9k9xq5jCRgHxBKmcjGBkI?=
 =?us-ascii?Q?Zvw+5A2B6vfJPSxszyGZbqtnCpI5Ws2Z9g8XPBlkyBaAd5Ue3qvGPJT4WaJR?=
 =?us-ascii?Q?RY/yS0HYKrDTUWW5CFA7UqBwp+vL3l5mn7QaZrW7uCNlFFxw+AK7OkG0CXFs?=
 =?us-ascii?Q?XZuGov8OUo+xYx4j25phLhsbDYHNQEPSvPaGjF9H2g1umXA5Bz6tqG7oATph?=
 =?us-ascii?Q?P5pFIVPLttWfdsRQGnzoTTcLTDtDLgGDQYD43v7xCEWCivBtwxbfDgDUN4lJ?=
 =?us-ascii?Q?i2DueP4VbdBBEkYGQ/A9mlaI8oWEJxbuTb/td5kRTioK/WFOJgZm0oDd86CO?=
 =?us-ascii?Q?HnGgYzTZaJxic5bigvgSAU6XEfeC7c26YB+ueSHGGQYLnPB/i+nh8XFJLRMM?=
 =?us-ascii?Q?oq3yPF+l5Lm2MvdNNciEWF5DUxzf0VSzyyGAladTWlvZtxpRYromyJD8iQV1?=
 =?us-ascii?Q?X9G6o3gGUfgB6Yl0wcLflu3DKYbdx5vgZ+Bo1FtYDIylTAFCOrTx/YHCfa0a?=
 =?us-ascii?Q?diVtf0BPk1hAe6q9oj2XcuXo89EOxfm3R3KLl68hMedFjg5pC1rTY1HgwkGH?=
 =?us-ascii?Q?6/B4O34nTrt1FF4UtwBJ3x07TnwQmQ67k/8jeV4Q?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e28623-090e-4bfa-492d-08dae2b97f17
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 18:39:15.8061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnXLZYkB8jnmQm2HfQAKKFqL//J0GVOiS/RMcsmAgOlBpyXLfv6sfJfN9vN0+SkPG+hJXLbB7pb4E2oqRnV61Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5658
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is no need to additionally use
 f2fs_show_injection_info()
 to output information. Concatenate time_to_inject() and __time_to_inject()
 via a macro. In the new __time_to_inject() function, pass in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.94 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.94 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p7hWS-0003Qs-9j
Subject: [f2fs-dev] [PATCH v3] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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

There is no need to additionally use f2fs_show_injection_info()
to output information. Concatenate time_to_inject() and
__time_to_inject() via a macro. In the new __time_to_inject()
function, pass in the caller function name and parent function.

In this way, we no longer need the f2fs_show_injection_info() function,
and let's remove it.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/checkpoint.c |  5 +----
 fs/f2fs/data.c       |  8 ++------
 fs/f2fs/dir.c        |  4 +---
 fs/f2fs/f2fs.h       | 44 ++++++++++++++------------------------------
 fs/f2fs/file.c       |  4 +---
 fs/f2fs/gc.c         |  4 +---
 fs/f2fs/inode.c      |  4 +---
 fs/f2fs/node.c       |  4 +---
 fs/f2fs/segment.c    |  5 +----
 fs/f2fs/super.c      |  8 ++------
 10 files changed, 25 insertions(+), 65 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 56f7d0d6a8b2..d68b3c991888 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -171,10 +171,8 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (time_to_inject(sbi, FAULT_BLKADDR)) {
-		f2fs_show_injection_info(sbi, FAULT_BLKADDR);
+	if (time_to_inject(sbi, FAULT_BLKADDR))
 		return false;
-	}
 
 	switch (type) {
 	case META_NAT:
@@ -622,7 +620,6 @@ int f2fs_acquire_orphan_inode(struct f2fs_sb_info *sbi)
 
 	if (time_to_inject(sbi, FAULT_ORPHAN)) {
 		spin_unlock(&im->ino_lock);
-		f2fs_show_injection_info(sbi, FAULT_ORPHAN);
 		return -ENOSPC;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 97e816590cd9..75aefc6d1997 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -295,10 +295,8 @@ static void f2fs_read_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 0);
 	ctx = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_READ_IO)) {
-		f2fs_show_injection_info(sbi, FAULT_READ_IO);
+	if (time_to_inject(sbi, FAULT_READ_IO))
 		bio->bi_status = BLK_STS_IOERR;
-	}
 
 	if (bio->bi_status) {
 		f2fs_finish_read_bio(bio, intask);
@@ -335,10 +333,8 @@ static void f2fs_write_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 1);
 	sbi = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
-		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
+	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
-	}
 
 	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *page = bvec->bv_page;
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 8e025157f35c..9ccdbe120425 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -732,10 +732,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	}
 
 start:
-	if (time_to_inject(F2FS_I_SB(dir), FAULT_DIR_DEPTH)) {
-		f2fs_show_injection_info(F2FS_I_SB(dir), FAULT_DIR_DEPTH);
+	if (time_to_inject(F2FS_I_SB(dir), FAULT_DIR_DEPTH))
 		return -ENOSPC;
-	}
 
 	if (unlikely(current_depth == MAX_DIR_HASH_DEPTH))
 		return -ENOSPC;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..49f20bc7d6d0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1877,12 +1877,10 @@ struct f2fs_sb_info {
 };
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-#define f2fs_show_injection_info(sbi, type)					\
-	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
-		KERN_INFO, sbi->sb->s_id,				\
-		f2fs_fault_name[type],					\
-		__func__, __builtin_return_address(0))
-static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
+#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__,	\
+									__builtin_return_address(0))
+static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
+				const char *func, const char *parent_func)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
 
@@ -1895,12 +1893,14 @@ static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 	atomic_inc(&ffi->inject_ops);
 	if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
 		atomic_set(&ffi->inject_ops, 0);
+		printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",
+			KERN_INFO, sbi->sb->s_id, f2fs_fault_name[type],
+			func, parent_func);
 		return true;
 	}
 	return false;
 }
 #else
-#define f2fs_show_injection_info(sbi, type) do { } while (0)
 static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 {
 	return false;
@@ -2233,10 +2233,8 @@ static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
 
 static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
 {
-	if (time_to_inject(sbi, FAULT_LOCK_OP)) {
-		f2fs_show_injection_info(sbi, FAULT_LOCK_OP);
+	if (time_to_inject(sbi, FAULT_LOCK_OP))
 		return 0;
-	}
 	return f2fs_down_read_trylock(&sbi->cp_rwsem);
 }
 
@@ -2324,7 +2322,6 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 		return ret;
 
 	if (time_to_inject(sbi, FAULT_BLOCK)) {
-		f2fs_show_injection_info(sbi, FAULT_BLOCK);
 		release = *count;
 		goto release_quota;
 	}
@@ -2604,10 +2601,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 			return err;
 	}
 
-	if (time_to_inject(sbi, FAULT_BLOCK)) {
-		f2fs_show_injection_info(sbi, FAULT_BLOCK);
+	if (time_to_inject(sbi, FAULT_BLOCK))
 		goto enospc;
-	}
 
 	spin_lock(&sbi->stat_lock);
 
@@ -2731,11 +2726,8 @@ static inline struct page *f2fs_grab_cache_page(struct address_space *mapping,
 		if (page)
 			return page;
 
-		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC)) {
-			f2fs_show_injection_info(F2FS_M_SB(mapping),
-							FAULT_PAGE_ALLOC);
+		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC))
 			return NULL;
-		}
 	}
 
 	if (!for_write)
@@ -2752,10 +2744,8 @@ static inline struct page *f2fs_pagecache_get_page(
 				struct address_space *mapping, pgoff_t index,
 				int fgp_flags, gfp_t gfp_mask)
 {
-	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET)) {
-		f2fs_show_injection_info(F2FS_M_SB(mapping), FAULT_PAGE_GET);
+	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET))
 		return NULL;
-	}
 
 	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
 }
@@ -2805,10 +2795,8 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	if (nofail)
 		return f2fs_kmem_cache_alloc_nofail(cachep, flags);
 
-	if (time_to_inject(sbi, FAULT_SLAB_ALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_SLAB_ALLOC);
+	if (time_to_inject(sbi, FAULT_SLAB_ALLOC))
 		return NULL;
-	}
 
 	return kmem_cache_alloc(cachep, flags);
 }
@@ -3382,10 +3370,8 @@ static inline bool is_dot_dotdot(const u8 *name, size_t len)
 static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KMALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
+	if (time_to_inject(sbi, FAULT_KMALLOC))
 		return NULL;
-	}
 
 	return kmalloc(size, flags);
 }
@@ -3399,10 +3385,8 @@ static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
 static inline void *f2fs_kvmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KVMALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_KVMALLOC);
+	if (time_to_inject(sbi, FAULT_KVMALLOC))
 		return NULL;
-	}
 
 	return kvmalloc(size, flags);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ecbc8c135b49..ec7adce76afb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -784,10 +784,8 @@ int f2fs_truncate(struct inode *inode)
 
 	trace_f2fs_truncate(inode);
 
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE)) {
-		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_TRUNCATE);
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE))
 		return -EIO;
-	}
 
 	err = f2fs_dquot_initialize(inode);
 	if (err)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6e2cae3d2e71..8a257743d047 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -72,11 +72,9 @@ static int gc_thread_func(void *data)
 			continue;
 		}
 
-		if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
-			f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
+		if (time_to_inject(sbi, FAULT_CHECKPOINT))
 			f2fs_stop_checkpoint(sbi, false,
 					STOP_CP_REASON_FAULT_INJECT);
-		}
 
 		if (!sb_start_write_trylock(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ff6cf66ed46b..01b9e6f85f6b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -809,10 +809,8 @@ void f2fs_evict_inode(struct inode *inode)
 	if (F2FS_HAS_BLOCKS(inode))
 		err = f2fs_truncate(inode);
 
-	if (time_to_inject(sbi, FAULT_EVICT_INODE)) {
-		f2fs_show_injection_info(sbi, FAULT_EVICT_INODE);
+	if (time_to_inject(sbi, FAULT_EVICT_INODE))
 		err = -EIO;
-	}
 
 	if (!err) {
 		f2fs_lock_op(sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index dde4c0458704..8e87be0fa85e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2544,10 +2544,8 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct free_nid *i = NULL;
 retry:
-	if (time_to_inject(sbi, FAULT_ALLOC_NID)) {
-		f2fs_show_injection_info(sbi, FAULT_ALLOC_NID);
+	if (time_to_inject(sbi, FAULT_ALLOC_NID))
 		return false;
-	}
 
 	spin_lock(&nm_i->nid_list_lock);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index af2d522b1a89..bffd92c0e614 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -384,10 +384,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
-	if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
-		f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
+	if (time_to_inject(sbi, FAULT_CHECKPOINT))
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
-	}
 
 	/* balance_fs_bg is able to be pending */
 	if (need && excess_cached_nats(sbi))
@@ -1142,7 +1140,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		dc->len += len;
 
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
-			f2fs_show_injection_info(sbi, FAULT_DISCARD);
 			err = -EIO;
 		} else {
 			err = __blkdev_issue_discard(bdev,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f812b9ce985..73e779d3b2e7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1372,10 +1372,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 {
 	struct f2fs_inode_info *fi;
 
-	if (time_to_inject(F2FS_SB(sb), FAULT_SLAB_ALLOC)) {
-		f2fs_show_injection_info(F2FS_SB(sb), FAULT_SLAB_ALLOC);
+	if (time_to_inject(F2FS_SB(sb), FAULT_SLAB_ALLOC))
 		return NULL;
-	}
 
 	fi = alloc_inode_sb(sb, f2fs_inode_cachep, GFP_F2FS_ZERO);
 	if (!fi)
@@ -2595,10 +2593,8 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 
 int f2fs_dquot_initialize(struct inode *inode)
 {
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT)) {
-		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_DQUOT_INIT);
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT))
 		return -ESRCH;
-	}
 
 	return dquot_initialize(inode);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
