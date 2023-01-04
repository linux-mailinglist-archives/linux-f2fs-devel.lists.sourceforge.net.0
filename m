Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 312A265D14B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 12:22:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pD1qz-0001W5-4O;
	Wed, 04 Jan 2023 11:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pD1qx-0001Vy-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qjwULjQGIH4Cm97/TrUL4gWBgtTtG0b3tYrKJb7k6gA=; b=ZNHPzZAc8wGQf+mkiY9WJfX1lB
 J86IJczeOL84VBRgQdlgjzsVNaziCSvLXDHr5+WB08Rw+YaYFq19As47SYzwX15MmAnDfw0NfDX8A
 PAmvj9zP+hJvSEPEwd6wgeFXdimHNAPZfnY/C8ivFuCYvhp3l48zAMmSXvXhO7kt04f8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qjwULjQGIH4Cm97/TrUL4gWBgtTtG0b3tYrKJb7k6gA=; b=mXy2szITCgesMRQuzhgZIvWNci
 32ppQSMkNITxvIbxEuEIGWCd0ont/5kBWbr5MTqaUvuTflpxFxYihkLym44ybOtvHyylligz2cSmV
 a3Zq0MweO7ydcUkDVgJOYVqFiFiDxLremVWOQpPcx4Me9KcgS06fkYyQj/wcxWIZw+FQ=;
