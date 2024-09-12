Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 852CF9761AA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 08:40:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sodVV-0007xT-5O;
	Thu, 12 Sep 2024 06:40:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liuderong@oppo.com>) id 1sodVT-0007xC-E9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 06:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oSsqPVk30Mqw3IyemL0Qad2li3axTIaKLI61/rZwLIQ=; b=O5KIsginXxjf6tNoL+VYfbXZrQ
 cR1WHPHSpuJLSHU9Yf68c7Wpq4lQ4RED7A98C2DQXbIhJQysHKn5lWskPEfICP3YJA0bqxQlekOLN
 VpY95fd0B/8MioLXB1VY73lfnNWhvmSV24tzooh8ojIiAXaizN40kNXONj8YCHmw01hg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oSsqPVk30Mqw3IyemL0Qad2li3axTIaKLI61/rZwLIQ=; b=cJjKLAquo72Z91ShMSRZ+FQGoi
 gFJiKpx5s/uEJt2uUmJtyqNdmBKbhCl+JexE3vxWpOqen0aJLMPA8Zn5EF7drb25mOmNBQtPeSQbH
 NbJoyo/9TRk1hTxp8NJFKTAgfnmQ/vfu2Jw+3cRQIBRGUa6wWEyAS69ynKEDop7tEqOM=;
