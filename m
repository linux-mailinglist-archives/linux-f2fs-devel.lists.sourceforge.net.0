Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D154697BA8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 12:06:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqraD-0006X5-K6;
	Wed, 18 Sep 2024 10:06:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liuderong@oppo.com>) id 1sqraB-0006Wx-Cq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 10:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wa018P/VMM0X7XfBlCnyHnJB5rHoQ3mlw+k+GS+4exw=; b=OV3uh63HswXPaMX+oCjdz51UXQ
 jQud4H6S6A4j7ZrBh+BiCC8ZDJrAoF8CWd0nJ26tiyeOU9qj9/qUFJqiGCy7n91/4hpEioBRiHrXh
 7VnRFF7ItA7khwChFdMJpFGPSu+YqSoWzJbPQvYWrrMe2EY2MCwxyNzSlO41HO1CdoeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wa018P/VMM0X7XfBlCnyHnJB5rHoQ3mlw+k+GS+4exw=; b=AtHOdaQj3zbjkQQ8A+N9rs7yPL
 PGvhXVymliCDt3ICkLo1xNCNaNdbbEapXKvGq4f6oKy1owyT4vZKHHeoNa5Qk5ZwvUgwUgeH0MePr
 dAyXLqbRu+99MhNZipq1R1rV0hMFUjQhYbAmU7EZowH19cCkWucgK6TAYmh7/DtkJcbc=;
