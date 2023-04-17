Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CF6E3E5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 06:03:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poG5j-00086o-7t;
	Mon, 17 Apr 2023 04:03:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1poG5h-00086g-2I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxMorCe39oyljGv/LPbzRKguWOGLoeg0EnqNb/uMznQ=; b=IT18dqWYzxZxbRKxrpbP34Oqo5
 nplLKzEegI8np8QO9+h7QvDZIainAoOGDStn9athHJIMax8h09+EoEnSRiXqzWVdFGtV9vWvf0kxm
 Cat7TIp7kgfVTWJgEbsJbWGIWHhmECJF99UstsC7trIhKbo9ZlH/rjBGgvMC6ecpRjBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JxMorCe39oyljGv/LPbzRKguWOGLoeg0EnqNb/uMznQ=; b=C
 QNM7YGQNcTGc4GMNiBcadA6lDSNwakEEG7tcULsLzvK5X2nhqmVfHHdchUHsEhxM8cY9bBi8dw0qV
 xX32FPARzxJBxp3ImNEYeTb3O0uEK3Nu2LrFEgBwF7ej5Cl/lAE6jaMKA9tk11Tm0LNiGvW9YrHyh
 NRvQajCBKM3GwPMU=;
Received: from mail-psaapc01on2128.outbound.protection.outlook.com
 ([40.107.255.128] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poG5X-0008Cv-42 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNVGwPzOmcO3nsDElyWP1OG+93ITvq2ZTQ6UNsrDbbX5cjf0IL+tFh272YMtp+P86AzHRslJjAEqgNB30SdTdFMpDRjNrcF9aV3J2HffBdZah44N0N+lxzXEg51EdjdJMOZbeDsbV1Y65FMO7KV6n7Mvo4moqLso1B3qDbXafA2IRvn0c1ykIefkP+wEf4x0xUGSRGlIifIomtv+V1kAthb2j9N1JXnAqvGwVN0DQqVo7CnvtdYxOr+gko9dnygLZ3o3MjjQml9ulZdcLGHsegwLrj7BznmWYuxwOACj2IBebTYlBtTLf2QR6PSpo8A0EBGCtfKh+jsfqpf2Phwnjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxMorCe39oyljGv/LPbzRKguWOGLoeg0EnqNb/uMznQ=;
 b=Tj7+5mmkUX+E3Zh8GXJyH/MmD+cdTwzxpfM2GaNg5VU8kLBceZRodp5KcjE/KYH3z6cigPuKV8xBZsdXhVJLUBZU51PbTXBy2a5xke/5kRx/lH2D1iTyC6+j96jcQU5On8/YCeMUK6BYmHsmFc3w0CCjiH3QzamTLVI9Vt0LTbPmHSj7pMOinHfZ957Ys0YuqA8/Idny7tzuE+dROyhbA7jfgYeSxuR7GpVEE3O5EadvTNcCsMx0ToiBDIkXmucJ1S9mw7Q0g6WboGVzT2N09SsZZ6uY2UQ6ELZIaC7EMJpEBMS4ixojaM56+llYwhLuxbIRtCvFR3N2dI8pJb+j6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxMorCe39oyljGv/LPbzRKguWOGLoeg0EnqNb/uMznQ=;
 b=frZsn0uslU50rM2wh4AQ3hb++14tsrm/+4iiQMuSpyhVi1ssam9MWBGUvOF93pZUY3tROForDcK8j/b64lNoEcocbKsWkv3qy57PitfmGX8cBjwApdOnHsUpaTAHlt1Zr5tByKMDuFVV+Rw7CqaGj90kZOTcQgA+aALwYdELG5eo9IXlwgGCdqyhy9T2l/0gRSsB08OSQI7TzQPd2HSKjTVX6AWsYijUq769Qd9aWZjSXpsPQSyXYJLZyX23laa09IEjSXnTN7eXQCMP5GUot9icOVVWyHI72htqnYJiebNS9qt7jLuYrSUAaDYHUlBxou5Ld7rSRh1W4yopP+sYYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SEZPR06MB5413.apcprd06.prod.outlook.com (2603:1096:101:64::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 04:03:22 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::16db:8a6e:6861:4bb]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::16db:8a6e:6861:4bb%6]) with mapi id 15.20.6277.035; Mon, 17 Apr 2023
 04:03:22 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Mon, 17 Apr 2023 12:03:08 +0800
