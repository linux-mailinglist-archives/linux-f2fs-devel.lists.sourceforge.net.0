Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4414141B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 08:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/FcQuICol9ubIoavLGzq4XJ5lgmgdSOcjNUumVNVwU4=; b=mBUTDqZNkzYiX/iXE+JL3rkJqT
	/1/s+K1Zl6wLLbQMoCvfp3BpOO3gdf8RDrWVibduw1PAi8QPGLbjZRZd8zxvcLkFhNM4jtOAzfWRy
	Ul6bHee3VZric2nDbqVgCTTGErbpFWQTNvS+fQA35zQK+eSB3+dPVBgbYVXI0yWxmsVs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSvhX-0001A8-Dk; Wed, 22 Sep 2021 06:25:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mSvhJ-00019j-Sy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 06:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C0ylYombX8NBsMhhzZ7zr2gQSEVHRSocFuphuaeM7pY=; b=dE1E84ogCmeLg6F7ZtlwjxNg5Q
 NjIovMd4my5GBzOTA85VFbwQm80lextnnHprmUo4lA2eU7WNNf29mLlHJXtdD2DqwqDiAL/33Xk4E
 vEodMmhKLW7AhdmnYmSVZ5uGXCx3Aq/y5ZMJ7SHSq7W+yqxJBZ9IsTk4wuwQJeooHfMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C0ylYombX8NBsMhhzZ7zr2gQSEVHRSocFuphuaeM7pY=; b=V
 GzRUKPxtITQ35ZzX+cg2Wv5nMrtuPybYDrHJzY0sQOHMyUjODy666zPv2PccaKgyxAJ13t0sBT0ej
 7ZT1c6eveNg04JrbdSIXx1C4PWHgDStUhqHif2G4w5CktGwoLg++r3mVcYnEAEZJ6ndB8o0pIpYKt
 sYT1A4lvAvkJGi90=;
