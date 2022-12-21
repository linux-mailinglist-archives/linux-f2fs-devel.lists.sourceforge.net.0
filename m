Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB86536FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 20:27:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p84k6-0005Js-PC;
	Wed, 21 Dec 2022 19:27:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p84jr-0005JT-UF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 19:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFLhBgUzjHTTnYf7gAqcOQi3yrIGNEUjIzeEgr4EQ6w=; b=lcr3cMqSNuTwNL1oAZmIp2gGf5
 lnO0Vv53vz9WR3t/izOPN97mA2+0MMMm7HiwcjF0qBCtbQ5/RRyZ4K7NQRlb6pCJNVaNWeyfR2h8K
 4svUwL5XJQXFLgLAB9xdTbX6nvC1HUYxH5QGVyaRvC5f6MFlRCf02r9h20Uq/W7C9Kk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AFLhBgUzjHTTnYf7gAqcOQi3yrIGNEUjIzeEgr4EQ6w=; b=G
 sJaSgCErcuAdXRrcZgk8e5k/r/jnPsp8mUZdyULvzQARouXvti3TIm/7a79oAHNs/bDOllEnU5mLd
 vX9sgCb3p1rD/0up+KhkmcUNhm2JxkO+mIOBfwezeT8p1fXmzbvgw7imcsqzebLrXB+er6kj6yOvu
 X0+no+4ziRZb6H0k=;
