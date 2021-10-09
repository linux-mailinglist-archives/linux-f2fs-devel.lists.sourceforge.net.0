Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E642796A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Oct 2021 13:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GKIzFO5RpI849NF082ytZYv2/ys7EhZwhLSZTbSDMqM=; b=mw3almY6gKJUO2wgU23tUGUljl
	mISPYec9NwXXFgvK/ZasqKeNQulRwTEgEwlRMlQfFUGwWkwCL7v8ka9RVaKVieYbl1sMf6rfvEBk7
	hpuNhtGnk8wSM2b8H/5RYUmBTDaiaovfK2+dj0+ndpku2d70cnODI9s2ubNLiGhbooAg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZAWM-0000fz-Ew; Sat, 09 Oct 2021 11:28:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mZAWK-0000fq-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 11:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/IRas/yYT73ciXT+jt8lwSjE6OV9xCKg4advGwsgW08=; b=GFk+AyqcWFK+JmkR/PBShSeyFe
 mBN/FaKWgiInDApvBkgs3R3roreAnEeRT7rhLzwx1+etssAcSjtopKGwLEc3No8BneZjCSgUXdTRb
 icmShQP4NQGnykUVovKGpho0Fsf7DkWd8bYcmRIUqGVwhTN6GdNFA+0tDsKHgry/hyBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/IRas/yYT73ciXT+jt8lwSjE6OV9xCKg4advGwsgW08=; b=J
 2x4AAbIdc6MSHRv22yrXpCzNls3nQY0x4c6citflPyHUQ9G+EXbWSUdvkH5IC5uPYTyJO+a1RjOMg
 mdJl2nTydSEPk2eYUo7KIXGg2XNo46OqUC41wEQ7NTiZmMjZ42/NU+a9pzUyAzbYU0+KpLa2HFVmQ
 W4ype1+EYymAkoyk=;
Received: from mail-eopbgr1310117.outbound.protection.outlook.com
 ([40.107.131.117] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZAWG-0002t1-HH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Oct 2021 11:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXw8Uzrvhq/DSDQ7hUPFAj2XJUW+T9n9N4xMvbu99H+2y6zAcyBkPruyZ0MUFTorblY/93/vtbCa5mP7n52JKoGnfrr1AXeEarD/S80U80B0rgGdibK8Y+pHXnqq4pqC1K/zZh1HFZGdG/GlAhpjXej/spBA+W/6TYL9v5APpLSlffL3WF3gCh3MMSnBzTAZspaA7xx4KXM5QENyAsa0h6VXgF2MUWvkqctqNkXJfwJ/uzX1NGszMZUHeb/+nfGT+2YXHkgLCWKNi2obmLd//xXb8mSlFsOCCm79fHLNU40eRaYG6QIPInDCVEbNiIMsxG9NtW24izTl8bB73Zd4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IRas/yYT73ciXT+jt8lwSjE6OV9xCKg4advGwsgW08=;
 b=mq8+0aCmGpPjMrkbTH//M7tDxULZq2TLqF3fXf/vUvoQtqGXU/f7OlwLz71ZH05/YUMPfl3d0+gcKziB0P12S4Vjg+UJ1OjeTwUaWaZHsWoEiGV0ZDhrbx1EDV8YLAevBN5DOPo0Yv5oeJHkUc16yCxq+IcJnIF4JhBOfeuFGaZMuJkyNBziWVrdcr/zpWozrwBp9HNlso4B6/MRS4vIB8USa9GlICZ5S1iZnzblozi6OoJEwTGnCRFuVO6rlk3HZGIk6+2fFJHnUvzdPzvZTC0BguhRyH9kCVf+y3QgsHR/sQfArPYyhKkQIaXx+atQL62r5O+4T07h3t3ZqTX+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IRas/yYT73ciXT+jt8lwSjE6OV9xCKg4advGwsgW08=;
 b=Aqu0XEhR5gaQatWT2WR1y17vT5OKY+okqCxoD/ZPKGp4sYcpBChEd2sgXHpL0xOG9ikLMvnT7DxfC0CS0XP1fK2DGBChwCYVAifZTLqoWtVZwDNUo6SMZjCwBCbFjj56PKty7T4dIppakmRw0a44fTMOdIRhf2lQnUOBqraZTG4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3873.apcprd06.prod.outlook.com (2603:1096:820:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 11:27:53 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3%5]) with mapi id 15.20.4587.025; Sat, 9 Oct 2021
 11:27:52 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  9 Oct 2021 19:27:43 +0800
