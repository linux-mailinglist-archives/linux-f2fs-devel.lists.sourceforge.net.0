Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6875045D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jul 2023 12:24:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJX1E-00067F-8M;
	Wed, 12 Jul 2023 10:24:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1qJX17-000673-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jul 2023 10:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hM/LnQkrF+yUCFW/YwJcPBGbLqzNa1ppV+Rf2gLON+Q=; b=lExUMOqaXKmpuyrB+WzZ0MMA+t
 6tp/U8xe86QdVM/LC9JHA+46lg5APTNDxOmg6lF659rjHFNWk5mt8yrrJFTLuXZal9oezedKYiJDE
 WPrsHXiEyKCFt/EXfV+TqOCQVdZBhXcc4PwKHTU5+mQD0CJjiXzDYIHD4KW0gqLc2h60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hM/LnQkrF+yUCFW/YwJcPBGbLqzNa1ppV+Rf2gLON+Q=; b=d
 CHALE3T57Ym5oyxvgEpAmUY0w5c2GjmCs4sbo27eZshrB++RIXB4Lq42SksnzUnjH4dzCWw/BBaxK
 QYKqzD+E58Vtq4Nic4+4pqLGr7tdJmTVaHl858eEwdwN6efq/VFWaX/jb2UB6yYty3Yk0U6u6y58P
 iI2OGmm6v6MRM6QU=;
