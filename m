Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF24C60C60E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 10:05:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onEwY-00052s-F3;
	Tue, 25 Oct 2022 08:05:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onEwT-00051K-8H
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 08:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6mhdRo0rJ0G+OYhur+vjiwq9R07TyurOMjhIaGh4Zw=; b=LvNd3so8eGkq4cXzLYyGhXYfzo
 qh2YytABVjmDDBZ9R3cjKuvZgXlp67er1d7DoApbg4IFL602nXpxbMTvhRWka4GZR45JFzw9uyBUj
 X0CBDloQyfwmgFIYPempKNfDZCeOD66/1Wje0CAug4zTMIF2FH7Ziz1zCbPEHwgJvCmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q6mhdRo0rJ0G+OYhur+vjiwq9R07TyurOMjhIaGh4Zw=; b=E
 ZzOZX141l14o+9p/hlz9kzXVNOePAn41kx3wSQ+evVtFpJObVfTa35K1IgrsxA/w8Uc6mlL2FWMvf
 gxmEusR8iukgBs3nLtZxqA5th+8SIhMhzcMQsRnHe+hZz/oKXEPLcf/9LEpRYkgO96vr+D8xXm2p1
 Bcc9dL0yjin8LNMI=;
Received: from mail-sgaapc01on2090.outbound.protection.outlook.com
 ([40.107.215.90] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onEwS-00GfiH-Dr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 08:05:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnlB77EC8slHXFmQWbSNZ9uLSdwxfJNxskxNdM2nV6/Qad2MtL8RCh8aAoWqEvoKmMsuFHu8imQYJDT+fFnCSA0HQKM44TvGJ2wuj6sDd4CgOhR7G+dT4ciZwfYP20L9uyDAX9noGydvbM/EwKrYsXBaQFcxMeiLXnTnLQ5VklIlGDkyEVjHDlX0cqW2l7t/r3MlynkHc/wakbh3nbTu4aVyLSStqDhZy8//lB3IyOioEGgZ32uYgkL/9vsznTvPFhYPn+3XgNdNfHgtUNPjzRrvtwy/GsGtmjIUPztWlPtyRGsMgNUuNHjh7ta0+f+3cI1RVdGsK10KJJYgC9WJ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6mhdRo0rJ0G+OYhur+vjiwq9R07TyurOMjhIaGh4Zw=;
 b=apzOLIC4oerAOB5MGj6j/IThMVHqf8WgzWsH0FT1vkkkMcaP5NHR8w5R1/nkymqid+dZsJuwGkeVFf/lRue/DMBselX5cThIIM/UTnctvFPv3ESQTemrMbjx/9X/hpnj8FiR/QwxKbFPVwJdgjYdSJbt8aXAItwehlc7OPbV3aiaciUiVnSYj0die6uD8cPE2SekGDgiAjj6t61BUg83q7oNdZqvjPwQTwudA7MIp1Q/rr+NzjSmDOdxXvilJ8X+PMCoqBGshtFRkzH1O9ISTJ5l7NkDxss8inBXfY5Dw0YlKAfxbbKuqBiOmaAmyBe90W9oYprqkUYUajZ3/fYlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6mhdRo0rJ0G+OYhur+vjiwq9R07TyurOMjhIaGh4Zw=;
 b=ZYuYi+FnZwB9eiDfcbGTqpA9SRYjrVJPrRS9YVcGWZGmEncKeOU0u+TPTo0d6p/9BibCvKiNVG4b5zi3GvpJ2G4mWAg0hyFuomgz8v7NuRURmhXFz6E0UrMm+crZPo6sT12SEKofsnhyP9/o+Qcat6M1psmJ42173VI4BsLqUpPNaU5kqqjUUp4Iw9IP6FkELu0hV+8aj636DEeAWiT5uXid8ohFKju/FQBp6xLd/YetKNokErehPqdlCJMHhwX5JKbZn654O5cibUH1fnO3/0XkfbbdKuJxvS2ZoAAccBmJGEXqgUdNRYZGE3fzMIkGczzZ29k9ke1bpe/ORpwFXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5550.apcprd06.prod.outlook.com (2603:1096:820:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 08:05:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 08:05:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 16:05:26 +0800
Message-Id: <20221025080526.9331-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5550:EE_
X-MS-Office365-Filtering-Correlation-Id: ec435f05-32b2-4dc0-1598-08dab65fb247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HthUCvfyYySU40wTUl55b6cfhYXZ2Ea2pnKovp0va2oyb95mAl0J9IE9kj9i/eO3ZdycqeNiJ5k8hOu0g+bkB6zc4twBqq91NxYMd3eiDOhfwhO4okXGGC2gOnFCX/WPNFzUo/DAVp3wuYDe94YOpiUSXTkOuMaB+umtR00cmSZYrEftKAoXnThgropveHkbMUUHxdfB5Lx5FKNqCKRzH+4RKggA/anjZCL7n281qCWMu8A+eJ7FTmDDIuTsJxRYll4EmNSlrY+Hhqvam0kb8rkHlbXBx4c09YoxXJaO7rqGQ9hYxqIsQWE1OY7/t7klRXcM7k4kWC3BI3jV4dCq4G7jbnhVy4BGdJYW8JXE0anml3mpXIG5HQzy0cfY9++Ha+/iYpLw23BzmaceZWlrly2X3hvgCyWD2DUjPpfI6FcpLKoSC7doMCQ17MFi9XLkd4uVp4x7ZyuItz3MRjQlc0i8j1l6rhyHn/jWmARVkZiy1oLSYPLn11RgOgdv2raEkjHgyFxjcOhDuNalR2ssWx2+re0CgIC0T+JGHLladbp4uCBsdeq0cKoz85yokd4c41S1Pwos4nbOhkphZAUy3mofR1P43YUsFEwMZhMF24e/+fYTt+Z0LQrdUBPDqARr0/C6hfn/+LDQQgB+buMQF7uW0Z7Cl/53LmFnW6Z8irrLA2QKrSftIiZl8wxTliAiPX+07NnoseLPhJHG/Bo116JKf7SryRudbXm9P9h5cHscSKdJn8rl/sx0iuYGoVlxoiCqK1Nx7TFMEXU88N1HjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199015)(2616005)(1076003)(186003)(86362001)(38100700002)(38350700002)(41300700001)(83380400001)(316002)(2906002)(8936002)(5660300002)(478600001)(6512007)(26005)(6486002)(107886003)(6666004)(6506007)(4326008)(52116002)(66946007)(8676002)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99ccrjmAuTZ3lfwRQqbSkOxQdjgeQxLS1cB1hiM9rOdprUG+gTvL+whjSBVJ?=
 =?us-ascii?Q?aMS9Mb1vNspzCfZOolqvIXFInKb1SURLcS5ElpCbUgLD3zbkmMVlW5Safdfw?=
 =?us-ascii?Q?xecjv2Q9nwPLljnNtI/ClRcZv/Ccdy58LsdOfoL4n+5fiO2eynlDcEDtu0a2?=
 =?us-ascii?Q?KI2JLomA/3GOvVwpljiccKUmZr4VIqydoxHJQA/CGX1orHTUgMrnQCX4F1GO?=
 =?us-ascii?Q?vpLekLYrQT3v8Bxl4WXklDiX114ZAnSy9qvJesEDa5brartF2HvAcl6FIuQr?=
 =?us-ascii?Q?U41LfvI2+6aVLG3ve69AGXITipo5nbLrwq9lrilz68J/HX0VnC1GBfgllZXz?=
 =?us-ascii?Q?QA9aYTggr5cQgNROMWE+2hAT4Ujruf6JeqQQfK/OQ/OE/8pSeO3Ng8yQqaEe?=
 =?us-ascii?Q?sxfn3zEzuWeA9BFymGoCsg4TiTq61ATl4WE7uXw+qwdAB9HqBHAqpuUn0C7v?=
 =?us-ascii?Q?aALtja6daiXoeUWeV1A1NfP0IyRZEYWCDJ/GA7xDx3KcgsgsL6/gHejtsX6p?=
 =?us-ascii?Q?3mOsIhAlgSsGXYEOgFWI95nk1xdNZBT5jvdwpRRyzjn2jU9n/NEBIt2VvZXh?=
 =?us-ascii?Q?8tcO1EryoMVZ3IWW2/UgYDZK/S8jwpV3simkTDubK0C63m6qhw30PvNhNFgQ?=
 =?us-ascii?Q?9zJNzgSV4iEhpTSVuZ25tvm15m9/N+egZ4T1zRdcVW4M8yBmR8vvWZ0a8wjJ?=
 =?us-ascii?Q?FJHRNA3IhYuNPULvbW7THD48pPPKXvNbapztwLwHAJQXcGeTRf215s+U/xie?=
 =?us-ascii?Q?DmP8tnOT6SZGBSwaIs2GkUZpgjkPff0d+9CZiJZLuhyZgI/YEtVCf2CT4qQm?=
 =?us-ascii?Q?HcwPUvEooBknfy84yjsvyomkUuHvQ1jZA+/FlTpSDBq9eZrHMRu9xuGxutGh?=
 =?us-ascii?Q?lWpaJIb1VGeXoRK2RWfon+v5HBhX+mGTcsN+qLTJMWwvLXmIudlih9Yoloyk?=
 =?us-ascii?Q?vNMNzdpufKjqA7kyrI7edolYm5Pqt3vjyBzoA+u1Egpp/H9U/xW3PYoRFzKy?=
 =?us-ascii?Q?ZjhW9MVqpYjOBCBsJt/lEsV6TvBsfgMGsox9ec7U/M4FIs0Xiy5ny5xzfD2p?=
 =?us-ascii?Q?6I+f/BXCdziC9udrI5A8FLgv2j0UlLQ83m3nvAiUrSu5Qygcq1J8X5GcmOKs?=
 =?us-ascii?Q?UQs7uXo+u+spp10LxLwpyvTvF4HMf56mrRTJRAr4RiAhyw+Fy+YktCXVkPL+?=
 =?us-ascii?Q?bThR7b/BADVghNP4oko+YFMiY5qHyIWoImFJdWyhzFet6ZfVbWKG98439bKa?=
 =?us-ascii?Q?Nar7GFNFR7HtRZbHUIzAEgG5pxU9cbadYwVjTCW9PzXbUM/vrBJtg5+uFej+?=
 =?us-ascii?Q?/wg7WBU5acaSqxjbeDWsGJ66u54HUbdxmNWcNcHeShLX/9CwDJbLOkmJgq1m?=
 =?us-ascii?Q?yndRXGQk5Avyy5TwY35g6i8TE861ZjaPpNUf13olz96WnC7VGbPavBMg/AUI?=
 =?us-ascii?Q?favKwWw8pZbUaU2HZvwWdmNkqF0mPBC19CmuAqFfKdErdhEdqrVhZ3YCVAFz?=
 =?us-ascii?Q?0FO5/faXmubRkq2GyeI2/zEvc89a83YndNRq7ZSm1tRUPrEUaMoFbSDxNZDU?=
 =?us-ascii?Q?1RMbX3Be6EOdAKRrXqH80mxvqYRdZ4Docc8zcmvb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec435f05-32b2-4dc0-1598-08dab65fb247
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 08:05:35.7527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbrvOXE5PoGtJsojsxZ92H3gaAU2SghaOrWEBf/AKtRKlr43EBLFQLOyppl2a38jQzto3k7t0EeXJOWamohIEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5550
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup for readable,
 no functional changes. Suggested-by:
 Chao Yu <chao@kernel.org> Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 v3: -avoid UAF fs/f2fs/segment.c | 8 ++++---- 1 file changed, 4 insertions(+), 
 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.90 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.90 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onEwS-00GfiH-Dr
Subject: [f2fs-dev] [PATCH v3] f2fs: cleanup in
 f2fs_create_flush_cmd_control()
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

Just cleanup for readable, no functional changes.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-avoid UAF
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..84a17607dfee 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -620,12 +620,12 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 	struct flush_cmd_control *fcc;
-	int err = 0;
+	int err;
 
 	if (SM_I(sbi)->fcc_info) {
 		fcc = SM_I(sbi)->fcc_info;
 		if (fcc->f2fs_issue_flush)
-			return err;
+			return 0;
 		goto init_thread;
 	}
 
@@ -638,7 +638,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	init_llist_head(&fcc->issue_list);
 	SM_I(sbi)->fcc_info = fcc;
 	if (!test_opt(sbi, FLUSH_MERGE))
-		return err;
+		return 0;
 
 init_thread:
 	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
@@ -650,7 +650,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 		return err;
 	}
 
-	return err;
+	return 0;
 }
 
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
