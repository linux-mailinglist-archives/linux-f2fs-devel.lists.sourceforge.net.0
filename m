Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFEF6E321A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Apr 2023 17:31:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnhsN-0003R9-DV;
	Sat, 15 Apr 2023 15:31:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pnhsM-0003R2-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 15:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EGizgU7cjM2YbXEwrOIA9kzvJPnBfTwTXZ43ap4GdM=; b=nQEkh/4ujiNg8EodM5qrREGVfW
 qB6iLRwP1K7PEex+T3fpsAmx6GUv92KSA4wdCBeFrMFXcpXNUZ1sKD6EpC331ZbUNb+6UBJwYyfMF
 IqPX7WDn7WT+6XKYbjz2FSIOjygRn7W9XtaHGsLM+2enjYlYYythI22PcX4tFQckdL1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1EGizgU7cjM2YbXEwrOIA9kzvJPnBfTwTXZ43ap4GdM=; b=d
 RRIvYMYD+JitrZnNESd0vo5KoQSiAWJhPY3fjjDx5WVR6A2xonP1zISuvKW5+DTupA084gOwXul0R
 +qtdZ2psUuJlmov0Fiy29kFvZrdNZZNKvF0xFFCP2UbSZl9TlbAD/7qCTeoOcTVb66JrCDSK4eCsE
 01w3tADhPYeFuE+Y=;