Received: from mail-psaapc01on2052.outbound.protection.outlook.com
 ([40.107.255.52] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sodVS-0006sA-Mb for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 06:40:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6EoIvg8kML8rZMjcFovTfd0gS6jYXOjklluBiz1t/eZAYjJWURAqBVwfRfV3bLVyW/zI/KEJfQgXG9IqRbWrrN8Btbizx6fjnxdjWTFWmdMwMvbAcfN5Wu6femoYQKrSxu9h98PoScnOt9BHUTMSfzFuHda0eFolESjodtFuzdjPftzQsST91ppzc1L4k9jQEa6tRKvCRBKBvFeVtiZhahojtPyDE5e//6HjuN26ZlR/wh7Xe2Kld8uf4Wow/e8NOquzEXKZ6bfxDs76CTbgy4N45vgMWAp7TvB3ClFDjZxuHhxPDN740mppYlJBKZ/ENNLtTa91sdooBfI3CgPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSsqPVk30Mqw3IyemL0Qad2li3axTIaKLI61/rZwLIQ=;
 b=KRaGUYjP7efvHxWKbujUgXivmGD0X5kAmOOLz6x95h/e/im4xyy9mbvokYhOKM7fBdbG9TnYQbTiVfIn3gZsOuic/BrYC89gTjXrovA/Wp5zAyJBJvDwHUi8ruM13Q9RGRiPRR3jdGaII3vM8FaaeGllfssbN0YM71SgTw86BzFYRT0OHtj0dcUu7hz9ZdLULU+OiGDWDAO7H+va7edDwJZGqHJW1+N96GLzAAuc9t73U2PJ3/U5Tpnx3cAMjsSLQrNztMUuQuIQMbbl/HMo8OXf7A1mJAKr5D4Yve2pexOD5+h7W60sHl5L+r3WymG/FMT+Cd9wrvDVSKLdTS8dfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSsqPVk30Mqw3IyemL0Qad2li3axTIaKLI61/rZwLIQ=;
 b=Gr2645xm6Z5QwgN4gbWUEDa9pTsbZNuioQC4ISkL3sMHyPLuHtEEkqgIBoZt0tkX052QRNbYiA1EBoo+NswV7tLdejiR+xhuEeMJoHYALnIoO/EbmC91tPCoRQubuLSJvEpj5irHlp5CMXENzETja0SFRCs7p9oKQrU56tXD1tg=
Received: from SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7) by
 TYSPR02MB7370.apcprd02.prod.outlook.com (2603:1096:405:37::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Thu, 12 Sep 2024 06:40:28 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:190:cafe::4d) by SI2P153CA0031.outlook.office365.com
 (2603:1096:4:190::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.7 via Frontend
 Transport; Thu, 12 Sep 2024 06:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 12 Sep 2024 06:40:27 +0000
Received: from cndgdcavdu0c-218-29.172.16.40.114 (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 14:40:27 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 12 Sep 2024 14:40:13 +0800
Message-ID: <1726123214-208356-2-git-send-email-liuderong@oppo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1726123214-208356-1-git-send-email-liuderong@oppo.com>
References: <1726123214-208356-1-git-send-email-liuderong@oppo.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|TYSPR02MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f50448-0636-412f-2345-08dcd2f5ca11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KB9Vb/+sAKJ+OKIHOuJsgg85HodLzDMIsFwcJL7h7kSq9t5ugsz2ZppQBdG9?=
 =?us-ascii?Q?Z3pUuxjvXuPMslaaSf7uslG+8VlZS1sLuCPXkNLpJfYpQuq0Ypar72GCOb52?=
 =?us-ascii?Q?Z2UuW153GJ7/aXkfOOu7IjO3JWxxyCjXl3h6lUK/dBw+oWuBjrKVUmGRGlfA?=
 =?us-ascii?Q?+gjauiuPk725mWbLJ2H6zjNvIPNntGIStZOtlAXKpgaSTdJi/WGJ4gTnubvY?=
 =?us-ascii?Q?dDFIvkv3hCw/qRp95tBfDJGqIbSqoR9FMOgnsYYtpcai51nIfXQoRXJpuuU0?=
 =?us-ascii?Q?MXyGCcFNlz799C6JFttAfZi9CAz1J/qTNQKa7ZUiZ/JfVF1f0HQO2aIgzlSG?=
 =?us-ascii?Q?y1+2aQmNgFv/ViZ2ZZtQT/x4QMEFNJdhAlOvg0bQ8POjwkjF1kfeYjX/NDbt?=
 =?us-ascii?Q?WMzquVjBf0No9RBDvrzJyWRG9HbrQUpdnDZXQXW/kuqWBzMYE/O+c1rASWvn?=
 =?us-ascii?Q?sqTqkJrztC+LT6Q0WzPTXJj3z+HGmZyeJQCcuWlPAILTHgp9SrY/7VxVYpZA?=
 =?us-ascii?Q?uBZD6MTaINl6Ql+cxTGEJ9+BhryQYT1aHa6M69qJrQaFRJjX9az2FfK0F2AU?=
 =?us-ascii?Q?kNXtNgoKR6NLQYJKwdplrtGgXnfG9kkm6bglkN4UiyD8YUJ/Yyw1BlXFjNLT?=
 =?us-ascii?Q?lFiaziiX90md9m+YbCRF9vd2h88D3GCPAw14o+Ki+1jKHH9rjAksjeyQ72kC?=
 =?us-ascii?Q?rWmolmrvRLwkxeflqqdqOl1Jz3aoXwjj/04R9LVXLOZC3cLj8dZw84bLWqK6?=
 =?us-ascii?Q?I1OPX+QWcrW39cFOjGKVBfYvCnpmnNXRSE4SiQeSQZ4hDOHIvGaAtDZiF1Uk?=
 =?us-ascii?Q?2QnZMODmDu50Pxb3h6xqoI1BtG8u2aEVvRmGi5qf5EALm2l0/ZdUSNbzN5BY?=
 =?us-ascii?Q?f6dFWzb7nQ/maomC2FYXVYcff0cb6Z/vpOu+9TifQROS+SyTmr3FGRSMBjr+?=
 =?us-ascii?Q?0HTAeuioJkMjBzZ2mJ3jg+W00ne2WpAJVdsBzBaN/QueU8VmffClJHxB7ew/?=
 =?us-ascii?Q?lPeI8wGnzK/a34dVEivkbVTMF6DT0STunRPBkjybgkZGTTmhiXwcSAgQStN+?=
 =?us-ascii?Q?6miytD5Ow6gnaJGPjaIatzxtpoJeKGGuh9CuGlZKO6grsDgJ1D6qIHohAGaW?=
 =?us-ascii?Q?SB3hiV/GMcfGzM2jdwT+KsRSP9m/5hK+mVqKdSGQDMVJnxY6qkopXL/S9nqI?=
 =?us-ascii?Q?2kvuWtxFVnw4zow9wgckLRsyUP7K7YUTUvkftY3xth19uja+lUJ0LrTdH9uO?=
 =?us-ascii?Q?4xzC/pcHrcVAK8EIknB1qUf1Vc3DhVfIW5/YkFbR00c/s1vGOzCvanHPOoRQ?=
 =?us-ascii?Q?x1HnOzfPDaMNEpzQeyl41LSNvEtp8TuYIhmGBt5bE5K/YglU2UCP/0zMcM1t?=
 =?us-ascii?Q?yMbSaS8hmdq4O2v8uIqlA+9C6bjK2e12VPNWvk36usYx2ZLVtrcUBZQmyfoT?=
 =?us-ascii?Q?99S5+ht/U1lwWeVJxjrkwb8gEntSnBBU?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 06:40:27.7146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f50448-0636-412f-2345-08dcd2f5ca11
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7370
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liuderong <liuderong@oppo.com> Remove unused parameter
 segno from f2fs_usable_segs_in_sec. Signed-off-by: liuderong
 <liuderong@oppo.com>
 --- fs/f2fs/f2fs.h | 3 +-- fs/f2fs/gc.c | 6 +++--- fs/f2fs/segment.c | 3
 +-- fs/f2fs/segment.h | 4 ++-- 4 files changed, 7 insertions(+), 9 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.52 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sodVS-0006sA-Mb
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: remove unused parameters
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
From: liuderong--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: liuderong@oppo.com
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liuderong <liuderong@oppo.com>

Remove unused parameter segno from f2fs_usable_segs_in_sec.

Signed-off-by: liuderong <liuderong@oppo.com>
---
 fs/f2fs/f2fs.h    | 3 +--
 fs/f2fs/gc.c      | 6 +++---
 fs/f2fs/segment.c | 3 +--
 fs/f2fs/segment.h | 4 ++--
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac19c61..4dcdcdd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3759,8 +3759,7 @@ void f2fs_destroy_segment_manager_caches(void);
 int f2fs_rw_hint_to_seg_type(struct f2fs_sb_info *sbi, enum rw_hint hint);
 enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 			enum page_type type, enum temp_type temp);
-unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
-			unsigned int segno);
+unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 724bbcb..6299639 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -339,7 +339,7 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned char age = 0;
 	unsigned char u;
 	unsigned int i;