Received: from mail-sgaapc01on2121.outbound.protection.outlook.com
 ([40.107.215.121] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pD1qv-004Li3-Kp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 11:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5D6rekwb1Izc0ZDhgWFDb636Z4R0AFYxWHw9ikHsMvNLViJNmVSNZVrIQPjmn8IwhNug8fsTm596ZVkZZ18HOYLgVelpxqiAa1q/HtuvtV5kQDdaTsHji7+SU2AtXhIsb4pl3wwK3fqASX10BdW1lmSZKWZjGf/sBfRo92UASYAVKdilSfFftfDDu6DA6ojPkg7sci1MbE1YkFm9m2i9pdiTSEzfPKwFzIGWO8nRw55lki5HT+sYhCvsEATFlZm5xzOzRORhs56gJwuFNk6oQvTgJi618UKlx+QXBn+Qk9GH005HXrwDw2sZUQEfOtzdt5/KBkqgjJxuTqABMcWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjwULjQGIH4Cm97/TrUL4gWBgtTtG0b3tYrKJb7k6gA=;
 b=dayw4tdeS+6VzpachutenCLfOHYn8U02H/64+zPC0vfU2INBbFr6OPlAI2lxx0eoZl2cyQyQcG+dx3J5HoA9yO2bhLEGompVYh/W8F0hJJ2EngWAgyhrcFWOocV6a1nQAZZG6pf4WP6kjg2vEuDUqW7TePXIIwjpBy4CJuRblq/FVt9B/jgRlM+2QiwOmKPg+HUGpquEjzG6xo6IR4IQPAseNpmGTrfRjCeuB3Y+0mwCTMqPtQ2Bnw0PMVqE7UMUkuBi3zgPpgVGUaLgWroQMtnv2KSlayrSczM2dPQq/4KUtPwkX2QCSqz2JzG2fgn5W/NhFg++m9hjHxDlQhbHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjwULjQGIH4Cm97/TrUL4gWBgtTtG0b3tYrKJb7k6gA=;
 b=Cz25gLpmWqx6lm9Zc9icSwyMAr5N3JimMm1bQzDhAIbsOkQw4XhnrTYSNYImys7Cznv/ynUfNXxee5bcg/4O5pZHQ7xlxxKvSF/UCC4G1pgAlo4YPgDJW0nJlf2PP6Hyw9rBenRFC1Dcv8feC/bDH06L01luUJArzDkx9Up+9Ir4AdcP5NAlHP0DQoV8E0WB8kjjW0DIqce3uK0KxyQp7A1txyWD0Am7NB1Jzfurrdl7L/prK4iSMtEOno1V7BbRv6mJvgnF70hzfioVOejVC6HjuK3KUcfhGynEhwTY2pDUVY3ThtCe9EuaMCNA+om39xaM1Yc77hTFFbDcWkkSDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5844.apcprd06.prod.outlook.com (2603:1096:400:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 11:22:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::7969:5a45:8509:7d80%4]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 11:22:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  4 Jan 2023 19:21:57 +0800
Message-Id: <20230104112158.15844-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230104112158.15844-1-frank.li@vivo.com>
References: <20230104112158.15844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 8976b458-83e1-40d5-3174-08daee45f1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXyDrg/KqLFN/TzkJJ8Ncoo/TqowXvVeNEXcx8pyk/X5IY3oyqevyT7U0LcUNsyfcFxHiZGlwJr6esNvfQNdvGsttZ+vMs8TjdiHpKGmMxk3TLSLPZFHz6B4fG0BC8ZC107spkyVD2bPPYBDA76OM21rDQUfelCCtysWrlAFlsnexd6Pj673cARqg6ug40XBFaP1zgVesTT24udbcEsClMb9WGjqsuDYZ7qCf0DODVOGR0Km8qN9jzniOHNE5xVyFw9WD1DwC+kdZ6RFmplrwu1pgILFNIVsipBHVfR+UO6hJi8Zv0WyKmyZ4FbgKb7XCrrildCj4i8p6ONmnbkI3FrXaaVhrs2w5JuKsBARUSbKqQsJ1DwOEpf3egqAUNCDiESdqJrA71ArpIwjkNjPc+zXA16qoFAUyAJKyonZIAJSnJXOFI486vrlVPm5ywGBjxaio/DknQsNyiVLGbYqS8xO1wXO9ObmUax+CAcX1f5QsmdpQpP6Qr89zaEk5Yk3Uy8woh8vmAdWjoanxTYAZiL2qVbozQYYiWxRRaca+gP3y70KAx2QiEmfK/l7pzFZpGF7U8SkMetTdGXZhAY2zJV2WFc8rNPb2XrcCf24NsYFe/Vv2QuX1XBCHYJRilBY807Lg9wzzOs24YA18+JEN3v9XkJFA1gecG47B7S2XioJ8NZDtOxcmqP2TMMOaUsK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199015)(2616005)(1076003)(83380400001)(186003)(26005)(6512007)(86362001)(36756003)(38100700002)(38350700002)(2906002)(5660300002)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(8936002)(107886003)(6666004)(41300700001)(6506007)(478600001)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SOAbJv/ln+AkRoYmVHoZc07fYN+0F10Jfupb8uLfSz9kz8NkzfeZUz2T/jiF?=
 =?us-ascii?Q?/YodQ9Li+Lvinibt+MsmaoZytZLz2HEXB/T4TctDLGnuA4Cv4eDw0f7ANqoE?=
 =?us-ascii?Q?4N4tt1HIUIcItXx/p48CVgqggRnLMPIv7FfN2N5tbeGLUCquZlMwAqGxe5Ph?=
 =?us-ascii?Q?txxT2K1wVZPNWxN5TiVxjRxZIt+qy2mAlyEWe2Ptw3/oOFrSa4AzkKeB5cgH?=
 =?us-ascii?Q?mOCCBSZfv1aABlTuRUlu15pmIffQVfw/k8bKvKOZj7ayBf08PV3nmvPou8Fg?=
 =?us-ascii?Q?OehhXGrg0ase5l1BWSRX6MAmIr8E24WoqJVSHsEyiW+GJuqD5j2F4FOQCa9s?=
 =?us-ascii?Q?+AhU+gzqb9xct6qCe1E2UflwfTLESEJwpc77gMPUB4II8n+KgTiQUKnMztr/?=
 =?us-ascii?Q?rG036im9f9X8ASls3/Yt6Se/+0nEpZxvhU2HIL6K25F+Onyva7cJof4PnUh2?=
 =?us-ascii?Q?Et7GaYL/CRS65BrjDO/3QCZlZtGEw9poxvqTzxvjoiZqghuA9XgEHT0a9DL0?=
 =?us-ascii?Q?qmVOpBvX2H2b0e3z+htF31Qv56WnsmftyC719DB/730BcdmUjzzsfhBUSww8?=
 =?us-ascii?Q?tAiKo47y8+f2GXpRtW5hkUhpo5ohSiSTmmY+kn/U6dsBQ/XwntbTcZm2FpvC?=
 =?us-ascii?Q?h+woOXZl45QeIKwWJlKjnWnkTdpxjpLKpVjbxSMdRjNWXdSaRZtO5aqC8uJD?=
 =?us-ascii?Q?HWFZv+Y5QyUOLjLb+TcJYI9r6cUTlMRKXEbu++89nPztwtcKCTDmfEtG64vW?=
 =?us-ascii?Q?3hnK3iXjMobomGePdEmenkCgenNkrtXlnCgJh3rS+3g1ZK/AejwGHAseoJVn?=
 =?us-ascii?Q?RZ8dSG7xwZGXCfsN0ZeptSM2OlxYB7/SANC/+0xf0amkGObM1LU0yUCKb2bC?=
 =?us-ascii?Q?//AAby9Bso1R1zHRb8Pu4KRVDnOnFm3CPlY2KYOlxoQ2msXo8l+bZgdtLdDj?=
 =?us-ascii?Q?DlQWv35KnMwMUYNu9Jdwye5Q/uTBIH7KfUNbEGAtA2saCOPgLKWRVVnDK7Oo?=
 =?us-ascii?Q?r4pil4pbZMmbd5HBFyejqNwiDWIm00s5slAAzQFRYYm9fqN6+bau1czBgsp2?=
 =?us-ascii?Q?U7zTSfbkRVmbm0SR3FkzUPQkn29duYOr5xg14jSzBjOczq8/Xoo+MbDiaeem?=
 =?us-ascii?Q?jEu9ce4SUGIuZTMwC953w5qyrrZKpV5WhQtX0mhuzqOnowpyyyInvNE3XTDt?=
 =?us-ascii?Q?ohdBLpyLy3GEXgZXuH7vwFTtPHpO772wWUsfGNsSdTsg4FQFAKVA3SPGoz6l?=
 =?us-ascii?Q?ZGc1m9rRNg6H2isZBYPu14dESSgXI0QJT/E/8GUBsGjB1V9QEUTdJ/50hhUx?=
 =?us-ascii?Q?Bu7oT2ucH9gD4j2h1iSo6g79kyyhpXTbQYkEUPSXfgzM+t+Hr8GvsaPRnmd8?=
 =?us-ascii?Q?q5ieW0LSwX+ClPpmg8WDHqhq7DbjD+YpUYvPdpaDXuzCM8rMvM5Arxt4VtPX?=
 =?us-ascii?Q?Un5TpiXuV7Qw5CwtmYOKpLT8PKcP2B5BpVDji3nHrRSGPmvr06JE4J6+EHPi?=
 =?us-ascii?Q?cJL96DWgHZEdFN6TaF8/9jX3HMNi5trfi4HLRvv9PCaH5yMXXfoLMTdGBK1M?=
 =?us-ascii?Q?5kl5eCpZX2psDS3Wnd6NhMn1MlZsQKYTy858I+uK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8976b458-83e1-40d5-3174-08daee45f1ec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 11:22:20.6851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/uB6MbSkSSb+vMtiX6pF7kIVCcPr1Ewp2NvgPg5txCVtn5MYqrRSBgMZfBxJGcL3r06f+5eZRuJBRUkP8l6Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5844
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Define IOSTAT_INFO_SHOW macro and use it to simplify code.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/iostat.c | 136
 +++++++++++ 1 file changed, 32 insertions(+), 104 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.121 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.121 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pD1qv-004Li3-Kp
