Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD873E172
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 16:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDmny-0002np-RE;
	Mon, 26 Jun 2023 14:02:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qDmnx-0002ni-Ie
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 14:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JeVcYVsoMYez1LzzpVcDbwzvKMhM2G2WYRzW2b7f2dI=; b=SRA1NSQdNFsz75DaQBDxEZEoPK
 JP595jf/GhIxjAChLX9H2tNYSp/LJqmHsRcjlgPfusVjLNy54Dv2v+rlT8hH6lGb/FJqMWZTN+3CU
 BRY4V5V/zTdCbvjEeyW6oMczMPibCzIDCvacp0DKg3DGgS/uJCxQCpRUZuS8yHPnNwR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JeVcYVsoMYez1LzzpVcDbwzvKMhM2G2WYRzW2b7f2dI=; b=B
 NPEGIVupAz9r6jXDyFuGkafXDqd57c2l8DD6c2Bw3g65+Nnsib2+pnOJX3Rr6yCnKu3mA/pVRSaau
 krXbX06gs7xlt6uqraC+IpJYpytsyFT8OZKhO9Lqf2h8bnUnHMvWtwS6QLLUH5g9QDT1CnskRblQs
 jvWZMOSASPa77i8M=;
Received: from mail-tyzapc01on2101.outbound.protection.outlook.com
 ([40.107.117.101] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDmnr-00FLkk-Ga for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 14:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZU7XSZTnc8qYOsSHyOKaMHLxtElKZNP0K27uKVdNFU8/e73KwLDh3/4CqRUH4rYEuqYH5iSRyGJZ4AqG5capkpf+gWnbF7QeyYBXB2PFm0x3+Y5i+XQfftd0rOGAjY/JNg+P5VCuPJ19FGOeK/HOsAIq9055f9Mn07sC1jfnAX0wSe7zNparntcciAzsRY4SpNPOyIaqCiu0f8yTU1QCfcoHPMmgkeA3h01SXWSgDAHX0fyR80pRrzc+496l6+7T03o2SeXrl96D3ZN1RtkaWSHvwGDTfP33AGmzrG0mQBAJgreozbAdY88w2bMMra74r2/unDjcOixFt3b3kIPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeVcYVsoMYez1LzzpVcDbwzvKMhM2G2WYRzW2b7f2dI=;
 b=dZd0Y9dxudkI2QOL08UxeQB0ElstQXpKYLtesxtRaVno+TTnIl4xJF1cVIRxzZfcynrqxQzw0g+WH2GUcVn7lQ4zDFdEJuLswoLOCxI0/7XqVjVxiTBieqtthvNdP70ax1HSnZo3YXBf/ssGT9B2C3Tda2doHEVjUmGiAyHfOTy+S9Tl3onXwuxyydCC6V2sSeUvA+2jcdkWp7xmRHIe3FLBUoy8/uWnukUcUGJ9X6RgZH+CvwsIZXdM97iZj0hBAWdcMegKD5+Cb2Z1/fJe//T2PST4H9I9+XypTx7SiEmUFL9nD1NM5p6VChTHXOAu08wn+IYN0R2yFfmRc6g/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeVcYVsoMYez1LzzpVcDbwzvKMhM2G2WYRzW2b7f2dI=;
 b=jTWx7oGdXofoR9x1YP94Dj1xxKaDs7fvj620D4WCn6hmy5tYdR5/RX4l5mkCoplMRr6NSiDjbxQcHMgvCfkEXFBJA8Hn96IczonOK8HwOXK45rqJwmynh/mHah+L9cWhJbwbGNWZcU56ZmfuR+K3UYj4UWx9sBLg87+wNeUvOkwAECjFXyNUEaDF4B4tzE61UjzBpwNk+p4AVd2bOjtuYovD+LyIIWZrs3alcNR2MP7bdzKae3exv43Aw8PPacfZCxSsoKz5p3hU/FHlMezCQN9TjkKBjqWBY302Pski3yRs2jVTwiOjhItra95EF7awHQZj1nyKllZbmBFNNFotyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by JH0PR06MB6535.apcprd06.prod.outlook.com (2603:1096:990:34::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 14:02:41 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 14:02:40 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 26 Jun 2023 22:02:23 +0800
Message-Id: <20230626140223.61209-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|JH0PR06MB6535:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f4179d-814f-4b73-7978-08db764e012c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5y0HIkcLTMd2034Rg/G/pGhDI8pH3W03IFWZqB580KGMA9eZl8b982uGeQO3hIhleAJWaXyJoh5NZkc8Sqr+1XZDEU91wJKwVzLjwOHtch8q/0yy88JJw0NAbQ7xpHOx7W6xieLtkQwgVN+V2JQcklZjFm2bvgyuS1W+PCWmEhb1omBcr6iLcC9SWufPF5S6WFbzM+KDJL6AeG6S4B5EoOsW/DI23Worq513kbn+SfcOn0mbo7/NgyhxEUFu3spSHGJsjo57YdAKRmgqzFjnt4MsKIalJqSXrOQLnGvDWTJiPlolxRV9nTC2rWpEPjS1dNsoGK5fmikptnDQE0LVSptIQPl3f9y3G4JK5+0x2B8/0rI4vOqq7YKX1OKsjjsoNWIp8OQwMYwMt0ZnIlbxKwlesWJkSoeuMKAUBYuE7i5E8gVnwHQyM5M+8B3hzdZI8+68zUJt6aQrmX89jB4pp127thGnp+UJujgIzNFMkuW3JcsfrCF05N6g9T1DfyixtMqFByE3BpSpxV6Ik40bQG9D9TBqJQDwmzAHMLBTEkJlBdUcvawJm6JqiHXwQjEOLkRLFo4MWIPC4UwtSIAH0yN1bmgKE/EuQIhF5XllfHRgjnMTp6slT4vgr3LBLxB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(186003)(26005)(2906002)(5660300002)(52116002)(6666004)(8676002)(36756003)(316002)(6486002)(86362001)(478600001)(4326008)(2616005)(107886003)(38350700002)(1076003)(38100700002)(83380400001)(41300700001)(8936002)(66476007)(66556008)(66946007)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S9J6P+IlqGIDIRYroi52E3IoLE9ru6MSYPf6xvUzI9X42sBL20hERMyg0IhJ?=
 =?us-ascii?Q?+lfFn8PkAdICBaR6Gr585F/b1LQrvlA/9fFK7NO3etrgmNbzFmLkpDF09TOq?=
 =?us-ascii?Q?rxAWkYicUKHheD2Hu9hB8xjGvWVAUWp9ygnG9vr/Qpc30oBWTPl2AqJt9IxB?=
 =?us-ascii?Q?e+tiFwUoBUQf7t1NmDevAXhTqYSWaomx94Q2GVpeZFZKot8MBB5+8Gbom2NY?=
 =?us-ascii?Q?jXO61URa+6VRdaJ8Z5Rbx/B3WtvtoEMHovZNVjNDf80bZnfiLbW0bm7iAcCd?=
 =?us-ascii?Q?4FBzUlDY4kw9RWiQTCphkDN6stJOXNHspP4Lj0jIRWqTCaAWCBzc2X4sqegP?=
 =?us-ascii?Q?NmdHGaKqqzno7GRCkv1AOykY/pqTeQ9aokyKxlrJ8lCvokbAqYiEarwxJzzo?=
 =?us-ascii?Q?ILbLHSuUuL0+DhDc7e9doldBylKVkwqLDfaX1hX3z3nMJkHGUtktwoP6A5YJ?=
 =?us-ascii?Q?jNNHIW/SnOoNtpIFQzlYCd0n5JJV0WPIqUZgA3SXsyQ6D3ix+TiwF8MPxpmX?=
 =?us-ascii?Q?2kcruhOpccRVv3we6DdjK9+KaUtvKIHAHU6lqFB4uMeTPgSJa5WiwjkCMqFW?=
 =?us-ascii?Q?LrTAnBsIoJ61slgtmPbOsT6ZVJlG/WJCRvsDYmAhYZfM64VWxodhAoI1/uyS?=
 =?us-ascii?Q?NVKrsfbX14aAsnBbhnZXpgZoVSx19PGez0CFeS5rHKE2/uHWd8GCIeIWO9DF?=
 =?us-ascii?Q?QjRkRQIpYEdxK5cb6G1FrYoSsaO1PRclcQdEQBm1ml2jq6rCPk8YlSQ50r9/?=
 =?us-ascii?Q?5RX3sAIYDkEj7niJgQXi7c1ektCd5heBuQ89UiPRrWTW/QV77hM9e6ORwqHF?=
 =?us-ascii?Q?aJ3K9FT0XgcaR9/uxTFDVTVUXTUD9ICk7Ljiu2jh/FcZ9iV41Mo9x9Be0ZrK?=
 =?us-ascii?Q?iD71UOArSyTh960ez+7y5oJhRyth0RaMWrUM2I16Qaa5vZO5YsQoq7LsQIsH?=
 =?us-ascii?Q?3ZcQVXMsuqnY3ONe/8wzR7aml1mML2L7jhmIUCy2JV9wY5L0gsnh+4L8B2+X?=
 =?us-ascii?Q?mv8kLQ/kATfiU1UT3tSGXzZvZK6CdTeWmHLTXkLMWddIt1qxiTzhViy0Iay3?=
 =?us-ascii?Q?STZ+zBk6sOR1OjGuVBvA7kY1r5IkwoypEOsZ4+akpkFjn5Wpq7YaHi0UtI8f?=
 =?us-ascii?Q?CCO0D0zZOT1NvumadgZXXOJlXv1fBQbUaUrZahuqyxN0fWVblrr2rhQ1VRot?=
 =?us-ascii?Q?M9+SgBP415iD8Ud6YjuegQ4CH31LWRVCFbf3sa8K/alJipLpVPEI4x+XePtc?=
 =?us-ascii?Q?timbuSXDGlUw0PdF4A9y/pHxd9bSQhOHdfX0EsnG72pgYoKLRzPtRfAAF252?=
 =?us-ascii?Q?OResEfiQ1kDgzcGJW0hF7As+CHFE4GX2hay6CsEVIpJGfP84utwpJuKqjsUE?=
 =?us-ascii?Q?veg+IcFAYq9nboGFEgvG0f49VDnQ3VQb2XfRMxoxaXktXTBsgKxgXQMwqKU1?=
 =?us-ascii?Q?sp58J7LzW7jBaL/71cnfD15aHYwFfT2LBVuVrIWYCrXChb9Y0UA8E9qFWRjH?=
 =?us-ascii?Q?sQPcLI8XIV3uGEAiY8Zm3UpsjnHkzRT6x9Lz4G6DNTQLrgGNFmBeAhHgtfvG?=
 =?us-ascii?Q?JjZKIIkPQa2WLUqeHnq8MRQIGgfMRM4liOgy7kR/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f4179d-814f-4b73-7978-08db764e012c
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 14:02:40.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qT5S1YIykLeFgwCwMmdKvBdlvTcm72chF/uwOw7UTRh9re/o2S44lAz4kwOfFIHIIQJhbv2QIOdaWwLeJTkQ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6535
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The fsync node chain can break when a node block is used,
 freed and reused in the chain. To avoid this, all blocks in the chain should
 be recorded and not reused before the next checkpoint. However, t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.101 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.101 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qDmnr-00FLkk-Ga
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid breaking fsync node chain
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The fsync node chain can break when a node block is used, freed and reused
in the chain. To avoid this, all blocks in the chain should be recorded and
not reused before the next checkpoint. However, this approach may require
too many resources. Instead, this patch records all related segments in a
bitmap as a compromise solution.
Since LFS allocation mode and GC operations do not reuse or modify obsolete
block before the next checkpoint, we just need to ensure the segments in
the bitmap aren't reallocated in SSR allocation mode.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/checkpoint.c | 11 +++++++++++
 fs/f2fs/gc.c         | 14 ++++++++++++++
 fs/f2fs/segment.c    | 10 ++++++++++
 fs/f2fs/segment.h    |  3 +++
 4 files changed, 38 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8fd3b7f9fb88..940f7a5568c0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1447,6 +1447,15 @@ u64 f2fs_get_sectors_written(struct f2fs_sb_info *sbi)
 	return get_sectors_written(sbi->sb->s_bdev);
 }
 
+void f2fs_reset_node_chain_segmap(struct f2fs_sb_info *sbi)
+{
+	struct sit_info *sit_i = SIT_I(sbi);
+
+	spin_lock(&sit_i->segmap_lock);
+	memset(sit_i->node_chain_segmap, 0, f2fs_bitmap_size(MAIN_SEGS(sbi)));
+	spin_unlock(&sit_i->segmap_lock);
+}
+
 static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
@@ -1594,6 +1603,8 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	f2fs_reset_fsync_node_info(sbi);
 
+	f2fs_reset_node_chain_segmap(sbi);
+
 	clear_sbi_flag(sbi, SBI_IS_DIRTY);
 	clear_sbi_flag(sbi, SBI_NEED_CP);
 	clear_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 01effd3fcb6c..e899c775b7fa 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -733,6 +733,15 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
 	return -EAGAIN;
 }
 
