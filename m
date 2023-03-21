Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DDF6C263E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 01:13:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pePci-0003Bw-6F;
	Tue, 21 Mar 2023 00:13:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yonggil.song@samsung.com>) id 1pePcg-0003Bq-3d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 00:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:To:From:Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PaEWPPd/BY1we4un0qO+7j4N9iZdp9EdLrjCEp8lr8k=; b=KHMHnmCdCJHQPqlQuJAXT05rX2
 nXi/KhTg5t+Lx2qmEUdNKJgx3j524Rvd6xgMU4Ag3hIbqw8BNLM52Jw0zs4TqqsmVS4TcxOboDztg
 2+C3F2w0MbSBElmzkAwRelpp/DrDq27lWPYyEnRif8VgDsIGAE+IM3oOi2BObXfjLcI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:To:From
 :Sender:Reply-To:Subject:Mime-Version:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PaEWPPd/BY1we4un0qO+7j4N9iZdp9EdLrjCEp8lr8k=; b=l
 jWVZ0Sk3liLwP+BcKNPTUbiJBOoOurRE0usyBqy94UhonoqStBIO0DHJuk1okYRAPnOlstgjiHh5I
 9nfh5iYOU/NQRaQEwjCit/gt8nZbZ4n3GvUXFgFY+7FqRsZ/gh3szb9Kc0YfCRC5PD9L0DUhkY5me
 TKOOMOc3KBo/P0Sw=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pePcb-0004C9-8D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 00:13:06 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230321001252epoutp04c13d33086421cbd6eda6f719e037b435~ORtCihcU20718507185epoutp04_
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 00:12:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230321001252epoutp04c13d33086421cbd6eda6f719e037b435~ORtCihcU20718507185epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679357572;
 bh=PaEWPPd/BY1we4un0qO+7j4N9iZdp9EdLrjCEp8lr8k=;
 h=Subject:Reply-To:From:To:Date:References:From;
 b=E+EbrR2lLPb5QMjv+zWONLw/Y9DEqFS6YrJinHL8VQpH010u7cEE8znOnQX0C93qh
 Gz0szdXpDiBX6xi0VEfeKXe+M04AzGCWeO29pGNey1Q/g8m50OLL1udmnWchoaD1mr
 n26jGdFP+l+JRSd5BkxS8Qm1yA4AdXsg7/ArsBEc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20230321001252epcas2p2af72b0899698fac1eafa829ad5fd7e98~ORtCN_PP21912619126epcas2p2K;
 Tue, 21 Mar 2023 00:12:52 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.69]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4PgX9v56kMz4x9Pt; Tue, 21 Mar
 2023 00:12:51 +0000 (GMT)
X-AuditID: b6c32a46-743fa70000007a4b-df-6418f6832e4c
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 44.EE.31307.386F8146; Tue, 21 Mar 2023 09:12:51 +0900 (KST)
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
Message-ID: <20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
Date: Tue, 21 Mar 2023 09:12:51 +0900
X-CMS-MailID: 20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7bCmqW7zN4kUgze35CxOTz3LZPFk/Sxm
 i0uL3C0u75rDZjH1/BEmB1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGTNfPWUq+KdTcXZmE3MD
 4wLVLkZODgkBE4kj6+6zdzFycQgJ7GCUWDx7G1MXIwcHr4CgxN8dwiA1wgLeEn2nHrCB2EIC
 ShLXDvSyQMT1JTYvXsYOYrMJ6Er83bAczBYReMUocWa1KMR8XokZ7U9ZIGxpie3LtzJC2BoS
 P5b1MkPYohI3V79lh7HfH5sPVSMi0XrvLFSNoMSDn7uh4pISiw6dZ4Kw8yX+rrjOBmHXSGxt
 aIOK60tc69gItpdXwFfiU+tHsPksAqoS7w6cgZrjIrHzxF1WEJtZQF5i+9s5zCCvMwtoSqzf
 pQ9iSggoSxy5xQJRwSfRcfgvO8xXO+Y9gdqkJrF502ZWCFtG4sLjNqjpHhL7e+6zQkItUOLj
 xPlsExjlZyHCdhaSvbMQ9i5gZF7FKJZaUJybnlpsVGAEj87k/NxNjOA0p+W2g3HK2w96hxiZ
 OBgPMUpwMCuJ8LoxS6QI8aYkVlalFuXHF5XmpBYfYjQF+ngis5Rocj4w0eaVxBuaWBqYmJkZ
 mhuZGpgrifNK255MFhJITyxJzU5NLUgtgulj4uCUamBqbzOcO0FMNsrJZYX5NCVNN267HQrP
 3+/qM+eaaZibtO12rt+DpC83rrx1ZOuZyqDK6WLTe/hSTZbOdFGjuJnHctKffuyV+/j21NL9
 GVcWqLwQmMGqWSLBWHVqfpn83V6TFg0BkZdlbmtf9jYf/ZsXfUE90e/hyuNmGx8lXXU9k7u5
 9Nzd8Hs5Stx2VdKK2Qdubo7/8OySobF4UNCvTCn/h1rhP1+u7eoTj12jF6C9f87M+6dy1XZu
 +7afg8FnNc/Eqq6vu03Kz8+6kn30zUGFN/rdf7dcOW1zL31RXL6zSGUHu5tm8GrvY0oVNxzm
 5/v1mUzNeLTtGMeyZ2H5Zyp2C11J9E9xid337881relKLMUZiYZazEXFiQCS/11T/AMAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8
