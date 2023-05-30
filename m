Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2BD71558D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 08:35:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3swq-0000y7-PY;
	Tue, 30 May 2023 06:35:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q3swm-0000y0-TU
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qoQD3r0Sdr+O7Y59/dBqGgRWCYR1QU4dTezEg7utQsE=; b=BeIp0pJ1NHCxAT0kUWC7nTaxTR
 hYnw3Rypi6pnWY+Q+5O0vkIIHjtu1Wg9nev11/vvcRFm2szfGeyh7+4I7HiqzUfZs2Z5Ekkx4n/VW
 xEsrRBTALzcMGmGiNCXvnqQtFFAybmmia+nKJEZV1apMZkwwNvhmi+GiGPrckcFQ5xkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qoQD3r0Sdr+O7Y59/dBqGgRWCYR1QU4dTezEg7utQsE=; b=l4qlNwe7V8mNwue7BAnaiN2ZzE
 wMfnaEvG3fIdjVUQOhLyevBD6TUJau+ZXP+HGqnZM+mSR2DtSYhHDAWQ8xtF7cvkAufdBZmuebesH
 xYDw5FMfXCP/rPdkXgHsXLzq4r2IxtElLwI2ECEvwwm9p11WnblZ5l82PGSAlu5hRA5I=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3swg-006JuY-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 06:35:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSTdMVQdJ7UGVZL5N7Un00SS4AJJNyhl3rPvuonJ/d3LvUUwI2ty+rFAEiKdK39+fzPvNYrn5U/OBX7wVBuRAChKS/Pdz3Ld4kHmJL74doGsn3jHvNWF5r0AR0gcwlD7FxFeWP2QCXUy3WjdwVQQ+1w6zrzZk2nh6H87Sgv0pqGBCBSpuK/LEPdiASy8xqr5FkusEhAARxaFSuVHqchTUsTYYgj6cQBZN6hhjZNJ+g5SwYJ5IJYkqqU3zdeT/HLVNZLNk7iOR36n7/sNnmhueTWiCoumMnyjfD5gzZKNtgyowUqaSByV3U2bVHfevq/6P7+8fSdAIl4pleF11Vn7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoQD3r0Sdr+O7Y59/dBqGgRWCYR1QU4dTezEg7utQsE=;
 b=cZ9mcStOJuZPzzj5DK+PFYUukN7ab1zXCP2RTYfkbtbo+KSC7r1FXmI/v3Ftc3D6j+VWvsU5jaLh9U3zOeCKltAyf7kAj+yKtdQVNfQxezR2LwfiqCvST8H6X0miuAeGFfn2a8ETvar5kSUWno1bCPw8O4kohfp7j/KQP/fp7sfu3p2g8S44LMz/600LSLJW5ScEe0L0uyMCMoPcBWDumNpHItCg1CQ5AiY2Xgld/vNOUNw8Fag7qOpMtfrvguFjWqP4XIeEopm4vfYIyUKccYKmJCFOsMgpTycG4vxDHOwvH/3tzzWZBAJwZB3Id9evDvTNT+yBfBNkb0DGMQqfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoQD3r0Sdr+O7Y59/dBqGgRWCYR1QU4dTezEg7utQsE=;
 b=ZvT2vvjXnPm0QtdZ0bSIfwXGjXY22wAz+pdZDCbUAr56gGfkn7+iADyLVXDQ96/U32UohsHGevIj7htCip6+wmHrgNotXe5h6wyvPC3ir3698cZ8XJ093Oc05hMddMiTGhZ9AjicLlZEoCvPOG6BEHWtiv5isSwXUVxh/5/NgQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SI2PR02MB4777.apcprd02.prod.outlook.com (2603:1096:4:121::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.21; Tue, 30 May 2023 06:34:50 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 06:34:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 30 May 2023 14:34:07 +0800
Message-Id: <20230530063407.3305344-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>
References: <20230529013502.2230810-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SI2PR02MB4777:EE_
X-MS-Office365-Filtering-Correlation-Id: aecb03b2-a9d0-49ce-d2ac-08db60d7f838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjD7qPG0Fz1ZGnYKZ4KrqPet0RyRn+IvgLwoxlUh9cj6cLqUqGzzrtKuKeUF4/Jsl6pZm84t82X3Si+vqrQXX92qDwJMtHxek+OKs4EZ3E06Ma3W0LrE8jJ6OuUcNzg42790hsVTfRGPSQhI5NQ2YuUA6SvWc9731NPbGeyFgvNIQBhwh4eix1tqUELWYXuf2QXMbEKEpGsNuVb4uxhFN89g0Wy61fiZSxmlnhYO+FRJV0Z4YyxqgazOnJd+ezO+aPsPYiHw+3wNwp2fvtJTrZpmSiZwWb7PNLxh/kv8njFoc7GXbZVftNnGYsyy2niA+e7XIsIQkn/oWoXhBiMJzcGmBAXJnsKv7grsIjuqqllfDvBgMvEl37Hbq1pvp/TjjVwAGSxvc3XomsHDjqoBjG+qW6P0HfLD5CP+AJhyit/wEOqrNo69rlLHDjkgoDAgwX0FiVtXq1iqxrZZM/lLlSPT8fV0Y+0qi0VzzMD0rRlJ8kk35bxj3R4+ETHeR1qZ7JdOMV0nJPlMoqryeWAG5V61upsFTVhm68Z8HpFYu6ET3sYoiOMZXbImO4M0nmPPYFgMhnsOGm2ENpR5x9h8L+6JwL6cnz1kj7WD+uaXEdP28tQLbJ4I2zReNeUKyceN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199021)(2906002)(186003)(6506007)(6512007)(30864003)(2616005)(26005)(1076003)(478600001)(83380400001)(6486002)(52116002)(8676002)(38350700002)(8936002)(38100700002)(41300700001)(316002)(66946007)(36756003)(66476007)(66556008)(5660300002)(6666004)(86362001)(107886003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+C5zl1CN0bl0TEdUPSUEPWU69W0GPF6QjS5sf1TvlFymW/h4scsxrHYqkgfz?=
 =?us-ascii?Q?jaZgNA5JdIIRaP52c0aUuOnUAt1QYM1bssb3rfMn85+dRg9KNc28aTsWY9oa?=
 =?us-ascii?Q?dkUYklTRe5xEIkAFJQVYPVHg2y5A2pOKvlDZY/Wscx1rK2S1Y18Tn1keRmbk?=
 =?us-ascii?Q?yqYlplrwcnbcppecVHQv/n3UgZAjjGP2J6hc4MA7GOG+ln9I047yOcxIRAc1?=
 =?us-ascii?Q?f416VyCLqdpjxKMbYkimO3BX93P2G5YkwjqQyIbLW4fU2iyB7kENsHfGKiL5?=
 =?us-ascii?Q?6+WxLOOhtROHAqWORuJ9L+v1Uv+OqmaASnsEVmUwsIztH3tLLZpDFB83eO1w?=
 =?us-ascii?Q?4+cpyNDFKzIvfcIELQ0IZwk8XXDgfBt3bfnp5sMTVXFYyLEr5OfJG/edo4S1?=
 =?us-ascii?Q?pqqrIYCPgNBpp+hBKuLBd1PoEgg+JP9c04ufu7E0bq95zZ6iItltgjKAkUms?=
 =?us-ascii?Q?7VKSQI9pDZjxHejH6LK/tnkK9x3VVTivtK8oPaHyhAQ6E26NP4ZnLDly8p+h?=
 =?us-ascii?Q?rje7x22fTgbfG5nlxY3NZIY7eox8uAtg60VcpAcmKjfdSbUOecc4xlr9MlA1?=
 =?us-ascii?Q?B1e+FmJK1/L1CVQHRcKUtWScclUkloJLy13nUta3FTQl/6OZAn+ik6SRxDi8?=
 =?us-ascii?Q?4BhkM8g2uEV1yeNZSb5wxlFlm+WVHm+lpztjb6LSpeONKmqxADub/fqsBh7o?=
 =?us-ascii?Q?FAcK1aWYn5E4NW3gJtkaygmRe7Nj7kHNrZvYHcPcnB3rb5nmj+lw9WQBmvxX?=
 =?us-ascii?Q?XtRrQLiVYSLMTQTuEMjAddC4qB3i3Jm+nSG5hc7pTVRsU6tpWHiMdRkbagc3?=
 =?us-ascii?Q?llhfXmcS34a5Y4AHSZhD+GlQRkg4wGpNDOH9IdINCJVeqrfsExWksyLZ50sI?=
 =?us-ascii?Q?s2VTXC5kjVkbPVBtrnBPXguLQ9tfibJJz3N0gJDK/SNES7OyWMWSXgaBWxmX?=
 =?us-ascii?Q?8NEWacvJ2h37zSdB5LiMqIl0sN3VSlGUAidBx7MyIqdbqSkvt+IJpCEW1W9q?=
 =?us-ascii?Q?/PlOFewnfJahrhSduE4SYRxKy+kKRw2h7D7XxU9UglEAu2u3c2smE0U0WNLX?=
 =?us-ascii?Q?cgLa7wQ6vZuBR7jg0al6dUaRVFe3tnikjWAq/P7oQSIbuP8IkppIKPHHM4YJ?=
 =?us-ascii?Q?ac1TQpct7iD6rPYd7v9auCXedwdOoB520TpzWSdyTVk7kFn6bU+wOAkLNeKl?=
 =?us-ascii?Q?tZCeOMFo8ehOXyXpn4kMbKKgEnSjT+fyQLNsZfK2KSqJXwX+Z2YUlI9zeufy?=
 =?us-ascii?Q?jKyi7ltS3AxfzblpKBUEYStkNR0mlp4igNoIgOsWvWMJ7WYRtHGosmX30ILu?=
 =?us-ascii?Q?A4gTYdAmCCU/TpV1ueebuJWV7343nIZXyD2JbV7k7UVn+S/X4IAIVsjWL7zh?=
 =?us-ascii?Q?2d7x109xezXOOYefgPVhtp6Kn1XiJHZMXvlKsnE5CO0JYQws6TLGfSy7KLtl?=
 =?us-ascii?Q?3g1g3aBaa+odTY44KbbgCBXzrU0osgnMF6rHB5RcVs0Y5M22sx4E/Hiup4Y6?=
 =?us-ascii?Q?bqi6sFMoO5OiV8YvNUQ5xz4wKK4gHYf24KIMgVhigS/gfANNWw1R44c4gewN?=
 =?us-ascii?Q?EqDePB4qgcvgPP+GnnFb1jbp2aBGdYgCH5SwOIMe?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aecb03b2-a9d0-49ce-d2ac-08db60d7f838
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 06:34:50.3626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 31BRg7D0l38u3yD906YrLbQZs5yk8uFhe98i86Fe83lY9B2S7HRLSTlGaTij2qfEvtql3V/3DraJx2WghLuK4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4777
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces two ioctls: * f2fs_ioc_get_extra_attr
 * f2fs_ioc_set_extra_attr to get or modify values in extra attribute area.
 The argument of these two ioctls is `struct f2fs_extra_attr', which has three
 members: * field: indicates which field in extra attribute area is handled
 * attr: value or userspace pointer * attr_size: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q3swg-006JuY-P4
Subject: [f2fs-dev] [PATCH v2] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces two ioctls:
  * f2fs_ioc_get_extra_attr
  * f2fs_ioc_set_extra_attr
to get or modify values in extra attribute area.

The argument of these two ioctls is `struct f2fs_extra_attr', which has
three members:
  * field: indicates which field in extra attribute area is handled
  * attr: value or userspace pointer
  * attr_size: size of `attr'

The `field' member could help extend functionality of these two ioctls
without modify or add new interfaces, if more fields are added into
extra attributes ares in the feture.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v2:
 * fix compiling error if CONFIG_F2FS_FS_ZSTD is disabled by adding a
   helper f2fs_is_compress_level_valid()
 * fix compiling warning for casting unsinged long long to pointer

---
 fs/f2fs/compress.c        |  34 +++++
 fs/f2fs/f2fs.h            |   4 +
 fs/f2fs/file.c            | 273 ++++++++++++++++++++++++++++++++++++--
 fs/f2fs/inode.c           |  21 +++
 fs/f2fs/super.c           |   2 +-
 fs/f2fs/xattr.h           |   1 +
 include/uapi/linux/f2fs.h |  35 +++++
 7 files changed, 357 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 905b7c39a2b32..3a2c05c849b0a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -55,6 +55,7 @@ struct f2fs_compress_ops {
 	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
 	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
 	int (*decompress_pages)(struct decompress_io_ctx *dic);
+	bool (*is_level_valid)(struct inode *inode, int level);
 };
 
 static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -232,6 +233,7 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
 	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
 	.compress_pages		= lzo_compress_pages,
 	.decompress_pages	= lzo_decompress_pages,
+	.is_level_valid		= NULL,
 };
 #endif
 