Received: from mail-sgaapc01on2138.outbound.protection.outlook.com
 ([40.107.215.138] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnhsC-0002mV-8U for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 15:31:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8IyJFGtnm2Z+TJ2Mo/hP8TdGkyewcGitoi23prQt0leDnqf23dktZR5Ha83ye0Nb4FU5GoYNRQt3WjD0bUmZIR+XQ0oH+AWWxKEavByjUEgeg9ARKGSwr4sCTCM49t2TnyGDUfgrExaGW+AYBPeu8GxzDWpkgcu9k2VMrQoPxlQ7GOe+7+pHbHkJ6IGRzDCcMySd4q/DGXAbOg2qhlYtkgEaIVLQwDnpuNpa1ICYQqW/pWGEsZUMTdkj1lZ3pDjknTaelxkuYd0P7HEVpObFcG8kgdcD6otal5lLg0lmNdOUvIXKWE1IYNAkNwdultSeWNAB0MEOW3BuXY0EA20qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EGizgU7cjM2YbXEwrOIA9kzvJPnBfTwTXZ43ap4GdM=;
 b=R7lOQ4S1+Otab7jguTWHx3qhuTDOfdvPnPffUl0kRt6UyfNZ26U2h0N3defHDGsJ/pMXXjjAdgX85bTTNNFMrLAQ/ouubP11MwXxl+h+Rldtv7BkiJvpD+YPVLHMuyAD++LjiSsBarZPmCmtYr33GjTbgjP21McFG7EbewlzWtowyvJGV8KuD2OCNHR1X4/RNJVeUJdlMkJaGGIZJ84LbN0x4DtUPYdSAApmxpbdvasFGDhE/VqCzlffd9DC15S/3t96SiJcwBWHFXjgZs7af9k3OqRVZc3EDEofSTQikrO+lpeQk0+SzD4NKDYo8sGoA3zlJrq4Gn72V5Ktoqpi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EGizgU7cjM2YbXEwrOIA9kzvJPnBfTwTXZ43ap4GdM=;
 b=d07x53fhwCqAIctIHLNGR/BnA6BxZJEzLt1f+u55stQ8gpa0WSwbgsTO35V8/yzwaEMm+xWa5GL26V+lzrnQdja2GAdxZGWp7HjIxxJzrvhd8xBn1KTOT2IjUmszSgFLMTvZChTFltXrCUrQsYL/TP8mH+EULfILgc3SZmlSCZ7V5Irkixw5iMJBnvyKexb9VBBFmbb8w/kWcxfVNKh8r2g8qTUsL87aHST4ukWdoCf3WaYwJUKNfXj47+EL7auH7CEb9IaLEskYOHtMzV47KuvA/Lh/iI2LjuHx9136CwfGlTDARicAr8fvROxOUe//jIeqLlYfLGFLrcvz8mTaDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5431.apcprd06.prod.outlook.com (2603:1096:4:1bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.48; Sat, 15 Apr
 2023 15:31:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Sat, 15 Apr 2023
 15:31:18 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat, 15 Apr 2023 23:29:43 +0800
Message-Id: <20230415152944.51393-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acd43b5-4297-408e-0c10-08db3dc67540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: soBbx5HCpjU/H3+Ri9XOeFJlkBofsszXMrr97l2974I+OSrgK+sz6fmjpkZAi6zSww8JGXvnI47ZLPZjP7cD4G5BPzdRErQTRrrQVoRltH0uTXjUbubDBZpZbmXVHRoGdnVFlkBXdj6EJdSo4jACthIkOwe6y+L68Mpg2ciXcpGyFZ1A+4GSdApHPESXaqvNnlLjVx5LYAQheXLVmw7IPOpZCNWwuqs09luCu2OpHzntNqTqBrDwcFMVAjIrYrp+UGKG3jsntcsMI2lMwmrso94x+t7j4MejiidgkLA9e10Uo+MOpxqf3Zg1M42BvJvTglWAN6L6Z6xMlTtaEe5FfK1EAClocgvJOsvTAx2nHH6iz84WXJWSrfemsBnr6i6Ofa3UMnZk9kVbPgZvERQRCugDm3MFHsMk/SNTpqN87ZENQPN9bIriEIUMIlx5nqh8TNzni2maBIft2jRkHArceDMDMttNqjS9sk7GDxKaFUt8dXUHVKDrlvH03Gje4iJIAV/8D5Dh4Y52ncHjCeVc1UN2V5TOAbWwq+yz3ucLwSJfyM1orlbfEPw0m7IK/xWvmSgTV5GPw3ZD5CA3zM0XbOdi0XB2iH7FeCdcRxrcyow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199021)(52116002)(966005)(6486002)(110136005)(30864003)(478600001)(54906003)(316002)(6666004)(2906002)(8936002)(8676002)(36756003)(2616005)(66946007)(66556008)(186003)(4326008)(66476007)(83380400001)(38100700002)(38350700002)(41300700001)(5660300002)(6512007)(6506007)(26005)(86362001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dgvqSGez4Sq1oQuHx+k1cwHvS6umpAL6TRCjk4iSmNzXX0mxPPxYBNfl1eXJ?=
 =?us-ascii?Q?almaY6WgzK0V45MJGoXTTXyeP6py4sQKG9Mlaz+Fl56NkplWyGtLXssGJlFh?=
 =?us-ascii?Q?m78OegoftojGPTSH/RIJfzcMFmIQFEB+UFI5xE4cg29ulfl4FsGE205Irial?=
 =?us-ascii?Q?KqYTCS3qeaoL5/8OCEGh0188bk5XqtBYq6eYzfcfjIYJxwHhspdQy4Dm7Fcr?=
 =?us-ascii?Q?yR0v6tQa0hDUt8uV4ycM5Nw/orWHVOg1MBsYmt2bvQ5HoIQ9ldFWREA0Nrpp?=
 =?us-ascii?Q?hJmXha/CPcTVzFWABy5/ge/ryGAdWFHhwU9f31adYtH4aMFVALw7VTFwFi/i?=
 =?us-ascii?Q?7rV4o4Zfk6tvYHbVM8KjPmFE4ncIhG4JYwaGUHuZDx+kjR4iOl1QtPM0NyV5?=
 =?us-ascii?Q?S8H7f+MzcnS2CMxq6A3Uw2fJx+JyjdI6uTOSeqqCJnXi4KZDyQgODQJi5oqx?=
 =?us-ascii?Q?x418gjP76w9QqSJhLTR4uWlhCAmkzMOeXzhld9GD9E2lbDuqR2PxQf/y8+Rz?=
 =?us-ascii?Q?oROczhaxker8ju2gj22CKNm4v3zj0/CssI4kKbO+xtqcFWAlI8Wu8p0KD47o?=
 =?us-ascii?Q?7xZUnvEfX+yMT62yKw4lSbgPG0qmpetfhPkR2p4QRmV+n2UeJozJHSZ9qQAX?=
 =?us-ascii?Q?YIesmvz6djHQ4EpC1HKuHXvOjCQEC9yV1KfSVswegZVx+mt7kkTbbGYmZVwR?=
 =?us-ascii?Q?i0cE3UQX0EAAdCXA9kjR4rUJt/t0l3OWolvtnJVMya8JGK5JyA/uJiq7PSrz?=
 =?us-ascii?Q?OpVHhHcteoBZQp7L+joY5qSQIzsDhZk7/MBjK65YS357i/M6RxBbsl9usk5L?=
 =?us-ascii?Q?oWF0JniPtn/rd3A3OsFS/nJQeMBDaCI5f1kbZEWJX6cyrVm/vTsIvEQJty6H?=
 =?us-ascii?Q?4udXA5yyLZ2O9/UtqKGXAbyJy3PlOfIfWErEASOf7xNzVP4zgkoekmQ7OjbS?=
 =?us-ascii?Q?H/LGqRCd1mSo114M/AHkXenNxhKA1Ybr81RFHZ9AX/QMVo0Ig8soPnU2t6yo?=
 =?us-ascii?Q?utj5XEQfGQslV4a/wGc2tdKxRz74TtsV7pKvgiunfbAejtsGHo6YEKUHq82H?=
 =?us-ascii?Q?G3Ux3ENbDJZRXhMGtmrvsB4Hu2VHtv3rliOT+OYQmim6tBapMUK49QO9ngbI?=
 =?us-ascii?Q?Bqwp8D8vwkmXPcZfV+9Gwc3y94ux5wxtco17cq7pO0NsaZt02bJ7/ilCgSIL?=
 =?us-ascii?Q?r79SFrjP/br43ZedJXH8pa2j7IwOCZDrIp5e6LpDzndQJOmBraHoNKle3Zcd?=
 =?us-ascii?Q?VB23smpmLlzRjomnp88ibKuYKHqy4/1UQLVOdT/0EVh85OfVjuRGYmpvjIY0?=
 =?us-ascii?Q?eBHaEWQP3yACHXaScdyMtpF/jRAIlgQooBDaeOCs9mSdIvrhj7QT9SwsjmT/?=
 =?us-ascii?Q?925pRoy33tnBhc6425Dd4z7Q1J738bh9/vWRwjXknT3M+T8rT9zp/8fMfHo1?=
 =?us-ascii?Q?Vj8JUawbBuuQWZgVUaCTM2dTCplXtCt2zTUmM6MKBTNAjTr9jwmn4Zx+rX4T?=
 =?us-ascii?Q?jxCEdOTPG0pZwVrcR4LSY4kJfHgE0ckX1pR+w91W3cquwP78C6ngmy62/pLo?=
 =?us-ascii?Q?l4Ezf7dyv1SEPj9c4lc1oD6DGGyQAU2ADDaLqbfh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acd43b5-4297-408e-0c10-08db3dc67540
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2023 15:31:18.5383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcQqXqlZqn+5aUWAc+2ByEh4nWSp8osZRcS5Hxl58+L8nNNQnqZMTiuJXmJTZj6kvkgHFa848G+QqzN/yfI8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5431
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch provides a large number of variants of
 F2FS_RW_ATTR and F2FS_RO_ATTR macros,
 reducing the number of parameters required to initialize
 the f2fs_attr structure. Reported-by: kernel test robot <lkp@intel.com> Link:
 https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -fix compile error
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.138 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.138 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pnhsC-0002mV-8U
Subject: [f2fs-dev] [PATCH v2] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch provides a large number of variants of F2FS_RW_ATTR
and F2FS_RO_ATTR macros, reducing the number of parameters required
to initialize the f2fs_attr structure.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-fix compile error
 fs/f2fs/sysfs.c | 237 +++++++++++++++++++++++++++++-------------------
 1 file changed, 146 insertions(+), 91 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 8ea05340bad9..1fb38b222684 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -842,68 +842,157 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 #define F2FS_GENERAL_RO_ATTR(name) \
 static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 
-#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
-static struct f2fs_attr f2fs_attr_##_name = {			\
-	.attr = {.name = __stringify(_name), .mode = 0444 },	\
-	.show = f2fs_sbi_show,					\
-	.struct_type = _struct_type,				\
-	.offset = offsetof(struct _struct_name, _elname),       \
-}
+#define STAT_INFO_RO_ATTR(name, elname)				\
+	F2FS_RO_ATTR(STAT_INFO, f2fs_stat_info, name, elname)	\
+
+#define GC_THREAD_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, name, elname)	\
+
+#define SM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, name, elname)	\
+
+#define SM_INFO_GENERAL_RW_ATTR(elname)				\
+	SM_INFO_RW_ATTR(elname, elname)				\
+
+#define DCC_INFO_RW_ATTR(name, elname)					\
+	F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, name, elname)	\
+
+#define DCC_INFO_GENERAL_RW_ATTR(elname)			\
+	DCC_INFO_RW_ATTR(elname, elname)			\
+
+#define NM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, name, elname)	\
+
+#define NM_INFO_GENERAL_RW_ATTR(elname)				\
+	NM_INFO_RW_ATTR(elname, elname)				\
+
+#define F2FS_SBI_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, name, elname)	\
+
+#define F2FS_SBI_GENERAL_RW_ATTR(elname)			\
+	F2FS_SBI_RW_ATTR(elname, elname)			\
+
+#define F2FS_SBI_GENERAL_RO_ATTR(elname)			\
+	F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, elname, elname)	\
+
+#define FAULT_INFO_RATE_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, elname, elname)	\
+
+#define FAULT_INFO_TYPE_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, elname, elname)	\
+
+#define RESERVED_BLOCKS_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, elname, elname)	\
+
+#define CPRC_INFO_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, elname, elname)	\
+
+#define ATGC_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)	\
 
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
-							urgent_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
-F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_seq_blocks, min_seq_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_hot_blocks, min_hot_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, cp_interval, interval_time[CP_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, idle_interval, interval_time[REQ_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
-					interval_time[DISCARD_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
-		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+/* GC_THREAD ATTR */
+GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
+GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
+GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
+GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+
+/* SM_INFO ATTR */
+SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
+SM_INFO_GENERAL_RW_ATTR(ipu_policy);
+SM_INFO_GENERAL_RW_ATTR(min_ipu_util);
+SM_INFO_GENERAL_RW_ATTR(min_fsync_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_seq_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_hot_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_ssr_sections);
+
+/* DCC_INFO ATTR */
+DCC_INFO_RW_ATTR(max_small_discards, max_discards);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_request);
+DCC_INFO_GENERAL_RW_ATTR(min_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(mid_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(discard_io_aware_gran);
+DCC_INFO_GENERAL_RW_ATTR(discard_urgent_util);
+DCC_INFO_GENERAL_RW_ATTR(discard_granularity);
+DCC_INFO_GENERAL_RW_ATTR(max_ordered_discard);
+
+/* NM_INFO ATTR */
+NM_INFO_RW_ATTR(max_roll_forward_node_blocks, max_rf_node_blocks);
+NM_INFO_GENERAL_RW_ATTR(ram_thresh);
+NM_INFO_GENERAL_RW_ATTR(ra_nid_pages);
+NM_INFO_GENERAL_RW_ATTR(dirty_nats_ratio);
+
+/* F2FS_SBI ATTR */
+F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
+F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
+F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
+F2FS_SBI_RW_ATTR(idle_interval, interval_time[REQ_TIME]);
+F2FS_SBI_RW_ATTR(discard_idle_interval, interval_time[DISCARD_TIME]);
+F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
+F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
+F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
+F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 #ifdef CONFIG_F2FS_IOSTAT
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
+F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
+F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
+F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(node_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(gc_remaining_trials);
+F2FS_SBI_GENERAL_RW_ATTR(seq_file_ra_mul);
+F2FS_SBI_GENERAL_RW_ATTR(gc_segment_mode);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_chunk);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_hole);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+F2FS_SBI_GENERAL_RW_ATTR(compr_written_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_saved_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_new_inode);
+F2FS_SBI_GENERAL_RW_ATTR(compress_percent);
+F2FS_SBI_GENERAL_RW_ATTR(compress_watermark);
+#endif
+F2FS_SBI_GENERAL_RW_ATTR(peak_atomic_write);
+F2FS_SBI_GENERAL_RW_ATTR(committed_atomic_block);
+F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
+F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
+F2FS_SBI_GENERAL_RO_ATTR(current_atomic_write);
+#ifdef CONFIG_BLK_DEV_ZONED
+F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+#endif
+
+/* STAT_INFO ATTR */
+#ifdef CONFIG_F2FS_STAT_FS
+STAT_INFO_RO_ATTR(cp_foreground_calls, cp_count);
+STAT_INFO_RO_ATTR(cp_background_calls, bg_cp_count);
+STAT_INFO_RO_ATTR(gc_foreground_calls, call_count);
+STAT_INFO_RO_ATTR(gc_background_calls, bg_gc);
+#endif
+
+/* FAULT_INFO ATTR */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
-F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
+FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
+FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_remaining_trials, gc_remaining_trials);
-F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
+
+/* RESERVED_BLOCKS ATTR */
+RESERVED_BLOCKS_GENERAL_RW_ATTR(reserved_blocks);
+
+/* CPRC_INFO ATTR */
+CPRC_INFO_GENERAL_RW_ATTR(ckpt_thread_ioprio);
+
+/* ATGC_INFO ATTR */
+ATGC_INFO_RW_ATTR(atgc_candidate_ratio, candidate_ratio);
+ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
+ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
+ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
+
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(ovp_segments);
@@ -917,10 +1006,6 @@ F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
 F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
 F2FS_GENERAL_RO_ATTR(avg_vblocks);
@@ -935,8 +1020,6 @@ F2FS_FEATURE_RO_ATTR(encrypted_casefold);
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned);
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, unusable_blocks_per_sec,
-					unusable_blocks_per_sec);
 #endif
 F2FS_FEATURE_RO_ATTR(atomic_write);
 F2FS_FEATURE_RO_ATTR(extra_attr);
@@ -956,37 +1039,9 @@ F2FS_FEATURE_RO_ATTR(casefold);
 F2FS_FEATURE_RO_ATTR(readonly);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
-/* For ATGC */
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
-
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
-
-/* For atomic write */
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
-
-/* For block age extent cache */
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
-
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
