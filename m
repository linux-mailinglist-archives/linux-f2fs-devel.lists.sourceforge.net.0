Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9F6E3195
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Apr 2023 15:25:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pnfuD-0004Vv-IO;
	Sat, 15 Apr 2023 13:25:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pnfu1-0004Vn-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 13:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bhOLcb0Re0x9rvteffJ+likjWdSJeaW7RW3X4LQ0108=; b=JLv1KswSmU4TC67bZOiKpicYhQ
 TEtJ94NWuDlTWQfgE4inQawczPan+kp8lHV9QsmSGX4qTnxFOXwatoXupf5uCkkeiIEmPcYSYibYa
 IBX1X4ZnFhz9CL/MHaMzPc+AaP+4C/usosurCFCkSUjeXhETlVGVkJs/WbII0ZrOEeS8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bhOLcb0Re0x9rvteffJ+likjWdSJeaW7RW3X4LQ0108=; b=Y
 ejphgYNoDrYv6dXEGcCIVdsmM5VKWVn9+Z436ZOLznKC7KBIVz9XYX1ASR0RSUXGTaKjIHn5PgDuS
 xRjlPW1bj5gDRdM4qjFoMD3orio17wUD2hmPY0eEwWI0qfd7W0p+dAk0cX3paIHOyffrugOyzcuDF
 4a7b3eGkLHwgLQNY=;
