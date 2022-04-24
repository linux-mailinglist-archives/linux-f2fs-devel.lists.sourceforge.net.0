Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4F50CEDE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Apr 2022 05:22:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1niSoy-0002PW-26; Sun, 24 Apr 2022 03:21:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1niSow-0002PP-9X
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oAnPY4cxOnnFTBYBCvP+qL9wznjLxy7UwOpF6OZjUhs=; b=SOmiq4khkEla26XZm/U51EaJ30
 oP3j2oUPuYtGgZmeOc9U3RNlYAqx9GCCFcwNoM154bn14F8AJ/ncUecZIu0nZkuBXj6p4cO6xs48c
 Eaz5CkzamWCEoWaguEK+4VbFSzANqN6A34xR4jnxkzKAXis58YX9d85xEbl75KqBC8ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oAnPY4cxOnnFTBYBCvP+qL9wznjLxy7UwOpF6OZjUhs=; b=J
 jJfi/x5o6IjSlXulmylNPQDkYDNI69Dpv8A3hKWrQxjcWHFgPHradouHFrJxTGu8BqumyKakTdRGb
 qhx0yERLSnEokUt8iijLPAVa2pdj7S9f63gQ7rQP288aMvETJ2lNrVB/D49X/k1QQkC6HNMqukjfE
 hNtgBzbdxRuNXk+U=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1niSop-0008Ui-Bz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSl2U2AbYw055lPVjVt9ocLKP6hMAFs9i2lKd7czSv/Rp5bt174LDl648qyC8p1/jlbQk4rumox0cEzaNzcX7vIIpNXXN/DMSDSMS027WeF0H87JDHaW9FuBIhyzUvjF5b0po5xP+wo7eC655am2hEOcrhnAZRbXK96gRX0Jito6SAwg1O5zT5XjvIBCEx5kwHkfFi52enLDWdYAurMc1GjAIVU8ME17SiJxJQNyHH0GGyteeIoFb+sjwcnv8ccf9NeOkHMj1pcJDotPnY4qGPbX4uMmhURXrTPyajMTPglhUlCBk7KZFODjrV0Speolid9q9WOHeVau2p24ffnEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAnPY4cxOnnFTBYBCvP+qL9wznjLxy7UwOpF6OZjUhs=;
 b=B3xE9sipnuqYul/FlS/QFQuzwSzlQJt4xnAra0c0dZCvrhqYqVkAMVs0v+jA+KET3rIsqe47K50SWywFUWJX9r604bR6zbg1rkCJyg99z/xbx0OjsDEb4UZTXAbU2Syt+en6WvTbmrm38+fdEh0Ti7xjvuK8XBhuBjmtBToK8fB8+zc0+Pq3/Kbw8hjwQXav61cCxw0KhhC1gguCZXKfEYMVD1TUBMHqYRXBgLypAXB5UzMrvw4lPVENWGjDlveT7exwUFFKNexiMdNDdFlD9FpYWayQp4TdN9AEIn7Zln1bSSL2+iiaMaHzqnhXXLrabDHGyMTT50vcJNN0fZnaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAnPY4cxOnnFTBYBCvP+qL9wznjLxy7UwOpF6OZjUhs=;
 b=FUt+Q7lcpcDuZX5+AGwK2hIq5O0sHzbX1CjA48DErXwdW2oMFY0Wg+fJshGiuQVoGex/lkLdmZm4Fb3e57tMX0QwtO4her6GI+XdL4UEDELipU0mPq26iXJQ6ApdnI3A6hgRpYa9Wjbmb8mHuhV/1DpJf1VJ5nOgWP3tYDJFcqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SG2PR06MB2811.apcprd06.prod.outlook.com (2603:1096:4:1b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Sun, 24 Apr 2022 03:21:38 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%9]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 03:21:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 24 Apr 2022 11:21:27 +0800