+static bool f2fs_seg_in_node_chain(struct sit_info *sm, unsigned int segno)
+{
+	bool ret;
+
+	spin_lock(&sm->segmap_lock);
+	ret = test_bit(segno, sm->node_chain_segmap);
+	spin_unlock(&sm->segmap_lock);
+	return ret;
+}
 /*
  * This function is called from two paths.
  * One is garbage collection and the other is SSR segment selection.
@@ -871,6 +880,11 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			}
 		}
 
+		/*  if segno is used by node chain, find another one. */
+		if ((p.alloc_mode == SSR || p.alloc_mode == AT_SSR)
+				&& f2fs_seg_in_node_chain(sm, segno))
+			goto next;
+
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0457d620011f..0f37efb88ad3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3475,6 +3475,10 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	up_write(&sit_i->sentry_lock);
 
 	if (page && IS_NODESEG(type)) {
+		spin_lock(&sit_i->segmap_lock);
+		set_bit(GET_SEGNO(sbi, *new_blkaddr), sit_i->node_chain_segmap);
+		spin_unlock(&sit_i->segmap_lock);
+
 		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
 
 		f2fs_inode_chksum_set(sbi, page);
@@ -4442,6 +4446,12 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 #endif
 
+	sit_i->node_chain_segmap = f2fs_kvzalloc(sbi,
+					main_bitmap_size, GFP_KERNEL);
+	if (!sit_i->node_chain_segmap)
+		return -ENOMEM;
+
+	spin_lock_init(&sit_i->segmap_lock);
 	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
 	sit_i->sit_blocks = sit_segs << sbi->log_blocks_per_seg;
 	sit_i->written_valid_blocks = 0;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2ca8fb5d0dc4..e0de075f959b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -264,6 +264,9 @@ struct sit_info {
 	unsigned long long dirty_max_mtime;	/* rerange candidates in GC_AT */
 
 	unsigned int last_victim[MAX_GC_POLICY]; /* last victim segment # */
+
+	spinlock_t segmap_lock;			/* node chain segmap lock */
+	unsigned long *node_chain_segmap;	/* segment bitmap used by node chain */
 };
 
 struct free_segmap_info {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
