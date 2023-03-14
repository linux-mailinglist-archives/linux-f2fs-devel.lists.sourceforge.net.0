Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E06B8C2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Mar 2023 08:47:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pbzNx-0005hq-1G;
	Tue, 14 Mar 2023 07:47:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pbzNu-0005hj-6u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Mar 2023 07:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rh6UJxWisQFryDemfLydE6a77p2ZTG2G9wZ47GaDRRo=; b=ADc5sAx4OGcE1ByF5wK5G9oCnu
 9S3PSNLQuprlapYn4V4dQ1JbpniDT4LkEEAWSHupEMYzjjDUmUXd82hNYrAR9lJkjoEPxBwYFzLMs
 Ki3ZVxPBJx7/3hhuMLO8cLad61fyKsuTTDQWx0GQEKcVYb1ZjiLcFX3W5lS8PFjbepu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rh6UJxWisQFryDemfLydE6a77p2ZTG2G9wZ47GaDRRo=; b=g
 LGWToBoHkhSb+3B/H3WlutIW3vY+Pu4QJpiK88kwi9jqZ78mlk0ucQ1FVALsT7oofDYONF62tZ6p5
 sHxXJEtVslpC+AT4SvHN6Z7EktqTt+RAeqGu2lkXQcW/45My20URQTRs/Izk6jj3arfiLCx87BzIN
 i4bnu1VPytgTwbbw=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pbzNr-0005P5-1Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Mar 2023 07:47:50 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230314074735epoutp03cdf7af67ffb596aea23b3bda19e0dcb8~MOZDYnIM_3105031050epoutp03q
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Mar 2023 07:47:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230314074735epoutp03cdf7af67ffb596aea23b3bda19e0dcb8~MOZDYnIM_3105031050epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678780055;
 bh=Rh6UJxWisQFryDemfLydE6a77p2ZTG2G9wZ47GaDRRo=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=MfJy2X/e2StM5wrUro9aHC4UYj3EaQsh8XwtNffT5a5CiuYN+3DUV2IiWum2QwM7r
 VytnjHW1CyIrU/aSSouvORJ9TRvIEucva1N7kIviQ3Iu8sY8sy/UlzgynURiRJPgB8
 U5BeZSx0Xhhh7FwAb6+DooYltBDsM1/OpFPv+oLo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230314074735epcas2p1b4f3d417fa3df9152499c5a8a009c0d1~MOZDHou100842908429epcas2p1W;
 Tue, 14 Mar 2023 07:47:35 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.91]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4PbQbp1T2Cz4x9Q2; Tue, 14 Mar
 2023 07:47:34 +0000 (GMT)
X-AuditID: b6c32a48-45bfc70000021624-ba-64102695b236
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 F3.5D.05668.59620146; Tue, 14 Mar 2023 16:47:33 +0900 (KST)
Mime-Version: 1.0
From: Yonggil Song <yonggil.song@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
Date: Tue, 14 Mar 2023 16:47:33 +0900
X-CMS-MailID: 20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7bCmme5UNYEUg1n3DS1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjH1/BEmB1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGY9uz2Et+KpR8fPdPvYG
 xg6lLkZODgkBE4nj8/8zdjFycQgJ7GCUmHj+I3sXIwcHr4CgxN8dwiA1wgLeEj1bl7OD2EIC
 ShLXDvSyQMT1JTYvXgYWZxPQlfi7AaJGROAVo8SZ1aIQ83klZrQ/ZYGwpSW2L9/KCGFrSPxY
 1ssMYYtK3Fz9lh3Gfn9sPlSNiETrvbNQNYISD37uhopLSiw6dJ4Jws6X+LviOhuEXSOxtaEN
 Kq4vca1jI9heXgFfiZa7c1lBbBYBVYnbnVeg5rhInPkyDSzOLCAvsf3tHGaQ15kFNCXW79IH
 MSUElCWO3GKBqOCT6Dj8lx3mqx3znkBtUpPYvGkzK4QtI3HhcRvUdA+JXzNPskJCLVDi+NkG
 1gmM8rMQYTsLyd5ZCHsXMDKvYhRLLSjOTU8tNiowgUdncn7uJkZwmtPy2ME4++0HvUOMTByM
 hxglOJiVRHjDWQRShHhTEiurUovy44tKc1KLDzGaAn08kVlKNDkfmGjzSuINTSwNTMzMDM2N
 TA3MlcR5pW1PJgsJpCeWpGanphakFsH0MXFwSjUwJd+eduqbypfCzk5lq+K7N7l9n6qf/8d8
 QOyJ10Grhc19bc7Tytkvu51w0HxezJXdcOJ1nvcVKwd5ziePP61y+xTqfXZaTcC7BtUW1gOi
 rvPn+9rp72nik79zcv/NptJZ5fJzD6zs5Fv19x/XwQT7rQvVblQeaJxRt/uyH1+avtTPCcFJ
 /G/XPGVWnjptlevvp4sm1e/2NF+5n+8A26IqvwMzmD1nxvftTqnwZxP+2tX9M+lRh6sCt+mK
 qkNLYz8yfP27bOr/I6qr715+F7D0rd/EeX9elyRe3VbdWujcMP/F4nuHVmydaHlnV4NAq5tL
 oKTbyxVP3p1a7s6w9fXOHF2Bi3syHk6sWejV9uY/m4sSS3FGoqEWc1FxIgBA6duw/AMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb
