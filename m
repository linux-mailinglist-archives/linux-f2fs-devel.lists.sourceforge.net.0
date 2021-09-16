Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2794A40DA66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHxu0VS4xW69HkFu5YUGV98V/Sszm08HWdGQyfK98NA=; b=PnwgpWnJ282IwVIaQzCr8hT6sF
	FEu6G8/YcS9SII9pmCZrdW8CKgnWijH1OQcC08CJUuu2zWtC4FAwKixDFoUh9ocTY03HbR524NF5+
	bomeiiZXJXwKwH8OXmP5z8u8NmgvVM9pMlZcVCOnu8KFtZKFBAFWgP7nibUYa2I2liCg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQqve-00053D-HI; Thu, 16 Sep 2021 12:55:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mQqvd-000532-Rp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=; b=XLBTm/HdfH23zkIYFlQnqzjfR0
 fzI89sqvbaCbh3Ju2TSPVuqhRp3OEPDj+iKNXDq5K7tAw0/agdwh6QzzV5bP1D0ONaLw3NDWm27CV
 ZefzrgJ/kz9hZXoTUCUlUonLb3xHL1YWobvXCNyR8NwRMzVyZzXDsrYdwlt96kxH6jaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=; b=k
 uaJRVC8X7fH/qXvpgj0nP6srVH+DRan2Ca4T4k4+QiE55W54d8zNedn/Gtm+4F57WiYsQgsIoIJvi
 kxPNo9KDss/hM1YA0yIR9SKtLM3VBOWyRS8uYJEEBOen8SnVLIWVA29cx7CuJ5uEcwQ9+Oc22L/G5
 Evr5ICOveqjdleV4=;
