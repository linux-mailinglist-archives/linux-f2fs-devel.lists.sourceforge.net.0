Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6A66DE9E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 14:18:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHlqx-0001Uf-OF;
	Tue, 17 Jan 2023 13:18:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pHlqv-0001UI-O1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 13:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8bMnH5jWPEKaNdGYDSsNc8HEQKql/H1lFBS/NuavcTI=; b=dtwwrFNrUnyrIHAOfUN2bBG4Y/
 kPfH6LK5UPuZezkkGgMa9d+4i8lJvrOa7p/pjQPNEHvjDK0Cn5QvONoj8y3sN5KzBZRah1EE/hqLQ
 xDqXFpQz5pmwuMkHvxzEnJEhazGJaiB0hd1npFg7WUJzSXfhcSF4UhKrUadd2Y9ujlCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8bMnH5jWPEKaNdGYDSsNc8HEQKql/H1lFBS/NuavcTI=; b=Q
 l9q3en91G0n8jJd7ly/HxI9ET6aFffue4PQ3a8O+AcHH0HQRv1/s6E+SXbdHGEUAg/YDpsLrPbcAX
 Q/py3rYFinn6KjV9GSg+yyeoAT1Iod4rC59XGXprFL3GAfXXa0MKAegMj4+XoK5OPE6ijtjIbK/Pl
 DR1yRMENIcE5zvTo=;
