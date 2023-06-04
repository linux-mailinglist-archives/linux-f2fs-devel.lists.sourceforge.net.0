Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D6721421
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Jun 2023 04:30:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q5dVJ-0004Jf-CN;
	Sun, 04 Jun 2023 02:30:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q5dVH-0004JY-V8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 02:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eAz7fNa2wfiIQPkGkOVa4YAhY+gP6df3jm74ZBnBoIg=; b=hxsZlbhN32keKVGe9qnYxDoSAa
 XVWm16rLUL8Br1g13m82mhCZhT8tZDIGY9ddnUtQI0x1jH6onBYl7Ur67h5JG/um3KMicqo/qoVO6
 0FO6UScFz18x/3PuBPZA48s6nBblURxGOupeNzUGbtmplsWfVwJ4QYHkqpX+UXiBtWBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eAz7fNa2wfiIQPkGkOVa4YAhY+gP6df3jm74ZBnBoIg=; b=g8alD7i4z8kYxX0XJxcs/hCbEA
 IJ+TgTfKv17eOp8x07oEoy3CoHp/UOOa93g0S1U8/z8fJb1W6FhWJxAwDmvnK1ZMle0x+pRzhMnuj
 eJpYbx5iyxLDGVzqbzyKXK71rhPU4qOgcGHffpUFjHhM/vL+qEiRUiskLaGNvDpXJ0YI=;
