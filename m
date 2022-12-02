Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D363FFAC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Dec 2022 05:59:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0y8l-0003n1-Gd;
	Fri, 02 Dec 2022 04:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p0y8j-0003mu-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Dec 2022 04:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z47m0ybNwf18b/RmNhOwKotYNmUbPXgFB0/nVhF3oEY=; b=k5DqfhQVYP2TSVAEI8DFdYvR6m
 1m1GS1ihVLrqcP2mAu4QKOsFImM7GE2IPNJUedegQqLAVvjKzlZ4a6USRkbBo8aXM2c0rHsik5Qi4
 81V9VW+PVLAvPmIEJCSpObwLLt2XemFp4t8IDEGIgaWgFfcT2+JOgCrXhDo5KF1dUcVQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z47m0ybNwf18b/RmNhOwKotYNmUbPXgFB0/nVhF3oEY=; b=S
 3OmDrhkRK1Xi/Yj649+28izbyfFmyzY8T+tjqpVNic21hhHnV4qe5L7Vdjhn7xB+cdU8FLW3dm9Sm
 Ls1erqyqJXMjDdg4zhJK45sEylOuv41ETU7S++B0ABfDLkz8uZXFYXe+12xvPJceJsITYWfVaXTDh
 534bjerA7bJDzagA=;
