Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 200026877CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 09:48:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNVH7-0006RR-6r;
	Thu, 02 Feb 2023 08:48:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNVGx-0006R8-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wMsmnbmNXYRUEU5YT/7odIoE+ovaE20i3kq0sGhW1Ks=; b=Vb6aRld7q01CuhyB+2vNJzICo0
 LTTmWWSscCSCeD4zhe5xLNIGbkND7nNoXTHpsBg59+NqUAygn4ahXMKSQbasJE6tBnrPx3HMs7yI1
 HcHdtNXiIdz+TYDTCw5uM9B06hNfDV9JaT4v4H2600ba/8JJpT33m5XVXflKhDT+RkYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wMsmnbmNXYRUEU5YT/7odIoE+ovaE20i3kq0sGhW1Ks=; b=U
 2UcfK/cNHHutCkAJmBonxnRnlVN0rlm1hF1QZ5rmVkH7dS5Bsi6/W25dB46vh6+gdx0qyW/DQG7PB
 1MVb9iDKis0/eT3bIlvrjldxlhhE+2iZWAtdScMhE5WEnifVfkCnIqNiaIVWPoOsomG3QEoIQ9irj
 qjuldYCFuNcFHwdM=;
Received: from mail-psaapc01on2104.outbound.protection.outlook.com
 ([40.107.255.104] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNVGv-008Iir-UD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 08:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTq2GRRHt6FKJivm8ojbN/I4KT4gqQYHuTdcKddMqCui8IoRFw4QpTolqCLtKcOG9BTKGRMPAjHie9jrnJPHTNxK35FNMh/YXLISc5g4iv7350a9i7n9ON10nT2uBleSGweh4kfbVpow/HNP0Yl1HRnBmwnRK4XsGMp6Jdc9tcvjb7ijL327kzUU6L8qiwU0GrigcQ6sS/M0sgqcXPHr3BYkyL5hjZpxBuDFTITg+6DcEC5RNnhRMLt3SFugorxJtuXP5swiQU+Z6Q6j4536YvGplAEcdEJAbwIMUC2rt5nVxGtGBru8n1Sw/DU3QZ20HYEpiddQyKkGn1abwOT4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMsmnbmNXYRUEU5YT/7odIoE+ovaE20i3kq0sGhW1Ks=;
 b=LXB8Gt0LBCfWp1bHJjApcJEpNcT2W+Js2AQzxeCBqwkYQNZYEaxPdqdCuCpmqBLfgUV4MIuXqzwhWh67zpRaWLWx8RfJs0SUekvLAhMfwDy+ZBFC0wdPc0RS11BPu1fDDHEC/QHbRh27A90yYSZpYefSa/Fh4M4SpGXDtpEwdpL8cCze9rDdi80ptQGI56NUXGlH8nCf8Jzg9NZoxQ3uIsn1iCnH8vo3M67qGFuDYZVtGN1tWakTzNJWVQq6RpdEzb8guq8ZKc/zjFCWMnoIiWEoUrccsqbaLgJ9mNMLT3q228HsxkVLYC4GLt490mb+bnGzYovr9gY3zs1BS7yFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMsmnbmNXYRUEU5YT/7odIoE+ovaE20i3kq0sGhW1Ks=;
 b=fUbgVoRQAPyW/PI4I+Z4bGopNLs28xgP+dgc9ctFjcudP2k23P09j3f2QBIGWJ1VY6ZV8kWuCkTirYUpYEq9M7suZ6Q3K/t3TFO0NTv6QRrvlCxcTAEHW+vYewEh5HGvBbHUIYYQl2/wlQguaxpPlRjJhXZ0rnt6a4N+bvziCpNZ33BzDslVWD5pGzZ+5ytKAvYSq0Py/8Rkfu7Ha+v7akdUVXrZtgXFO/Y42yoJv6eGaZXfro+wAYm3zz2cBz0DqFbNwwP+EHX6nBk2tTY9P28OLTikkRzbIgtdYg0698EK6NzfoIQFWqm1ntyjiLqG3d0YGQxSTvngqF5u8b4OZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4514.apcprd06.prod.outlook.com (2603:1096:820:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Thu, 2 Feb
 2023 08:48:29 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 08:48:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 16:48:13 +0800
Message-Id: <20230202084815.70791-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0184.apcprd04.prod.outlook.com
 (2603:1096:4:14::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: 412cf13c-a36f-4882-6127-08db04fa4194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3T1XnvRo/RiKTXFf5akE3u7AoQvbzg/rIzgV4sp9i15Dj2mwS8sc5eR+fr0GEqePTqMhVfjO15wYxzuYLnJyGP625Juu3p3fTsJjOeH3Ld1KHCrMDFvhi5bKC+ku2/v+o5qiPzHM/Nc9Y8abU0Ljp8RDjpHHHqtybQt4HNFaTt4exQUylIfJHcu21GpmJDSHPKslX/fl2nDbl8NOs3dYILdApliI5cc2buP2Z2Wbwr4CLFY3VrvbLWR1/RNQVEirnXVxB+fVKuOlfpnpYGn7rJY9KmJnwoYait/4q3JrvJsZDnHccS5y+UM6j+sShJuOUqdxM05GknHoAmlcJpHBpqbBkNM8Q14xFc/vUyrSdf81QGUQfE1RKx8IvvtR+mCeCt3rW8dU3q3aNcB0sGCjwSTSYNqShhJ98WSZMlZntXO495+fAX4uCX+3q560pc8BxlO7e5zYE1URTwr9oTvLE2QHwQAiZiJyAqIRGCgmQCE5N4ATOndBiHdNDnS5UneaMYaiy52ESaga0zdnvXjyRuWoSikaqr99RT0lj3fCwq1ipXdJPf8n17eIYySaPDRgDxXgu1k0T2pWQZ386xh1YUKcoZntH+bQc+4XZu5zK3vEkL3icNSOCycFz0NXAp9oZD4JK/dsA5eXjUXXrQNbdYT6maGBU7OPPdmHcXECgkpyfmQjkV68ZBqi3IDpr0ju5/pVassF+Vaubn+iFOgLy7uSzXfcdNY22nlI49eFvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199018)(6512007)(1076003)(478600001)(8936002)(186003)(2906002)(107886003)(26005)(6666004)(52116002)(6506007)(2616005)(6486002)(86362001)(8676002)(5660300002)(83380400001)(4326008)(41300700001)(38350700002)(38100700002)(316002)(66556008)(66946007)(66476007)(36756003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BWscXEltD3M9kLIRp3NAg2+tFE2p0KvkNwzTPWGhFr4Z1vxVXAkU0X0tZ4rA?=
 =?us-ascii?Q?oSOh2bz8wdLRp9sFQT9yNmgmHZSGGkgGgOBU0/mNd9kU055H4A2D4XQECFB4?=
 =?us-ascii?Q?KASE9VlYb9V/QQkmwP0ECjM4QgXAwLpWk1L5dxqlXsLuwN+Fz/+Tw0eN3ckf?=
 =?us-ascii?Q?qNfmD4mBN2Dck1J5vk84G//q9zLhA6qYU+IxdhCQ9XcvPnjGueGwlZshl5xE?=
 =?us-ascii?Q?Ya+gH1F/38F6/ogtxsfLiPx4QP4Y3JwHrkrIby/paXDy6NkMcaRy1cXpHCHq?=
 =?us-ascii?Q?2+MSNbhHHKJKhzxv4N3SH3yJqwybt0CFwbbGJIIWwhVBCgXzet58BJxPxSGm?=
 =?us-ascii?Q?xSnMjPyRyA8S8LPUiCqXnFuO4fvOjyU7FnxnanobuVqO6nfx/zPIHig73BJn?=
 =?us-ascii?Q?YqJGk4WkfKnZHJJdUAg1zsU3wWUcgRKvkAnfDZoV56oUeCBhDCpTncIvkmDd?=
 =?us-ascii?Q?nPEkzUSaEx6ppsWlhVcHPnR7y40V81Em/3YT51p3PdBgnmnG/pHPzvyfxaIZ?=
 =?us-ascii?Q?D7rZ59ClVDCSQJhcWtR79oXwf+afhVrCVUFZJB5kzZjJJPYsjYVFWLcAJmvo?=
 =?us-ascii?Q?+eJvx9bvdIAKiRaisq3KbAXCf8vAszZOB+pqjL0G/oOAwn8yuPDy2afmcGgC?=
 =?us-ascii?Q?UuoONhInwuT33qY102hE6jSETCwjMN51Iat+MOV1zL60wphQoP+O0SuMVh+r?=
 =?us-ascii?Q?PYBoCE3ZZk4BFbohlh68nuLi7RtCQfKPGeIfSVqvNDQMNOVvq1ZrqeyUCXiy?=
 =?us-ascii?Q?SzKjhPF0bW0HhKfc2wmY00WyLH9wVGnM50FZWIpNLCDqRWFjOf2hIAWii7w2?=
 =?us-ascii?Q?u0E2JixiGcFiUFT36qduxPC83qO8X54J4cLhhLlUSe/Tsw//Oqo7/lFeb7NN?=
 =?us-ascii?Q?DAp9oCUdUtnCaSCVtcr8JR+z55o1VsPnwR3VAkgF4T6baW9yfTwfMBQWxE69?=
 =?us-ascii?Q?qrYJ4bigAHV/P+feDRsLD0IiMsifSIERjrU1s/VTKmugz+W3ecGs8Y84fsr9?=
 =?us-ascii?Q?f+MSJNnYT7nlGSzNlUOr3YvM1nOTFOKEIHI2mFZZIRK6bbxF1WZnfp3F3k+7?=
 =?us-ascii?Q?NSZ4TpUVCNwCSddzPv4l2EYjyYNgIJjc7E/Hz8IxCl3DqPG1cxeCvfpxCtsP?=
 =?us-ascii?Q?B5QwmGCxKayBGVLkgzxS5N1yoVr5eP8Ht8foFm9ohUSGWOf+qbhDp4onUMuZ?=
 =?us-ascii?Q?lgSHPnEaO05lYCHiNn55OX6ViY0O6JT6r6D6GYijuJ9V6RZS+IS5dGJU7KFH?=
 =?us-ascii?Q?ffhLWXRsSiy7WKJ35n9Feh4mV0D0QeS1H0XrueAyPUUjwAQQaEFZsYz1FpQq?=
 =?us-ascii?Q?k4RPI/ZP+wjrF8FQDAsNViqtGwZXwUajG1zLphYtR3NDOL91QFU0giHU1Olq?=
 =?us-ascii?Q?sdtq8+qJyey56XggjprB/qhUATo0C/UasrW0dWuT6yXmMUVFotPGRspPbvjM?=
 =?us-ascii?Q?l1vk6xr4bv7lnfsKnJfU0gbqWD0eRVkNLCjnfOFJmG04tseLhsTBQcHSFpFJ?=
 =?us-ascii?Q?hafqviJh64SvTElRWZtLicwkgLzeGzsB/m00/othNRLZPTedjnifGisxHa8G?=
 =?us-ascii?Q?mNW6WFQxLNho6HKHUQ5AJL7ka6+QeApotSaBpuvo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412cf13c-a36f-4882-6127-08db04fa4194
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:48:29.3197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvuXBKEKSb8RatGj+o3ykjlUz+Kv2blpEy6PptcENTyMHiVmGfSWl5CsmfoUab+Q099ZgkmneKS8M1+Awd7I2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4514
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For LFS mode, it should update outplace and no need inplace
 update. When using LFS mode for small-volume devices, IPU will not be used,
 and the OPU writing method is actually used, but F2FS_IPU_FORCE [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.104 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.104 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pNVGv-008Iir-UD
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs: fix to set ipu policy
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

For LFS mode, it should update outplace and no need inplace update.
When using LFS mode for small-volume devices, IPU will not be used,
and the OPU writing method is actually used, but F2FS_IPU_FORCE can
be read from the ipu_policy node, which is different from the actual
situation. And remount to lfs mode should be disallowed when
f2fs ipu is enabled, let's fix it.

Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-add check in __sbi_store()
-introduce IS_F2FS_IPU_DISABLE()
-convert to f2fs_lfs_mode()
 fs/f2fs/segment.h | 10 +++++++++-
 fs/f2fs/super.c   | 13 +++++++++----
 fs/f2fs/sysfs.c   |  9 +++++++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0f3f05cb8c29..8ee5e5db9287 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
 
+#define F2FS_IPU_DISABLE	0
+
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
@@ -679,10 +681,16 @@ enum {
 	F2FS_IPU_ASYNC,
 	F2FS_IPU_NOCACHE,
 	F2FS_IPU_HONOR_OPU_WRITE,
+	F2FS_IPU_MAX,
 };
 
+static inline bool IS_F2FS_IPU_DISABLE(struct f2fs_sb_info *sbi)
+{
+	return SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE;
+}
+
 #define F2FS_IPU_POLICY(name)					\
-static inline int IS_##name(struct f2fs_sb_info *sbi)		\
+static inline bool IS_##name(struct f2fs_sb_info *sbi)		\
 {								\
 	return SM_I(sbi)->ipu_policy & BIT(name);		\
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fddff5deaed2..f06af2af215f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2302,6 +2302,12 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		}
 	}
 #endif
+	if (f2fs_lfs_mode(sbi) && !IS_F2FS_IPU_DISABLE(sbi)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "LFS not compatible with IPU");
+		goto restore_opts;
+	}
+
 	/* disallow enable atgc dynamically */
 	if (no_atgc == !!test_opt(sbi, ATGC)) {
 		err = -EINVAL;
@@ -4081,10 +4087,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	/* adjust parameters according to the volume size */
 	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		if (f2fs_block_unit_discard(sbi))
-			SM_I(sbi)->dcc_info->discard_granularity =
-						MIN_DISCARD_GRANULARITY;
-		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
-					BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
+		if (!f2fs_lfs_mode(sbi))
+			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
 	}
 
 	sbi->readdir_ra = true;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3c6425f9ed0a..e1f1ebfa59d6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -697,6 +697,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "ipu_policy")) {
+		if (f2fs_lfs_mode(sbi))
+			return -EINVAL;
+		if (t >= BIT(F2FS_IPU_MAX))
+			return -EINVAL;
+		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