References: <CGME20230321001251epcms2p4c1fd48495643dbfca2cf82a433490bb8@epcms2p4>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.34 listed in list.dnswl.org]
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
X-Headers-End: 1pePcb-0004C9-8D
Subject: [f2fs-dev] [PATCH v2] f2fs: Fix system crash due to lack of free
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
 fs/f2fs/gc.c      | 10 ++++++++--
 fs/f2fs/gc.h      |  2 ++
 fs/f2fs/segment.h | 27 ++++++++++++++++++++++-----
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..dd563866d3c9 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1773,6 +1773,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 	};
 	unsigned int skipped_round = 0, round = 0;
+	unsigned int need_lower = 0, need_upper = 0;
 
 	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
 				gc_control->nr_free_secs,
@@ -1858,8 +1859,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		}
 	}
 
-	/* Write checkpoint to reclaim prefree segments */
-	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
+	ret = get_need_secs(sbi, &need_lower, &need_upper);
+
+	/*
+	 * Write checkpoint to reclaim prefree segments.
+	 * We need more three extra sections for writer's data/node/dentry.
+	 */
+	if (free_sections(sbi) <= need_upper + NR_GC_CHECKPOINT_SECS &&
 				prefree_segments(sbi)) {
 		ret = f2fs_write_checkpoint(sbi, &cpc);
 		if (ret)
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 19b956c2d697..e81d22bf3772 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -30,6 +30,8 @@
 /* Search max. number of dirty segments to select a victim segment */
 #define DEF_MAX_VICTIM_SEARCH 4096 /* covers 8GB */
 
+#define NR_GC_CHECKPOINT_SECS (3)	/* data/node/dentry sections */
+
 struct f2fs_gc_kthread {
 	struct task_struct *f2fs_gc_task;
 	wait_queue_head_t gc_wait_queue_head;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index be8f2d7d007b..52a6d1ed4f24 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -605,8 +605,12 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	return true;
 }
 
-static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
-					int freed, int needed)
+/*
+ * calculate needed sections for dirty node/dentry
+ * and call has_curseg_enough_space
+ */
+static inline bool get_need_secs(struct f2fs_sb_info *sbi,
+				  unsigned int *lower, unsigned int *upper)
 {
 	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
 					get_pages(sbi, F2FS_DIRTY_DENTS) +
@@ -616,20 +620,33 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
 	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
 	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
+
+	*lower = node_secs + dent_secs;
+	*upper = *lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
+
+	return !has_curseg_enough_space(sbi, node_blocks, dent_blocks);
+}
+
+static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
+					int freed, int needed)
+{
 	unsigned int free, need_lower, need_upper;
+	bool curseg_enough;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return false;
 
+	curseg_enough = get_need_secs(sbi, &need_lower, &need_upper);
+
 	free = free_sections(sbi) + freed;
-	need_lower = node_secs + dent_secs + reserved_sections(sbi) + needed;
-	need_upper = need_lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
+	need_lower += (needed + reserved_sections(sbi));
+	need_upper += (needed + reserved_sections(sbi));
 
 	if (free > need_upper)
 		return false;
 	else if (free <= need_lower)
 		return true;
-	return !has_curseg_enough_space(sbi, node_blocks, dent_blocks);
+	return curseg_enough;
 }
 
 static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