Received: from mail-eopbgr1300124.outbound.protection.outlook.com
 ([40.107.130.124] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSvhD-0008D3-C4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 06:25:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obNZZReKbYn65ypmV3zr4L2RXk9lu47Et+EK9UzmALbYiYc3mcDudyHcKQhuDNF2pwwzXVW94CWXqFcq6DMgaMMiZKPSsy5eI2cW2bMhLTkrukL1R32OGczswTlInkRcEvDzhoRAcUtFQFc2GqczL9X9rKG47E5ILy5dh6DCiaUxpPb6rfy8dAoGlWqQGHUhOjd8QSBYaef5H/2f81vJ0ThdA7gDO9B9RJ07zOQ2VPepbobstj8T85whjktvdixpGz2s+DesWvJEXAbVMXCiloq32taed6W1tl8IgXYJa18g/gu6vl+A3dHsvQWb3lKJ7fnQSFsi6Usa22+0XkkmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=C0ylYombX8NBsMhhzZ7zr2gQSEVHRSocFuphuaeM7pY=;
 b=LoPQafto28ycXaxW13+wgdPkt+w8erszXEuGfrJSkq9NGCkyR0TVuTr66ZWTCRgB+rQuCk33JyifdDib2Lx6BxZ4SfyGJ2X4E3TJSMG6iPTlFAvzBzVEeLo8OjUFQk5isIX5lluXb3gjnaD1cl/cbFj2hijaqnqLQwDE7zBFb0dR7x2lgxCb9m1G2UhFTiY80LtLo+SpaCLIc949vaRUxkvakfzyVEStwoTp+QJ3vfSKmJwNHvRtkEzg2/OxS53v/Tv4xGTryv/3Qv4I0RccGXKy1FTgyxSyS17H2S+JnprEH+pYysGAbiawIPwAUdAsFtA//pGEo0jV+TNFNFi26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0ylYombX8NBsMhhzZ7zr2gQSEVHRSocFuphuaeM7pY=;
 b=YtRM8TriCs2uBB9xLwFoJCF6ipxqOSjcSadParQQ/hP+kpZAAYa9Hbs9rzim/VKnZGMbnUti+A5iA0UQEZN/37dooozM5qflKO+q84GtEBPbKN9YQWBl8ochvW3+0uZdD/WSeUJSS8ECqL5EqCxgH2b79WZGbsGVaJ0j7fkelww=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4241.apcprd06.prod.outlook.com (2603:1096:820:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 06:25:20 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%8]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 06:25:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 22 Sep 2021 14:25:04 +0800
Message-Id: <20210922062505.412057-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR03CA0063.apcprd03.prod.outlook.com (2603:1096:202:17::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4566.7 via Frontend Transport; Wed, 22 Sep 2021 06:25:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c021ac68-56ba-4274-f1d8-08d97d91c043
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB4241C8B0B6E51927307625EDBBA29@KL1PR0601MB4241.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3kvQEiGeCguyAG3aOa3xPcnOkg4qyouYAkcoVJ9EKKYpzlXIrRGmJyXBZCjHE14tCwQIkGQodKdIvqsoEzPIBJhbpixUqEEWkue4xR2pKKNwuHYCZV+Ga+8tTpXEB52yEC06JpPjgg9bstK0QRBjA7PC8gBIqphI+cr4jWQtCZmCYRcidcqPYYJ84pF1Lfm1gHaqDXSQdmPwVTczfWlz60THXP+Eeb4bjH//Gav3S56H16fseSFB3y3qINcTv5ZAEq0impjEnsMcRfcRmo8Ut7EhYGVQCjlsUdxYt4V+OhvN8sO9ek6CXoE8H8Sk2UYl9YTnOSi8SJ6152g+LG6r3BfsGSKBi7fvkEWvzaK/RVV/8/xFhckvxromVNsILBjTDCs4VPAQNqMO0T6w6sx6epy+msycPp/fy7ojcfbpHAKIqMo/PrOwEJYIRs4XGCQtIFus5HUpwlVqE7crotE+UtL4if5KBf/JwVUgEOtQvJw8hOV9RSnuL3Im55K8DGftd7huusz62W6hbcPMqEhbluBSjsX+OkZ6pTfzxIFxEABZoUV/ywFvzl4ECqRc4OMPdM3mq9/X2DzHOz0h0nZ26qGAJgZc2EDybPXmcMUDF3f9Izoo3fPzGQva8I3DlV6XqU0G4jpZODPqAO3/+G9G07Njjznxn9yz8MKFNgJnUdTLdsvAMd8eZD8a+mI0zX99t2gdHpoSJCYy/JfEDUyuTcBUe4bP/uSizBsdxtZZTew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(83380400001)(2616005)(6512007)(2906002)(38100700002)(86362001)(508600001)(8936002)(107886003)(66556008)(4326008)(1076003)(66476007)(66946007)(6666004)(316002)(8676002)(186003)(6506007)(6486002)(26005)(52116002)(38350700002)(36756003)(5660300002)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Quas6sOuJRBXgIElT0gscXjs4PHZcuvDoTlpTZqNsUfVBFVEUxVF5LEjgJH2?=
 =?us-ascii?Q?KJ7MohnOsw3l2oj+c8ZXxa58MN0Zhjlc5APiCfb03JCnRoaYxsATbfMawjRe?=
 =?us-ascii?Q?YV+YZU6nqjUeMkPhPJ3Qd/Q7dSe6NVlYwzJDEhnI7us0+pva9XZbj3tIMh9H?=
 =?us-ascii?Q?zLBXMu+UoFL/kB7rYXghuB8lEZUu3AgsrQhToscoF6FCgWIuTk5bkaV4PQX/?=
 =?us-ascii?Q?8UL0B/YBt/Q91rulSla7G26FI6dXn9EbaejuWgXU+G1nY3oUsZDPN3IWzAXM?=
 =?us-ascii?Q?aNO0hqKNDox/j5FCRGVWJLm4pcqVxRPI2UJeDzB5tig1AS/B5Maw8+b0HHUK?=
 =?us-ascii?Q?M/oPQv/5gculYRJJUE6m1zXb5azJa9aifbvslxz/hH3hzUYER7pKjJgzxdp0?=
 =?us-ascii?Q?qMwB6W9K1hmlorEDqdvMx6DugAgBuJMrG88JLys/XA/SnRZTxhFJpIv+pe1w?=
 =?us-ascii?Q?GBLRpSSZ+X9i+x1pynPJb671aAZ4kGBXog7/DRDC0S4l8AnyGdQOIf33A+Y8?=
 =?us-ascii?Q?QViPVWJojR52ryVvTv0QHR4z5+ivGogUFpb+6VfPdWb7ou6C3lMiEz2HN1ud?=
 =?us-ascii?Q?hOsogv29fbvpMxcFl09NaKd+IEOhqN8ubNO/KXWQv3SSFF16M3nqF+y/hVLG?=
 =?us-ascii?Q?t8NUIzRwqMPH9ppsMXd5/W+buGZnghtLUv1Jvub2h4AEM+aYHj+hwkqLZDfn?=
 =?us-ascii?Q?UNzDqtpdEMetV758G5inelk/alIHAwYXDHK/LHqlkIUOYlkW8hH03lNQ+39k?=
 =?us-ascii?Q?ZOJ3IriomNa0MgZbvC3UmTS1wBX4XpLEB4SeVTovVVtCat8IsVGPyEwjQtWH?=
 =?us-ascii?Q?LNSmiQXeBRUijoseQ21zwJi5hR+BIWBylSXwRE/lAzh0gzhxmDCJzEr9CuP3?=
 =?us-ascii?Q?qN7tHfoDHSjOpVxaziqqZ6m1ETvtooCdJNElWOBD6ApZnjD8JzIVMJrtEoeC?=
 =?us-ascii?Q?bBzzGApa/8B3UhfAzmV9nDy0u8lLF8VlDeCAKsBihPMZ7O19B9OtOcJ4nACQ?=
 =?us-ascii?Q?MaCrXCy7dLB/zkpWto6Bn2dTJSqW3ZQLd+2jMyLUIyuQ0awW0qHsKtn07VYh?=
 =?us-ascii?Q?zj6Kg82L8l4ChMvLbmhzpHB9kQ6JPyTgbRVZqSsZtKvGMuG+ImmLvlWFUKBN?=
 =?us-ascii?Q?DYToxT7+gYyQs6e8tbgvKojmSEHMeF7V6fubO/ROQr0gXwS2wj18etJLkEBv?=
 =?us-ascii?Q?vb2RcdLUEXT8BdpKMPbBDsFsg6kb5QRQP4msOGJbwsWLyBRnO0JACGepDJma?=
 =?us-ascii?Q?5Xn+308ThrNsUJhKyVKOVJQR8yemvuCqPSMKE8VGZcOeOy+e8yE2cvDuMIzq?=
 =?us-ascii?Q?PTaul/4+oFvqOqxmas5cg4oH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c021ac68-56ba-4274-f1d8-08d97d91c043
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 06:25:20.2339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00e0bX5H2R16wrDOisG1q1K98yfWJcKDpTiZS4c8n4AWXlPv5GH47gXmRa0QMbjtRXGw9PjgN/joass4jTUMjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4241
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: separate buffer and direct io in block allocation statistics.
 New output will like this: buffer direct segments IPU: 0 0 N/A SSR: 0 0 0
 LFS: 0 0 0 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> ---
 fs/f2fs/data.c
 | 10 ++++++---- fs/f2fs/debug.c | 24 +++++++++++++++--------- fs/f2fs/f2fs.h
 | 32 +++++++++++++++++++++ fs/f2fs/gc.c [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mSvhD-0008D3-C4
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: separate buffer and direct io in
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
---
 fs/f2fs/data.c    | 10 ++++++----
 fs/f2fs/debug.c   | 24 +++++++++++++++---------
 fs/f2fs/f2fs.h    | 32 +++++++++++++++++++++-----------
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c |  8 ++++----
 5 files changed, 47 insertions(+), 29 deletions(-)

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
index b339ae89c1ad..20d715cacf49 100644
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
@@ -3866,8 +3876,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_update_max_volatile_write(inode)		do { } while (0)
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
-#define stat_inc_block_count(sbi, curseg)		do { } while (0)
-#define stat_inc_inplace_blocks(sbi)			do { } while (0)
+#define stat_inc_block_count(sbi, curseg, direct_io)		do { } while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)			do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
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