Message-Id: <20211009112744.33698-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.4 via Frontend Transport; Sat, 9 Oct 2021 11:27:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7449ed3-3698-4bb8-f8f8-08d98b17d517
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3873:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB387355176B322FBCAFF534B6BBB39@KL1PR0601MB3873.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7syBSF+LCgyCbhuReR+Wb+0ndcTCM4HGhgj1e5J4YjTCcKgYDgAVSmndbbZUNZH7BoOvkMa2IF1rEzNQC+gxF/rD3YNrzMxwK+KEGgGk/ZmK+Ad5HDpg/p6g58qbhsGfhwV3gs7Qma/SL7YT89gK1M40QtCPtKTPxWI9by2n2Ged2U2ZwC2mYEtXlBZL6q7FCcBweIjOscG1OTPRxPX3u/1rrbzxYiNvFezyn/XcN9PhBVPT6eKkNz9h1l0kwanoIej8b6H+SCO2HhxY1e3kn+od4HkHBh7tGpDUYPYObAtgp1u0lQqWe8WAwsu9fE/eh11Die5OUlc52ieK2d6QyFgK1iVb2nFSRrPJ1RI1PL3cFDrla02kkzgxJseb13UFHa1UTTfxqpDsKHed4iF7MBWqvn+wECDrlXpySDpASLOxBry4CvW7pnW+K8W9AJVgt3dMV67Edz6Qw6FfOycUtgJRvQ3Rdjy0uEjEl8pgK5H3Fd0iSF7VUT8lUOwmMHlF+zJYAJBYhaNqhwop53XYHftiySrv2m13FXjBqRToa3qLHf0XStNJARfqFI3xOKWHBzQ9cHdXrZfETlyCDOPLpzJbS5KC2KF63pYlDsNAbSG7V8xK04xHiSZdExPHfCOVgok0b/WYZPLjAI/5KcqRIum1Fwwf8fLXspkRz6X4Q19cATd61RWfNKLYWIKQdsbI0aUW4WsdMsBoYwHYyNZitdoJD0gMotLAEiKJntRJe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(6506007)(956004)(2616005)(38350700002)(6512007)(8676002)(38100700002)(2906002)(316002)(1076003)(86362001)(6486002)(83380400001)(36756003)(186003)(66556008)(508600001)(66476007)(4326008)(66946007)(52116002)(26005)(107886003)(5660300002)(8936002)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2AL5FtPCba8D3knMB2QSAlBUGNG1XYYoKdiCgD0FK4jDYaSDz8Cf80zDpF60?=
 =?us-ascii?Q?hfRLSBFZXizUJqzqvy7W7Q8EUR2DaOpbrZPvhR+Cq10Muu9yXjKxQTAJMoMB?=
 =?us-ascii?Q?+AH7cPiGJEWB0lAcdnBgEKrWccDlY+/ekgsg61Jpk8NpY6Ki4Yjpw/IqLBwr?=
 =?us-ascii?Q?iit6Qr+e0i2jXuXwRlV/mzLUkLMwB4cqJIPBrwme2LTNnJlGNK1QfJqL+li+?=
 =?us-ascii?Q?HfEpn6OH57+Ue5qxiQBVHA0uDzuz0XMabqvOxRzdqy1GAi8isePordaMOkQj?=
 =?us-ascii?Q?+SpNRKI+vlybNNCmNapPdbat9hgpB0n5SVhZWtqowvfwqmvjkG2Lebv2rbEA?=
 =?us-ascii?Q?FNRA9nHSFp21xvbDcz1NWy6Wpg8qCMZcg5sB8Gu8oKSo0q/O6bbsQKwCjJwU?=
 =?us-ascii?Q?xBaf1JJUD7qKBI6X+gbtBmYHc97pGsJ935WVcKRCH+lLDOl8XZZEld36Z2fz?=
 =?us-ascii?Q?pIETpZ7EiGT8iTTpN9qy9dJINSw7h7fYGYwLl5JVc9WGD2eggVSOT9q710w/?=
 =?us-ascii?Q?g57L1zkckeI5Fy5YGdm7fPAvswgwUXT+HWnrKtAj4Q6ZAVdX/hxs0RpjUu6j?=
 =?us-ascii?Q?VqIjCiSOkH93Wozzd6X33ABbb+AkAgzN+gV2ODL/+rLH5D5jarO6JFqjQ77s?=
 =?us-ascii?Q?bQO9QKnuGZ6zQPy9NoW61gCOXuO4Ms6l3RcRtpuLnEI/gUawbedMOJ3rFGtJ?=
 =?us-ascii?Q?/+qTk0jN18p6qDIoxymasVquRIhPltMNX12oCXju26bbK+TiRWkRkdBBC/bY?=
 =?us-ascii?Q?KF1pCiyhpws0423IUJxXE7x8qLifnssX47DKCEgPoonxs1eyxZOp0bGtfSBm?=
 =?us-ascii?Q?h0612ZtUvQ9cbiWUSLvFj8DtCtP0YLXxs2AVr0HzU6Sg5S8MrPaHZREGqb7V?=
 =?us-ascii?Q?IKH0b9OLOwnOXZelE5o9zoP3fNCzV7VpT9x08sRvrWKUAfZl5dYFDJzw5F4I?=
 =?us-ascii?Q?W9H5EQCXe+LG1aem42tAIlIpaxMjtjnydgjLdoVFJHUqO9lHKS0t1iuWmdnd?=
 =?us-ascii?Q?wnAmqf9+f/uNdDjwwX0f3YEF4Xu8fxsFO9CWDpCTqCpr3vdqmfmt78jux1GN?=
 =?us-ascii?Q?x9cm01RVdsP+WI859+nvMnYwzksqllhJeid6bCQtrvIZ7qWfS0l3ZpR0GH8D?=
 =?us-ascii?Q?Y3tn3etZHSbAnn6EU5LmFmtpg44UPLuxfgo8n0DOFiKf1gX3UUeD2Z1kmA6v?=
 =?us-ascii?Q?ZA9IQ/tw7s5IDYZradWEnbunPn8j5kDu2wEOyLQGfFfITScfgiaK5+ZKwhFp?=
 =?us-ascii?Q?lbSFy2vI2zv5maBRCQmBXOA7SGJW5YTIjnbulFXIBgJaUFSvzvAnAE4GU1yN?=
 =?us-ascii?Q?famjD/R9nPIb/xf4vOf1ORpc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7449ed3-3698-4bb8-f8f8-08d98b17d517
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 11:27:52.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkOBmCDhLkGAlzYlKRJX8rpxzHMXXmS0bkLR1wNqDsTPcfiSxriWseFIT6sc+F5ZISHKuvM6V0euPBQHPAkEbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3873
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.117 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.117 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mZAWG-0002t1-HH
Subject: [f2fs-dev] [PATCH v5 1/2] f2fs: separate buffer and direct io in
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
index b339ae89c1ad..bf2e73e46304 100644
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
+#define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
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