Received: from mail-sgaapc01on2129.outbound.protection.outlook.com
 ([40.107.215.129] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHlqp-006rdw-DA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 13:18:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoihBhxPq+vsMo2yLxWtTNLHIu8aGskRl4x0ZvGTEqdJ09jglJ5I8E/AudEe6F7wxKSWQq0kytlaE22+NppEze2q+77uMdCU8jshp+k9DK0aGOVGI+0XOdDxMCIxnqkekzL4Vu4NcTbElSmBxfpSlcl81xWVpYyDOnam3mMSGVM8pP4nffLdh0EYxkh1/K3wAeLUHOWXS3b06KnlwjpvfTeoy7iG5hBZilZok3H3ik0OMo/mmBfoF3EgHG8Cw9Er80C/ZW/d9pjIQ3ybe3iN2ldArybKKRwhiXV4Npzc7U9+TifgH2Bmkj3mn9xgxF/TcMJNpCMrsfRm017DsiPkhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bMnH5jWPEKaNdGYDSsNc8HEQKql/H1lFBS/NuavcTI=;
 b=kfFB23Pk954Al02WKBzGgiwRIN3UKburpc5nENDAEzBk0VgtqSHYV57Wwb09iW6IaR2rQCylAEPXQ2irHDBlWhss4amJt8UbydG9cf65xOq79nYD7hClCtlTSF8O9xGyBMBK4VGEEmWpOvU5SWQaDManWwsFYda9G0jPm2H8eXDLsCGnAGQ/sQF8gBaT61wTI8k34PBqIPQbWmLXAZhnGw+gBDRY0w7PYtTsMAi0ZgNf+0xwar+pWWblXW4vfvnWClnT9tZVnxplps6YM/VIo0S/pUDbzV/YBpW+JDN0cUFeZ+C2fceFMTn5D3T+OcskBmEKV0Qv137QGdJMIvsAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bMnH5jWPEKaNdGYDSsNc8HEQKql/H1lFBS/NuavcTI=;
 b=YxEh9Y2eP7Hzhg6tpQIPDKGm7p1bLX3HQtXlLKKpGJzSNDUw3Tg5/cMBKnWPcq4RI0uF470kxjByg5yOjNspDmMgN0sGEXMDOcvgZTwEbvmptfWfD7YuspTIEUIe4HZYkp2V5DxVeHFNHebp5j/oy4pqln7TYzBTb6DnEYJkxGKrv1LH4bRw4QLh7oF2JmSYMTxnEo8w1TSrVvfE6X7R+qY34w0IX7ZPhA0mI0cwUnVBLdk4dItbxABy8iCbHKLGrQ7zTVeTIOtmXPLb5o0Zp6LYeyVMo59L8CAbdwWe+7+wOkyWkn6Lb0kMOpENQHjjrtyTwbxb54gSQv1yF7tvAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5566.apcprd06.prod.outlook.com (2603:1096:820:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Tue, 17 Jan
 2023 13:17:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 13:17:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 17 Jan 2023 21:17:40 +0800
Message-Id: <20230117131740.76597-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5566:EE_
X-MS-Office365-Filtering-Correlation-Id: efa2afb8-2722-44ed-ac12-08daf88d3be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YhKBBMs94CVubTDZea41d6vE+bK3CNpxZCIgAOaduGFQjmnQqHoqR7z5NQ67T1vDSvpPpi6t47ar4rvpPTy1nINpTq3q3auLYozNTqAmEpl2diLr6RNqIu3Oknoaw6XjgaEn4Mpo+Q6tvm37iPK6NF/0xwqVNJUlU5JGerg2cYUYSjh8MrhXBJtPdqWc1uOPNNFaLKRRLju/PJM5Fawp0Ryo+ATNnA8v5dIS+vUzQMGrijMPvo9A+HffvFKR+lezdsb4moqAp+HjWmqSNSPLdelLnXXBMieklIIBJekxckCMqqARV/0ubG4129Z63mNcAHmcQX5PgOTAdCQQM/9QoTlgpOcRmp0IAfIOEXkE/5DMHoqG7IpCPoizylQq3v0F+aPgYWRokm1p2ohCtx5q9fdN4n6585D4EVICIhHOINJv99kniYxQEPdthTZnJDKpmbAjaAUeugtfDphzOTCu0PMRxjcq+uBSbWfEo3smi45+shy25++JqIUr5DJtTct/gvChCQnWYTZMEdK24tpJ3Yn4H7pyxZd3i2nTFDwfx5uoKeLnHvRPGOV0JMbEbVaC08aKEQyFtvKBwP0voQpV0397wMowCCECcDbJMi/QBdZT6hpyx29S7pJ2OQenxB/KVtPHELLOpZPowX8CXA5GAccS00R/O902ba91307c8XqI2ignxfKgHj5Gr+n607di00N658gIS8uwdT0qy+HJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(83380400001)(38100700002)(38350700002)(86362001)(5660300002)(2906002)(8936002)(8676002)(4326008)(66476007)(66946007)(66556008)(41300700001)(6512007)(6506007)(186003)(26005)(2616005)(1076003)(316002)(19627235002)(478600001)(107886003)(6666004)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GElBx84mvsoyUA//7GmlrNTm6/ocjBt5n6pnMXzwYbY7Gmf9h46lpn3jmzjR?=
 =?us-ascii?Q?PA3tjsg9oIJidITM6hyXtPUX0yRE+/J5DOpb/AdW5V/xmzDelay4ceD0Reaj?=
 =?us-ascii?Q?dXn53P3fB2SiLvyZtEkbV1Sby7KZo5Z1OXvAQBRa3GAVRZgvcCEeMiqlIjlT?=
 =?us-ascii?Q?g5x4D6TneLqv0x668zCJEvgtf827Aa4vB67ClfPkTHA56+LG7jwlzydxsjJu?=
 =?us-ascii?Q?ZN+WT6UKqWjnxKGm2PzjKxR9BlCoSyPBNOUthRhq2LfBVjoeoTCvFmVHEG0O?=
 =?us-ascii?Q?U8V4OmYgutvyI4pNz1HLDEGoWCuZzn1Ubh4V1/rCskpo3DjfSzQ2NrAjgL76?=
 =?us-ascii?Q?1QKzYi9f6lzvc4Q32x5rFxJnp/z9QRoxS2/zM0jPH7JD1FUGMHAsJeZGB4Ub?=
 =?us-ascii?Q?LCm7cYpS+SgJ39oeaL1nkyhg/rFPvcendyHtoUykZbxr7z/awTkOiCgBnbn9?=
 =?us-ascii?Q?xN+D1LrUGztNZ9QuPnqzxphC0ICLDlgJYsBqqyiNxogWpyBHXoMeWCJq/jh6?=
 =?us-ascii?Q?0Sus6xPOGD9k27FQ/qMFQimg9wJBt4TSnHkY6xNOJv+kTj39xrWAdNF4Z2qd?=
 =?us-ascii?Q?knffZuH+EGmi954q1fPr8/OhyXL8Dfo6ieQ1EfXuOMjlanFqDH18onWEduTR?=
 =?us-ascii?Q?REUyUpmw3kIh2EJTESUClNXYpdzgo9fHECD8QvIXRyQWSAqua7ogCbB9kcbV?=
 =?us-ascii?Q?XZ4BsOlCpEGgIpIkLcxdtAkMwuUJkpbE1T5tYkqht43Nh32RICyu5WhsqPKl?=
 =?us-ascii?Q?os/wt0NiTiA/drUuWhlKEunvEn/BpcgCg/q0zfZjU7PkZimIi4/JrfAstNKR?=
 =?us-ascii?Q?h9ugxDC+OQwOE4YvcRN6pqG21wmIad9BKYHY6vWvwHBrLhUl6WEPrETDYAV/?=
 =?us-ascii?Q?kPV0yMFFP736wuKYVALPcSHd4TqDdfATXVtwwD4hew+fMxOkuQy1HSRYTDlJ?=
 =?us-ascii?Q?B1le/u2I3icFIEmBXgWZfczIvDmCuvsq/dYlPTS9xzCNj5dq2QDQW9mpfgGj?=
 =?us-ascii?Q?R4S2SRvH3/vL60OaALbXffmPQod7R5vbmpyFRpadu57pb+5BZvNSgcm2jirV?=
 =?us-ascii?Q?GQ4vWbTeI9UMjjGZqPvxmX+4LgCWNDpZSyUDFmEm1MJVL/IyFdI4R+nCJEwL?=
 =?us-ascii?Q?HBLA8Ichu+qezB+QOgYMRwmEfbV2WgL9l5CgfT9rMEs+MQbxlXrXBWfPkoV3?=
 =?us-ascii?Q?Ty8eQ5HfDMVay5j12fO3lIVn7I2dFPduokWuNmmZRWAu4BZ/9b71lwM6AkAk?=
 =?us-ascii?Q?58Uz9RkEAB6mvgsQRIAG/TlwYfJ7STFsbGFlVjMY7sxiXSUmye5syKJk9X4o?=
 =?us-ascii?Q?b2hZ9ls6tP5ei5w5D0E/MgMYBq9JH2gNgqFfeEh4wqwl232XZzBW6AUwDr2k?=
 =?us-ascii?Q?Iky23NNnwk7ODkn+jKDuykcPReh+K+trFCgVQZTuleME/ZlGyNerAEXm19Pt?=
 =?us-ascii?Q?bfTueYzYrUy2mMuC7n9kRJmcqY1zswZHwsmHCK222+ib3evSJlaaCGrWm+4A?=
 =?us-ascii?Q?foPzo7KwBSKomoinR7gbh9vxDaAqc4ZvXTn0LMUPHokY1E3bshC4LJNNqxm+?=
 =?us-ascii?Q?ArMMBN6aOboR2OWKvRzA2LyvIJ7YJx0f8uB93ur6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa2afb8-2722-44ed-ac12-08daf88d3be9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 13:17:50.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dbNRdYjn+xKsRfsqwktrGHqM5NEVLP4x1l/6VJ50LMBfu5Mhb00bjJrk2q7+QOYhnt5PqoohxeRmuNfHgZjqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5566
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch export below sysfs entries for better control
 cached
 compress page count. /sys/fs/f2fs/<disk>/compress_watermark
 /sys/fs/f2fs/<disk>/compress_percent
 Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 17 +++++++++++++++++ fs/f2fs/sysfs.c | 18 ++++++++++++++++++ 2 files changed,
 35 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.129 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pHlqp-006rdw-DA
Subject: [f2fs-dev] [PATCH] f2fs: export compress_percent and
 compress_watermark entries
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

This patch export below sysfs entries for better control cached
compress page count.

/sys/fs/f2fs/<disk>/compress_watermark
/sys/fs/f2fs/<disk>/compress_percent

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 17 +++++++++++++++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 75420c242cc4..920562742655 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -717,3 +717,20 @@ Description:	Controls background discard granularity of inner discard thread
 		is smaller than granularity. The unit size is one block(4KB), now only
 		support configuring in range of [0, 512].
 		Default: 512
+
+what:		/sys/fs/f2fs/<disk>/compress_watermark
+date:		january 2023
+contact:	"yangtao li" <frank.li@vivo.com>
+description:	when compress_cache is on, it controls free memory watermark
+		in order to limit caching compress page. If free memory is lower
+		than watermark, then deny caching compress page. The value should be in
+		range of [0, 100], by default it was initialized as 20(%).
+
+what:		/sys/fs/f2fs/<disk>/compress_percent
+date:		january 2023
+contact:	"yangtao li" <frank.li@vivo.com>
+description:	when compress_cache is on, it controls cached page
+		percent(compress pages / free_ram) in order to limit caching compress page.
+		If cached page percent exceed threshold, then deny caching compress page.
+		The value should be in range of [0, 100], by default it was initialized
+		as 20(%).
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e396851a6dd1..37c6ef080f7e 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -598,6 +598,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		sbi->compr_new_inode = 0;
 		return count;
 	}
+
+	if (!strcmp(a->attr.name, "compress_percent")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "compress_watermark")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
 #endif
 
 	if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
@@ -932,6 +946,8 @@ F2FS_FEATURE_RO_ATTR(compression);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
@@ -1038,6 +1054,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(compr_written_block),
 	ATTR_LIST(compr_saved_block),
 	ATTR_LIST(compr_new_inode),
+	ATTR_LIST(compress_percent),
+	ATTR_LIST(compress_watermark),
 #endif
 	/* For ATGC */
 	ATTR_LIST(atgc_candidate_ratio),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