@@ -308,11 +310,24 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool lz4_is_level_valid(struct inode *inode, int level)
+{
+	if (F2FS_I(inode)->i_compress_level == 0)
+		/* lz4 */
+		return level == 0;
+
+	/* lz4hc */
+	if (level >= LZ4HC_MIN_CLEVEL && level <= LZ4HC_MAX_CLEVEL)
+			return true;
+	return false;
+}
+
 static const struct f2fs_compress_ops f2fs_lz4_ops = {
 	.init_compress_ctx	= lz4_init_compress_ctx,
 	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
 	.compress_pages		= lz4_compress_pages,
 	.decompress_pages	= lz4_decompress_pages,
+	.is_level_valid		= lz4_is_level_valid,
 };
 #endif
 
@@ -477,6 +492,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool zstd_is_level_valid(struct inode *inode, int level)
+{
+	if (level < zstd_min_clevel() || level > zstd_max_clevel())
+		return false;
+	return true;
+}
+
 static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_compress_ctx	= zstd_init_compress_ctx,
 	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
@@ -484,6 +506,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_decompress_ctx	= zstd_init_decompress_ctx,
 	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
 	.decompress_pages	= zstd_decompress_pages,
+	.is_level_valid		= zstd_is_level_valid,
 };
 #endif
 