Received: from mail-psaapc01on2097.outbound.protection.outlook.com
 ([40.107.255.97] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p84jr-0075uc-Cb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 19:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfnmc/qv1axlXI0nF6WR8PUQWPv/5mZTn3IQGKBnrZ6aDktEnHXxg+Iwu/ek3bG6SQywpJJcehghPg+O5BLPUfQVECRo7/uz6uT4MndMTwsbxV4JZnRHrOtDTFOfmt421/nPTwxFarCT8bhgiYXnkDuu0kR6S2HKZC0YAdbReF86Onczg/IJADMo6WmwR4/eGytDgqtIiHwjhuehhygJpjdgSLqh4PlL1zK6H2qYH44MfvdaTLRNJ2Y09IkrPBlq8FeKLr+TMFaGfu2pH3aUG2z7Mz/C3mn3icmFg2cRb/h/4f9G4OlQurxp2iRH2EEwvHlcrizVJvHzvQXLKDYIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFLhBgUzjHTTnYf7gAqcOQi3yrIGNEUjIzeEgr4EQ6w=;
 b=gdJLpNwdf6s+anxnG0ccSbC9L2lFwoVzwCwV1BErrqr9yA4hauZC0vz1CFR9m6Al9ycoLXXYbMQHJqn2nDQwEdDIKK+L6+yUo0SruxFARb7fnSzPieXuOhEAthBewhb8DmMtYkWr/yJh5E+3czhwjR5zeUY2sCaD4JqVyzieO+EOfw8b6k9qJbHYgG7Su+sJMWVPA9XRSB/bi+bV6fVN5Z9ILWJ1BdElAJS7ajhFSZ3VVUWsYj9gHS1M0GmMyWTghaIP8Gy8v0YEXB/V4l+pEjq3DKrhvKFlF2ndVV5TwddusdNfECtjey0w0qeVG/ZPkjSWTKH+V4NFF9VWV+Vp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFLhBgUzjHTTnYf7gAqcOQi3yrIGNEUjIzeEgr4EQ6w=;
 b=VSneaMOfY5VzxnTtndySYp2pOjZqv7tEtM90LTvz7StISngBj37AqEz7fsNMSQqARgKzggbu2y4viFzwZ9DkT2jeRuz7T39ARog2MX56jh1T9BH4UrGoSJjTbnGffGG5x0CMEEL+P69HC+sT6dkz2vwsKLu3AeHGgYmbJqgr+SHWFsmNsa2GYcVtMXUnbYmLTKeFMK8nFQQmiG/5HvP3NMqCVt4WyS525BiPEZXhowD6TP9AwaXtVEg8MFI0Jw73OFHrWtsjDdoPxScANSK1Q3lCzXA4gp+2fAG9Cpf+MVEVCjQfqQKCOimMw/1XpN8ZaR8N6lmPPlJgco0kV+9s8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4106.apcprd06.prod.outlook.com (2603:1096:4:f7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Wed, 21 Dec 2022 19:26:44 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 19:26:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 22 Dec 2022 03:26:34 +0800
Message-Id: <20221221192634.18068-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: e395bfee-5ee4-4d9e-e801-08dae3894b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LpKSz62Pj8zCVmLIix8s7MKXoFNeG5NC2HwuP57bidpiH1tJ94FVMOv2DaLhi/cCFPaZIiH5b8kIIQKWXGqEmndqJZqJt9pULIdEvUr92MDD3SWwsKlmQX/vMgubyIgFVQ+TE0lEBJ4oczTg2SQuJ8Ynpio0xrDQvw9oapv1Zt6U+pnuav+x1wr6UGXdowntYJEK9ZtmVTZUcehcmPqapbUCLxZw4r36Wcf9Ja6hQ7HXIgwrNggmQkZyDRMZRV99mGgjGSnbBazDicjoxNfbT+9gv6ydMG9/iewxbN9RCopWaX0zEIGaJlWLTIQWxpXASpAggsJUkwvlVLzQf7CRHAPQ9ywPj2uby76lBzVblxh7ctncZmWrtQ9kdauveqPQ6vL5VTYK6+GKoU2CZbkJ377JW7NMUeJ5e+l+Tvgw8uk6TYAWVhakJPB3O1DEXDIt9CesiUUsbHfuo/ed6mCllyeKZ/BELSjhW+4Oo7mINiLRIx8K38qCOVQJ187tmfJy0tYW6vkgKrt5O8Fc4QognYHPZNFZWkPqEROapDptINg/6eA18hyQEeSAqkSC3cqDEH1D1o3sz1B4uy2lKWMk9CplapKvWAmVmkxp8uF3o+Gv06FGUGFFRBy6pJA7O/Y2x2Jk2tgNCIOiyZygurvQ+3BDrRJUdPCIsvlZQr0LupJXG1jDSRtTpSGAZGn17pXfwsOV2JcKceX7plkRF6CXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(36756003)(26005)(186003)(6512007)(6506007)(107886003)(8936002)(6486002)(4744005)(6666004)(5660300002)(52116002)(83380400001)(316002)(2616005)(66476007)(1076003)(8676002)(4326008)(66946007)(86362001)(66556008)(41300700001)(2906002)(38350700002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QX1o7NNt4DQsbTbnLFQFCDSWDqke/mpyFozWtPXN0U+lclpZi3zr6yKvPd2j?=
 =?us-ascii?Q?QGQu3/UvZZZsNk7vSSwvlkZJgZ9s9oR6kYf6EvCmTkFoIJfWip8iYPgC2lyB?=
 =?us-ascii?Q?oTZA2wNn3e63HyQXVgqMHVVYHpXEw0v4VL1/UwLkks/FH6Md4KNnYXM5iqXg?=
 =?us-ascii?Q?QDRrBJurt+0W58OjHxH9Ef7J8RocYg4np/llzIFSxTrPYhzB34Sf3AyQMDxI?=
 =?us-ascii?Q?0Rb8U8jRoYTxgZbyAhKY22MFCKwwkdlDhUrg0302HJWmp3rq/5kV6N2U7GN+?=
 =?us-ascii?Q?y2x20rpaedWG09U/LUwVyhRNsPthLV+vQlNx7cDaDUBYKlLtz2EpOHWjpdOf?=
 =?us-ascii?Q?bjx5u3NYh47KZuuSt06JMayLBnW/XjPy5SAmEcPAOJwFxmQL5wClUiUHTmxp?=
 =?us-ascii?Q?7j/qSqenGkk9lML8hbNT/A5Q/Mxump3rd89LtadcwgF9P6M2mYGQN3xGpcca?=
 =?us-ascii?Q?dfSnteVUdzDym7flddibFdxGyab4Wk6VOe0sQei6fZ6LrbI7cWtD1cZMo0Kx?=
 =?us-ascii?Q?gXYxrx13QTP9XQFmYqtBAPS6i2dUFBrjFCAhYF3AUjGVj62y+VxUjlcGCm2t?=
 =?us-ascii?Q?6iAIg9wUzmZ3b7C1/dq/2KhzCaxHi4fdrKYD4R47mJx8FZ0AqX0F30vONj9I?=
 =?us-ascii?Q?7OfTC0AoMrJCEjShniPN1qqvUnjEW7TwlWtfPu+ZNEydS4+hvH46VfkfemLy?=
 =?us-ascii?Q?WSJgxBAuyujcfQweZFId/lq7AuuaKwEOSmwBJyNuQH7DtGrMpa4G+yjtxH5j?=
 =?us-ascii?Q?ZvxJl2og/v02D5k3fcQmBzohuRvohmbMSBP63Jom82gzzDKLUFtCzvtcYMbZ?=
 =?us-ascii?Q?mD0Z1gLP2HlP1KvVk+uJvvUPScOksTq6z04LPO/lLtDl4ermOksLiki5bmDe?=
 =?us-ascii?Q?mrIyWgaDzfAikssJW8gz1amtcSjiuaefE1S+0ZHq1Wacbj/Ctawx2idetjLx?=
 =?us-ascii?Q?xhuDrPukLtZ5sF2JZCx5VOdjyc+hBl41SRbrGgYFxE2VLa5MnYfPPSqsUKFn?=
 =?us-ascii?Q?Y3AZFYT8SVddhyf0OC4vplLnvS1JovNLEDD8I6WoaGch61uAA8H3eh+Ot7Om?=
 =?us-ascii?Q?LDXe/E6ARmOxclSU44YQK8xBesU3ECubKNB+LDkT4MiDtNhQ2QD8Brl81t96?=
 =?us-ascii?Q?6PPrjyf5PdzLM7v3xFjaylVXjbsmM7h5IGxKEToKQLD3/YgrWKMSloXz/V04?=
 =?us-ascii?Q?zaLuzGwLY4IPruxiazuQ/NgbqiUb00d/NXP8H8fhNgcmZ285jhxBhqmIB9fq?=
 =?us-ascii?Q?sWiU1SseLq5nlpZtvaU1CU/aa+9S62/dUpdKGug/UcghjpkUqT/wG7S3RYrC?=
 =?us-ascii?Q?xcCY1ZD8YP62hNVWFI9Upds/LIEWQ9frIlvqA0RxMgsIhycqqOgdrKMk+dqf?=
 =?us-ascii?Q?U8gvzFGQisQmGlKwCoyq0s7s2QLNlFny3VzSk9820RmUHADBfYfpK6LKZz9I?=
 =?us-ascii?Q?E0WZAjxqJw6L1uLVGsIHwcgoDGp/vEhDcfv7A+aKskMwUqqQiPiwIeg9WIc/?=
 =?us-ascii?Q?4Hzyj/nLzA6LPimknSRf99kgl4319E/sgW7w22c59TVr5D7fEWHpfo2oQz/M?=
 =?us-ascii?Q?z2Vrys6Q/xtWWxXEET0nNJRX0yZigvTwuHw3n3TR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e395bfee-5ee4-4d9e-e801-08dae3894b25
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 19:26:43.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSWkNq824Lyin0SIaG/g4nsEFXgDrKNfy0pN+0g0mh8KLvK67kF9PSqAjpURdsgdN2vA3lNCyXk6YuE2EreTQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4106
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just cleanup. Signed-off-by: Yangtao Li <frank.li@vivo.com>
 --- fs/f2fs/f2fs.h | 2 -- 1 file changed,
 2 deletions(-) diff --git a/fs/f2fs/f2fs.h
 b/fs/f2fs/f2fs.h index e8953c3dc81a..3e22de1f405e 100644 --- a/fs/f2fs/f2fs.h
 +++ b/fs/f2fs/f2fs.h @@ -1384,8 +1384,6 @@ enum { MEMORY_MODE_LOW, /* memory
 mode for low memr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.97 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.97 listed in wl.mailspike.net]
X-Headers-End: 1p84jr-0075uc-Cb
Subject: [f2fs-dev] [PATCH] f2fs: remove unnecessary blank lines
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

Just cleanup.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..3e22de1f405e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1384,8 +1384,6 @@ enum {
 	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
 };
 
-
-
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