Message-Id: <20220424032127.435309-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ece4274-ecf8-41a4-8de9-08da25a18b25
X-MS-TrafficTypeDiagnostic: SG2PR06MB2811:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2811B9279FF58AD2307D157DBBF99@SG2PR06MB2811.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7tOD9KCzUacYT7amxcLaegatVQdVIT06fodLP+nh32Nax9dvHVdcwDfpvx4u5/tcZCc1JVk/y4A3BnZnCXhI5ep90aCxFaBSe67jid71DUDDXxiCTBgNpD6GowTU6kGMfPN2CwRAWY4mGGeAmso99qiaklsP9XcgdHT0lPkBDfpb+0K85MN+ZBQWJL6Nhge55f31YwZ5SQv491lhzZPkXguLwzQtZBhXI2MVoLzFEEF9yylKtr+pVJCroM2bZcP+V+Gy7xhKRBuJEPFpOJ6ahT/fSvPEPLMyLtybrHpXRLRWVuv9uo7kfFMR0axYZvXJN3rvSDebigjT3i6pfKMagZEtBz/8aik1bxHnp2/SvAga2irjCjZ4vJW32rQf1VMFy2Wo9xx8p1IjUQwgdi7asHc6hA2GiupTyd1pFyFAV4yXIYJMtJH6uLqxm5wMjXkf3/z34rtLbvNh1BvjU5sPbZJqITBiaEpnDPzBlbFR1dFTzRfIQ7hUmGy+SkcDKbTHcTUb8le9VSYuWBzzlKAGBA6z4jedXU+EsDlilZUEZpK7LU2PHhBjs8bdqtVqWcs9QldTJsDwMvImDMoVkUrgzoncvs1neLnvy8HqW/jDPpoOF8NhqKQyOLpkHUZC4eX+ILt56pEpdyzA8Yc64lKBp5b5w2V41tCrl52LhuYrj05fCao0VslmXvGhcZyzaFFegeMgJktd6u0o5KDfFpnvxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6506007)(66946007)(508600001)(38350700002)(316002)(38100700002)(6486002)(36756003)(26005)(186003)(1076003)(2616005)(83380400001)(6512007)(52116002)(6666004)(86362001)(66556008)(8676002)(66476007)(107886003)(5660300002)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XDJEJSO7o94r7sH3v5jRun5oFhMP6x7eqQdXmFtVo9I3r88j6Bzzvx3niWGj?=
 =?us-ascii?Q?85xukR/b3Z1FhMSfxrp8VJ1wuWt++xoK8lbh3h+9zlsKZ+yIrloLYPgpwTwI?=
 =?us-ascii?Q?S/5u2BdGdr1gU7HtZ1YQ3TSD5+nLE7jpxaT1Y4lz73HjQ8LwIImxlfOH+8ze?=
 =?us-ascii?Q?NkjZgyDB1hjPqpxN2QvHqSznZxCCKTaiHejG6GgxAwDl95y0v2UbwgP1F/IQ?=
 =?us-ascii?Q?h3j1WXN2cqi2WTILr8XfYUpGEdr6cZwUmqGN7R3hLETC5RGdZMrFdsO81QUl?=
 =?us-ascii?Q?8T8mLdWjGXr5uI+eHLiIvBgPXTxO+55jhWiB3DaRr2V7VBM6lQ7sbcv/DmR9?=
 =?us-ascii?Q?T3iFuFlsRNR3R9MAASZzdjzdBwFPAI5XxWEjZ/+uDEcCVg60FMnCx7MaUW+X?=
 =?us-ascii?Q?NBR0RXLGtri0K3sn+G3i01lYcfC3XjnwXz2lqEx48CrmE47pCdnv4iWJhrW5?=
 =?us-ascii?Q?7JdgwHH0G4sZ+3jbiNGmY8MpzW2wgLCh+lGnL8JHPIEZv2HQIho8jn/VXR5a?=
 =?us-ascii?Q?Scxp2j/pV+de8IY5HMVWTXlVp4IS3X81nD+rlhkClcAxYZHPn/iXw7ARfxdj?=
 =?us-ascii?Q?FmbDA6wd62wLQMQEzpbC+HjwG/WAjTcVDEM9aen/f7XiBTqOJ5z7wArJ2SXq?=
 =?us-ascii?Q?RDx2j2rH1YLaUzi04Qbnj6tU+wiliOXSrhdGd3Z99GspAXdfFNaxh9ylnfue?=
 =?us-ascii?Q?QiCq3hYVIZ3XfZDpczSoGQ865sS9eArghqfKV0bUkNAP9UlL4mzTZlC1ULFh?=
 =?us-ascii?Q?ThqnKzbRN+W7HZIZZJCfspieY4uwVt+WKX+O4J0oDLmfDSmOu7OK4MVHs9uk?=
 =?us-ascii?Q?Bona4M5RDq3NOCvaQfNHyiOTPP9fz5HkzO8iabK0HFnX+VvmdHM7fckKKU0N?=
 =?us-ascii?Q?R84OyQhxeCpnyS3NbGa67dygT9H6MXC/YfFIwGAbY7y1qve9JzqEzpJD1wYV?=
 =?us-ascii?Q?D0g/B07NS7B5E1h3hkRUiAplRpwGk9n6NeJDacuhAVSab7NHqlBvissTJtxQ?=
 =?us-ascii?Q?tGqbhMnpRzBbZ2f7WJrGyyFmq/GsF1KNX78csP7/d0J8x8S4rxDOLRm7bDf8?=
 =?us-ascii?Q?+FmndkOT4Gw2OnX6XeYtc/NzPAXjjdWu1ThwI/Pi3qVzcgsaOcCgBCuCeaLp?=
 =?us-ascii?Q?AwY5jXC+WR+2hsE42W1JYWoC7FwRlszj2MntDJLgkuIbzZcDK722Dednmj+o?=
 =?us-ascii?Q?fPB/PrcBg5FYxi/R5trr2hXRtRE/fz6slS+WVYk7WSx9hLdKZtjxodO45Cn+?=
 =?us-ascii?Q?PomJmyPPOn8DjtYDKW4MNEejLctHpmFBVjQ6xW4I7Dk9BxGIcws6Gu9xPJ1z?=
 =?us-ascii?Q?0A1EsH4n682ca8FWgdLvmevHNtVp2Bi2zZjGxrK1wQQuSVLJKNI0Dsf8xcSE?=
 =?us-ascii?Q?M8f7B3wN6SQHbYiKUQNUMXheokuemsa1n96bgzUUfCT5BD4O8OOxQkWEyhEE?=
 =?us-ascii?Q?jwo98r7z3+Cwv4pvRtG/hkqHZ7h1KFlROPGh3izASVzzq+XloqyoZsrj8/Rq?=
 =?us-ascii?Q?WfgGk+tLEUlDO0IYHcKGhEPReuRAxbfpMZ/wkZnJbN4I8vI+DrU2KarBn2Lj?=
 =?us-ascii?Q?y8Q+dKaRjg5YRGUrt+htyPtFxpW66dlZJfK+oLpIWo2KzFyOiTg8gu7e8LeP?=
 =?us-ascii?Q?vHXQ7l6HoqWwIMHW7WcYsmIjc+r6SR4El3j1rer9FpY1Q9MFgR8xmBnCAF9d?=
 =?us-ascii?Q?R/FUT7P9Bm9YPn4XPkhtvrWQrB/HcP/+FtSdgW7YsXs92qZY6HD14ABY33fP?=
 =?us-ascii?Q?TC0UzsHcrA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ece4274-ecf8-41a4-8de9-08da25a18b25
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 03:21:38.2834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhSWDD2+YSZ6Gu/ovfBE+1eB2vCOirmOCoYD09JBRegGk0KWcPCanB4XF0HX6IfEQxGYjCyU25HR2zdIWl4j0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2811
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Try support follword recovery for compressed files, this is
 a rough version, need more test to improve it. Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com> --- fs/f2fs/node.c | 7 +++++++ fs/f2fs/recovery.c
 | 10 +++++++++- 2 files changed, 16 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1niSop-0008Ui-Bz