Received: from mail-eopbgr1310129.outbound.protection.outlook.com
 ([40.107.131.129] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQqvc-00Ck9U-3A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcuE2Rk2IVAKhPIx6ES2PEpXZTEeuqi+WQZB/8PVbtBynEKcFEewlpn8OrILr5I+CT72jkl/74Mk9F/qKX6APY3q75pT4UpHGOjgp6UyCTSd2kQFeXEgOex/f50w4+oOH/JCUU8dZEYv+mbOKEiq4PvuG0VS8Og1LjW6UwI58Pzg27bd9pZacTJs1Vu6eYrHnISH05juobOc5W9qT8wvKr3QvQ0kn8R2b99SW3JoePtKCrgAnqqsfGOqAWCnY89khHEtD5gntMW8ONAoKNUBc8sPV0SeZF0+LyozOeWx2WR97YQwhF9RfZFFQYCCbHyhTvbbnIkJ1/42/SkfIq5K4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=;
 b=eUEmh1wslhqREsMjjZf0NCQyY4RmyHvF//9QemZqTRaPaETYuQdNOU0IINBjZC2vS97ro7rTLqrDNXsFETzF9sDkjoHlfIgZfuJKBAq/6LvnL0Ec9CmkJ3MOX9+2dqZgLgTiTgckEBhoxc7JSFPk3wmq7fWjR8DeVixj33RH69cNKHoPe9PgXLbmHOBj3NqPXf1eSyLyqE0wA/ZqH6Z/gQ3UbHKYnYM+Mw4Hjx5U4PxUR3hlauqDOYjKH+vYOFEsKYukvRtvCQKmBbONDHA2OoUk3VMFuo+T2uKTRdlgxzs1EZl8puFsyZZ65xubcYdlTE4KzmDnXBNFbFVBFkC64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3h1q6PHRyv6Al06qCEKpFxdF5NHwQ7Nd14q16FEUw8=;
 b=REmjubh6mrpGDd7ErF8IBcxTNvu2VWF0R8lp0PxA07dvn3LtIylbF2ufpPF0GHYPB9yTnbKI87wGHwdfCCSJWYYuiumU/pjdks99d9J39k5hnuPn6JKSEpJQctyKvwZ2kGAgkLIJexaR9wNjZTXE2yBFbBAtX1WCBkD6Ql1hg18=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4147.apcprd06.prod.outlook.com (2603:1096:820:31::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 12:55:36 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.015; Thu, 16 Sep 2021
 12:55:36 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Sep 2021 20:55:19 +0800
Message-Id: <20210916125520.118196-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::29) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2P15301CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4544.0 via Frontend Transport; Thu, 16 Sep 2021 12:55:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c928936-9fcf-4e0d-2437-08d9791146e4
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB4147B6AFB38DCF5339437E35BBDC9@KL1PR0601MB4147.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0sGCEZqlWDpvPTqux3ogjdpgdoGs9UT4y7G5KMpVlIj0DHhc4/iqYDqAE74PwYVv/jfqWm0NhsDPj4+wNZeSb7dZes4hoSwwai6dJEPYLlV3WaFYUarPwhl5Ir3eDHpmiYhs11Gxh5fIqfdzk7oJjtHFIjx89/Xn7arTjA7gbTuZfZ3IWVjsgu+ypo0+/KlDfyo5EKE8CPkgLGflNBP2Y8clBdh5a1lmUfXzGjYy0vM37nIikrDAIFmveL1/LYbrpxcIaQ+1IPIZEufXhQLnArv4oANPkps3iuQERrF9qq9U1OHq6V3phbyGZWP2aWXIpretDHuFox5qRRUlKLP4V7M0NCrCSmSPSo57pU7AqZbRHqkeDUnNZXVec5OB9rtcM88C6Xu4iAq4tt9XKIvnaDpQ1EkF//CKVZxmJudP4B7i0YuskFivZT7R1WUEljtJVohpp4UimvnGtIcJVkM4gJgnToaM8QXGEDHrIGvSnwpMCzuP5uLzOFuJ12ldkERxfxsCjGJ0fEmgDVAKPVMw4aYYECqEOShyLJk63e6ugJMlUGiaHwwT4CzVKe3Ir02DiqmJODq4scMCxWXBAAGsyj0IZefeDBPAxPl+e1bMh6UVjcL7/76Dqr/JzHaaUbDtbhkNy9/g+0cu+18x122oSn0PlrF76QaT98S43jOhzsHP6VmybVz8e+dk3TWg/as6gPyGEoi3h6lMGGScYSnhhSovq6nK+uTYzUun67MeFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39850400004)(4326008)(86362001)(316002)(36756003)(5660300002)(38350700002)(66476007)(38100700002)(66556008)(956004)(6512007)(8936002)(8676002)(478600001)(66946007)(83380400001)(52116002)(107886003)(1076003)(2616005)(6486002)(186003)(2906002)(6666004)(6506007)(26005)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAxxP7ujD+cIoWDVEa8iG+toEVJ+0mbF+XTSuwHVh9wix8uZiaRBPsjR9ygn?=
 =?us-ascii?Q?otfFLITglrKgXBwMwzmEcJOpGw65USDwuUetctF2I/D7eSGz9HOC2wWy0Tsl?=
 =?us-ascii?Q?tewtXRk0H6JVvnW114RmaMtTX0eqMfQeYTWTGKdE39JhwzfD76onaVqfwL9N?=
 =?us-ascii?Q?2R7aMR0JlxKaYysFC2g4o3tM9CD75D2XOVbPjMJCRTcXFQniMdF/KfLIvoNC?=
 =?us-ascii?Q?hhMNn/4HdzK3NFPfkQBURwzZMF3A2lnSlzERXAyN9JyXh2p1dYYzezYGMRj3?=
 =?us-ascii?Q?JycNnt1RC1RCmz/O/rDwq8P8NCa+BhMEpxBekLHNH8KScXL0Nm8cSMODAd8T?=
 =?us-ascii?Q?ganzxtLQh2NCE3rRXkDlPfT4GagD2dQ8Sj9L2hR+VLgLfGY5LR0yNNwwKnTz?=
 =?us-ascii?Q?NDb5aJHjtl2Wckf90H9panq1anCoIT8U4vex3/20UfWeztrFQNIfQwSZbpw5?=
 =?us-ascii?Q?0hkMNcZjGgQS99IZbrpFltmiTpbIxgFGFCJUkS1kGwJJZ+ERUUF+B1R6dhoA?=
 =?us-ascii?Q?RgMUW0epk6a3k5nEX4vibQlIW31UFwSgrk+8Jd1mXs558+2nrP3bOKaNcm4i?=
 =?us-ascii?Q?A9KTyK54wEjw4VU8qTSeQQYjAQI40/We1SPGm2xf72g+RV7SUkPdoJYXyJrY?=
 =?us-ascii?Q?tmAWE2njtZVSFUeZd2IaZFP1YS9mt+i5fJsoFU6u6qme+ATUzjECCno23ZFA?=
 =?us-ascii?Q?V2LGaq3twqQvhUZ+NG0FBo6nySo0YcdgNKQxjAhpAlhOpmQz4MXJWDNWIGmx?=
 =?us-ascii?Q?SsgY5hGEaqzw7RR9r15qcDhTnJ06c2lIqAR1EVK3Zq3pqY1Gf/7geR/O1QWi?=
 =?us-ascii?Q?VIxFGSeoaJNb4uAj7mx26vOpdJDyyOk9LN/ukve6mTiunlk9Cp0I3ClOWj8f?=
 =?us-ascii?Q?0VT7Ujs0qQdKn+tTwUwAXa6uxV0mTUQx5PwIMi4Nwqkft8ZSWFyUfS6k9yZL?=
 =?us-ascii?Q?5fxa2o5jVKqLLTKIaI6mQF3jGTvyEGT2cWdafGosSw5tj0XsY3fhiUJRNf9S?=
 =?us-ascii?Q?hHzGSVWg60zujILXEfCRbXELXLChaEPaSNWlROeq0AIf7z2p4779en325VWk?=
 =?us-ascii?Q?4DFSJEircFO1jAppxs9KSXi3bXzcMhPmcreZYW5FaKFMLhZ95284Su/4/MoK?=
 =?us-ascii?Q?v2aaITSrpPlW0zSv7sUiwcbtO5kJRA0ix9YMIs3902QSuhl8J9aRi4VbhcZm?=
 =?us-ascii?Q?Ncsy9Z96M/Qb7gduMoRIrjsKJtXY1/CDenezGJjPIQI0mEnWH1vVKGNNPlyA?=
 =?us-ascii?Q?/xZZS/9h4lKAPGqKRVE5/joUw5XaMfYjO8tNLjygCTV5vPB53X0DzzGXPWb6?=
 =?us-ascii?Q?/lMH6+4/IhnelKTE+2lP0Zyn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c928936-9fcf-4e0d-2437-08d9791146e4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 12:55:36.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sItIe/JRdfr/ekFPDzUa7AA6dv4/WQ2yEQ6i9g+dIzL6dewKcy0NugjKvvHzsjKq2SNWKxxTFbZUoEZZDIkW+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4147
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: separate buffer and direct io in block allocation statistics.
 New output will like this: buffer direct segments IPU: 0 0 N/A SSR: 0 0 0
 LFS: 0 0 0 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> Reviewed-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 10 ++++++---- fs/f2fs/debug.c
 | 24 +++++++++++++++--------- fs/f2fs/f2fs.h | 28 +++++++ [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.129 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mQqvc-00Ck9U-3A
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: separate buffer and direct io in
 block allocation statistics
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

separate buffer and direct io in block allocation statistics.

New output will like this:
           buffer     direct   segments
IPU:            0          0        N/A
SSR:            0          0          0
LFS:            0          0          0

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    | 10 ++++++----
 fs/f2fs/debug.c   | 24 +++++++++++++++---------
 fs/f2fs/f2fs.h    | 28 +++++++++++++++++++---------
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c |  8 ++++----
 5 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..c1490b9a1345 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 	return page;
 }
 
-static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
+static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct f2fs_summary sum;
@@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-				&sum, seg_type, NULL);
+				&sum, seg_type, NULL, direct_io);
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
@@ -1548,7 +1548,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		/* use out-place-update for driect IO under LFS mode */
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create) {
-			err = __allocate_data_block(&dn, map->m_seg_type);
+			err = __allocate_data_block(&dn, map->m_seg_type, true);
 			if (err)
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
@@ -1569,7 +1569,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
-							map->m_seg_type);
+					map->m_seg_type,
+					flag == F2FS_GET_BLOCK_PRE_DIO ||
+					flag == F2FS_GET_BLOCK_DIO);
 				if (!err)
 					set_inode_flag(inode, FI_APPEND_WRITE);
 			}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8c50518475a9..e1aa843b067c 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
