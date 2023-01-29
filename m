Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0519867FD79
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Jan 2023 08:55:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pM2XH-0004j6-FA;
	Sun, 29 Jan 2023 07:55:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pM2XF-0004iz-R2
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 07:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nlr7RdF6wtt6Qsh9IQnsHE28CWKpGDB4ZL13yIjjuMc=; b=NSXRIbtR2xoRFvgCNIeXFSwoC1
 3EgadT6EAf8IL2rjRZfqQWLEXek2YuJUHXxMGXE6iOVkPFSxwF+kz6XlJGtNkjUfUCgoVkDl8BUi/
 wsQxacLxodVwPtvmdnTvdesvv0q1h1Tf6OL6PHA0iMJCZHCjVAWLbbDkWCWXTfNXEV38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nlr7RdF6wtt6Qsh9IQnsHE28CWKpGDB4ZL13yIjjuMc=; b=b
 9fvjwPOPDv/QQ7z3BpEXWXSVuGP+COE+eUvxe31jylPs996b4lpqcYwA4sI4iAfFVNRo9fnzz5JlI
 d6B2ZNd2qilz75SIIr2EoQkFTm/i4wkUtbo9yps24o0ZyDeiskxJ++jjYt54W9EOJBjW/WdTHbeE4
 5PI8TWW9+7EgwZBE=;