@@ -508,6 +531,7 @@ static const struct f2fs_compress_ops f2fs_lzorle_ops = {
 	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
 	.compress_pages		= lzorle_compress_pages,
 	.decompress_pages	= lzo_decompress_pages,
+	.is_level_valid		= NULL,
 };
 #endif
 #endif
@@ -542,6 +566,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_level_valid(struct inode *inode, int alg, int lvl)
+{
+	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
+
+	if (cops->is_level_valid)
+		return cops->is_level_valid(inode, lvl);
+
+	return lvl == 0;
+}
+
 static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index faa27f41f39d4..b92b96eb133cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3475,6 +3475,8 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
 void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi, struct inode *inode,
+			u32 *chksum);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
@@ -4232,6 +4234,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
+bool f2fs_is_compress_level_valid(struct inode *inode, int alg, int lvl);
 int __init f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
@@ -4296,6 +4299,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	/* not support compression */
 	return false;
 }
+static inline bool f2fs_is_compress_level_valid(struct inode *inode, int alg, int lvl) { return false; }
 static inline struct page *f2fs_compress_control_page(struct page *page)
 {
 	WARN_ON_ONCE(1);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78aa8cff4b41d..3de64ce8dd491 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3376,10 +3376,12 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 	return err;
 }
 
-static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
+static int f2fs_get_compress_blocks(struct file *filp, unsigned int attr_size)
 {
 	struct inode *inode = file_inode(filp);
-	__u64 blocks;
+
+	if (attr_size != sizeof(__u64))
+		return -EINVAL;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3387,7 +3389,14 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
+	return atomic_read(&F2FS_I(inode)->i_compr_blocks);
+}
+
+static int f2fs_ioc_get_compress_blocks(struct file *filp, unsigned long arg)
+{
+	__u64 blocks;
+
+	blocks = f2fs_get_compress_blocks(filp, sizeof(blocks));
 	return put_user(blocks, (u64 __user *)arg);
 }
 