-	int i;
+	int i, j;
 
 	/* these will be changed if online resize is done */
 	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
@@ -210,10 +210,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 
 	for (i = 0; i < 2; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
-		si->block_count[i] = sbi->block_count[i];
+		for (j = 0; j < 2; j++)
+			si->block_count[i][j] = sbi->block_count[i][j];
 	}
 
-	si->inplace_count = atomic_read(&sbi->inplace_count);
+	for (i = 0; i < 2; i++)
+		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
 }
 
 /*
@@ -551,11 +553,14 @@ static int stat_show(struct seq_file *s, void *v)
 		for (j = 0; j < si->util_free; j++)
 			seq_putc(s, '-');
 		seq_puts(s, "]\n\n");
-		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
-		seq_printf(s, "SSR: %u blocks in %u segments\n",
-			   si->block_count[SSR], si->segment_count[SSR]);
-		seq_printf(s, "LFS: %u blocks in %u segments\n",
-			   si->block_count[LFS], si->segment_count[LFS]);
+
+		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
+		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
+				si->inplace_count[0]);
+		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
+				si->block_count[0][SSR], si->segment_count[SSR]);
+		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
+				si->block_count[0][LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
 		f2fs_update_sit_info(si->sbi);
@@ -611,7 +616,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->inline_dir, 0);
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
-	atomic_set(&sbi->inplace_count, 0);
+	for (i = 0; i < 2; i++)
+		atomic_set(&sbi->inplace_count[i], 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b339ae89c1ad..3d4ee444db27 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1692,8 +1692,8 @@ struct f2fs_sb_info {
 	struct f2fs_stat_info *stat_info;	/* FS status information */
 	atomic_t meta_count[META_MAX];		/* # of meta blocks */
 	unsigned int segment_count[2];		/* # of allocated segments */