Message-Id: <20230417040308.46621-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGBP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::36)
 To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SEZPR06MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: b808e05b-ef47-4375-f212-08db3ef8af7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FueN/Rho19aiULqMddGKwG0iy0871LP/TF22Nf/Y/sYyRFw+51KLM3LKndI0XN8yhNZTQp36NQfx/xByOt8iIBOeR5c9McgK1QZZsv+t9rJHNdxSLxEgzEmynB951TkVyHPXv99WwsrzlBYKuDL9V53+8FuGw5lTUN11CtfcBIw9HmDY01RkEwyhUsgfk4nlfNHdhJztYHCUv7o781adqzkZw1aejvG8p2OA+hsDRKG4qkwdJcNmkDKVvx6+vwhTerfcGeEluwU0FF1vcsbNqUwjg5xa5ZiTO/ELD6Zjd2IQ1OOylCEucsaeXIQTJDg85XmCwD2s/XDSBO7HPAeerD/J69lXSvauQP++X9RQ+CoUBYgIWoe/85OsjVigRWXN7T4m2ffENND1J9ZrIpMdagitZLzLTI9imj4m8IgBBdE3I+N80JMvpao/9eZWCvaOZM0xTSw2YonnXzgawTXVWkIfAoKG/MfWbaHVGzuichqQiHEJQauKVa17ISEd7jyLjOUpZWLjyyJMUTDqfvW/7i3gRntenbCglaC8BgAo+DbKnmqYKp/GcbZQL1+OUj1uZFsVbvxiLHocBqZzsv+hcmSQXsbDLivuoP4sMhnwG3m3TK2oQU8BQ7iTKrNFX05h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(5660300002)(52116002)(6486002)(66556008)(66476007)(2906002)(4326008)(36756003)(66946007)(86362001)(8936002)(6666004)(38100700002)(38350700002)(41300700001)(478600001)(8676002)(316002)(110136005)(1076003)(6506007)(6512007)(26005)(2616005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYdTWZvTQu4TayY7QlJIx/kPmTDj917TGd7poiApKGtLhXLexy24YoN7zuy0?=
 =?us-ascii?Q?pfeM4GqKEEqdWn+B0jR4u+30S5uBBvm7btycyDAnp7FdUP1X5OtikZaSP9ex?=
 =?us-ascii?Q?/nqWz2Q84GVsER9DoVltM31pgp5/R8jO0LLuvvWO1YUqoNNO3jiohvAQzFu6?=
 =?us-ascii?Q?MM4NO9RFG4xd3MEEh14GaF422Ixw+Pn7T64WgK1zYbxelVEOD+V7vAGVLP4L?=
 =?us-ascii?Q?ugSa7Ybgrfl93DpWr+V4X9zJeEV+atx96+M/PHlygEgCEwo1LejRgNJJ5p5n?=
 =?us-ascii?Q?r8mUXyVLW3SWFMdPh00XtC5GqorepqsFrhfKa2AsqILhBiouTHP9MWbCg6N4?=
 =?us-ascii?Q?6sju44Wi8WrvpiiJaEBysfMAoqmSeyTbTS1Zi5yGEQ5cT4CDL0MSpoSqwhYh?=
 =?us-ascii?Q?0pMwRacvbOHZz4cg2rhg5ILWOy+tpSAwS5wGBnx1A46bYK47e20qzaQJ3V9z?=
 =?us-ascii?Q?M4/v/G7w71wy4PXgZXJLC0Cmlv9+taHx6AW1/CYj9G9JXUoIZd/AK+pFq+cZ?=
 =?us-ascii?Q?KlC90MB2AFg6riY7pIoFoiGVO71gQ7/TD98oMmzIr2I7afsieAc4u4PPR3PW?=
 =?us-ascii?Q?HcnFI6qzTAnt8uBWodWDmq6/vDTH40CciBja3GosXAFYHMQ3zsEU1yHd6G6U?=
 =?us-ascii?Q?tyjwgIsa3ExVqhznS1uDpuc/4xWRbLRprxhHwy4qo2eS6dNGZSGvA/3tNRDe?=
 =?us-ascii?Q?rI7oRNcmp25CJbHLBY0ZJzUUP47veQpiebbo4kN8s5T+jb3IifJSleyrsK7z?=
 =?us-ascii?Q?RVgBqhwtQGyR3WnO2C2H7vUtTIIstNWvEX2ZiDYd4fVb0l/PoHqJRrUkiLTu?=
 =?us-ascii?Q?NLT7kjUa0EERPtQ1KFJIs+la+Xz0LVWzLVjol5aPzgpQqm/8H9Nx0Y7qU2uP?=
 =?us-ascii?Q?JPbVjwK6fMoN9CndWhsFYsQiu/mr6+Z+vUtbVhSbvhq/JhWuS+0e1pE59/mx?=
 =?us-ascii?Q?8g9wl3Lq036CvNHQOUFnog8LUQmLHvJJM2dYoUMDwWdzBZvrD0ENCcIZDY+L?=
 =?us-ascii?Q?qxVzLR8I0bNLnKdcif7cxD30XkluMZOvvgvjpHbczEH/p7iTisFhBTSSr7An?=
 =?us-ascii?Q?ksRp7TKQ0S2Cr5CoWvMUXV+nRWCV+fQm5TgxwWySNmOPA04JJnqPe3aUZSZx?=
 =?us-ascii?Q?Sa9uT9XOcjaSkRxl2XfFiNrFqbGkEl8zyFHULWIyQii+y+o4KL2xE2HfeXf0?=
 =?us-ascii?Q?oC4Et88FnQ0TrBigpan3VBA5WuxIhK1Py8s/Qx5GKTWDS168GCobF/N3gDow?=
 =?us-ascii?Q?fGpI8qwQiTTjmc97hjZraoJBlwVIvrevbPwtEe4cvfwQJpyauUkEV5uIuguB?=
 =?us-ascii?Q?+SGKiLLtAY1g1bNsofTZeiCxqwXTP/QdI9YOHya97ILk38dtpssaFJPU8ZQw?=
 =?us-ascii?Q?Nt2Kx5V/qj0vY5o9q+rW6PSJAqoVckD1UFdUNgzopE5dXTkF/XVYVhJ3mVFf?=
 =?us-ascii?Q?j4GCF2tzSkFAgAJPdwC3c/PKjFFyf5WJ1Tl+rM6OnDgRpPDXyV0Y2zbQl1Bw?=
 =?us-ascii?Q?wX70BiV5tgyjBpDffvGb0rXsS/bp/sij2mE7ur27/r+F/gfONJ1JUZIQo7Sb?=
 =?us-ascii?Q?skAQkNw1QafCkF4rnBoepMJtzaXtz6swkAP7ClQd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b808e05b-ef47-4375-f212-08db3ef8af7c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:03:22.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+H1pkP9zJGjjY8fHV4VfFs82hSsrBBKOxs9bb2FEd6SmLsjbivPVOvmmzG7tHNo7dGthol0zq4zArh0rDF+4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5413
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's descrbie it's read extent cache. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- Documentation/filesystems/f2fs.rst | 4 ++-- 1
 file changed, 2 insertions(+),
 2 deletions(-) diff --git a/Documentation/filesystems/f2fs.rst
 b/Documentation/filesystems/f2fs.rst index c57745375edb..f68337086dec 100644
 --- a/Documentation/filesystems/f2fs.rst +++ b/Documentation/filesystems/f2
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.128 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.128 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1poG5X-0008Cv-42
Subject: [f2fs-dev] [PATCH] docs: f2fs: specify extent cache for read
 explicitly
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's descrbie it's read extent cache.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index c57745375edb..f68337086dec 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -163,11 +163,11 @@ barrier			 If this option is set, cache_flush commands are allowed to be
 fastboot		 This option is used when a system wants to reduce mount
 			 time as much as possible, even though normal performance
 			 can be sacrificed.
-extent_cache		 Enable an extent cache based on rb-tree, it can cache
+extent_cache		 Enable an read extent cache based on rb-tree, it can cache
 			 as many as extent which map between contiguous logical
 			 address and physical address per inode, resulting in
 			 increasing the cache hit ratio. Set by default.
-noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
+noextent_cache		 Disable an read extent cache based on rb-tree explicitly, see
 			 the above extent_cache mount option.
 noinline_data		 Disable the inline data feature, inline data feature is
 			 enabled by default.
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