@@ -3905,10 +3914,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_get_compress_option_v2(struct file *filp,
+				       unsigned long attr, __u16 *attr_size)
 {
 	struct inode *inode = file_inode(filp);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
+
+	if (sizeof(option) < *attr_size)
+		*attr_size = sizeof(option);
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3922,31 +3935,42 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 
 	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
 	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	option.level = F2FS_I(inode)->i_compress_level;
+	option.flag = F2FS_I(inode)->i_compress_flag;
 
 	inode_unlock_shared(inode);
 
-	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
-				sizeof(option)))
+	if (copy_to_user((void __user *)attr, &option, *attr_size))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+{
+	__u16 size = sizeof(struct f2fs_comp_option);
+
+	return f2fs_get_compress_option_v2(filp, arg, &size);
+}
+
+static int f2fs_set_compress_option_v2(struct file *filp,
+				       unsigned long attr, __u16 *attr_size)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
 	int ret = 0;
 
+	if (sizeof(option) < *attr_size)
+		*attr_size = sizeof(option);
+
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
-				sizeof(option)))
+	if (copy_from_user(&option, (void __user *)attr, *attr_size))
 		return -EFAULT;
 
 	if (!f2fs_compressed_file(inode) ||
@@ -3955,6 +3979,14 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 			option.algorithm >= COMPRESS_MAX)
 		return -EINVAL;
 