References: <CGME20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs tries to checkpoint during foreground gc in LFS
 mode, system crash occurs due to lack of free space if the amount of dirty
 node and dentry pages generated by data migration exceeds free spac [...]
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.33 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pbzNr-0005P5-1Q
Subject: [f2fs-dev] [PATCH v1] f2fs: Fix system crash due to lack of free
 space in LFS
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
Reply-To: yonggil.song@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs tries to checkpoint during foreground gc in LFS mode, system
crash occurs due to lack of free space if the amount of dirty node and
dentry pages generated by data migration exceeds free space.
The reproduction sequence is as follows.

 - 20GiB capacity block device (null_blk)
 - format and mount with LFS mode
 - create a file and write 20,000MiB
 - 4k random write on full range of the file

 RIP: 0010:new_curseg+0x48a/0x510 [f2fs]
 Code: 55 e7 f5 89 c0 48 0f af c3 48 8b 5d c0 48 c1 e8 20 83 c0 01 89 43 6c 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc <0f> 0b f0 41 80 4f 48 04 45 85 f6 0f 84 ba fd ff ff e9 ef fe ff ff
 RSP: 0018:ffff977bc397b218 EFLAGS: 00010246
 RAX: 00000000000027b9 RBX: 0000000000000000 RCX: 00000000000027c0
 RDX: 0000000000000000 RSI: 00000000000027b9 RDI: ffff8c25ab4e74f8
 RBP: ffff977bc397b268 R08: 00000000000027b9 R09: ffff8c29e4a34b40
 R10: 0000000000000001 R11: ffff977bc397b0d8 R12: 0000000000000000
 R13: ffff8c25b4dd81a0 R14: 0000000000000000 R15: ffff8c2f667f9000
 FS: 0000000000000000(0000) GS:ffff8c344ec80000(0000) knlGS:0000000000000000
 CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 000000c00055d000 CR3: 0000000e30810003 CR4: 00000000003706e0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 Call Trace:
 <TASK>
 allocate_segment_by_default+0x9c/0x110 [f2fs]
 f2fs_allocate_data_block+0x243/0xa30 [f2fs]
 ? __mod_lruvec_page_state+0xa0/0x150
 do_write_page+0x80/0x160 [f2fs]
 f2fs_do_write_node_page+0x32/0x50 [f2fs]
 __write_node_page+0x339/0x730 [f2fs]
 f2fs_sync_node_pages+0x5a6/0x780 [f2fs]
 block_operations+0x257/0x340 [f2fs]
 f2fs_write_checkpoint+0x102/0x1050 [f2fs]
 f2fs_gc+0x27c/0x630 [f2fs]
 ? folio_mark_dirty+0x36/0x70
 f2fs_balance_fs+0x16f/0x180 [f2fs]

This patch adds checking whether free sections are enough before checkpoint
during gc.

Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
---
 fs/f2fs/gc.c      |  7 ++++++-
 fs/f2fs/segment.h | 26 +++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..b22f49a6f128 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1773,6 +1773,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 	};
 	unsigned int skipped_round = 0, round = 0;
+	unsigned int nr_needed_secs = 0, node_blocks = 0, dent_blocks = 0;
 
 	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
 				gc_control->nr_free_secs,
@@ -1858,8 +1859,12 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		}
 	}
 
+	/* need more three extra sections for writer's data/node/dentry */
+	nr_needed_secs = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + 3;
+	nr_needed_secs += ((node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0));
+
 	/* Write checkpoint to reclaim prefree segments */
-	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
+	if (free_sections(sbi) <= nr_needed_secs &&
 				prefree_segments(sbi)) {
 		ret = f2fs_write_checkpoint(sbi, &cpc);
 		if (ret)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index be8f2d7d007b..ac11c47bfe37 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -605,8 +605,11 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	return true;
 }
 
-static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
-					int freed, int needed)
+/*
+ * calculate the minimum number of sections (needed) for dirty node/dentry
+ */
+static inline unsigned int get_min_need_secs(struct f2fs_sb_info *sbi,
+		unsigned int *node_blocks, unsigned int *dent_blocks)
 {
 	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
 					get_pages(sbi, F2FS_DIRTY_DENTS) +
@@ -614,15 +617,28 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
 	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
 	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
-	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
-	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
+
+	f2fs_bug_on(sbi, (!node_blocks || !dent_blocks));
+
+	*node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
+	*dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
+
+	return (node_secs + dent_secs);
+}
+
+static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
+					int freed, int needed)
+{
+	unsigned int node_blocks = 0;
+	unsigned int dent_blocks = 0;
 	unsigned int free, need_lower, need_upper;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return false;
 
 	free = free_sections(sbi) + freed;
-	need_lower = node_secs + dent_secs + reserved_sections(sbi) + needed;
+	need_lower = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + needed +
+				reserved_sections(sbi);
 	need_upper = need_lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
 
 	if (free > need_upper)
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