Subject: [f2fs-dev] [PATCH 3/4] f2fs: introduce IOSTAT_INFO_SHOW macro
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

Define IOSTAT_INFO_SHOW macro and use it to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/iostat.c | 136 +++++++++++------------------------------------
 1 file changed, 32 insertions(+), 104 deletions(-)

diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index e7d03c446994..991605fcfe0b 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -25,6 +25,12 @@ static inline unsigned long long iostat_get_avg_bytes(struct f2fs_sb_info *sbi,
 		sbi->iostat_count[type]) : 0;
 }
 
+#define IOSTAT_INFO_SHOW(name, type)					\
+	seq_printf(seq, "%-23s %-16llu %-16llu %-16llu\n",	\
+			name":", sbi->rw_iostat[type],				\
+			sbi->iostat_count[type],					\
+			iostat_get_avg_bytes(sbi, type))			\
+
 int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 {
 	struct super_block *sb = seq->private;
@@ -39,120 +45,42 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 	/* print app write IOs */
 	seq_puts(seq, "[WRITE]\n");
-	seq_printf(seq, "app buffered data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_IO],
-				sbi->iostat_count[APP_BUFFERED_IO],
-				iostat_get_avg_bytes(sbi, APP_BUFFERED_IO));
-	seq_printf(seq, "app direct data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_IO],
-				sbi->iostat_count[APP_DIRECT_IO],
-				iostat_get_avg_bytes(sbi, APP_DIRECT_IO));
-	seq_printf(seq, "app mapped data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_IO],
-				sbi->iostat_count[APP_MAPPED_IO],
-				iostat_get_avg_bytes(sbi, APP_MAPPED_IO));
-	seq_printf(seq, "app buffered cdata:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_CDATA_IO],
-				sbi->iostat_count[APP_BUFFERED_CDATA_IO],
-				iostat_get_avg_bytes(sbi, APP_BUFFERED_CDATA_IO));
-	seq_printf(seq, "app mapped cdata:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_CDATA_IO],
-				sbi->iostat_count[APP_MAPPED_CDATA_IO],
-				iostat_get_avg_bytes(sbi, APP_MAPPED_CDATA_IO));
+	IOSTAT_INFO_SHOW("app buffered data", APP_BUFFERED_IO);
+	IOSTAT_INFO_SHOW("app direct data", APP_DIRECT_IO);
+	IOSTAT_INFO_SHOW("app mapped data", APP_MAPPED_IO);
+	IOSTAT_INFO_SHOW("app buffered cdata", APP_BUFFERED_CDATA_IO);
+	IOSTAT_INFO_SHOW("app mapped cdata", APP_MAPPED_CDATA_IO);
 
 	/* print fs write IOs */
-	seq_printf(seq, "fs data:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_DATA_IO],
-				sbi->iostat_count[FS_DATA_IO],
-				iostat_get_avg_bytes(sbi, FS_DATA_IO));
-	seq_printf(seq, "fs cdata:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_CDATA_IO],
-				sbi->iostat_count[FS_CDATA_IO],
-				iostat_get_avg_bytes(sbi, FS_CDATA_IO));
-	seq_printf(seq, "fs node:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_NODE_IO],
-				sbi->iostat_count[FS_NODE_IO],
-				iostat_get_avg_bytes(sbi, FS_NODE_IO));
-	seq_printf(seq, "fs meta:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_META_IO],
-				sbi->iostat_count[FS_META_IO],
-				iostat_get_avg_bytes(sbi, FS_META_IO));
-	seq_printf(seq, "fs gc data:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_GC_DATA_IO],
-				sbi->iostat_count[FS_GC_DATA_IO],
-				iostat_get_avg_bytes(sbi, FS_GC_DATA_IO));
-	seq_printf(seq, "fs gc node:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_GC_NODE_IO],
-				sbi->iostat_count[FS_GC_NODE_IO],
-				iostat_get_avg_bytes(sbi, FS_GC_NODE_IO));
-	seq_printf(seq, "fs cp data:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_CP_DATA_IO],
-				sbi->iostat_count[FS_CP_DATA_IO],
-				iostat_get_avg_bytes(sbi, FS_CP_DATA_IO));
-	seq_printf(seq, "fs cp node:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_CP_NODE_IO],
-				sbi->iostat_count[FS_CP_NODE_IO],
-				iostat_get_avg_bytes(sbi, FS_CP_NODE_IO));
-	seq_printf(seq, "fs cp meta:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_CP_META_IO],
-				sbi->iostat_count[FS_CP_META_IO],
-				iostat_get_avg_bytes(sbi, FS_CP_META_IO));
+	IOSTAT_INFO_SHOW("fs data", FS_DATA_IO);
+	IOSTAT_INFO_SHOW("fs cdata", FS_CDATA_IO);
+	IOSTAT_INFO_SHOW("fs node", FS_NODE_IO);
+	IOSTAT_INFO_SHOW("fs meta", FS_META_IO);
+	IOSTAT_INFO_SHOW("fs gc data", FS_GC_DATA_IO);
+	IOSTAT_INFO_SHOW("fs gc node", FS_GC_NODE_IO);
+	IOSTAT_INFO_SHOW("fs cp data", FS_CP_DATA_IO);
+	IOSTAT_INFO_SHOW("fs cp node", FS_CP_NODE_IO);
+	IOSTAT_INFO_SHOW("fs cp meta", FS_CP_META_IO);
 
 	/* print app read IOs */
 	seq_puts(seq, "[READ]\n");
-	seq_printf(seq, "app buffered data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_READ_IO],
-				sbi->iostat_count[APP_BUFFERED_READ_IO],
-				iostat_get_avg_bytes(sbi, APP_BUFFERED_READ_IO));
-	seq_printf(seq, "app direct data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_DIRECT_READ_IO],
-				sbi->iostat_count[APP_DIRECT_READ_IO],
-				iostat_get_avg_bytes(sbi, APP_DIRECT_READ_IO));
-	seq_printf(seq, "app mapped data:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_READ_IO],
-				sbi->iostat_count[APP_MAPPED_READ_IO],
-				iostat_get_avg_bytes(sbi, APP_MAPPED_READ_IO));
-	seq_printf(seq, "app buffered cdata:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_BUFFERED_CDATA_READ_IO],
-				sbi->iostat_count[APP_BUFFERED_CDATA_READ_IO],
-				iostat_get_avg_bytes(sbi, APP_BUFFERED_CDATA_READ_IO));
-	seq_printf(seq, "app mapped cdata:	%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[APP_MAPPED_CDATA_READ_IO],
-				sbi->iostat_count[APP_MAPPED_CDATA_READ_IO],
-				iostat_get_avg_bytes(sbi, APP_MAPPED_CDATA_READ_IO));
+	IOSTAT_INFO_SHOW("app buffered data", APP_BUFFERED_READ_IO);
+	IOSTAT_INFO_SHOW("app direct data", APP_DIRECT_READ_IO);
+	IOSTAT_INFO_SHOW("app mapped data", APP_MAPPED_READ_IO);
+	IOSTAT_INFO_SHOW("app buffered cdata", APP_BUFFERED_CDATA_READ_IO);
+	IOSTAT_INFO_SHOW("app mapped cdata", APP_MAPPED_CDATA_READ_IO);
 
 	/* print fs read IOs */
-	seq_printf(seq, "fs data:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_DATA_READ_IO],
-				sbi->iostat_count[FS_DATA_READ_IO],
-				iostat_get_avg_bytes(sbi, FS_DATA_READ_IO));
-	seq_printf(seq, "fs gc data:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_GDATA_READ_IO],
-				sbi->iostat_count[FS_GDATA_READ_IO],
-				iostat_get_avg_bytes(sbi, FS_GDATA_READ_IO));
-	seq_printf(seq, "fs cdata:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_CDATA_READ_IO],
-				sbi->iostat_count[FS_CDATA_READ_IO],
-				iostat_get_avg_bytes(sbi, FS_CDATA_READ_IO));
-	seq_printf(seq, "fs node:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_NODE_READ_IO],
-				sbi->iostat_count[FS_NODE_READ_IO],
-				iostat_get_avg_bytes(sbi, FS_NODE_READ_IO));
-	seq_printf(seq, "fs meta:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_META_READ_IO],
-				sbi->iostat_count[FS_META_READ_IO],
-				iostat_get_avg_bytes(sbi, FS_META_READ_IO));
+	IOSTAT_INFO_SHOW("fs data", FS_DATA_READ_IO);
+	IOSTAT_INFO_SHOW("fs gc data", FS_GDATA_READ_IO);
+	IOSTAT_INFO_SHOW("fs cdata", FS_CDATA_READ_IO);
+	IOSTAT_INFO_SHOW("fs node", FS_NODE_READ_IO);
+	IOSTAT_INFO_SHOW("fs meta", FS_META_READ_IO);
 
 	/* print other IOs */
 	seq_puts(seq, "[OTHER]\n");
-	seq_printf(seq, "fs discard:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_DISCARD],
-				sbi->iostat_count[FS_DISCARD],
-				iostat_get_avg_bytes(sbi, FS_DISCARD));
-	seq_printf(seq, "fs flush:		%-16llu %-16llu %-16llu\n",
-				sbi->rw_iostat[FS_FLUSH],
-				sbi->iostat_count[FS_FLUSH],
-				iostat_get_avg_bytes(sbi, FS_FLUSH));
+	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD);
+	IOSTAT_INFO_SHOW("fs flush", FS_FLUSH);
 
 	return 0;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