Received: from mail-psaapc01on2090.outbound.protection.outlook.com
 ([40.107.255.90] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0y8h-0003xF-9s for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Dec 2022 04:59:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQYIGbmU38ld0u/zL+fHsEOz4ACdSMlARtgFCsz3Jq1VICXwlyE+9O6FE7ij61thkK8kLEfjfSXGdkvye9ljeE86q27XAFBsduukwu08TDDWyWwZspVDsNKC76Gr6AxwvwUVamSd/Q7jZFE3TLhbaqqx3zncHZxptdOIEj8uYGlYERlpS11ZqiqUPeQj6wli6ee1+yMLWmy6AErgVzBHBZZmxlZcRFTn4AO1C4GpyP6ZIAjAzpY86BLoqUkv69G0k4zKewIOBuam5Z7eda+ull6+EeSEupgSEQFLjFRF6SUsvWYBt1CD+DGo7AMwSjWcwSQQ9rCxK5hsMA88GF38Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z47m0ybNwf18b/RmNhOwKotYNmUbPXgFB0/nVhF3oEY=;
 b=XfJm18gwm6YZ5oxhZNuIPU5cwJetwQslAyS0CHYDCsLBc5hOhudcAimLF1nTYI7ct1dP3DdO2DNGprqnUDUsqJZIyn9J3XVwkJjlbvlhd1rHQu9/YC/P8Eg3o6vMCvbUL7bk52nA/mBOyZW/PBZd7FhTe8qs/zzdAnxoEf8iXvHOsjWLqo2hM8NihLpWgMx90mqQsR9aRyppXv5IUI1Th34BytqHIu9qx/V1Z4rM8fsO2se7pzhTiyDMCIl3C/cgz4PYNPoECtusz3EQ01gzAYbkwbrssO2oa5UryKDPpW5d8a1YbZelcyTdO65eXb0ojEe36/MfiH6bgkGgwO1L/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z47m0ybNwf18b/RmNhOwKotYNmUbPXgFB0/nVhF3oEY=;
 b=GIJxTc0Qm2YIyZFLu28y3F3UrRbHjAngoaWsQkva9xWDd5qCDIZOov+IFzAchLm+mEVHHNkD2dL+OW1yGgrM6ueJq5c4hAkXkISUcGTWtSHYQb+HNyA4bB+7V8KWY4pXJ9H+zkU2fXKzbZZgAfc7+poU80+h4A98pFtTscOykSYcv16JBnMj/90mTFdvGvTQUAqTUQr8Cq+AnPh/3C19ImgKOTP95sPiAgV8fZg7pokbTAB4fTz5UctgE9GIIvfH9CYTzqKwZHeb/lHqG4zapLdaYHQyTNakQAWxAbKFi0lfd260wn7HTRaFcPQcbCtDbRX7eQ65DIWc098vuZB4dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4462.apcprd06.prod.outlook.com (2603:1096:400:67::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 04:58:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 04:58:52 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  2 Dec 2022 12:58:41 +0800
Message-Id: <20221202045841.9888-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:3:18::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: e73fb099-e42e-48e5-5db7-08dad421e868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecLpyN97y/xFdIEDjneR7mteYercXaXiC6szm45QGvUlzPH5agWm/3i0v+/EkzWe+Q3KBxYjNt8uW6Mwm/8cYjjccWnm9+W5/jjvfDMATyh642HBUR0nqKp6LbwISXoVdHqaEbIj139M+wf2BKK3vtOZ/MhUx4y5M8XpPJHGnNLt9Jaiufgi0EUCMX8tpiIHguG0ZZcfjOkEv7KuNQ3HD1gQXshfZsXXemLj39O3mVIm5YPjr0hIk65Niog78Ari7Qky9pULA+JT2pekfMNEzyhMccR9RDErg/GpiHIeQZlMDim3ytVPL8CIY0a7htQX6UWAD7bm5qyXX15GOvFh99g2pyM7bStyx4xYUgzI2qn7k74fG6ZdCHWh4R2U9fQrx4DekMIXyD1t9Xkz6+FSybC3wbx6/CLJncIETWCC23mdoYvys2wjelQsgjeRpqRBAefOfP5jARbyTusFAiBKMpwMP5OL5iP1mtaIiCKjzj12rqY2x7S4clmGH7/X3WkxP9uEQ1c75fIcHhJs05J/fRr8flcCPzcBCy88YmRfycZCtxGphbMUWuaSBwak/xaL5COhvc0piyAgGEw8/G3yTDVn4J6FckjYvb3Nb3yuqdqTwbAyto39TP/7TLx201SF4OggQ5TN3wK5qttbYc9AcXhXrzGlQRExPStqHSlajvfnRW9dOTDRJe8+7PzV4mMH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(451199015)(2906002)(316002)(66476007)(8676002)(8936002)(41300700001)(5660300002)(66946007)(66556008)(4326008)(83380400001)(6666004)(2616005)(38100700002)(52116002)(86362001)(186003)(1076003)(26005)(6512007)(38350700002)(478600001)(36756003)(54906003)(6506007)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UntMt2PQpnMrLGb/swUfmTcgyzDpQCDrdlh7SslTWtvaWNCzsXc4pfwsHFnn?=
 =?us-ascii?Q?eySswJRzsRqR3ctS+k1sf65GYPHQEUfnVadMFGwHKr2kDbibUBviU2IBZjuT?=
 =?us-ascii?Q?vJG3DhwbaokmXSR1XPTUKBWHVq1fnMTsIwQY4tXWZwuweloRqskn1Y+bqc0s?=
 =?us-ascii?Q?EggmcIAUA+jnFLUdIMM/RhFWmaiQb2vggSaV9B13A6BNXiZ7fjZYgLBiJcAy?=
 =?us-ascii?Q?B1RwqWewx54f2KF+GZlu8wSA56Fd/m8ls1B+f1Ib9dQpN3I9eSv8IfhSCEMj?=
 =?us-ascii?Q?wmhsya6IuvQ/3o+ANYWj8PD0m+3eDDk2i74Z8DbWn9eUYzGYqgFiZrotvYCG?=
 =?us-ascii?Q?y1bYGX0UTFoCQwgoHpHBhxYsI4mU/I8kUVsPUVd1H869KTJU/FMurm5AaCZj?=
 =?us-ascii?Q?FDGuosWCVixdnICcdmIXmuEHNkfvHU9M1JI7q2aJYC/sIubceSAVjO1tv0AG?=
 =?us-ascii?Q?71dX0cDG9tB0n1hRJqG0LAHxBfN5SC3q/5B87T3yr78e0nqm54cJhsdERdvg?=
 =?us-ascii?Q?VrG5ClyEudT8FQoj7jopT+fGRE6ZqVXj1Fk+JyJe9VvgidNoz0CCdR4IvZ6+?=
 =?us-ascii?Q?B1X737wXZOdNN9JK77t+EnKyS24M9PyrZHIntOmHkJCGx/x55Q56GkViVTg5?=
 =?us-ascii?Q?u6/PoUQx0dUykSlfYp+RkXvHEfLMgtD/rpJgAi2BX7tgu4F4DA8k5IfcDaNv?=
 =?us-ascii?Q?wj8Up/nWxEfJG2Ab0LV0AruiNluP6Cs/Eobanku4PdI/k8bxax/hZz5w+Cr5?=
 =?us-ascii?Q?cGs215llL9EWPoUZbP+15e5ov+VejEubGQVu8udxBowCxC4aulLnFa9KNUOU?=
 =?us-ascii?Q?BVZ2ELzKHbLCkhd2Emh80YwyK84xE0sdconUL+sYZwmE83AGOBrDpviaGJgQ?=
 =?us-ascii?Q?SFipe3d5yAhjfabBGAJsXWx4engQ6cgBL7zLUnXxuMjs0drU0RjFd+NKZVjy?=
 =?us-ascii?Q?sGVEF2jpWT0OOYRY5dxPf0mlOlcW/rQezVyG+jum01OBYwiEzmmgWgqXXroN?=
 =?us-ascii?Q?zLwPpOz3i5MHOkiY86IjoVPsnOiL5OHX+nqXZ9PEu4j+WFvtXDaxxhOogwLb?=
 =?us-ascii?Q?O8ibBTysTGa305s+hwnxpSpMD5G0ERjCcrGCXtl5htTRAX838S/W1WUCgls4?=
 =?us-ascii?Q?aq6+ZZycloWOpskF2gXrGN6mhFuXuOOmOr78IwnTe1Ys5T0OzI7xneaFDDt6?=
 =?us-ascii?Q?aSkonY1Q2DZKkcuglianvNTUREcgnDO6AAGhJ+FwlmtGqE4rc0m0fIpjC7EJ?=
 =?us-ascii?Q?IJoEZ6U3sXwhFp2Pxv4EJq1MUDrJuSD3ssbqd+p6XfmcJbrVhfwBsyqOVs27?=
 =?us-ascii?Q?q81izYxJNGktwjVB3a8oKXUZ92+RytF0p5f1LFGxsjrxPMemgo5KXi1dftCY?=
 =?us-ascii?Q?5sJxhEaXL7EDs40hBWLERSC1LQguRLdaoxbneOwWwYE3am/yioSIRQZQIFDF?=
 =?us-ascii?Q?EA+ZSKQiDUbyFNdKPhBj/NXZhByZjjWlkXVwEtFq/THmED4WR/3GdtaC9jvC?=
 =?us-ascii?Q?6HrvvrCjxaTG72B9BEJnoPqWzt7fuxqsEp2Ct89gf6ow3tQtyWpN0pAzDKSH?=
 =?us-ascii?Q?loifbJOuXpEIjp8iCufi+pWlCxDIyEJMc9H8YpXb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73fb099-e42e-48e5-5db7-08dad421e868
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 04:58:52.6228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyLxKyyoQn4BSbUG52srAb+XNqYqQf7WQ1EXRuVM0xWaMtQXnsVW0WzURgDLghITLQFI6Zk6v8mYDUdXrSjUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4462
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No need to call f2fs_issue_discard_timeout() in
 f2fs_put_super, 
 when no discard command requires issue. Since the caller of
 f2fs_issue_discard_timeout()
 usually judges the number of discard commands b [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.90 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.90 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p0y8h-0003xF-9s
Subject: [f2fs-dev] [PATCH v2] f2fs: don't call f2fs_issue_discard_timeout()
 when discard_cmd_cnt is 0 in f2fs_put_super()
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
Cc: kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No need to call f2fs_issue_discard_timeout() in f2fs_put_super,
when no discard command requires issue. Since the caller of
f2fs_issue_discard_timeout() usually judges the number of discard
commands before using it. Let's move this logic to
f2fs_issue_discard_timeout().

By the way, use f2fs_realtime_discard_enable to simplify the code.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 6 ++++--
 fs/f2fs/super.c   | 8 ++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9486ca49ecb1..d5f150a08285 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1655,6 +1655,9 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 	struct discard_policy dpolicy;
 	bool dropped;
 
+	if (!atomic_read(&dcc->discard_cmd_cnt))
+		return false;
+
 	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
 					dcc->discard_granularity);
 	__issue_discard_cmd(sbi, &dpolicy);
@@ -2110,8 +2113,7 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
 	 * Recovery can cache discard commands, so in error path of
 	 * fill_super(), it needs to give a chance to handle them.
 	 */
-	if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
-		f2fs_issue_discard_timeout(sbi);
+	f2fs_issue_discard_timeout(sbi);
 
 	kfree(dcc);
 	SM_I(sbi)->dcc_info = NULL;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 79bf1faf4161..aa1cadfd34a5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1576,8 +1576,7 @@ static void f2fs_put_super(struct super_block *sb)
 	/* be sure to wait for any on-going discard commands */
 	dropped = f2fs_issue_discard_timeout(sbi);
 
-	if ((f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi)) &&
-					!sbi->discard_blks && !dropped) {
+	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && !dropped) {
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT | CP_TRIMMED,
 		};
@@ -2225,7 +2224,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool no_discard = !test_opt(sbi, DISCARD);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
 	bool block_unit_discard = f2fs_block_unit_discard(sbi);
-	struct discard_cmd_control *dcc;
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2406,10 +2404,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 				goto restore_flush;
 			need_stop_discard = true;
 		} else {
-			dcc = SM_I(sbi)->dcc_info;
 			f2fs_stop_discard_thread(sbi);
-			if (atomic_read(&dcc->discard_cmd_cnt))
-				f2fs_issue_discard_timeout(sbi);
+			f2fs_issue_discard_timeout(sbi);
 			need_restart_discard = true;
 		}
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