Received: from mail-psaapc01on2114.outbound.protection.outlook.com
 ([40.107.255.114] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pM2X9-0001SH-Dd for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Jan 2023 07:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDMztSYIWXMWPy0h6/CTWUmS8+o9bEWYfsC3BQAabt5c4yr8MKxvHmOIVnMR2X6qFCjuSpCpbtn1taBXiP2XFnlTNdLBuv0RTfvgvYTqChjvdxlYTCqpDpMVCLNQ65njzMo7YJnzVEKMsVMpgkg9y0V22DK9aD+xBU7fTzTSrYYK8UNpDZGT4weOmGj8FHLs/e6dEAEYKJTb/m7dY0wRvHj29sGRul1T0TFWcf0mMO/j/5/o+/WQVGDzzl14YPa1//RbLXTAtqKLQOV7PUXKigjgBSyWAg+4yiC6JJGuU0JmD1yuRhDEBwji/Jzhumd32KRH/kexvrFDW1YwJqLmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlr7RdF6wtt6Qsh9IQnsHE28CWKpGDB4ZL13yIjjuMc=;
 b=Qgfg6oO9HxAMTiDUfkEIudEyi9g2o2JvRnBuw/kYosgvhSTmGulb+W4PwvhcGzcdci6+VV40ymJzUKPPT7T1Ur3+YhMMea+1hVTd5+Nmj+8VW16WWJnRRbDA8EMWmkXsdky3DaxG1QvyyGSZU7rAuRQCiLO/tFEgKOzvkNR5eUxQTVJvJmLzw6/jvRpiGX5h5uY+Qwx/6jKnCW+McqsNYKQuMTjEuRn6JmqVG5QUmxqyc5l/P/nKaOHVOSGYFoRuxcebnMISHeQqkPbMzYeo9e/8HIW8Ts5LlkvL+LcGzmQ5+b+bPf6XIj9Jfd5xQ+NnaK0/2ptLmXFaftDOK/YrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlr7RdF6wtt6Qsh9IQnsHE28CWKpGDB4ZL13yIjjuMc=;
 b=JrTrnN5DEY1R0eD88irCayXLhOlz5oPN2A+uqPqJAXdY6jUqWWbsqrvlGNAa8b3max1Gn05qTdMgm6txiR4TXswHhTOM+HAPtjL5/PTZLhkBzTd90NVySx1pYNwf5ONI5ZcCFl+vnw716Y9/P5iOv2jK3tV1AX43raR66nZ+dGAKsjqoOtvAqE8+gXV1fmlbm14qAUNsQwpoU6PL1KKnLf07K2WI8NnrKvFbpp/XMRbAk89WYX59ZLuXS98IQJ5F9JlLr4D6gwNt/IPb4ZLt8vxyeN2hcpKEoS7+cTJlUemxNlNiyv710di7LFF/9bzyCD/14INasU5IA3NnoOTk2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3982.apcprd06.prod.outlook.com (2603:1096:400:27::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.19; Sun, 29 Jan
 2023 07:55:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.017; Sun, 29 Jan 2023
 07:55:19 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 29 Jan 2023 15:55:09 +0800
Message-Id: <20230129075509.37107-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3982:EE_
X-MS-Office365-Filtering-Correlation-Id: d1c77aa5-3ba1-4b63-70b3-08db01ce2a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URyH8cy/cfwVetWjM1YJPwdWtiJRNRFPfJtuGam8h1vhDbLhzO/MtXMpHlh1N0m7w5oP0oaZ8wploHoY/mT8lNOeNZPaQuUD0DKrc1C9IxC0BX3Xf60ifo01obMRfV6WNz7FSosV8qmZQQsyBje20G2OvhNrSICM2kalL/0RNBqlvRyGqDP1NkRBcI8fRF3LHYU0iJHK7U2xGWAjLrPKg4sRVrXqXWyAt0y/sGlvFFa1rqsfT/4xOe6L9O1e8IhR2KZs3E2/CmOtg70SW54H5qDy3njTgl3wWIf9wPaIJCbwo8PD/4lr655LOdMPk4loGMW9e63J8KHUZ0Lucm9G0g68JtKLKAgZTPK2S3PhrxnP8YYJyYwiPvy5wMmX5Z1dFFPpP9QGBGcOtd7HxZ/xP+fkE5amo6JS8xi4GyJx37Uj4HBA+3ZQQNbEjZq/OzFaXs/1EM7bFOXISgbN3vJzuRzlK+/mwOQA+KEH24/VdKEiEfGZmW0r5pFVkxsbnbrRaYZ/S7g0T+7Vhk3Fs6SwXmciU2H56J2j0ienQPH5khORvENN6AmSTbIUxgsUlzQNn0ZKwvHSO/JMrBvs/CQfqtMLaaVguCA3VoZGnwimbgA9Jaq9WfdRwi8Nx+1ewkYcrW0g/2B/EDIglvCniW9IhK7DAkT0TeYLzX7x9tpL/496BE1jyFywCvUr8eAhpdjhQZoP/BNEuQM6CFTu3RZe8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(451199018)(36756003)(316002)(4326008)(8936002)(41300700001)(66946007)(66556008)(66476007)(8676002)(86362001)(38350700002)(38100700002)(6506007)(1076003)(6666004)(26005)(186003)(52116002)(6512007)(5660300002)(2906002)(83380400001)(6486002)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?spcdjgTbdnLucwUsXVUFgpSLvskZPfLfxLKCQ0hHCHLffKZI0s4ZNC45kP+T?=
 =?us-ascii?Q?QVXM2MFqRwC+S14uTwS/XO+brWc99zI+8GkSGbKrBfp3aGaqoCn9SFwa8h34?=
 =?us-ascii?Q?Z9wKCiDArsTg4XBPrbpI4L5zyan9p+NeyjtopBG80fHLiuN6FehmaxTZJKJd?=
 =?us-ascii?Q?x9AUpW4L3SaUoQziH6XS8dSF+jZfUw4lNbgJh35qDequTEguaJUFscaLpRLs?=
 =?us-ascii?Q?DXGrMFR87gAtd/TwAz+djJkjILncS34MFBL/PLQV6VO5DpN/bLmF/GrBzwJL?=
 =?us-ascii?Q?SyEqraISnuau3+JPyiMpO4TdR0tWUCwDwC2KnrjX8ZdeRNf0jolzWxK0fzhj?=
 =?us-ascii?Q?MXJlfIxPh9oSyewTdng0D1+SkirAUHsOTJ4P6W05rXjoiasEKKGLHPdQMTmr?=
 =?us-ascii?Q?PPSWlgQs9OdNfMWTB1fXZHd8AnSYUlcgNZl6tQaNQfm6B+PdfEa25p+ZE66u?=
 =?us-ascii?Q?yrwom08oICmiC1fToL2wF9JSbZNKlzd7JdHFM2WLwm3+Ab+ljxmj0VPKgBWb?=
 =?us-ascii?Q?Fp7/AwtOxLKjTmRJb2tIDvTKzyqsFvuWePtZw7NQIQrq80rKbQB2ZHXFs2MZ?=
 =?us-ascii?Q?dkylBJ0LIkznB3ThcSqBdd58DLwZKlc7ZEaqR/iqL7wErkmqZwv2yJ+/81GV?=
 =?us-ascii?Q?O8Y/DiBuYh9yLQnWqKTBn+ccUMC11D6C9+GKhPqOH49ciJX/78nCpgmM22c5?=
 =?us-ascii?Q?6DzWOfAMlPx5V87BkAws0vu2Zl3PQKyPLwMJKcv4egpHB/OJ66/JshO09iYV?=
 =?us-ascii?Q?lnBkUMZVt1FgzloS6jPfdwjdQCFj1xL2W0M2YUSxTeHC3LwAGHZj7M/c/uUT?=
 =?us-ascii?Q?fpqSj9TtujUrMdKwPE6n6E3iBP56LVAyKwBftEFGSswx1XmA42RvEm/u+MxG?=
 =?us-ascii?Q?89YE6ouuP/0oQol4Y9yHHwE8buoD6rM9NqDdkynQCJXSCi+VxiytpDNsHqVe?=
 =?us-ascii?Q?p9mVo4+p4DZdlHG9srRb5aGiup2g9Pi+1dVH/qIwg1IGyk+O/QsSqEbj6CeR?=
 =?us-ascii?Q?wxSvICFXIWLESrfb0mtLEqnoVadPTkJDkct9K6SovZpnn2YwllcS20Vc/u15?=
 =?us-ascii?Q?dz9JdM7bG4PctgVSi7O6QxbJz3b+kmgpgatGD6ptppm/1QI7rTzRhpR9bOJd?=
 =?us-ascii?Q?1wH4D7mb/DHiMf/Ec4r6OUhIW6A3dFQXmB26UHxGUpM9Rbr3JV14uSj3vCcU?=
 =?us-ascii?Q?ljkTBDcYDiJbmNUwXRerX3pj5vVQlTAlneO3T4pgJoeA51XzqcHSu5hdTWSC?=
 =?us-ascii?Q?at53M3+IZ9wjzS27r/A7vEHROtNBUfEY3FxA3JpjC2Xl6ZRDpOeRD18pmE7d?=
 =?us-ascii?Q?jmYGbitu0ZnSY4zl5IzVGFC6MKyLFdsGO4TuZi4rinz067r7B9a6OLGZ440Z?=
 =?us-ascii?Q?rcp8geb5QAOPryl/BqIDARTvPZ1qHoKmXiuln8AWJtpgeil+/+4GZOMf5t+b?=
 =?us-ascii?Q?VEhwpR3RtVMM5LxTV05t59Mj7fWE82WF+uWKxLl3iZBHlf4qB6jWu44MGGch?=
 =?us-ascii?Q?Zkem9IPDXeqM4jRTpSlB6bqRr5wckKdmoGZ609A4BTXMBmonzXKkB0UsNRcG?=
 =?us-ascii?Q?NLXXqvLzlhXx2IvrNGMqB3iygZFexcKUC92fXMZQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c77aa5-3ba1-4b63-70b3-08db01ce2a70
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 07:55:19.1834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lKyhjfIcG46OjMt+MWOAmk00Kkjs+QFkyENMV89XqUw3A+0oEeqsF4M213oFm+lsQH7j0kC1o2mOThna0EI/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reported a bug which could cause shift-out-of-bounds
 issue: UBSAN: shift-out-of-bounds in fs/f2fs/super.c:4184:41 shift exponent
 613 is too large for 64-bit type 'loff_t' (aka 'long long') CPU: 1 PID: 5467
 Comm: syz-executor.0 Not tainted 6.2.0-rc5-syzkaller # [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.114 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.114 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pM2X9-0001SH-Dd
Subject: [f2fs-dev] [PATCH] f2fs: fix shift-out-of-bounds in f2fs_fill_super
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
Cc: syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com,
 Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reported a bug which could cause shift-out-of-bounds issue:

UBSAN: shift-out-of-bounds in fs/f2fs/super.c:4184:41
shift exponent 613 is too large for 64-bit type 'loff_t' (aka 'long long')
CPU: 1 PID: 5467 Comm: syz-executor.0 Not tainted 6.2.0-rc5-syzkaller #0
Hardware name: Google Compute Engine/Google Compute Engine,
	BIOS Google 01/12/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x33d/0x3a0 lib/ubsan.c:321
 f2fs_fill_super+0x5518/0x6ee0 fs/f2fs/super.c:4184
 mount_bdev+0x26c/0x3a0 fs/super.c:1359
 legacy_get_tree+0xea/0x180 fs/fs_context.c:610
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
 </TASK>

Since currently only 4kb block size is supported by f2fs,
let's use 4kb directly to avoid triggering UBSAN exception.

Reported-by: syzbot+fea4bcda5eb938ee88ed@syzkaller.appspotmail.com
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d8a65645ee48..41c2bbd3e719 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4174,8 +4174,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_options;
 
-	sb->s_maxbytes = max_file_blocks(NULL) <<
-				le32_to_cpu(raw_super->log_blocksize);
+	/* Currently, support only 4KB block size */
+	sb->s_maxbytes = max_file_blocks(NULL) << F2FS_BLKSIZE_BITS;
 	sb->s_max_links = F2FS_LINK_MAX;
 
 	err = f2fs_setup_casefold(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