-	unsigned int block_count[2];		/* # of allocated blocks */
-	atomic_t inplace_count;		/* # of inplace update */
+	unsigned int block_count[2][2];		/* # of allocated blocks */
+	atomic_t inplace_count[2];		/* # of inplace update */
 	atomic64_t total_hit_ext;		/* # of lookup extent cache */
 	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
 	atomic64_t read_hit_largest;		/* # of hit largest extent node */
@@ -3491,7 +3491,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
-			struct f2fs_io_info *fio);
+			struct f2fs_io_info *fio, bool direct_io);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -3699,8 +3699,8 @@ struct f2fs_stat_info {
 
 	unsigned int meta_count[META_MAX];
 	unsigned int segment_count[2];
-	unsigned int block_count[2];
-	unsigned int inplace_count;
+	unsigned int block_count[2][2];
+	unsigned int inplace_count[2];
 	unsigned long long base_mem, cache_mem, page_mem;
 };
 
@@ -3778,10 +3778,20 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 	} while (0)
 #define stat_inc_seg_type(sbi, curseg)					\
 		((sbi)->segment_count[(curseg)->alloc_type]++)
-#define stat_inc_block_count(sbi, curseg)				\
-		((sbi)->block_count[(curseg)->alloc_type]++)
-#define stat_inc_inplace_blocks(sbi)					\
-		(atomic_inc(&(sbi)->inplace_count))
+#define stat_inc_block_count(sbi, curseg, direct_io)			\
+	do {								\
+		if (direct_io)						\
+			((sbi)->block_count[0][(curseg)->alloc_type]++);	\
+		else								\
+			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
+	} while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)					\
+	do {								\
+		if (direct_io)						\
+			(atomic_inc(&(sbi)->inplace_count[0]));		\
+		else								\
+			(atomic_inc(&(sbi)->inplace_count[1]));		\
+	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
 		int cur = F2FS_I_SB(inode)->atomic_files;	\
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 77391e3b7d68..7c47082f73cc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	/* allocate block address */
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
-				&sum, type, NULL);
+				&sum, type, NULL, false);
 
 	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..ded744e880d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3391,7 +3391,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-		struct f2fs_io_info *fio)
+		struct f2fs_io_info *fio, bool direct_io)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -3425,7 +3425,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	__refresh_next_blkoff(sbi, curseg);
 
-	stat_inc_block_count(sbi, curseg);
+	stat_inc_block_count(sbi, curseg, direct_io);
 
 	if (from_gc) {
 		old_mtime = get_segment_mtime(sbi, old_blkaddr);
@@ -3515,7 +3515,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		down_read(&fio->sbi->io_order_lock);
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio);
+			&fio->new_blkaddr, sum, type, fio, false);
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi);
+	stat_inc_inplace_blocks(fio->sbi, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