Received: from mail-psaapc01on2097.outbound.protection.outlook.com
 ([40.107.255.97] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pnftx-008hal-IX for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Apr 2023 13:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsLJ5IYERocNhcs1vXzIzzfHETcfTtnk1+8UoYAKWHCGVneMQTFHtHC/qmJWIOYtBVyPWdHmBFHtbXdRnhvkWt7MTtcDqw2JCQ0iKkMrDFtfdgo4PUYbmrfhE4KeF2jFjzJAIeidqrpSwFdcCWCEswekiB+bQ+n15R902qiDsbfOeBFvsIEoxV5+akQBBpkkqdZVZ/jM8T+Efc4oyiPNsOqlcc+/L+z6f16D2JpTcx+w/a3vffE2KUiXO1g0y24si1JnDtH8JOeTGt4c3vAESoQoLSDy5oZ2vAQH4RcqEghtZ5mn5tXsmZW954iEwj0bKwvHYw5P12pW3KOVsmkirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhOLcb0Re0x9rvteffJ+likjWdSJeaW7RW3X4LQ0108=;
 b=giiVpJRlXSnjQEqOVI/Z/G9C7XxPmfbuhFlHYD+6ZNLNQwCYo1AQM6OdFg6VkcOGMckUr3DiXeByktc4caH+htxoXQgLK9Rb7e76EWarMYolG4Xu6BemUBH3qNZXhEYFxxAmSXHbNji4PSMJeURQO41hljCmT6BAsCrRFoYayNn2F277nYfdaI8y9rz8hMJdHdezZtq4th5jhH8+lkGK1Q3BfFMmbI4zvBqzwuOoFgkzI6Cfd97fjcacWJ9F4Zah5JwNxGy9lb6nf9xqsYa/gy4cpmBdHcYdQsxTyENbQTyO6XWSNhxFamM/mILklRt0MzSd8daJ8IqOqKTVLJ0cLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhOLcb0Re0x9rvteffJ+likjWdSJeaW7RW3X4LQ0108=;
 b=b69EO3f6IdT4o5978tD9uA+JJ2yeXNCVZ+XRBrK3ahvOicPBW5NbZ5oCfCHPpI0B8KONSzbJd14DuA9EdTLZhWigrnJlX2aZKvOXRzKLg+VxOd+RkXabPhgnRyLz0qNKhryM/WZRKYoUfnVSd9NhRSTcUz49ndypZKwoThFALY65OLON4KNqTS0qTUmm8s0oF6jYoUyuIPjAl42wHXHXUkFoXN3RNBbr3KDc3hz2jaX7t/cyr7EUA5QmxiHWCbz0vqElEH2x//z/rfPc6lL0TnF/fjycWkIEGGo+X8ERYLtTKpHRltYUQM6VctbVyCq7oy+gQ9HOb2GpMZMDR1PXVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5164.apcprd06.prod.outlook.com (2603:1096:4:1af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 13:24:58 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Sat, 15 Apr 2023
 13:24:58 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat, 15 Apr 2023 21:24:46 +0800
Message-Id: <20230415132446.13063-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: c99f11c0-5ed8-4bb7-75e4-08db3db4cf03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSBVhsPXp7YdRcUHkqaiS/cMiz64blC0Sa/zohDayp1Q9MQ5/F38T7S32BzhoqG2RCBrdtG+4xmvWZVgkhBKc9GplQT4PUEQf/ZzjBH501gqUPDf8A07ELWX+zHnMuxYUUYjY/xRh8dbJF1pfkq5ecu5SdXODbbadAR+4Kn9zio3BmDZmGHzVKwFXXTGXNI0idNcGIgL+z9A6b/GEnRopyS36KR85HXrvdDE05N82IByj/FDr45ncJ3pX583EQT6+z0ReF7bGFXVTe0OUTUvFKcBhLYfZBZ0+d0kMPmZnGq46EF32hLkU9zsjP0wOeF5hR9H3+71c1jkp2zCs77XDztXn9G2Dad4DB0r3tS1sWiG+zfq0HEx+UDKU9a7LlhqDR12ZuKFU6pMpAwAor4SS37imlQgFcoZ5MGkHNoPucRBj6ayfaNTOfTfE5fZ8pVSdHjTqdNpHoNPjALzp3OdkYfFD1PZKt/Xa0xYto3LaOtGY6wku9wyCvOFDHR8nzEx2zB5U6D4OpdWWka1y+hWSC4RmhumJeNwCBU06GoaQ7XlkXITnu9qZEAMq4Dc26i1bogIawB3Q/KutyrX5dWs6j17tEemHAcOsOYhUBBx57jleHmBtq+qqmS1RxnZp5GS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(66946007)(4326008)(66556008)(66476007)(8676002)(5660300002)(186003)(83380400001)(86362001)(52116002)(6666004)(41300700001)(110136005)(316002)(8936002)(2906002)(36756003)(26005)(478600001)(6512007)(6506007)(1076003)(6486002)(2616005)(38100700002)(30864003)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tis8sXJw30pK/DRLZxaOTKQiqDbRvEk2UmIo+EcHXVh8OmAQ0vHGyQCmHpU3?=
 =?us-ascii?Q?5icbgrDZeEoiiu+3urAJ5OxN9NKspKcpP5+LzVhg7bQumf13FN85EIgEnWLX?=
 =?us-ascii?Q?t2YooOXG/8JUW5raonom5FJvwtMy9AWO80o7IvaBc2UjV8SRZy6MjdBMWGBG?=
 =?us-ascii?Q?dQU+NxKfJ649b8oSlwLRg0qDV3LNu3ZR/ViMx7S/ApnSx9mQQ/GemJGQ1Avk?=
 =?us-ascii?Q?zSjzF7wbGGmq1hpMPikVH4G00nqHUBkZMa1XO9HWLVid7Ap+uVEnyNGVDuvh?=
 =?us-ascii?Q?NLe5hFPQ/6xcdkek37z2dMKtskBPukd47voon35ZyEa0XgGDCm2oFfR3AryH?=
 =?us-ascii?Q?fDxmD7jm+oJ1xrqn/lTmxFSZj7ujpq11hCKPAGZUOaqnbXJZGqE7npAMp61u?=
 =?us-ascii?Q?QfBDKJIvu7HALOOWH2DZaBHVd4fD7yCrNsBv0ookup2LhzwuMXqDtqwByqQY?=
 =?us-ascii?Q?gGUUMHFgNB/Kto9RGEQU5EvtA15EXxLsY7OgAGuaVyXTotRVV+GFKUitJYU1?=
 =?us-ascii?Q?urbQP4Sz6V0jqZUKrN2Gg2S+YJPUxpDKT+xJicSQsZE4968G+QYPa9EzItTj?=
 =?us-ascii?Q?wwfoeVP236iCfBNB4lA7AKU07xq45OG2r2zWBQPX6jE+rJfEMhjlsuGTnxM2?=
 =?us-ascii?Q?xRpTCnoR5gcS2hmkBMB7oZQGQdjnVacB07wJoZoP4Gt0MRmdrFb0JM+YgSg6?=
 =?us-ascii?Q?iqhq6TD06NdYjcn43AW2nFjv8UKETAjkld5jD+VdT/7rgLPXA559+iUl+fz6?=
 =?us-ascii?Q?gVqLC/ITzUO6eEWl+F5u/W54BwykTXbU2s9Rfld6gqFWE6YN7zLVIMvTamXF?=
 =?us-ascii?Q?jUggQ1mk93Fpa1tqcwhHHmZ6Jv8VXsFHEbSe9soKzAq97YNDDS1CFBaQN0uX?=
 =?us-ascii?Q?+g9TXlR9ikXQWDfA8/dpTytb0BYLyDZM974PF+ByhqniDUuqmTzUtc3Rt6+3?=
 =?us-ascii?Q?9XDupHiz2d/F052pHYA+p4+zSx6Jw8x99VjS1BPYw4FH4B0NnUWoIZu1n5wQ?=
 =?us-ascii?Q?MlneEUQuh8ANz2ZOP/9LT8zXB1Q8AAfbrd95Bv9KrGPDsDrrFN3gE6CVSzOp?=
 =?us-ascii?Q?Ix2jJyxde3ccnxFc3/hAACDhgSR3tmwD0VtowoBRaDjJQOfINkNT/TV32XjB?=
 =?us-ascii?Q?HUL0KqhGKefMIXnamNpKdWB+X5V7T+FSfX0Z9l/N/5lsMvCmS2x274rrM960?=
 =?us-ascii?Q?NKghdQJ736JkBkZbhhasSBof5cj4xAQ3byFuIEuOFE/533+LEzh5Xhr3Pflo?=
 =?us-ascii?Q?Thgt/PPnKVwDllApZix70NbwMBYCQW85Tsse+tUngBgbzsm5E7re1mKPxzQ0?=
 =?us-ascii?Q?2h4qsUFdCqUjyhwCJQoIvqbanAQoMMUeB1QF9kqftBKsaluHBCtxxq/Jt1l8?=
 =?us-ascii?Q?wa6Frpa/wsq2EWU5X4viPG5SruCyFidGhvprL5mRHORYldtHF9fCcpl2BNRO?=
 =?us-ascii?Q?fdYj4Mh0ErKCtEKTpM+xLV1LxiaD/iF2CTP17DGx5Tshdwu/XwlVoqM61DQ8?=
 =?us-ascii?Q?iQ18knYMH3OL4Fv9sLDwkceiPOAmqYKUrbUvm5EtOeXqRC6TkFwFbDBYUhXH?=
 =?us-ascii?Q?CBTwHeV4kB1GcVOxAzuUdZlmj9kcemMc9CFBg89Q?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99f11c0-5ed8-4bb7-75e4-08db3db4cf03
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2023 13:24:58.1326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80/1749E+SVONfPtwsrUzhXWCUokH+2Kj6KYMm4zZGX7ir1sN6Xhn0Ef52wMSz+g7GOc/Vo2KtyVm32lDkyXsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5164
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
 the f2fs_attr structure. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/sysfs.c | 237 +++++++++++++++++++++++++++++ 1 file changed,
 146 insertions(+), 91 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.97 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.97 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pnftx-008hal-IX
Subject: [f2fs-dev] [PATCH] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch provides a large number of variants of F2FS_RW_ATTR
and F2FS_RO_ATTR macros, reducing the number of parameters required
to initialize the f2fs_attr structure.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 237 +++++++++++++++++++++++++++++-------------------
 1 file changed, 146 insertions(+), 91 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 8ea05340bad9..b9aa2f989387 100644
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
+#define FAULT_INFO_TYPE_RATE_GENERAL_RW_ATTR(elname)			\
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