Received: from mail-psaapc01on2047.outbound.protection.outlook.com
 ([40.107.255.47] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q5dVF-00AOCX-9L for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jun 2023 02:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtI9s8tYY9/BVCKGFoQMp7MiTpQduaDZReZrzBlstlvvVGYwG1w5+IE3EeTH3rRdX4+Pt6yp7r2jlc89jIErQOtE9c3rah2XlGJMoWHFGRq0s1V6dxr4yMsq+vziyy7ZJlunbhqIxJeuC85bEz5Y0b3VJUoXqnLQ82VT5N9AFxinF/NIew5sDOACAHBi1bfbl5lFLbmpUf9QA9xnism8gdTT1oNXyAoEp2gxpvK1h5KOMj0Uj9IJegynwcsw/CImsjRiejrThBVlghJZgogllqPdmyt2FsQgs7chRT7h1c6tn6NN+uVb2y/qyRJIDCW0mpS7jmveJ1i+4faf2ZsKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAz7fNa2wfiIQPkGkOVa4YAhY+gP6df3jm74ZBnBoIg=;
 b=OFdEMLXZYtb+3CkRPEteidnktGFCoXd7XAtnp83TiFdBoKs3qmnRc6DQuoN8F/gpvPaNraV8LJAp0sj0pRN6ewgTaHnbFZmxzyeThrxocB5N7gyx+tKZ9Ig7Ir+NQnBDVvrXFeuU2/LXyLAubycn2R12MJcbmRa7EU8S3om+QKmEMiB48qC0xESTJXm12bIRNvBcl9FeAVrlSEqKA+TAem8tXGMBTHue5xVAqjcGFjk7rg88jliBnUgQN8PwoOx9GaAD3p8IFwms3KpqHuJuR7gI6+2g9Z2PAUolB9Y7GQihnv+TQGKaInt4nI/+oYb241NG61OJfI4FjevnUbE4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAz7fNa2wfiIQPkGkOVa4YAhY+gP6df3jm74ZBnBoIg=;
 b=sIiL1kCC5mZ1qvxBIX0Y2U3liNVa1C0LWtIRdx1GYkq0PAZWNJsktt8HsCyqr3zTLUqNon5C9PUamXEP8LcKqwiF7Uxp882nQsKbGuy/eEZ1B9ciS4EjAVIbqgJBnnhPU/jrZVK3aNeV26HpY/lEJwxW1CPPBn7ht3EFgC1o0UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 PSBPR02MB4438.apcprd02.prod.outlook.com (2603:1096:301:3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13; Sun, 4 Jun 2023 02:29:26 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6477.013; Sun, 4 Jun 2023
 02:29:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  4 Jun 2023 10:28:30 +0800
Message-Id: <20230604022830.14837-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <bfcb9d94-15a7-3dd7-7e1c-c041e3ee2769@kernel.org>
References: <bfcb9d94-15a7-3dd7-7e1c-c041e3ee2769@kernel.org>
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|PSBPR02MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 6803812c-d39a-40f2-fd31-08db64a383c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHaFOfONfift3ap6KwAsGUMgoWaGWjuq290g91c9lGwfBvW0ikg/Ql9cAgBQqrw8SiTaiWDaVpQ9dJnoIRTAYBnlGfFXMeliUnMtEw5F50/Ut8S3scqkWmch98SluTrz3idlO6Sn0BhdjUCMqBzlOGADZYmO4FsEWlkAdRhINDESiVGlpGNd9opTGAnTIDa4t7/WWXXz/gHem72MeOB+3z4ogZOpsEd2k3e3HZn/zMQzMXmeuC2qUk+cznmSZkaUvwUZxHsJdBuut9RsWSs7xcZTnia88gCxgxoU4PkaWQ8bcNCGgCl8c8nTN77pGNfgS660beh9zcc2cETu7nClqDubP5CoP+BtIoZ/dcw+QKgrgH19AxFY3N2ercmcxm2I0K6jhq+L0SktKIPPsbLstNdXk+iJwKUZd0t3nFcB02muG58EGB6GOZrtwY1cbiA6j6+EuV8/sNorQjLJKjf2Ds3Gqgga7JYxliVXZji5YDcw5JtRNIArN0aGsGPw72/JNNPpnlhHFJcft30/16pR0ZdI+AV+AgLHZZL9HLEhXC9CNFLbE+eVFpor1HI0bFldh6RrkJJ8Y6Kqw1KtckjAXLBabhnZZ+y3Lc+t69VLCu/b1JpL1IScNaXQTefuWvzO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199021)(478600001)(8936002)(8676002)(5660300002)(36756003)(30864003)(86362001)(2906002)(4326008)(66476007)(66556008)(66946007)(316002)(38100700002)(41300700001)(38350700002)(83380400001)(6506007)(1076003)(6512007)(2616005)(26005)(186003)(107886003)(52116002)(6486002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2IoG+K3pkFD+Hn6Esax5U+6AmzMc0PPuQm8YuYJvSXJbwmEzLH0IS1a09Fso?=
 =?us-ascii?Q?0RUI/Pp4jAwUb0sYiqK+hDiXTuACLvYJ+Ab7eVKyrP5QcBy3Y/Ph6Whtt09+?=
 =?us-ascii?Q?gpLF75KEtonv16rRcU+7x0Qpb2xj2QGXZl5JloZB7NRewnNoNOpHm1LoIrx7?=
 =?us-ascii?Q?87DnFMdHhXAdDgCrcMkOpyNPdCK55v0tfeQcgYJiAE1K41/KqBF/qSqeD+NH?=
 =?us-ascii?Q?eoaSGBhOMEae0+ZeGp8pNqf3fn2TyK7uec2KRVw7T9zvOly9esdHeIw/E5e8?=
 =?us-ascii?Q?gkNi1zN2UA43BBGH4o999oLBRgyCqwn04HETCEnD320pKp1YGQD1MXneWp/V?=
 =?us-ascii?Q?BKg2tm0nydvdmu/wiHQdTAUaTeksbfDs8blKWisMxoNluU3vwYUuHC4o/jM8?=
 =?us-ascii?Q?t0eKPBDLkDRXKsqRkWdYCQ0uXQRYhdJeZdwAsDJnWdwVvt2WA/jWzTR66UOK?=
 =?us-ascii?Q?67r4ET5Jzs1nMhksFcUZxzgNUNZkv/LhP+j+vU/Tf0rKqplbRjsILOC4GBHR?=
 =?us-ascii?Q?7Zjd9dOiPpDo32YmqmSzct4LGQUy70NJlFpXv2qvEj75c1JWhkz5YSoZpa24?=
 =?us-ascii?Q?qvDmRvynyY2dt2U51lg+NbZDTWb62wzJ/rUVrLxu6lGKv8w1062DrB9u2HJ5?=
 =?us-ascii?Q?P9bAju2iLOoc8Z3g1R6i7AZZLC9vF4F6hL9QXilSQMctm1ik1x+lM0J61b/r?=
 =?us-ascii?Q?CBOUvo5CL34hCMoU1HSG4ZT9CnC3SGlw4d2DjgVW07Z6oKZPnfmp/tKm/sKw?=
 =?us-ascii?Q?xqk1L6zAJHyIPDmtV2Jm734CM02WSl0EhwimUz8vpV8Q6rOnW5DUGeEgrFqW?=
 =?us-ascii?Q?weUVHL6FwpZPMAM/dxQbpa57/rg1yxSwyJad0MP1kUKSBxjGkitIddA7cV34?=
 =?us-ascii?Q?g9hR+elpRm54FT1sJNypIftmSvSogFndl+WpiSAq6jChkluNLJ2A5nfOSVQT?=
 =?us-ascii?Q?lr3IkLNCJFCylWeFyu3lZU8evayKwMT/nJRW83hf00tyy0RNu0IbiYu9rdED?=
 =?us-ascii?Q?hTKxJmztX17gYqToJtQfhjaO3ap1i+Bhr9G2BbK1arevXJBT5fkn5OueLxHE?=
 =?us-ascii?Q?CFd71SWZq3nJryTLteBBqRqE0aastbXWf039tueIvKJPZ/tBkYvBlE37Jr3C?=
 =?us-ascii?Q?lp+FUHCuvuZ3CEidrAxei47W+t/eDpl5x+9Ueh49LLfCx9Wm2oHWqEHRP0cG?=
 =?us-ascii?Q?2/gv+51L0nrY01xMWxelnzx3xhjuMlTnCQrW7lz7eMYG/nrMcjEjlBvJGXuk?=
 =?us-ascii?Q?dKX5OfYon5BkvaMkgMVYByZFV6wyhBrlhqGPRGCCt187ctrFQDw90aJyi7JC?=
 =?us-ascii?Q?gGVbfCArMOumQdJIjxjeAt2TgcG8M72zpI60JIbB7l2Uz9ugJKgjrGOkXXYI?=
 =?us-ascii?Q?N1sGotDbpv0YKJBjktooUWAj0UN2RflZQTDLXjNbeoovzV0Ted9+q4/CL0p6?=
 =?us-ascii?Q?s6kVgI+WkAIa5B5BiKHmZtWMF+lKryFqiBvPD5kTxXYf2Vlu8gvETP8/TJhg?=
 =?us-ascii?Q?POR7oDtBXIz0Chukj7466VhuDW7utmwemB2jB3liBOESHj/reIXoBgjWF2nc?=
 =?us-ascii?Q?3QGs1LOLvKx0v90gE6Tl/m5Wk3WwZy8XadFqZQbn?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6803812c-d39a-40f2-fd31-08db64a383c9
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2023 02:29:25.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnXnNZG7gxEUdcoTwNtpUdM3yq1VJ4ZLmiJXZ8MLv7C5mPrswt+T9CVJEuudxdrF2peOLu05IFoGFdi7a9bIaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4438
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q5dVF-00AOCX-9L
Subject: [f2fs-dev] [PATCH v3] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
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
v3:
 * setting lz4(hc) level correctly
v2:
 * fix compiling error if CONFIG_F2FS_FS_ZSTD is disabled by adding a
   helper f2fs_is_compress_level_valid()
 * fix compiling warning for casting unsinged long long to pointer

---
 fs/f2fs/compress.c        |  33 +++++
 fs/f2fs/f2fs.h            |   4 +
 fs/f2fs/file.c            | 273 ++++++++++++++++++++++++++++++++++++--
 fs/f2fs/inode.c           |  21 +++
 fs/f2fs/super.c           |   2 +-
 fs/f2fs/xattr.h           |   1 +
 include/uapi/linux/f2fs.h |  35 +++++
 7 files changed, 356 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 905b7c39a2b32..3fd804277059d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -55,6 +55,7 @@ struct f2fs_compress_ops {
 	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
 	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
 	int (*decompress_pages)(struct decompress_io_ctx *dic);
+	bool (*is_level_valid)(int level);
 };
 
 static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -232,6 +233,7 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
 	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
 	.compress_pages		= lzo_compress_pages,
 	.decompress_pages	= lzo_decompress_pages,
+	.is_level_valid		= NULL,
 };
 #endif
 
@@ -308,11 +310,23 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool lz4_is_level_valid(int level)
+{
+	if (level == 0)
+		return true;
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	if (level >= LZ4HC_MIN_CLEVEL && level <= LZ4HC_MAX_CLEVEL)
+		return true;
+#endif
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
 
@@ -477,6 +491,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool zstd_is_level_valid(int level)
+{
+	if (level < zstd_min_clevel() || level > zstd_max_clevel())
+		return false;
+	return true;
+}
+
 static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_compress_ctx	= zstd_init_compress_ctx,
 	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
@@ -484,6 +505,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_decompress_ctx	= zstd_init_decompress_ctx,
 	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
 	.decompress_pages	= zstd_decompress_pages,
+	.is_level_valid		= zstd_is_level_valid,
 };
 #endif
 
@@ -508,6 +530,7 @@ static const struct f2fs_compress_ops f2fs_lzorle_ops = {
 	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
 	.compress_pages		= lzorle_compress_pages,
 	.decompress_pages	= lzo_decompress_pages,
+	.is_level_valid		= NULL,
 };
 #endif
 #endif
@@ -542,6 +565,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_level_valid(int alg, int lvl)
+{
+	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
+
+	if (cops->is_level_valid)
+		return cops->is_level_valid(lvl);
+
+	return lvl == 0;
+}
+
 static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index faa27f41f39d4..9fcf8f66c860c 100644
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
+bool f2fs_is_compress_level_valid(int alg, int lvl);
 int __init f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
@@ -4296,6 +4299,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	/* not support compression */
 	return false;
 }
+static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
 static inline struct page *f2fs_compress_control_page(struct page *page)
 {
 	WARN_ON_ONCE(1);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78aa8cff4b41d..353a2edacc549 100644
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
+		if (!f2fs_is_compress_level_valid(option.algorithm,
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