-	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
+	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
 
 	for (i = 0; i < usable_segs_per_sec; i++)
 		mtime += get_seg_entry(sbi, start + i)->mtime;
@@ -1707,7 +1707,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	 */
 	if (f2fs_sb_has_blkzoned(sbi))
 		end_segno -= SEGS_PER_SEC(sbi) -
-					f2fs_usable_segs_in_sec(sbi, segno);
+					f2fs_usable_segs_in_sec(sbi);
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
@@ -1881,7 +1881,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 
 	total_freed += seg_freed;
 
-	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno)) {
+	if (seg_freed == f2fs_usable_segs_in_sec(sbi)) {
 		sec_freed++;
 		total_sec_freed++;
 	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198..6627394 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5381,8 +5381,7 @@ unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 	return BLKS_PER_SEG(sbi);
 }
 
-unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi,
-					unsigned int segno)
+unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi)
 {
 	if (f2fs_sb_has_blkzoned(sbi))
 		return CAP_SEGS_PER_SEC(sbi);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index bfc01a5..9e61ded 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -430,7 +430,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
+	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
 
 	spin_lock(&free_i->segmap_lock);
 	clear_bit(segno, free_i->free_segmap);
@@ -464,7 +464,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi, segno);
+	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
 
 	spin_lock(&free_i->segmap_lock);
 	if (test_and_clear_bit(segno, free_i->free_segmap)) {
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
