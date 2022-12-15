Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818B64DF92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 18:21:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5ruk-0008KQ-UJ;
	Thu, 15 Dec 2022 17:20:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p5ruh-0008KB-El
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 17:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fMGhzqbHoph5HyTpmTChWQXjN8JRq7iE2hoYRLdbyI=; b=KblQhYDD5dXA/XB8Y+4c1Jj5pM
 Np2bGzChF2LELJU47h/IHJ54DF9CQcFuJTVBIq+m/yQsMar+5c/3i8/+Khd2+TCYqfnYiSEJIoZ1c
 lc+qd51zOZQFpJYi/EqRR3RDjklWey8srNCvQELJAhFDuz/aFMK/m1o7gs/2UQZuTSpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5fMGhzqbHoph5HyTpmTChWQXjN8JRq7iE2hoYRLdbyI=; b=O
 RJeO3LjNDCt6YAFAeGioxj5RBxZAUFSuQPMJLOhXlAlKOhRDIl5CmkmlOp1hzfLhcKi+WS7HQtmMk
 KrdAjniIvObeVH4Mwrk3dTUiX3GeA98GYOUW9Fm/6HdKNF81UgvYNUlTMQxhynaERHyfZ4EnVsls+
 v1eyLPklSir2YRJ8=;
Received: from mail-sgaapc01on2134.outbound.protection.outlook.com
 ([40.107.215.134] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5ruX-000e2d-Cl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 17:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg8kXmlehprpkOFfW77jYavpTRikCZSNhjk2RKJxLBBBAoylRtezO+hohcRSMFHz6C2SOs6Yj68tSntB2Yw3gLn41Z/L2ksQ40iAyWEa6yc6Af3X80YrUsVe3vxcaxQ7ynYcaVasVNkAJR2pJ9mklDtV7MVYUhkNfnsyHtfZqOSIflIU3K8nbPCbz0b7c2Rk9rMZniEuVeMNdOuASK6eWkh8c36gqcZaLhK4UBVAPEyg/wy8qARuh1E0ILtQPJ/fZHS3TMtP8uDu4EoERh2kXlO6Ty8Obr4d5lqgpbGK9Nbaikh8+hnpShKHq0E30zChrsxZ4QwFC/65v0PTFuG5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fMGhzqbHoph5HyTpmTChWQXjN8JRq7iE2hoYRLdbyI=;
 b=lcKl5Sc1sFUaXvIiOBXb/bpp+Kf9QGJhkHtHmBQsOHN7tyeXrb962Nou2vo3xTfFzGslqPovc74tusD9W3M0CJq3rvb692Z4nwNdVqC1D/RekYSJnXW6MoX7G2kheBcbnoF2ctL8OlcvaGMCFZ+Wa42bNwXtpEGrrivCm7i8j9Ek3fK0xK/yUOK9oR/4VHq/ib6lQuc0KnNwSt8lzAlJh29iMe8r93sNljX/zaMdAG9CQQvo7QcVQZ9Xc1bWJg1nUNEGW1DoomSlFKiVMF4BXlmntaUdJ8mIWeq/TCgYwd/CNvCbd6C8VyWRdWoaLyvZuRqqJQoR12rNqD82nWwSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fMGhzqbHoph5HyTpmTChWQXjN8JRq7iE2hoYRLdbyI=;
 b=ER1aowdxrvpdfJ66zkEQOzxsC+Nz0nnKDHD4O8tRa3Lrx/WOj4W8jCwLy/iOCPcjaXinVG73k6CWY1GdxeQooBBOK5okvDUrGyXpxCtaL3OKo6tp99kSDkBMRpf7LiKrmWxgSHVJmUMsTCwJsqHgsRjh4KC/YyPE/egJvYc42Cj39CGNWBXzGUnUW/z7/BMszglAJQviHcOwyY6gyqw86M47YZho++G0ODCGPV+8j2n2c/U2gZ++xHc/xbh0BtHBnS58pOEOoIJ5AphetjBArPDSsjsiZEzbPpZ8dEMB0JMwIEjtvRsibc7VYQc6dk3VKZBuT4pA1Noy68Sbs+eRLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5720.apcprd06.prod.outlook.com (2603:1096:101:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 17:20:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 17:20:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 16 Dec 2022 01:20:20 +0800
Message-Id: <20221215172020.8115-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: e7188173-10c5-4d98-d9f4-08dadec0ad82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soGAme2tqoRRltfWd1/a3NCMvhlrlFPE15CrE3DHctZTOQNhfH453gCyv2vozRdJysOpNPkU266tW4gxiH0dGckMy6jhjFc3rH+lzmfqXcRa04/zyhXYtLa4M/5DQ1Pb9kKjT4tAmWz2JBtVQ6q0JKhNuVADKzEJbPBcS4tjQANzSbndjQehnyjxb48kot2JUXAX6VWDfp5Bc43ZBStYp6t0XXKhbgEouY53xQkcB1zWjc5L9fSt6TEtQ655MUOCbPUdnRvpwbuMx4QN8tsDEPu9D7Ej7ZqVmzWVFX0BM/d9N8yAMitWNPcT+8TVHxrp+TVRceucf2dUI7LGJb9TIu9cjIZGrAIf5DKtwCNobf8RpMyj7hN5nBw4sI7NWgBoSPfBML+JjGQl/sY/69qRHQdqwYT/PKPtwUqU16PirxYvgGlOWVXInShjAIBsqrmuV0sJxYO/6f4mV3JRvE22g4EpLdp2yPGdkEe1cZWfk+6Cjyxo1uEcL4LdoJ4oLSuGb0lrlAS9qmb+vlyBFcWiG5QF8ootwdA4WK6LM6sbHDMc46tV/5L/nvAw1x9fT9D3sqmuSj61lJj5N29pFBI5nNdAPUROc1A+oXjOZrxXqvQUzb2o+xKbPnaXCyL5ZFPHYUMIZ+7x6rKPLC2xSCBOc2zfNYCHhCw7SkVTpknR28nrmWoowiTGs+1VcOCSgjHy7yBJxwp+gQdIOS2TPxWDYqnDwmNE7U7Y/3he4Ni87z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(86362001)(41300700001)(966005)(26005)(6512007)(66946007)(66556008)(8676002)(186003)(66476007)(1076003)(4326008)(2616005)(6486002)(478600001)(52116002)(6506007)(316002)(107886003)(6666004)(38100700002)(38350700002)(8936002)(83380400001)(5660300002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BxnDXTFg2l5UKt07p9rctlL6xGMbKIMU3FVWoanaFQW46WH0GQWTRAtWKu/+?=
 =?us-ascii?Q?/V6wSbdYpzmv46SjQGkmSKiBoKu/vAmqlHmqHUbatTdRpkXlT/XfSidU3rXM?=
 =?us-ascii?Q?4oqkgbyfnMr/it2C3sjbMJO7jQNSa8/gNGIh3mJsu0ZB3CiDEPSsbmzFwBd7?=
 =?us-ascii?Q?M0AZ/RqwQBG1IS9AqM3ZsvYUbygcyDprm6tDIOF7DMIQHayu5bljstqXKL5b?=
 =?us-ascii?Q?0WCv87wAS89U6lM9dBz37zadPk/hTXWl/ge7rvcxMGn892sM0TCP2CPykfbI?=
 =?us-ascii?Q?AgWeTNBOhV4/oaIZo0VavpVTq8P3opZ5Wd5tW/pdkT1utkChyQgPy5mMxaAl?=
 =?us-ascii?Q?ULlwagiVVjmP601Fdl8ufuhvDfd+twv2nRLqsVS3wzeYh5KlRtOY/pbB06eC?=
 =?us-ascii?Q?vhYJRHiayKKhNhjFzrMRloLL7uMDkcicrJQOcF6ICZvoQG3weM657nSo0e9s?=
 =?us-ascii?Q?V0SvpETCu2OIe0U3WQIJ76OairrzvK1eF8FAp0IcAuvk0xAFumTjfNk7h3wa?=
 =?us-ascii?Q?t8QnttRGjOfh7pw6FzrpmyK90ElUWRsi5j68gkxrB4w1wSwPewL+cAF+4ony?=
 =?us-ascii?Q?x1olbLIpw6XpXhe4T1bjlPozl12z1wYo8XZpgh0te6IfE+Xv64sIzbBMRU/q?=
 =?us-ascii?Q?7P9tQRtXI6zc/Ep5MSGqvRka7bMEO9jaCQ35/TAi2eDwg8r3eXCBCbsNcNca?=
 =?us-ascii?Q?9OEVR/Gnn+1nClULaaTMLWSaHiSicrrgyKCfD1mrCt0rWJmyAdBWglZTWHdG?=
 =?us-ascii?Q?5alvOAEuNf/ibpwnU2R3aK2EP10F19zaTu30mWLqBAcDB6KR0gj1jB5GHCVO?=
 =?us-ascii?Q?lK4oZEY7T+o/fMftkhuLeaPbWygILxoAMfxWButL/iggiBoRdGm5lkjbkoha?=
 =?us-ascii?Q?jymJXe+H4DnsYSiobLwNxmTtbN5CZmPMbyeNUsg1LrwcoDolLcj6XR4RU016?=
 =?us-ascii?Q?6sRw72u+MP7VaWWddwRqhERGyxMsNHy5VuuxQbm836ZatiWj0l+JJvUQ9yS2?=
 =?us-ascii?Q?yPrsbQnMKLJr1SBW7YaqVWP8zi5sJLNt5RN1zakhrc+3+Rq3lkZIHwB0xXW4?=
 =?us-ascii?Q?515uSVrBm4rqqdbacYisubDC/WnNaKuSakeXUO05/xqBckW4gCsfKrqzIwTs?=
 =?us-ascii?Q?mQxIompZjnm0PIsWiP8J9V67T6Fn6UGwMrrPKWTn9Qed5jeZtiRPYzAJzFLS?=
 =?us-ascii?Q?pGXRR75hfwrOiom9uNtvyFHMGFH9fukhnGSszl2nnIwJkk7pPnFFaqB2K7P2?=
 =?us-ascii?Q?LGMGRYzvQzk7pNWUrOQWCHsID8Mp4lZAhm62avc7zAWU8NisGIEYipaWrZTa?=
 =?us-ascii?Q?yfW88UvNDRYdVSIMcajuNQusrxugBp2P8/UF90mjYZnjYjuEyxcD6Lrw9aSR?=
 =?us-ascii?Q?wZsL1z9liQa/6kRVpHZ+oDD2Fyl7wHEgYFt1kAyK6cnlcfEyzuShSYikJpq+?=
 =?us-ascii?Q?QWVscZUHJHJMIj6ob80V4O/KeDiReUXUgIlqCjNe6L5HJhPYsHeq7aHAGOFw?=
 =?us-ascii?Q?Nsfk/D/hAszk8xrLAWUj2IgsFmd2NXetC9ohlSG5lk2/enaCoT4kLPv+wzyd?=
 =?us-ascii?Q?W3FDfj6zYXwPFD/x6wKQZDvAYXxiW3zU5xds2hiw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7188173-10c5-4d98-d9f4-08dadec0ad82
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 17:20:35.4498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Bq3pQ+yDxiOWNKfV7gO/dKaYYXtJOOLUAJF2NuqyIZOum6C1crwrmr9HGY+kvZBRDVK/XDn8Xeb8zR4ydLujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5720
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From now on, f2fs also has its own patchwork link, thanks
 to Jaegeuk for starting this tool. Let's update it to f2fs entry. I've been
 focusing on android storage (especially f2fs) for the past two years. And
 I volunteered to be a f2fs reviewer, add my email address in maintainship
 entry of f2fs. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.134 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.134 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p5ruX-000e2d-Cl
Subject: [f2fs-dev] [PATCH] MAINTAINERS: Add f2fs's patchwork and add
 Yangtao as a reviewer of f2fs
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

From now on, f2fs also has its own patchwork link, thanks to Jaegeuk
for starting this tool. Let's update it to f2fs entry.

I've been focusing on android storage (especially f2fs) for the past
two years. And I volunteered to be a f2fs reviewer, add my email address
in maintainship entry of f2fs.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a608f19da3a9..655a8b68b332 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7886,9 +7886,11 @@ F:	drivers/iommu/exynos-iommu.c
 F2FS FILE SYSTEM
 M:	Jaegeuk Kim <jaegeuk@kernel.org>
 M:	Chao Yu <chao@kernel.org>
+R:	Yangtao Li <frank.li@vivo.com>
 L:	linux-f2fs-devel@lists.sourceforge.net
 S:	Maintained
 W:	https://f2fs.wiki.kernel.org/
+Q:	https://patchwork.kernel.org/project/f2fs/list/
 B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=f2fs
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 F:	Documentation/ABI/testing/sysfs-fs-f2fs
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