Received: from mail-psaapc01on2055.outbound.protection.outlook.com
 ([40.107.255.55] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqra9-0003hm-W0 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 10:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPh1Tldk3jBV+DA58MegU4rqpyJIe/t8bXsL8fXxNjpjl93b4SdrNwuduyu5eM1F7yjFHa6h0p88JiUEOFXvzU5Is5FlX3R/m4e1ywdBh2bjTF7PYY2l+uzv+ABO+Tg5eNbUroJ4T/8ebgMz6iU3nwpZC4YIq8USy5tg7ssEz1OFfHS7BZstnRmFAGKEX47ci0JvXNU2YH3gYeKKfKESOT6ixd6XtwVnh3ryCdKwe+0Qf0HNtVCqKREtTS8O2uQisLOyRqiQWtrLmASQIm/++nIoT1O/clr5vWZ96hUEeSEbfPxzZVfSNeKCRtrHmT1Fi3MTo+6tOL/BHvCiJmqrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wa018P/VMM0X7XfBlCnyHnJB5rHoQ3mlw+k+GS+4exw=;
 b=k94ZTOQImwhckbGWb9bqGgrptysFCHv9acmK76abXKm84oHEt9ZiFBmag7QtOMQPHfYUmoI0ivKh3UJyXlc0gzzhe9WeBJ3QtylxQ8+Lv10B0k12JMa+aT8mLqfIDB5k39+9ZmGoMqqvDM/aO8LbGepNcOjI6mf4ZEXzrftW7EGUZdxKHYSeDnzE/bBMg8ZAT9BgNZ7T1fYwmT0solVtZoGWIPizGY08qFOZ7GYZGQz4ISXhV6PSQjg67XgIwpkQNwVRiqYA01mCl32/suhQ6FpB4SR9WYwzu3vaiZ5oc+E5rKl997krs8wdahmfXQpCQ2YSljv8Ylu03zxvmDZZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wa018P/VMM0X7XfBlCnyHnJB5rHoQ3mlw+k+GS+4exw=;
 b=Trya8S7s8dhsq2CaBBqBVYL+cfGPSCvWpLh7lpnugCxHNCMeinKf7wvD/gPmGMadf9PZjb3RHvv3E25exDD00StBI2h2DGXajh85RNFZy1iB/lUMqa0WuwEobVqcKlOjdQ4mqRjXqpHVeapV1OPalTErjgvKXp8SZ95ZyZM+P5w=
Received: from KL1P15301CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:820:6::15)
 by SEYPR02MB7458.apcprd02.prod.outlook.com (2603:1096:101:1e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 10:06:35 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:820:6:cafe::3b) by KL1P15301CA0027.outlook.office365.com
 (2603:1096:820:6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.6 via Frontend
 Transport; Wed, 18 Sep 2024 10:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 10:06:35 +0000
Received: from cndgdcavdu0c-218-29.172.16.40.114 (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 18:06:34 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 18 Sep 2024 18:06:20 +0800
Message-ID: <1726653980-590956-3-git-send-email-liuderong@oppo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1726653980-590956-1-git-send-email-liuderong@oppo.com>
References: <1726653980-590956-1-git-send-email-liuderong@oppo.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|SEYPR02MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: c550fb92-35c2-4564-3dc0-08dcd7c99420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7IGyNTQRVzVBfeNi+uKMMqS3hnia/cP7RXA3f7MW+0/irD93SzzwhAQ8o0zL?=
 =?us-ascii?Q?Fnsjk+teAkmDmSWdwtDca0w/B0Q4G6apuUh1CcKXOyStLw20C9oym0SKaZmN?=
 =?us-ascii?Q?oQxfHIMYWecOn+NaET4p847Lsusyoq59kI4ORaK6ufsjsQ2crziUt1fYKQtw?=
 =?us-ascii?Q?vST+Hz7d/Ed0f9Mr4TEa5fkU2LCzvm6q444CuOUsVPRNy1PPLTN85FqeXk/b?=
 =?us-ascii?Q?2bnFcDMUw4Rm+QAWONEvZT5qhuJFovCiGjyHoDkAVyNf2W18E6GT+daR3XdO?=
 =?us-ascii?Q?gJZDxBbh7GgdJL3oI7YsI4LUJafAh9zBO7rV0PIvHzK/UxbXcg9coo7h59K8?=
 =?us-ascii?Q?EsF3oahAErC7DE4WWW3vHifNVWRQ8Z0/TkyNJ4uRQGjrlJVasLBdY2TR5wUh?=
 =?us-ascii?Q?P95rz057O6DgJ2oISWZ2es7w5yXHlyRTpUgiNcXPccpitJSx3TD5O7cVUJ0O?=
 =?us-ascii?Q?1pMjDwsbuaAvbtVH+oz5RB5rtXctzIMXQNeYFWcoMTjWfISUnZGEEyNltx00?=
 =?us-ascii?Q?avYDH51fyI8RCUfc13dWL32O0col7qQRcb/WHw9ymintQkktFO3+7tE/4K97?=
 =?us-ascii?Q?WCeWzYWW0IjmnGAzKK/+xvk/LbG3mhdswPc5kC9cbWdenQvXq/AbQ9ElMgW3?=
 =?us-ascii?Q?luvVv884a3KvL0TUBcaFnyCBCa3VOOpyWMRBnZP2dxKCSm+aPOy45MPgwtCn?=
 =?us-ascii?Q?YlPkgeR1hAcwR9XaCAIhz2oNBAD6Na5enBctrE1K+7K6WukbwBZ7T2CjYviA?=
 =?us-ascii?Q?McFOttk3N2DLzxS3/+3tpLoqXXkLxYYHJ9qaTTAq03LVyVVIyNMWqPvonEAR?=
 =?us-ascii?Q?fBm0HMgStC0Mu5JaLOhpT4G1lBm3M9uuz4tKJBvA8PUmOaHiwzI/XmcXKQvv?=
 =?us-ascii?Q?DDjFeybV6TMttR2ePumacudvBkMzONMi7OX3+S4aG/0tntDPVK7RLDDmESsA?=
 =?us-ascii?Q?+cSKh0zVILlgF8NLZB9BBfSnlpB5xY12E2AwUEvm64pw5ElcJ49PSwjb2DqG?=
 =?us-ascii?Q?k4jV71lP8EdrtiSUy5e1xcmJtnNvJTXax+MRgOb2jAOrM+pARJjL4I3V+GlV?=
 =?us-ascii?Q?q5vwIynaMUCZ6puSjPpEPBu6bG0SnPeyBQ3TBJfC93PsxiJPLhD7qwfyoRe3?=
 =?us-ascii?Q?slxIu2HuTbB03iRIuZ/R+6csmGx+qeQCK/8ud+0jzR1m2xTNepOrAWBii9nO?=
 =?us-ascii?Q?GQMsbnn2hNfRltoIUww3fRKyGzbz63x5hFchi7Xu7HHYYNeAMqlFaXPOHG1s?=
 =?us-ascii?Q?yQ1Ok3HlM9SdT2t8N2iDKpU8ye2KhGqSpW90KVf1QbogcuwaFEl7+FE2cQQs?=
 =?us-ascii?Q?NySbOQW1xZJMCLzygpWrknj76pv/2xtvcr8DhQfsc/taDvPm34T78v5GO34v?=
 =?us-ascii?Q?GV1AIHQJAnKOI4ke+HH36OY3c+h0w19Kx8tpjvdzK1B8qoCmPVmUORsZWOBZ?=
 =?us-ascii?Q?YyOcZjSjY4jdZqASHbBXb9p5U3hiMJWu?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:06:35.1588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c550fb92-35c2-4564-3dc0-08dcd7c99420
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7458
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liuderong <liuderong@oppo.com> When segs_per_sec is
 larger than 1, section may contain invalid segments,
 mtime should be the average
 value of each valid blocks, so introduce f2fs_get_section_mtime to record
 the average mtime of all [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.55 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sqra9-0003hm-W0
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: introduce f2fs_get_section_mtime
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

When segs_per_sec is larger than 1, section may contain invalid segments,
mtime should be the average value of each valid blocks,
so introduce f2fs_get_section_mtime to
record the average mtime of all valid blocks in a section.

Signed-off-by: liuderong <liuderong@oppo.com>
---
 fs/f2fs/f2fs.h    |  2 ++
 fs/f2fs/gc.c      | 17 ++++-------------
 fs/f2fs/segment.c | 35 ++++++++++++++++++++++++++++++-----
 fs/f2fs/segment.h |  2 ++
 4 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4dcdcdd..1c140ff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3762,6 +3762,8 @@ enum rw_hint f2fs_io_type_to_rw_hint(struct f2fs_sb_info *sbi,
 unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi);
 unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 			unsigned int segno);
+unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
+			unsigned int segno);
 
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6299639..9ca73bf 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -332,20 +332,15 @@ static unsigned int check_bg_victims(struct f2fs_sb_info *sbi)
 static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-	unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned long long mtime = 0;
 	unsigned int vblocks;
 	unsigned char age = 0;
 	unsigned char u;
-	unsigned int i;
 	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
 
-	for (i = 0; i < usable_segs_per_sec; i++)
-		mtime += get_seg_entry(sbi, start + i)->mtime;
+	mtime = f2fs_get_section_mtime(sbi, segno);
+	f2fs_bug_on(sbi, mtime == INVALID_MTIME);
 	vblocks = get_valid_blocks(sbi, segno, true);
-
-	mtime = div_u64(mtime, usable_segs_per_sec);
 	vblocks = div_u64(vblocks, usable_segs_per_sec);
 
 	u = BLKS_TO_SEGS(sbi, vblocks * 100);
@@ -485,10 +480,7 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
 				struct victim_sel_policy *p, unsigned int segno)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-	unsigned int start = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned long long mtime = 0;