+	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
+		if (!f2fs_is_compress_level_valid(inode, option.algorithm,
+						  option.level))
+			return -EINVAL;
+		if (option.flag > BIT(COMPRESS_MAX_FLAG) - 1)
+			return -EINVAL;
+	}
+
 	file_start_write(filp);
 	inode_lock(inode);
 
@@ -3971,6 +4003,10 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
 	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
+		F2FS_I(inode)->i_compress_level = option.level;
+		F2FS_I(inode)->i_compress_flag = option.flag;
+	}
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
@@ -3983,6 +4019,13 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+{
+	__u16 size = sizeof(struct f2fs_comp_option);
+
+	return f2fs_set_compress_option_v2(filp, arg, &size);
+}
+
 static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 {
 	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
@@ -4168,6 +4211,208 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	return ret;
 }
 
+static bool extra_attr_fits_in_inode(struct inode *inode, int field)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	switch (field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		return true;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_compr_blocks))
+			return false;
+		return true;
+	default:
+		BUG_ON(1);
+		return false;
+	}
+}
+
+static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	u32 chksum;
+	int ret = 0;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+		attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
+		break;
+	case F2FS_EXTRA_ATTR_ISIZE:
+		attr.attr = fi->i_extra_isize;
+		break;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		attr.attr = get_inline_xattr_addrs(inode);
+		break;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
+			return -EOPNOTSUPP;
+		attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
+		break;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
+		if (ret)
+			return ret;
+		attr.attr = chksum;
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!f2fs_sb_has_inode_crtime(sbi))
+			return -EOPNOTSUPP;
+		if (attr.attr_size == sizeof(struct timespec64)) {
+			if (put_timespec64(&fi->i_crtime,
+					(void __user *)(uintptr_t)attr.attr))
+				return -EFAULT;
+		} else if (attr.attr_size == sizeof(struct old_timespec32)) {
+			if (put_old_timespec32(&fi->i_crtime,
+					(void __user *)(uintptr_t)attr.attr))
+				return -EFAULT;
+		} else {
+			return -EINVAL;
+		}
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		ret = f2fs_get_compress_blocks(filp, attr.attr_size);
+		attr.attr = ret;
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_get_compress_option_v2(filp, attr.attr,
+						  &attr.attr_size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int f2fs_ioc_set_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	struct page *ipage;
+	void *inline_addr;
+	int ret;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+	case F2FS_EXTRA_ATTR_CRTIME:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		/* read only attribtues */
+		return -EOPNOTSUPP;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_sb_has_flexible_inline_xattr(sbi) ||
+		    !f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		if (attr.attr < MIN_INLINE_XATTR_SIZE ||
+		    attr.attr > MAX_INLINE_XATTR_SIZE)
+			return -EINVAL;
+		inode_lock(inode);
+		f2fs_lock_op(sbi);
+		f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
+		if (i_size_read(inode) || F2FS_I(inode)->i_xattr_nid) {
+			/*
+			 * it is not allowed to set this field if the inode
+			 * has data or xattr node
+			 */
+			ret = -EFBIG;
+			goto xattr_out_unlock;
+		}
+		ipage = f2fs_get_node_page(sbi, inode->i_ino);
+		if (IS_ERR(ipage)) {
+			ret = PTR_ERR(ipage);
+			goto xattr_out_unlock;
+		}
+		inline_addr = inline_xattr_addr(inode, ipage);
+		if (!IS_XATTR_LAST_ENTRY(XATTR_FIRST_ENTRY(inline_addr))) {
+			ret = -EFBIG;
+		} else {
+			struct f2fs_xattr_header *hdr;
+			struct f2fs_xattr_entry *ent;
+
+			F2FS_I(inode)->i_inline_xattr_size = (int)attr.attr;
+			inline_addr = inline_xattr_addr(inode, ipage);
+			hdr = XATTR_HDR(inline_addr);
+			ent = XATTR_FIRST_ENTRY(inline_addr);
+			hdr->h_magic = cpu_to_le32(F2FS_XATTR_MAGIC);
+			hdr->h_refcount = cpu_to_le32(1);
+			memset(ent, 0, attr.attr - sizeof(*hdr));
+			set_page_dirty(ipage);
+			ret = 0;
+		}
+		f2fs_put_page(ipage, 1);
+xattr_out_unlock:
+		f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
+		f2fs_unlock_op(sbi);
+		inode_unlock(inode);
+		if (!ret)
+			f2fs_balance_fs(sbi, true);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_set_compress_option_v2(filp, attr.attr,
+						  &attr.attr_size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -4239,7 +4484,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FS_IOC_SETFSLABEL:
 		return f2fs_ioc_setfslabel(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
-		return f2fs_get_compress_blocks(filp, arg);
+		return f2fs_ioc_get_compress_blocks(filp, arg);
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
@@ -4254,6 +4499,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_decompress_file(filp);
 	case F2FS_IOC_COMPRESS_FILE:
 		return f2fs_ioc_compress_file(filp);
+	case F2FS_IOC_GET_EXTRA_ATTR:
+		return f2fs_ioc_get_extra_attr(filp, arg);
+	case F2FS_IOC_SET_EXTRA_ATTR:
+		return f2fs_ioc_set_extra_attr(filp, arg);
 	default:
 		return -ENOTTY;
 	}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0a17484443299..aef9c1fd37dca 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -204,6 +204,27 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi,
+			  struct inode *inode, u32 *chksum)
+{
+	struct page *ipage;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	if (!f2fs_sb_has_inode_chksum(sbi) ||
+	    !f2fs_has_extra_attr(inode) ||
+	    !F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+		return -EOPNOTSUPP;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	*chksum = f2fs_inode_chksum(sbi, ipage);
+	f2fs_put_page(ipage, true);
+	return 0;
+}
+
 static bool sanity_check_compress_inode(struct inode *inode,
 			struct f2fs_inode *ri)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 374c990810ead..64adaec4e98e0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1361,7 +1361,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			return -EINVAL;
 		}
 
-		min_size = sizeof(struct f2fs_xattr_header) / sizeof(__le32);
+		min_size = MIN_INLINE_XATTR_SIZE;
 		max_size = MAX_INLINE_XATTR_SIZE;
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index 416d652774a33..b1811c392e6f1 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -83,6 +83,7 @@ struct f2fs_xattr_entry {
 				sizeof(struct f2fs_xattr_header) -	\
 				sizeof(struct f2fs_xattr_entry))
 
+#define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
 #define MAX_INLINE_XATTR_SIZE						\
 			(DEF_ADDRS_PER_INODE -				\
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be1046..a8fdaa22c7bda 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -44,6 +44,11 @@
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 
+#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_extra_attr)
+#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_extra_attr)
+
 /*
  * should be same as XFS_IOC_GOINGDOWN.
  * Flags for going down operation used by FS_IOC_GOINGDOWN
@@ -96,4 +101,34 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_comp_option_v2 {
+	__u8 algorithm;
+	__u8 log_cluster_size;
+	__u8 level;
+	__u8 flag;
+};
+
+enum {
+	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
+	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
+	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
+	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
+	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
+	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
+	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
+	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
+						 * i_log_cluster_size,
+						 * i_compress_flag
+						 */
+	F2FS_EXTRA_ATTR_MAX,
+};
+
+struct f2fs_extra_attr {
+	__u8 field;		/* F2FS_EXTRA_ATTR_* */
+	__u8 rsvd1;
+	__u16 attr_size;	/* size of @attr */
+	__u32 rsvd2;
+	__u64 attr;		/* attr value or pointer */
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