Received: from mail-sgaapc01on2056.outbound.protection.outlook.com
 ([40.107.215.56] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJX0y-005NEF-7O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jul 2023 10:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0OWSiWcBhGa56+nXvRcFqN+TGEye17SNNgN83uZI2la/Gu6D49sNnmNxWDpzILSm4sq7dqs6SLikccdSwIxMuOWtEx5zTgKkGeeu+jOROYfTyy92yOFAqU9P1wLswN2SK+goOLLWUlDAb6326wZU3KW1HAZAtBCSiNZlNwmSwtslNZ2btGVwWR7XVdQ1KYDz5Cu6a4p9LQVBrcb/3bMJhgJsbLrJQQ/PyOf2e3KCvpjnMJOtCJ12JfYmXMzom9ttNLKa0HPDmDk6R/y9vaiTCI9sqjSu5aAHrKY/CgXjp5jX/x51xCoUkHo1hpei3UvOA8WsTYIOD5d+bwsVLe1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM/LnQkrF+yUCFW/YwJcPBGbLqzNa1ppV+Rf2gLON+Q=;
 b=Y0a+Js11jz+nPqa8UeSw4YKyjqwwZIyTZYqOOcrWHyVWtOJH2ZNXe9LZ2zLfpBkia1I7neFGIttgBwx2wL1puWdYq8ckp3CcQXNrKNGXVXaA1lp8pK7JiIFAvJZqkV6KKSZb85JBTRRoX8LO5Bk2rjPS8jWar9VabR0CXPoHD3i9B8Dq5U0xFK/TP5RWEARxrhDb5rMsPUMuxo94bitbxpVITaxZ3fqAAl5OeH4rMdiDuLUw5UNxcL1hLhB5A9rfg6/k0B/w8PL30tB3u0SPubMLM4LTjy06pmynf5yfQpxE37/rZVO0C8NsG6re+6gtCyBkGR49j5QVzjEV3MBI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM/LnQkrF+yUCFW/YwJcPBGbLqzNa1ppV+Rf2gLON+Q=;
 b=LPtySylH1lxmk7hDvwBblNIToE2ncWffRjuD1HK1bWAiPkUmTxpEJokQ4NLsAL+or8dYUaBxO0ep0NCMKgXQwZ6/oRW1XJd8NVx+g+nvGmnHaAJuTHZSwtJcAl/mZm46T/BOoTNKDfKbn+eQ07gu+Mv0xmx3pSHNXdvoht1IfF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6182.apcprd02.prod.outlook.com (2603:1096:101:c3::8)
 by TYZPR02MB5247.apcprd02.prod.outlook.com (2603:1096:400:8e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:23:57 +0000
Received: from SEYPR02MB6182.apcprd02.prod.outlook.com
 ([fe80::9981:1b76:283:1b]) by SEYPR02MB6182.apcprd02.prod.outlook.com
 ([fe80::9981:1b76:283:1b%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:23:56 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 12 Jul 2023 18:23:31 +0800
Message-Id: <20230712102331.4079126-1-guoweichao@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To TY0PR02MB6169.apcprd02.prod.outlook.com
 (2603:1096:400:279::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6182:EE_|TYZPR02MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 391540ae-47a6-4b97-adc8-08db82c217e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Hyo29XFtGY/AbVMO97/0vZi5MhE4Mwtwc9sRQjTySG8X6e4h8GK7Ap500bPJ/BwP/w9Au8JQTPUKZDk5TFO2qvgKb11sf6BUJHML9SN+CR0hfDbJj6hdhT6bG78M46m5FrFLH8LabOLZCM2988NkUXolevbqU809dyIUmUW3eN48e0VwiIOvxzTYLYaPXs85wFR71M6ASEUXSfnVdxoSQh1RsYnc7U9RIGYdpTPpstPGZszknhlYlpG4+kStqPI5SP64Rl12CeP60JOT9GJdpv13hECkUrpUNDxZFNFOn8kaBL4Mw+frKiWTMZa9Ye2/+0b98NeqjSAcIXEeEbKC0OdJaWTl5zIXV5rAYKihn65M/Ne3RnkxBYDJy8AYF4ekGWpxMiQ8JJ3slifIo8N7cHGcECDehWVUfZBpNZ9GApy1HT2yiKE59/NbWFLcob8YaLeDOaGKScoonjs1bgi6fj+/x8PF3vlgUMCjSdkOsOii+CVPwIE+ZtAvzSRFHgeY9ISJ/BVmQbg7Ixk8dgT/VS9IuS3h8nxZWGbm9/Bzb1ni5hRWVjrwY8MejDbUJZvXvlcIAO5xgAKkJw/7OL2eRKYl+BL1c7E++ZlIhjuvQOPzQYwZMeFsJi1xlZxrOni
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6182.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199021)(52116002)(6486002)(478600001)(6666004)(54906003)(2616005)(83380400001)(36756003)(86362001)(2906002)(186003)(26005)(6506007)(1076003)(107886003)(6512007)(38350700002)(38100700002)(8936002)(66556008)(4326008)(41300700001)(316002)(8676002)(66946007)(66476007)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPDm5BuiA7FYv06tqJm9Ydl+FpI5bamP/M7TMcIJV2Ub5VOhSzL6opBb2cZv?=
 =?us-ascii?Q?hQK2kqnj0916jvrnmKI2SoL/7sxsDUNy/ySU84sznlFlcLRFS6lUOwF66QT1?=
 =?us-ascii?Q?iQXZPOnjgbpXUl16M7l83kSNUygG/gxYqkMBfxnv3yNvoYZOnX8oFKeEhQMR?=
 =?us-ascii?Q?jLtFvK80y7yggDJ9+V2IhZaZ6nA6KuTbqkEMzkyFyy5BqDw5eEMT9RK+jMpg?=
 =?us-ascii?Q?yu9aL9NRzPV/uOt/URG+ujG4itK362GnjWTuSgl8wKm6ZkQwOLpHRvsMdDWs?=
 =?us-ascii?Q?sPTiVnSAB1toLX5OJtdum9hjwk7EeQ+NI/u4XG2B+plQtUSGTcxSH9L0+jSA?=
 =?us-ascii?Q?W8gsQyrHeevysmCGdSOuVqZgH5uvrO1Y+mOeDZr8hwOjVzYRA8BjHHTAziGY?=
 =?us-ascii?Q?RtCx/t7tuOT6VEMaA1/4ywCOvZZOpxknRLnIwkZAIPxgjoywpSjrYV7cJHVa?=
 =?us-ascii?Q?8iE28waFukctP/UCwoSR7N2y8OawEGaA9s6qfkiWYwieIr+A4mv50AQ8pcY9?=
 =?us-ascii?Q?hoiBsZeLE1X2EFU3IcOSPxL18jwcXW8C3q9I0A5yO5ev1lOgWpeIZHsQ+qRM?=
 =?us-ascii?Q?HvKzOLXJlqwmVxUTHMoO0I5k9NaJMEHQtsKIkmywvMXNn0XnMQp0w6CIkDUY?=
 =?us-ascii?Q?AMcYB9DCKzojYonc6YacfgsXFgbzJDX9+bRvYVvvHP1gU9vQRgMO+OuC2tGZ?=
 =?us-ascii?Q?CnV8oZssj3tnPnCRtmKDOgKLpceF6RUuQG5jI4/3DsuwSLZT9kL8SRQB4l0g?=
 =?us-ascii?Q?1IcNYaypUBHGMurMXB6w7bKkkp2ZdxsQ1jlzGV8ZDs722OUK0TacNxHana7C?=
 =?us-ascii?Q?Q20BSTyJz+gb3R/f1DPFtKSWLV2lLXmBiABbxa33XLFovasM5uKbvGIMToqK?=
 =?us-ascii?Q?Kky4tOBXj43nf1N0vKxDAG0gynk9YBSnj5AqueX9ObVzbDatTJDBwi5v3z53?=
 =?us-ascii?Q?hmJaiEiabzwfY9eIy8mZVKoA+pm/xMCLXwMIDMDSSRHEGISaPOtvaQYbNB3e?=
 =?us-ascii?Q?PP+t9cpWZwO1y0LWc74nZtl7a4J2HvSqQAh4pPvOnjt+DWQbhpO0XkNtLc1i?=
 =?us-ascii?Q?oWEOEjLhic7Mo+xaz9SGkuLpZidjutioO6p/TRmjBhXH0ul+ii/OMTCBuzIn?=
 =?us-ascii?Q?eyS3yEBjg+BeFOz6tAHnsJ5oHSZPjafaiPIK4ElP3bYGqxMFmTn4850Fm/t7?=
 =?us-ascii?Q?XjkxTxf+s2spaVRWW8h9MbQHX2JdGSAXytHtj0ADevueVK9vwYiI/kRAwIvE?=
 =?us-ascii?Q?A2AWc6PM8gjd4xANVAPAuGwoIyV7maR6cEbpLW9zGmg1QohElCl3Cr4jbo5r?=
 =?us-ascii?Q?h4vf7v62kXRcXpOCDIdd62LwMcah3wrvFfFXiTC2BeHcdiuXTakgSQvPPuRc?=
 =?us-ascii?Q?U7pNrHnyFQZo512O8b6OyKb/Vd7omqKmvInzFn5tbtrm+x3T33RnirPUm3Vv?=
 =?us-ascii?Q?q3Dv4Onn/GuR80UlKCCHKSk0TgHTFgIPeslgjAYH9/zpUUcwuGF3JRY+JeYQ?=
 =?us-ascii?Q?XAoq+ORUEyx3XhwbMu7pKZQ7RNgby8i0EAafUZCYHcfXduViRxGdptgnrWfK?=
 =?us-ascii?Q?WA/vRyA+p3hBIO3J8f9y2zV4WFoddb6xzs1kCqnFpx6TVIpzTgyyNosuluHU?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391540ae-47a6-4b97-adc8-08db82c217e1
X-MS-Exchange-CrossTenant-AuthSource: TY0PR02MB6169.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:23:56.5105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSd6bFmJpttfKH2i8UOBq1W563X0YxZbYDEOIaD+E4i2MwFrMhXsfiRaDuXGWwaSFWHjxGD1blKM7OgSxc4aiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5247
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Weichao Guo <guoweichao@oppo.com>
 Signed-off-by:
 Sheng Yong <shengyong@oppo.com> --- fsck/mount.c | 44
 +++++++++++++++++++++++++++
 fsck/xattr.h | 54 +++++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.56 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.56 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qJX0y-005NEF-7O
Subject: [f2fs-dev] [PATCH] f2fs-tools: support print_xattr_entry with
 fscrypt context v2
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/mount.c | 44 +++++++++++++++++++++++++++---------------
 fsck/xattr.h | 54 +++++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 397feb5..b9696c4 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -196,7 +196,7 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 {
 	const u8 *value = (const u8 *)&ent->e_name[ent->e_name_len];
 	const int size = le16_to_cpu(ent->e_value_size);
-	const struct fscrypt_context *ctx;
+	const union fscrypt_context *ctx;
 	int i;
 
 	MSG(0, "\nxattr: e_name_index:%d e_name:", ent->e_name_index);
@@ -213,21 +213,35 @@ static void print_xattr_entry(const struct f2fs_xattr_entry *ent)
 		return;
 #endif
 	case F2FS_XATTR_INDEX_ENCRYPTION:
-		ctx = (const struct fscrypt_context *)value;
-		if (size != sizeof(*ctx) ||
-		    ctx->format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
+		ctx = (const union fscrypt_context *)value;
+		if (size != fscrypt_context_size(ctx))
 			break;
-		MSG(0, "format: %d\n", ctx->format);
-		MSG(0, "contents_encryption_mode: 0x%x\n", ctx->contents_encryption_mode);
-		MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->filenames_encryption_mode);
-		MSG(0, "flags: 0x%x\n", ctx->flags);
-		MSG(0, "master_key_descriptor: ");
-		for (i = 0; i < FS_KEY_DESCRIPTOR_SIZE; i++)
-			MSG(0, "%02X", ctx->master_key_descriptor[i]);
-		MSG(0, "\nnonce: ");
-		for (i = 0; i < FS_KEY_DERIVATION_NONCE_SIZE; i++)
-			MSG(0, "%02X", ctx->nonce[i]);
-		MSG(0, "\n");
+		switch (ctx->version) {
+		case FSCRYPT_CONTEXT_V1:
+			MSG(0, "format: %d\n", ctx->version);
+			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v1.contents_encryption_mode);
+			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v1.filenames_encryption_mode);
+			MSG(0, "flags: 0x%x\n", ctx->v1.flags);
+			MSG(0, "master_key_descriptor: ");
+			for (i = 0; i < FSCRYPT_KEY_DESCRIPTOR_SIZE; i++)
+				MSG(0, "%02X", ctx->v1.master_key_descriptor[i]);
+			MSG(0, "\nnonce: ");
+			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
+				MSG(0, "%02X", ctx->v1.nonce[i]);
+			MSG(0, "\n");
+		case FSCRYPT_CONTEXT_V2:
+			MSG(0, "format: %d\n", ctx->version);
+			MSG(0, "contents_encryption_mode: 0x%x\n", ctx->v2.contents_encryption_mode);
+			MSG(0, "filenames_encryption_mode: 0x%x\n", ctx->v2.filenames_encryption_mode);
+			MSG(0, "flags: 0x%x\n", ctx->v2.flags);
+			MSG(0, "master_key_identifier: ");
+			for (i = 0; i < FSCRYPT_KEY_IDENTIFIER_SIZE; i++)
+				MSG(0, "%02X", ctx->v2.master_key_identifier[i]);
+			MSG(0, "\nnonce: ");
+			for (i = 0; i < FSCRYPT_FILE_NONCE_SIZE; i++)
+				MSG(0, "%02X", ctx->v2.nonce[i]);
+			MSG(0, "\n");
+		}
 		return;
 	}
 	for (i = 0; i < size; i++)
diff --git a/fsck/xattr.h b/fsck/xattr.h
index 22ea35c..b155cc8 100644
--- a/fsck/xattr.h
+++ b/fsck/xattr.h
@@ -34,22 +34,58 @@ struct f2fs_xattr_entry {
 	char e_name[0];		/* attribute name */
 };
 
-#define FS_ENCRYPTION_CONTEXT_FORMAT_V1 1
-#ifndef FS_KEY_DESCRIPTOR_SIZE
-#define FS_KEY_DESCRIPTOR_SIZE 8
+#define FSCRYPT_CONTEXT_V1 1
+#define FSCRYPT_CONTEXT_V2 2
+#ifndef FSCRYPT_KEY_DESCRIPTOR_SIZE
+#define FSCRYPT_KEY_DESCRIPTOR_SIZE 8
 #endif
-#define FS_KEY_DERIVATION_NONCE_SIZE 16
+#ifndef FSCRYPT_KEY_IDENTIFIER_SIZE
+#define FSCRYPT_KEY_IDENTIFIER_SIZE	16
+#endif
+#define FSCRYPT_FILE_NONCE_SIZE 16
+
+struct fscrypt_context_v1 {
+	u8 version; /* FSCRYPT_CONTEXT_V1 */
+	u8 contents_encryption_mode;
+	u8 filenames_encryption_mode;
+	u8 flags;
+	u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
+};
 
-struct fscrypt_context {
-	u8 format;
+struct fscrypt_context_v2 {
+	u8 version; /* FSCRYPT_CONTEXT_V2 */
 	u8 contents_encryption_mode;
 	u8 filenames_encryption_mode;
 	u8 flags;
-	u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+	u8 __reserved[4];
+	u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 };
 
-static_assert(sizeof(struct fscrypt_context) == 28, "");
+union fscrypt_context {
+	u8 version;
+	struct fscrypt_context_v1 v1;
+	struct fscrypt_context_v2 v2;
+};
+
+static_assert(sizeof(struct fscrypt_context_v1) == 28, "");
+static_assert(sizeof(struct fscrypt_context_v2) == 40, "");
+
+/*
+* Return the size expected for the given fscrypt_context based on its version
+* number, or 0 if the context version is unrecognized.
+*/
+static inline int fscrypt_context_size(const union fscrypt_context *ctx)
+{
+	switch (ctx->version) {
+	case FSCRYPT_CONTEXT_V1:
+		return sizeof(ctx->v1);
+	case FSCRYPT_CONTEXT_V2:
+		return sizeof(ctx->v2);
+	}
+	return 0;
+}
 
 #define F2FS_ACL_VERSION	0x0001
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