Subject: [f2fs-dev] [RFC PATCH] f2fs: support follword recovery for
 compressed files
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

Try support follword recovery for compressed files, this is a rough
version, need more test to improve it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/node.c     |  7 +++++++
 fs/f2fs/recovery.c | 10 +++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c280f482c741..50211e8e7ec3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2803,6 +2803,13 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 			dst->i_crtime = src->i_crtime;
 			dst->i_crtime_nsec = src->i_crtime_nsec;
 		}
+		if (f2fs_sb_has_compression(sbi) && src->i_flags & F2FS_COMPR_FL
+			&& F2FS_FITS_IN_INODE(src, src->i_extra_isize, i_log_cluster_size)) {
+			dst->i_blocks = src->i_blocks;
+			dst->i_compress_algorithm = src->i_compress_algorithm;
+			dst->i_compr_blocks = src->i_compr_blocks;
+			dst->i_log_cluster_size = src->i_log_cluster_size;
+		}
 	}
 
 	new_ni = old_ni;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 3cb7f8a43b4d..c01d3a3e5410 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -636,7 +636,6 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 		src = f2fs_data_blkaddr(&dn);
 		dest = data_blkaddr(dn.inode, page, dn.ofs_in_node);
-
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
 			err = -EFSCORRUPTED;
@@ -669,6 +668,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		 * and then reserve one new block in dnode page.
 		 */
 		if (dest == NEW_ADDR) {
+			if (f2fs_compressed_file(inode)) {
+				recovered++;
+				f2fs_update_data_blkaddr(&dn, dest);
+				continue;
+			}
 			f2fs_truncate_data_blocks_range(&dn, 1);
 			f2fs_reserve_new_block(&dn);
 			continue;
@@ -702,6 +706,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 			f2fs_replace_block(sbi, &dn, src, dest,
 						ni.version, false, false);
 			recovered++;
+		} else if (f2fs_compressed_file(inode) &&
+				(dest == COMPRESS_ADDR)) {
+			recovered++;
+			f2fs_update_data_blkaddr(&dn, dest);
 		}
 	}
 
-- 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