-	unsigned int i;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
 		if (p->gc_mode == GC_AT &&
@@ -496,9 +488,8 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
 			return;
 	}
 
-	for (i = 0; i < SEGS_PER_SEC(sbi); i++)
-		mtime += get_seg_entry(sbi, start + i)->mtime;
-	mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
+	mtime = f2fs_get_section_mtime(sbi, segno);
+	f2fs_bug_on(sbi, mtime == INVALID_MTIME);
 
 	/* Handle if the system time has changed by the user */
 	if (mtime < sit_i->min_mtime)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6627394..717cd15 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5389,6 +5389,35 @@ unsigned int f2fs_usable_segs_in_sec(struct f2fs_sb_info *sbi)
 	return SEGS_PER_SEC(sbi);
 }
 
+unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
+	unsigned int segno)
+{
+	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
+	unsigned int secno = 0, start = 0;
+	unsigned int total_valid_blocks = 0;
+	unsigned long long mtime = 0;
+	unsigned int i = 0;
+
+	secno = GET_SEC_FROM_SEG(sbi, segno);
+	start = GET_SEG_FROM_SEC(sbi, secno);
+
+	if (!__is_large_section(sbi))
+		return get_seg_entry(sbi, start + i)->mtime;
+
+	for (i = 0; i < usable_segs_per_sec; i++) {
+		/* for large section, only check the mtime of valid segments */
+		struct seg_entry *se = get_seg_entry(sbi, start+i);
+
+		mtime += se->mtime * se->valid_blocks;
+		total_valid_blocks += se->valid_blocks;
+	}
+
+	if (total_valid_blocks == 0)
+		return INVALID_MTIME;
+
+	return div_u64(mtime, total_valid_blocks);
+}
+
 /*
  * Update min, max modified time for cost-benefit GC algorithm
  */
@@ -5402,13 +5431,9 @@ static void init_min_max_mtime(struct f2fs_sb_info *sbi)
 	sit_i->min_mtime = ULLONG_MAX;
 
 	for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi)) {
-		unsigned int i;
 		unsigned long long mtime = 0;
 
-		for (i = 0; i < SEGS_PER_SEC(sbi); i++)
-			mtime += get_seg_entry(sbi, segno + i)->mtime;
-
-		mtime = div_u64(mtime, SEGS_PER_SEC(sbi));
+		mtime = f2fs_get_section_mtime(sbi, segno);
 
 		if (sit_i->min_mtime > mtime)
 			sit_i->min_mtime = mtime;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 9e61ded..e7ff51d 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -18,6 +18,8 @@
 #define F2FS_MIN_SEGMENTS	9 /* SB + 2 (CP + SIT + NAT) + SSA + MAIN */
 #define F2FS_MIN_META_SEGMENTS	8 /* SB + 2 (CP + SIT + NAT) + SSA */
 
+#define INVALID_MTIME ULLONG_MAX /* no valid blocks in a segment/section */
+
 /* L: Logical segment # in volume, R: Relative segment # in main area */
 #define GET_L2R_SEGNO(free_i, segno)	((segno) - (free_i)->start_segno)
 #define GET_R2L_SEGNO(free_i, segno)	((segno) + (free_i)->start_segno)
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
