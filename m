Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B46996C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 15:10:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSexU-0008S6-QU;
	Thu, 16 Feb 2023 14:10:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSexT-0008Ry-0a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 14:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=njKBpNZG/OWGljuPOd7ZM34F7lFXHOxn3UcVLZ1fw9I=; b=VVgWtaoYCtksUgr/XriKP+hL2w
 LNP8DxhHbBtWUsk/jwIPB9TNJUxUyDGcOkdluQMjrnhSQ8NpDek6quMIv2e5kWN4xbA0gO6iYDAYR
 7FJXK19K3n3bCPVXzyTF1hEtCwLq+dOkNqpSEuHGG3SsoJHr3KREGQono3tJJr7HSG9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=njKBpNZG/OWGljuPOd7ZM34F7lFXHOxn3UcVLZ1fw9I=; b=b
 lu3ZiyVcTf9bU9TY6aYdP4xd1UmaNjlnhaYX/bWK+SzKorDfjyeJUXU+1PraQIGwuqviMo0VI4C0M
 /ewIOQoY7YEGCQv36f+vF4x0HtBjejsqMcGSZ4oHWU9qbJYVPaIGMlaY2yvsDn0O2hhDrPuZN0lUP
 oHfU78ga15TBf/qc=;
Received: from mail-psaapc01on2124.outbound.protection.outlook.com
 ([40.107.255.124] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSexS-006JtS-2c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 14:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0CesmbRYzqGY6jK4GA77aJcVcQPvDFVyXDkexsPWaaxt0HUbZFXwR16QkJcCgAggVa3MZWpxnjyOUxi5cJSwzLe7LDFCam6bNP+jNffdTYLHRPQQQIExEqxQTeKxGT2uJD7/x/JDVgj1AGLDP3WeXUI+PXa71pi63acRILUmdBoLYH2CUnw53SIgGnHc1pSu5qsU1WicGsVMrFZs4eu+ndZcmIPuzigg9EWEjd0FzCwu8iFIxwp2kJ0FqBkgUQ2raLXjGxdYz9sCAboOTB0cS5hJw7XuQYUg/UwGkr6SRhEiEPbqDcfHlXYBLR1ZNnf/xZC6FTvmRcgZako8YaXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njKBpNZG/OWGljuPOd7ZM34F7lFXHOxn3UcVLZ1fw9I=;
 b=TO/pvYI8lVTvCOif7nbzjXzxMme+ASSFc2dJEOEeWR9O/DcKoxzNUFdSYgOVumqN9Y7kwWf7mPGkik6mPFujCebqnm2oz2uPdlnBTwlKY25yinOSOvLut5cj05DClbcDAryaheikrQdF3BNW7LwXVgW1AIvfyz5jp08U6JNQ5Y4wjQCdbkkNkxNbxFTPZqkbhsR7Pizkec0A/1MTXpANnAuTqw181xRH04uvEIC62A3IiTa6a7lU584jccIx8icpQhepBdXRCFxbofons8vFczYlGGQ0WS7+9lFyalTu9EzN9R9D0On2Dc5b5wUqz0UXtrUzd5mbi7oL4Y03LiQ5hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njKBpNZG/OWGljuPOd7ZM34F7lFXHOxn3UcVLZ1fw9I=;
 b=rCKrhMNnH++RdtyaFt5lQVohwFfmYS8R0k5SQgThwnp4edJF95Lpi5Z8QQhJ5QH07HhQ2CDGFR0VxgNECMVaZkhkdN+0lyn+iYiHC+E1T7VBj6+JCXG7xQj5hm1AA37wA1o9ok5RUv3Lz0FrTprsBWALZIvlwcKtX8wEBsl40Ha868EHPKXYUz3lUQWSjR6ql3G2VNDq0L+ZLN6FczLAyp+OYCTOA/9AdvDhq+n7od0vF8SvfAPy1TpNbA/g6bfXO5lrw3jxSasA5k4bvFFFwdEhb1/5IpATEjtcTJqEZ3gs5s10+rBvGlkb2rmBobTRnN1+0Ix12MnvaeYPb1s0Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYUPR06MB5947.apcprd06.prod.outlook.com (2603:1096:400:344::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 14:09:47 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 14:09:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Feb 2023 22:09:35 +0800
Message-Id: <20230216140935.20447-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYUPR06MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: f7a543e4-2725-4517-d550-08db102775a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITe7vSJ2AGcefPwgIsxsEOfDNb1dVxTbHW3VOckLzuUh7GgdVul91rvdKqp+S2kvtd0CumbnRn1EqzNrlt2nfK2zxSYIf1/87Io7xSdy5F1s8/G0p/uXCmBNu4vLQ02eMdEWPO1+S6a8qFUAgB1o6ufeVRi04ZlNIwEmlIvavUHu+WBkZ6BMPcmBiVSwlQY8iekc1A1pxYpcLL2mDl8bHlYCEmMUwOmmIHHOuFIF3+Tn02KDdzwQUpbQtcZTPmVwrzNO+xsxv7obDbv3hZpjFgzjP8k4/3JSKhWKmJEbs2Q3WnWbUZq0yyXvqYrzk6Wu8lu3/lbQiC5vjIo65BFJOoZZp2LVJUJgfNUL8QY/hyXNex29TH8ui6UBflqX/Ix9VKLOcftHP+xVCaV7pJ38HkIaratje7LNBaOjnjzDPxJGjBdUyPL5vQlg3nN2RibG10iR71f4HFUB0q6vsyzFpI1hecBrsa3tYrGdeOMN1qRbykJ+cDjjMZjGIGqHnX742lb18XOv/dcWaFOLoD96Uizu88E56A80diPTecNOgnfiDnHjsd281yEAO4Pd1QghIES5bweKDT3WgLzVwkFLmu1dKVr/0/KDIPAr6qL+UVs+8ZzhaKpGGpqvmjnepl+ZyRoLqT47jYNYcTmY4il9E/fG76k1J66bTz/QuTmyJPSod5ELcZSbnhUyVk42AE1NfxjwHs+quU8exrTM3Wb/YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(186003)(52116002)(478600001)(6512007)(6506007)(19627235002)(26005)(107886003)(6666004)(38100700002)(1076003)(316002)(2906002)(36756003)(6486002)(2616005)(83380400001)(38350700002)(5660300002)(86362001)(8936002)(66946007)(4326008)(66476007)(41300700001)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1+vnNwnnV0qAOljwl/zEtHCJM4vRJavZg0ciz8hZzmqP9GvA0i9DR3ytsAzt?=
 =?us-ascii?Q?0ZyVsvyQKC0pxl5ZJgrJdZfHxL4UNpPjITd1+Nym/GcU3MX5TvgHke0ZTiL/?=
 =?us-ascii?Q?ChcSHw9CpCjM0bgqx1M+EQy5pHWy3ov7FA0wxw6pRJWPoWnb4/Y4wzIWwbGa?=
 =?us-ascii?Q?KgDaHxeW5e8uyPNaYHWA+zivvjcbDEejF7Yfvl5h/NVOVPUMYVDrEwH7+VzY?=
 =?us-ascii?Q?uNddsjHnnj6VMVqHgov22p/CFUkEpF2avqqXw6yCFZw+tqo9OOErJHpIhxU/?=
 =?us-ascii?Q?INevWO1NG/12DzqFCVEl33CbPViJIFaauWNsYmqc8VY9YizYExyms03dq8r8?=
 =?us-ascii?Q?gkmlIk0ExTYtMf9gyKVLK1j9xVZXscZL6uCY8lBfsl1dRc6cOidt9/IqIcjc?=
 =?us-ascii?Q?W7WLX+D+OIJ2j+UOP8GdI8vbZWskWQ9hSH44P6mZTzCRn8GvXZWnnlVTqUZQ?=
 =?us-ascii?Q?CwUnhFpHeSZXbYM5rvvaOviwyIWr+cwba2F/zqtnqYO7nbqSeqHHqKtb/qwp?=
 =?us-ascii?Q?LuIaWkVKyyQ2MiTE2ZHUssiVKuWXmsfpCDKdQ9rfC26AEvyKZQQ8HBLgeehB?=
 =?us-ascii?Q?HZVDHAAyMiUs6G4XnJzlr0sm2aw1MzFarhA/yqrZ6iGTK5A3yJwbvwgPYS28?=
 =?us-ascii?Q?6ZOG/RlE+TZPiuPDDWPlBwOUeRIsDIdgojAgCRBKVF3Lj5G9ihNttiZxaQBC?=
 =?us-ascii?Q?xtDg0Ml+2ilD+QS05bEWllwV5DsTd6aSGtouZ/jzYarnlEegzwkn0ipTBAkS?=
 =?us-ascii?Q?0l94e5zFw1OTZQyd/WCepIbUDDwfGGsie5p5Q6UcJkbHP3I+QI9BAmLbpju5?=
 =?us-ascii?Q?nU43KxjOe7m5Gc9W8o3sQiL9bIO5EQL0NVnD7GFr77H62P3DP6DGLpHyHMk1?=
 =?us-ascii?Q?o01+HsyfmvMLTNPuHjMiUwUl+ForGI/4J8VJRlBuWOfA4NzXT9JEwDHXKn2n?=
 =?us-ascii?Q?snrgNQH+HsxTMtDqJaPd79HX98qan4fgft5aGwpD+Vv01O4lHnWlox2g8Hi+?=
 =?us-ascii?Q?9ifgZV04iyV0QybBXuLsTmmMJNCIP4XIByrpvbQs6NNKqwMiMRRLyj94abDc?=
 =?us-ascii?Q?9YAhitNn6Ed1ZbwDdddY4f/vDPmBfwRupI6RgMPrYwea/KqpunAAvTNvMcMo?=
 =?us-ascii?Q?S/cG4bjfaAjm4/0txA4D2gLzQWk1Zwx/fT5hzZidAneGXVjSE8YtgRIBL3qK?=
 =?us-ascii?Q?OVVP/hiF2DnloAISoHyER+zi3cWsOSY7A7Ad/4omjvV0yN03FTAcqvrnXqFL?=
 =?us-ascii?Q?Wv39BkPA0Xkx8/a44ctRVQci4H11GWC371EqcGcSxBS4zLq2Yy8HsG7RXAA1?=
 =?us-ascii?Q?CMR3KdQM34Nf7NcLPCzUfQWM52bsgkbqUo/jE+dE5yzyrfIjPLniqCtSmKpR?=
 =?us-ascii?Q?nIWT/6uyVGR4ZG+nNyKpbEm0sV0J2YQLAuKbxp6YiGcdJbb2mP69RDhjVY3J?=
 =?us-ascii?Q?6aAjfq5KkeJqz9WfzJuP/VCaLmqSswHFnLCg0BsAQy15Zc6UJxzOuoG/fnXf?=
 =?us-ascii?Q?4FMFvVbVXvhgHh6GEx+70hS2KF2mMedKf7J3aJ4pEBIJpNfs8RaNkbbqIUbC?=
 =?us-ascii?Q?FR0ybdZzzvKQRJgr+DJ0hkvY7hoDMlZgjHFOyMY1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7a543e4-2725-4517-d550-08db102775a0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:09:46.8813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkuD8eDqZGQfTbLLnw0fE6WWG3yvHwCqLn9rSAYtsGKC9txCBP2TjB9Yey5ZomXgk4NN4+VWLG9dHKEHNbhEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB5947
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
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -disallow to set 0
 Documentation/ABI/testing/sysfs-fs-f2fs | 17 +++++++++++++++++ fs/f2fs/sysfs.c
 | 18 ++++++++++++++++++ 2 files changed, 35 inse [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSexS-006JtS-2c
Subject: [f2fs-dev] [PATCH v2,
 RESEND] f2fs: export compress_percent and compress_watermark entries
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
v2:
-disallow to set 0
 Documentation/ABI/testing/sysfs-fs-f2fs | 17 +++++++++++++++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 94132745ecbe..c1314b7fe544 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -729,3 +729,20 @@ What:		/sys/fs/f2fs/<disk>/last_age_weight
 Date:		January 2023
 Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the weight of last data block age.
+
+What:		/sys/fs/f2fs/<disk>/compress_watermark
+Date:		February 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	When compress cache is on, it controls free memory watermark
+		in order to limit caching compress page. If free memory is lower
+		than watermark, then deny caching compress page. The value should be in
+		range of (0, 100], by default it was initialized as 20(%).
+
+What:		/sys/fs/f2fs/<disk>/compress_percent
+Date:		February 2023
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	When compress cache is on, it controls cached page
+		percent(compress pages / free_ram) in order to limit caching compress page.
+		If cached page percent exceed threshold, then deny caching compress page.
+		The value should be in range of (0, 100], by default it was initialized
+		as 20(%).
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 0b19163c90d4..5397bd8bfcf7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -598,6 +598,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		sbi->compr_new_inode = 0;
 		return count;
 	}
+
+	if (!strcmp(a->attr.name, "compress_percent")) {
+		if (t == 0 || t > 100)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "compress_watermark")) {
+		if (t == 0 || t > 100)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
 #endif
 
 	if (!strcmp(a->attr.name, "atgc_candidate_ratio")) {
@@ -950,6 +964,8 @@ F2FS_FEATURE_RO_ATTR(compression);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
@@ -1057,6 +1073,8 @@ static struct attribute *f2fs_attrs[] = {
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
