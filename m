Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 305227141DE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 04:08:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3SJD-0007Om-SX;
	Mon, 29 May 2023 02:08:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q3SJ8-0007Of-IP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 02:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLvxepq//Nr0ZocNEPavwrXeDuP1FmcGw8Ja5RHm/LA=; b=EDLSbCemVlPEVR/CFMUhnb9UNQ
 43r5snNdb2Yv7K6qsFIoNg5WSzxOG6SXLK6spfH8dyy+axnWK18wroivf+lfGObeBmUJwr+0iWtjb
 V9YzbfNpDUxrRsO2ZKMM0MH9nmtcKyu/0CnNJnoXRi06rSa/JnGnTB9BXBUngbyp0Rp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WLvxepq//Nr0ZocNEPavwrXeDuP1FmcGw8Ja5RHm/LA=; b=SSAgG+DZpW0SzAtb8jkk9iPyP5
 dR85ESx5vnrvOUF5CeyxfAEECn+qbP5eAFbVzro7rJLMDLc5v4MYwdo9LIO2jo6kk3SsY7xVF0Pvx
 YYkGDRPmHZdXz1kldqncidp7+PC/cbKZEupVY7AgKDgVP0OVrq6xoiJbCGh3fyhyQAyo=;
Received: from mail-tyzapc01on2058.outbound.protection.outlook.com
 ([40.107.117.58] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3SJ2-005OLE-3S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 02:08:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnJrCe/0711rBX7nOiG9CJMtma7pa3IxIyLkfqRRIsdomKfxIGfjHG+zjS91z5ITGw096EVmpchosJmHkuCvHtm5qiZ95l2iTjpCrWkCGWTTdDa4vtrdgY5Mbvq+2UyoDltMqEjiUfzyhxrP9ro+X/U38cJtNZKWwbrfrg8IWn3CnwPtaWpYAnJ2oP3OxZ0W2KWd0e6ibTSabI4BSCJzfY2V8NjUiXQFlNPs/krkaOOYd1LGzu6q5BjwspOshoi80JFKDtsYZGSusQlipLaLR9uqcY/oC/JEdu6UGTkE/8dNQam7g00Elbvol5K/sZm3O2DkuJJlOHwNH71wA72xRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLvxepq//Nr0ZocNEPavwrXeDuP1FmcGw8Ja5RHm/LA=;
 b=OD8Kk+U5FBRNWdqj3z6Tv8o1+KuFwtw8Cs4KaglIU67tu+VvjgMVdwlg+nrHERf1nj+6m0vl551zN8zFxjBVZfsZp7raxdrwEUekgUa7QIvDYSSyBanOYTorGZM98P4uWvh3GFbGWPSLsM0XiU3W7z7bJaTecGDqrj2p0DTx+eLoB8VWPP4n5ZVUozGcdzLlqrtrN0JmjWdMnC1O0RI8mrYvgjFVZTd7sMHiqasR3w3j4QR9lYWy3JNn5g4eBjwpCk2dY2HcSBcTgMVxpmIR2SkHBBbpY0MSqTiYHYyumPt5lbMLzCZ3rJSnwTSiXxJRcK16muRFibwYB6XSRbW9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLvxepq//Nr0ZocNEPavwrXeDuP1FmcGw8Ja5RHm/LA=;
 b=UNrsoSaklyNM+spd22cZ4Hm6tym1l0HxKmIhAZ8lbELyhoQ3ooydT42ISq+S/flgupKhyyi+TQkw+ZITyNS+JMZP9YF6YLQfvPxTkXF4cE69zewoVf2WXQClt/TCZroqmxGYvH96p//J/XVRDVHMQJOu/92bREcW69G1znenm54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SI2PR02MB4617.apcprd02.prod.outlook.com (2603:1096:4:ec::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.18; Mon, 29 May 2023 01:35:40 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6455.020; Mon, 29 May 2023
 01:35:40 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 29 May 2023 09:35:01 +0800
Message-Id: <20230529013502.2230810-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529013502.2230810-1-shengyong@oppo.com>
References: <20230529013502.2230810-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SI2PR02MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f79a084-e32a-4a2b-247b-08db5fe502c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYI7Tn6tNgaHK0Qle9Xq3xdHBQeKtCEKyPxs8cJWn6G3zKqOg6A/ufYn/nIKgSdiunVs7Uum5ogYICHi2ydss6uxSw68xw9Fq0OQHdEN1ECTuQAdRfugDarcy977e9vQxGxggipLg6T5WEpngWoltEpQ6yRLwDnQBoVjDSR0IO/7Qa/CCcu+em2hRAFtW2cOwC1+VUuY4qEJ+ShlmSJHUKHogQ52D4FQP0lGAp7hLJt1E1vWOnE/liJ2NbZIwcSrbAoSCPGu2o3ZQxmrSg5OIL2w1uTPNsh+m6Zq5E2I1Qk5Ab0ox+wixu4FTuIV+lxCzsnQn0mzzkgwF6hTytcueSiIcDHZ/JbdN4D64FrI6wPZE7HsrmaqxDuY/P1P6Vov+/w8v5/cO5PzoVa5OIU4ld4bQi++xZnd7mRap/UamZzT2draAdjkFmrcn+KdiwxXy6hCQNiIQbI6WfM5Nmk+/ilgw7FAShS1kajecrIIt979f5uO+PJHW5djLyARpxWaYEK+N1G8dqXygKF/DO7rX/5GIUizDfH3ajf7JC/ZtejkFdoPsJeAe6H9iwGj3Sxb/U9caNpCR141G82CaUglueDq8J1/fQId59C6o8qHJLfjia954/513h4Yjwq0slXs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(2616005)(186003)(83380400001)(2906002)(4326008)(5660300002)(26005)(1076003)(6506007)(6512007)(36756003)(86362001)(107886003)(478600001)(8676002)(8936002)(66946007)(66556008)(66476007)(6666004)(316002)(38100700002)(38350700002)(41300700001)(6486002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ffX4wunB8UDopP7mSRjtrEWyLOmoG8bsrfz/AyzEXUm6hTaciJ5ysS61zyc?=
 =?us-ascii?Q?KWi7DzJd35t3OBCFqrGDLqDizv0G9exOjw+qG+wzaJ+nxKlWFqmRxV1foh8A?=
 =?us-ascii?Q?ZEWWXpFrPdYdp6k3L8Na6rPvvRL2s2VPusP8Z/jQEKVLFLRDX15Ijvq63kWe?=
 =?us-ascii?Q?mTtQDxbIW9N1j2nExt2izJFsG7nO7GVKlsxA0HzDAPY/Vb+j8kEGQzs0t11C?=
 =?us-ascii?Q?OHzThBnm5MxnXjfY56yxrgM1K++J78HzjQINzrO0jNsaOTx4tm0tvWtO46z0?=
 =?us-ascii?Q?73OaklvQ6tQYCfaC+yUqPnelK8W/05gMH6Q4TO8xgQ+oJzC5iFv/RuxOE1E6?=
 =?us-ascii?Q?+Cz1fXi2IDvnbsfyRIpylz12Z8XBolRC5zPfIyrDGFBm7WGVV6+UOEg2iIdR?=
 =?us-ascii?Q?T7GEyx9iLoWSpddxL9iK1DuRokYajH7/TuVSGzJAfH2M28CWnXSB3hhwGPw0?=
 =?us-ascii?Q?urt+BBpybhDz6jbj8Zi6tj0Z3ctc/NNotvmw5R2//W8wmKmLJknITn3hOb3P?=
 =?us-ascii?Q?j7yaskg+Z1SUDGFailfbLugM6aDNEHJdKc+zGw0ztEflN/gzQ0ykUNZ7iPQ5?=
 =?us-ascii?Q?6YQcalI067STUMEHa80WE+rhHP3gL1Z0Fj4+FmWIj/xUCb9nktrR1S8oS29h?=
 =?us-ascii?Q?jNzz6VyHW1NDqf9+Gcr6quiGVQiVFyh8mAs4EDV3Nw57dROunHQ52lymaAPv?=
 =?us-ascii?Q?NPfIcCrcOyP1svQuhI31XCYME0uSnEsCc+Yw+yq460U/6G2p+g0RdJJX+MQ/?=
 =?us-ascii?Q?Jlggj+1BCtFM+KAwTZdMHVJ20AJ4Y5n4LCpF7uQR7YTDqjI4ycw6kmfhAVEG?=
 =?us-ascii?Q?+x7obBY48bvXGpl/SYgzQmTdkflF+tKfGpWZrl9iN0NYZGylzmPuL3vBSJNl?=
 =?us-ascii?Q?h+mEihuJlOdeVV9qdXV0JtS0p1uiIQ/0vtpR4Kzsp5/9lsMPtoUH3cWfktJb?=
 =?us-ascii?Q?R86kE5tQEQiUKK93EY9DP8AuOHABoHLYKMVsf/6k/AAPpdWj6xj7Xt71iImm?=
 =?us-ascii?Q?la85pBLF5Swj0TtE6oKBRsfnatbEoRKShnlitFWBZRurZkhuJkYHh2EwwEAT?=
 =?us-ascii?Q?b4mm5kwgdoEJrXQotcVVseGUAI1H05ZFipk7Aj5MU9W10dG3eo8BTUSzV9ub?=
 =?us-ascii?Q?iLOaO4PjMcrS1LgpiOyGsdz2vW+3MDrx1zgN+Eqc2eJbOHX6EOClMZ3P7x/E?=
 =?us-ascii?Q?PeikepAeKGi3nh8YyHanZo5erv89bpUNLFRS1wq1XkDK5eSYtSqLO4CYmayc?=
 =?us-ascii?Q?4udubVz5QDC0pfLHcLyzqU1OxtaTD0+t/PUckDfM95K+etHZOrzd3uGvIfHM?=
 =?us-ascii?Q?ZFIn/2JO7A2izYp0XVNgD+skQVhbLZWGyllOG5TpV8QIHuE+NkP1bZ57m39t?=
 =?us-ascii?Q?HoHQ5STSVLXMTPWsVfJw49InYavY9nWOFCAhJVgbItWwk7HgWygFSI14IwEK?=
 =?us-ascii?Q?vf0CARuLAYLlOSgDiGFEo5HhlIseQAOEa+MXQIXtH31AEj7WVX/9PBys3cfP?=
 =?us-ascii?Q?cYPui/y+I6sinN/tqj04KgtEoeNbVk/gwYLy5SoVfqG6EeDqMEPuhlvy9aOr?=
 =?us-ascii?Q?w1NsEkIOzadhLoGx2XONqSEcsiXYOdFtTtxeOZma?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f79a084-e32a-4a2b-247b-08db5fe502c9
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:35:40.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAKfW4aLkJh/dVrmtqN4hgR6fM4f1SQz633bkZVcdtMvLGS3F9syGadoYvncBNlH4E3HVb9B9Q8m7Dni5B5TNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4617
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds get_attr and set_attr to access inode's extra
 attributes. Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tools/f2fs_io/f2fs_io.c
 | 165 ++++++++++++++++++++++++++++++++++++++++ tools/f2fs_io/f2fs_io.h |
 34 +++++++++ 2 files changed, 199 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.58 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.58 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q3SJ2-005OLE-3S
Subject: [f2fs-dev] [PATCH 1/2] f2fs_io: add [get|set_attr] to access inode
 extra attributes
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

This patch adds get_attr and set_attr to access inode's extra
attributes.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tools/f2fs_io/f2fs_io.c | 165 ++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h |  34 +++++++++
 2 files changed, 199 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5bc0baf..70e0347 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1311,6 +1311,169 @@ static void do_gc(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define get_attr_desc "get inode extra attribute"
+#define get_attr_help "f2fs_io get_attr [field] [file_path]\n\n"	\
+"field can be\n"							\
+"  total_size\n"							\
+"  isize\n"								\
+"  inline_xattr_size\n"							\
+"  projid\n"								\
+"  inode_chksum\n"							\
+"  crtime\n"								\
+"  cblocks\n"								\
+"  coption\n"
+
+static const char *extra_attr_fields[] = {
+	[F2FS_EXTRA_ATTR_TOTAL_SIZE] = "total_size",
+	[F2FS_EXTRA_ATTR_ISIZE] = "isize",
+	[F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE] = "inline_xattr_size",
+	[F2FS_EXTRA_ATTR_PROJID] = "projid",
+	[F2FS_EXTRA_ATTR_INODE_CHKSUM] = "inode_chksum",
+	[F2FS_EXTRA_ATTR_CRTIME] = "crtime",
+	[F2FS_EXTRA_ATTR_COMPR_BLOCKS] = "cblocks",
+	[F2FS_EXTRA_ATTR_COMPR_OPTION] = "coption",
+};
+
+static void do_get_attr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_extra_attr attr = {0};
+	struct timespec ts = {0};
+	struct f2fs_comp_option_v2 coption = {0};
+	int ret, fd;
+
+	if (argc != 3) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	for (attr.field = 0; attr.field < F2FS_EXTRA_ATTR_MAX; attr.field++) {
+		if (!strcmp(extra_attr_fields[attr.field], argv[1]))
+			break;
+	}
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		attr.attr_size = sizeof(attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		attr.attr_size = sizeof(ts);
+		attr.attr = (unsigned long)&ts;
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		attr.attr_size = sizeof(coption);
+		attr.attr = (unsigned long)&coption;
+		break;
+	default:
+		die("Unknown field");
+	}
+
+	fd = xopen(argv[2], O_RDONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_GET_EXTRA_ATTR, &attr);
+	if (ret < 0)
+		die_errno("F2FS_IOC_GET_EXTRA_ATTR failed");
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		printf("%"PRIu64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		printf("0x%"PRIx64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		printf("sec: %lu\nnsec: %lu\n", ts.tv_sec, ts.tv_nsec);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		printf("compression algorithm:%u\n", coption.algorithm);
+		printf("compression cluster log size:%u\n", coption.log_cluster_size);
+		printf("compression level:%u\n", coption.level);
+		printf("compression flag:0x%x\n", coption.flag);
+		break;
+	default:
+		die("Unknown field");
+	}
+
+	exit(0);
+}
+
+#define set_attr_desc "set inode extra attribute"
+#define set_attr_help "f2fs_io set_attr [field] [values] [file_path]\n\n"	\
+"field can be\n"								\
+"  inline_xattr_size : [values] is [size]\n"					\
+"  coption : [values] are [algorithm] [log_cluster_size] [level] [flag]\n"	\
+"    algorithm        : compression algorithm (0:lzo, 1: lz4, 2:zstd, 3:lzorle)\n"	\
+"    log_cluster_size : compression cluster log size (2 <= log_size <= 8)\n"	\
+"    level            : compression level\n"					\
+"    flag             : compression flag (1:chksum)\n"
+
+static void do_set_attr(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	struct f2fs_extra_attr attr = {0};
+	struct f2fs_comp_option_v2 coption = {0};
+	int i;
+	int ret, fd;
+
+	if (argc < 4)
+		goto out;
+
+	if (!strcmp(argv[1], extra_attr_fields[F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE])) {
+		if (argc != 4)
+			goto out;
+		i = 2;
+		attr.field = F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE;
+		attr.attr_size = sizeof(attr.attr);
+		attr.attr = atoi(argv[i++]);
+	} else if (!strcmp(argv[1], extra_attr_fields[F2FS_EXTRA_ATTR_COMPR_OPTION])) {
+		if (argc != 7)
+			goto out;
+		i = 2;
+		coption.algorithm = atoi(argv[i++]);
+		coption.log_cluster_size = atoi(argv[i++]);
+		coption.level = atoi(argv[i++]);
+		coption.flag = atoi(argv[i++]);
+		attr.field = F2FS_EXTRA_ATTR_COMPR_OPTION;
+		attr.attr_size = sizeof(coption);
+		attr.attr = (unsigned long)&coption;
+	} else {
+		die("Unknown or read only field");
+	}
+
+	fd = xopen(argv[i], O_WRONLY, 0);
+
+	ret = ioctl(fd, F2FS_IOC_SET_EXTRA_ATTR, &attr);
+	if (ret < 0)
+		die_errno("F2FS_IOC_SET_EXTRA_ATTR failed");
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		printf("set inline_xattr_size:%"PRIu64"\n", attr.attr);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		printf("set compression option: algorithm=%u, "
+			"log_cluster_size=%u, level=%u, flag=0x%x\n",
+			coption.algorithm, coption.log_cluster_size,
+			coption.level, coption.flag);
+		break;
+	}
+
+	exit(0);
+out:
+	fputs("Excess arguments\n\n", stderr);
+	fputs(cmd->cmd_help, stderr);
+	exit(1);
+}
+
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1343,6 +1506,8 @@ const struct cmd_desc cmd_list[] = {
 	CMD(get_filename_encrypt_mode),
 	CMD(rename),
 	CMD(gc),
+	CMD(get_attr),
+	CMD(set_attr),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 58be8f8..b0be15c 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -91,6 +91,10 @@ typedef u32	__be32;
 #define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_extra_attr)
+#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_extra_attr)
 
 #ifndef FSCRYPT_POLICY_V1
 #define FSCRYPT_POLICY_V1		0
@@ -216,3 +220,33 @@ struct f2fs_comp_option {
 	u8 algorithm;
 	u8 log_cluster_size;
 };
+
+struct f2fs_comp_option_v2 {
+	u8 algorithm;
+	u8 log_cluster_size;
+	u8 level;
+	u8 flag;
+};
+
+enum {
+	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
+	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
+	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* r2, i_inline_xattr_size */
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
+	u8 field;	/* F2FS_EXTRA_ATTR_* */
+	u8 rsvd1;
+	u16 attr_size;	/* size of @attr */
+	u32 rsvd2;
+	u64 attr;	/* attr value or pointer */
+};
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
