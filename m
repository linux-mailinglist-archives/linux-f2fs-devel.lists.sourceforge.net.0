Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOofOVx7/GkwQgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:45:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9034E7AAB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQafc1zTj5yNzcGbQ12G4cZOk+LEfigQj1TnugZtcIo=; b=HonC2IGreX9q6aeuTD/sFQfPqS
	TErCrCtrkMKyDeri0+ktXL5NqwPAOvGe93QkTi0XDpE/V9iLwcCFSDlD66HzI1aKLkal3O8Zy+C/y
	OsxRFoEhssGI6C3OJkUOUpkkzKq5wiSKl+FAkOwkLpE2ND8kKlItptqtDdwHeRbugXjQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKxAY-0001IG-Mz;
	Thu, 07 May 2026 11:45:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wKxAX-0001I7-2G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=32HORghXN4ragaUWNX27h/7UlLuRpVTadxzKURWw9lw=; b=IFgojiBjNfC6oQN7iKPdLfpe+4
 th5JmxvrDZkWBokVR1w/LSz13sD4kM+xbzNhr69CUTi0AOo6s0WM+vQnTVYP+qYfNbVzYvw5c1Cm4
 fXNywmXgtPTVJlVxI3hl6jkx6rfs9+zT4xk7rFVgQwGGNHL4l2cFwpGBqdd5invxo8+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=32HORghXN4ragaUWNX27h/7UlLuRpVTadxzKURWw9lw=; b=I+mHWvmMTtTqtQpZUhTSP9EcQd
 o2rBZS5CTPXdxyS3/ZiThoWv/LK1EDKd1Ff2C7h84xDHL6YlVj8qhkObZPp+QS2DD38upsulK6W4O
 zKmksbmmDK4gzi7sXciJG/iPBTUTpuzdgkr8M9LsneRMg+AzDuyrNQtNUees2kSfXg18=;
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKxAT-00038V-TI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1778154326; bh=32HORghXN4ragaUWNX27h/7UlLuRpVTadxzKURWw9lw=;
 h=From:Subject:Date:Message-ID;
 b=nBWjuNUi6LrYza9GszPI60jY4Gz5T0smaa68RJNmBLiaE3gwBmCu7gMY61D2Rmw2c
 Nfgb+lK/UbduwcBc/9khcKsS7LYcL12Dy/jRUvYeWXNSR47nyIkmIZ3KZ08iBFCYe0
 bIp1hfhwKDTbKItnQvLMHBvE2TkLlKK1msg/02eo=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69FC7B44000045CE; Thu, 7 May 2026 19:45:17 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9667764456696
X-SMAIL-UIID: 75E491C81E0848A08CC0FA9DD3976B13-20260507-194517-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  7 May 2026 19:44:34 +0800
Message-ID: <20260507114434.1353908-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507114434.1353908-2-monty_pavel@sina.com>
References: <20260507114434.1353908-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Add inline extent format recognition and
 handling to fsck.f2fs. The inline extent format repurposes the inode's direct
 block address area (i_addr[]) to store compact extent entries, identified
 by dual magic numbers (0xF2F5EF00, 0xFFFFFFFD). This patch enables fsck [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wKxAT-00038V-TI
Subject: [f2fs-dev] [RFC PATCH 1/3] fsck: add inline extent format support
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 0B9034E7AAB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,xiaomi.com:email,mi.com:url]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Add inline extent format recognition and handling to fsck.f2fs.

The inline extent format repurposes the inode's direct block address
area (i_addr[]) to store compact extent entries, identified by dual
magic numbers (0xF2F5EF00, 0xFFFFFFFD). This patch enables fsck to
correctly parse, validate, and repair inodes using this format.

Changes:
- iextent.h/iextent.c: core extent operations including binary search
  lookup, insert with merge/split, truncate, and format conversion
  between inline extent and direct block formats
- node.h: update datablock_addr() to query inline extent first
- node.c: update set_data_blkaddr() to maintain inline extent format
- mount.c: handle inline extent in block address update path
- fsck.c: add sanity check for inline extent integrity
- dump.c: use datablock_addr() for consistent block address access

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fsck/dump.c    |   4 +-
 fsck/fsck.c    |  38 ++-
 fsck/iextent.c | 738 +++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/iextent.h | 100 +++++++
 fsck/mount.c   |  59 +++-
 fsck/node.c    |  30 ++
 fsck/node.h    |  18 ++
 7 files changed, 972 insertions(+), 15 deletions(-)
 create mode 100644 fsck/iextent.c
 create mode 100644 fsck/iextent.h

diff --git a/fsck/dump.c b/fsck/dump.c
index f5c95de2..f45ce353 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -546,8 +546,8 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	/* check data blocks in inode */
 	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
-		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
-			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), type);
+		dump_data_blk(sbi, ofs * F2FS_BLKSIZE,
+				datablock_addr(node_blk, i), type);
 
 	/* check node blocks in inode */
 	for (i = 0; i < 5; i++) {
diff --git a/fsck/fsck.c b/fsck/fsck.c
index db44f9d6..92edbaf9 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -274,7 +274,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (ofs + ofs_in_node >= DEF_ADDRS_PER_INODE)
 			goto out;
-		target_blk_addr = node_blk->i.i_addr[ofs + ofs_in_node];
+		target_blk_addr = datablock_addr(node_blk, ofs_in_node);
 	} else {
 		if (ofs_in_node >= DEF_ADDRS_PER_BLOCK)
 			goto out;
@@ -562,6 +562,14 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 				p10);
 		}
 	}
+
+#ifdef HAVE_INLINE_EXTENT
+	if (IS_INODE(node_blk) &&
+			f2fs_iext_support_inline_extent(node_blk) &&
+			f2fs_iext_sanity_check(node_blk))
+		return -EINVAL;
+#endif
+
 	return 0;
 }
 
@@ -1211,7 +1219,7 @@ check_next:
 	}
 
 	for (idx = 0; idx < addrs; idx++, child.pgofs++) {
-		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs + idx]);
+		block_t blkaddr = datablock_addr(node_blk, idx);
 
 		/* check extent info */
 		check_extent_info(&child, blkaddr, 0);
@@ -1247,14 +1255,20 @@ check_next:
 				&child, (i_blocks == *blk_cnt),
 				ftype, nid, idx, ni->version,
 				node_blk);
-		if (blkaddr != le32_to_cpu(node_blk->i.i_addr[ofs + idx]))
+		if (blkaddr != datablock_addr(node_blk, idx))
 			need_fix = 1;
 		if (!ret) {
 			*blk_cnt = *blk_cnt + 1;
 			if (cur_qtype != -1 && blkaddr != NEW_ADDR)
 				qf_last_blkofs[cur_qtype] = child.pgofs;
 		} else if (c.fix_on) {
-			node_blk->i.i_addr[ofs + idx] = NULL_ADDR;
+			struct dnode_of_data dn;
+
+			dn.inode_blk = node_blk;
+			dn.node_blk = node_blk;
+			dn.data_blkaddr = NULL_ADDR;
+			dn.ofs_in_node = idx;
+			set_data_blkaddr(&dn);
 			need_fix = 1;
 			FIX_MSG("[0x%x] i_addr[%d] = NULL_ADDR", nid, ofs + idx);
 		}
@@ -1498,6 +1512,17 @@ skip_dot_fix:
 	}
 
 	if (need_fix && f2fs_dev_is_writable()) {
+#ifdef HAVE_INLINE_EXTENT
+		/*
+		 * Truncate inline extent area to direct blocks boundary.
+		 * This removes any extent entries beyond ADDRS_PER_INODE,
+		 * ensuring inline extent doesn't reference indirect node blocks.
+		 */
+		ASSERT(IS_INODE(node_blk));
+		if (f2fs_iext_support_inline_extent(node_blk))
+			f2fs_iext_truncate_from_blkaddr(node_blk,
+					ADDRS_PER_INODE(&node_blk->i));
+#endif
 		ret = update_block(sbi, node_blk, &ni->blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
@@ -3273,7 +3298,7 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 	struct f2fs_node *node;
 	struct node_info ni;
 	nid_t nid;
-	int ofs, i, err;
+	int i, err;
 
 	node = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node);
@@ -3302,9 +3327,8 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 
 	/* clear data counters */
 	if (!(node->i.i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))) {
-		ofs = get_extra_isize(node);
 		for (i = 0; i < ADDRS_PER_INODE(&node->i); i++) {
-			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
+			block_t addr = datablock_addr(node, i);
 			if (!addr)
 				continue;
 			release_block_cnt(sbi, dealloc);
diff --git a/fsck/iextent.c b/fsck/iextent.c
new file mode 100644
index 00000000..b7c63137
--- /dev/null
+++ b/fsck/iextent.c
@@ -0,0 +1,738 @@
+/**
+ * iextent.c
+ *
+ * Copyright (c) 2026 Xiaomi Technology Co., Ltd.
+ *             http://www.mi.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "fsck.h"
+#include "node.h"
+#include "iextent.h"
+
+#ifdef HAVE_INLINE_EXTENT
+
+/* Global iext_info variable */
+struct f2fs_iext_info g_iext_info = {0};
+
+int f2fs_iext_sanity_check(struct f2fs_node *node_blk)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	struct f2fs_extent *ix;
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int k;
+
+	if (!S_ISREG(le16_to_cpu(node_blk->i.i_mode)))
+		return -EINVAL;
+
+	if (inline_extents == 0)
+		return 0;
+
+	ix = EXT_FIRST_INDEX(eh);
+	for (k = 0; k < EXT_ENTRY_COUNT(eh); k++, ix++) {
+		if (F2FS_EXT_LEN(ix) == 0)
+			return -EINVAL;
+		if (F2FS_EXT_LOGICAL_START(ix) > UINT_MAX - F2FS_EXT_LEN(ix))
+			return -EINVAL;
+		if (F2FS_EXT_PHYSICAL_START(ix) != NEW_ADDR &&
+			F2FS_EXT_PHYSICAL_START(ix) > UINT_MAX - F2FS_EXT_LEN(ix))
+			return -EINVAL;
+		if (k == 0)
+			continue;
+		if (F2FS_EXT_LOGICAL_START(ix) <= F2FS_EXT_LOGICAL_END(&ix[-1]))
+			return -EINVAL;
+	}
+	return 0;
+}
+
+/*
+ * __iext_binsearch_idx:
+ * binary search for the closest index of the given block
+ * the header must be checked before calling this
+ */
+static int __iext_binsearch_idx(struct f2fs_node *node_blk, block_t block)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	struct f2fs_extent *r, *l, *m;
+	int index = 0;
+
+	if (EXT_ENTRY_COUNT(eh) == 0)
+		return -1;
+
+	l = EXT_FIRST_INDEX(eh) + 1;
+	r = EXT_LAST_INDEX(eh);
+
+	while (l <= r) {
+		m = l + (r - l) / 2;
+
+		if (block < le32_to_cpu(m->fofs))
+			r = m - 1;
+		else
+			l = m + 1;
+	}
+	if (c.dbg_lv > 2) {
+		struct f2fs_extent *chix, *ix;
+		int k;
+
+		chix = ix = EXT_FIRST_INDEX(eh);
+		for (k = 0; k < EXT_ENTRY_COUNT(eh); k++, ix++) {
+			if (k != 0 && le32_to_cpu(ix->fofs) <=
+			    le32_to_cpu(ix[-1].fofs)) {
+				DBG(2, "k=%d, ix=0x%p, first=0x%p",
+				       k, ix, EXT_FIRST_INDEX(eh));
+				DBG(2, "%u <= %u",
+				       le32_to_cpu(ix->fofs),
+				       le32_to_cpu(ix[-1].fofs));
+			}
+			ASSERT(!(k && le32_to_cpu(ix->fofs)
+					   <= le32_to_cpu(ix[-1].fofs)));
+			if (block < le32_to_cpu(ix->fofs))
+				break;
+			chix = ix;
+		}
+		ASSERT(chix == l - 1);
+	}
+
+	index = l - EXT_FIRST_INDEX(eh) - 1;
+
+	return index;
+}
+
+static void __ext_add_one_entry(struct f2fs_iext_header *eh, int index, struct f2fs_extent *ext)
+{
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+
+	ASSERT(index >= 0 && index <= inline_extents);
+
+	memmove(&eh->exts[index + 1], &eh->exts[index],
+			(inline_extents - index) * sizeof(struct f2fs_extent));
+	memcpy(&eh->exts[index], ext, sizeof(struct f2fs_extent));
+
+	eh->cnt = cpu_to_le32(inline_extents + 1);
+}
+
+static void __ext_del_one_entry(struct f2fs_iext_header *eh, int index)
+{
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+
+	memmove(&eh->exts[index], &eh->exts[index + 1],
+			(inline_extents - index - 1) * sizeof(struct f2fs_extent));
+
+	eh->cnt = cpu_to_le32(inline_extents - 1);
+}
+
+enum {
+	F2FS_EXT_HIT_LEFT = -1,
+	F2FS_EXT_HIT_MID = 0,
+	F2FS_EXT_HIT_RIGHT = 1,
+};
+
+static int __is_iextent_hit(struct f2fs_extent *ext, block_t fofs)
+{
+	block_t start = F2FS_EXT_LOGICAL_START(ext), end = F2FS_EXT_LOGICAL_END(ext);
+
+	if (fofs < start)
+		return F2FS_EXT_HIT_LEFT;
+	if (fofs > end)
+		return F2FS_EXT_HIT_RIGHT;
+	return F2FS_EXT_HIT_MID;
+}
+
+static bool __is_extent_mergeable(struct f2fs_extent *left, struct f2fs_extent *right)
+{
+	block_t left_blk_start = F2FS_EXT_PHYSICAL_START(left);
+	block_t right_blk_start = F2FS_EXT_PHYSICAL_START(right);
+
+	if (F2FS_EXT_LOGICAL_END(left) + 1 != F2FS_EXT_LOGICAL_START(right))
+		return false;
+
+	/* NEW_ADDR and NULL_ADDR always can merge. */
+	if (left_blk_start == right_blk_start) {
+		if (left_blk_start == NULL_ADDR || left_blk_start == NEW_ADDR)
+			return true;
+		return false;
+	}
+	if (left_blk_start == NULL_ADDR || left_blk_start == NEW_ADDR
+			|| right_blk_start == NULL_ADDR || right_blk_start == NEW_ADDR)
+		return false;
+	if (F2FS_EXT_PHYSICAL_END(left) + 1 != F2FS_EXT_PHYSICAL_START(right))
+		return false;
+
+	return true;
+}
+
+/*
+ * 1. all single extent insert operation must check mergeable at first even for split case.
+ * 2. all -ENOSPC error will delete the old mapping except for case which will
+ * split extent into 2 separate extent and insert new one.
+ * 3. index point to 0th extent or extent which first fofs is bigger than @fofs.
+ * 4. delete old mapping before insert new one even for extent which len is 1.
+ * 5. when enable NULL_ADDR checking, insert NULL_ADDR is the same as delete operation.
+ */
+
+static int __iext_insert_idx(struct f2fs_node *node_blk,
+				block_t fofs, block_t blkaddr)
+{
+	int max_inline_extents = MAX_INLINE_EXTENTS(&node_blk->i);
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int index = 0, left = -1, right = -1, ret = 0, hit;
+	int merge_bits = 0, max_split_cnt = 0;
+	block_t fofs_start, fofs_end, blk_start;
+	unsigned int len;
+	struct f2fs_extent *last_ext;
+	struct f2fs_extent split;
+	struct f2fs_extent ext = {
+		.fofs = cpu_to_le32(fofs),
+		.blk_addr = cpu_to_le32(blkaddr),
+		.len = cpu_to_le32(1),
+	};
+
+	ASSERT(EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(&node_blk->i));
+
+	/* 1. insert empty inline extent area. */
+	if (inline_extents == 0) {
+		ASSERT(max_inline_extents > 0);
+		INLINE_EXT_STAT_INC(&g_iext_info, overwrite_ext_count);
+		goto add_entry;
+	}
+
+	/* 2. try merge with last extent. */
+	last_ext = EXT_LAST_INDEX(eh);
+	if (__is_extent_mergeable(last_ext, &ext)) {
+		last_ext->len = cpu_to_le32(F2FS_EXT_LEN(last_ext) + 1);
+		INLINE_EXT_STAT_INC(&g_iext_info, fast_right_merge_count);
+		goto out;
+	}
+
+	if (max_inline_extents == inline_extents && fofs > F2FS_EXT_LOGICAL_END(last_ext)) {
+		INLINE_EXT_STAT_INC(&g_iext_info, drop_insert_new_ext_cnt);
+		ret = -E2BIG;
+		goto out;
+	}
+	/* 3. search extent. */
+	index = __iext_binsearch_idx(node_blk, fofs);
+
+	fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+	fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+	blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+	len = F2FS_EXT_LEN(&eh->exts[index]);
+
+	/* 4. check extent hit. */
+	hit = __is_iextent_hit(&eh->exts[index], fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		/* only if fofs < eh->exts[0].fofs. */
+		ASSERT(index == 0);
+		right = index;
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		left = index;
+		if (left + 1 < inline_extents)
+			right = left + 1;
+		break;
+	case F2FS_EXT_HIT_MID:
+		max_split_cnt = 0;
+
+		/* 5. overwrite extent. */
+		if (len == 1) {
+			__ext_del_one_entry(eh, index);
+			inline_extents = EXT_ENTRY_COUNT(eh);
+			/* just overwrite for single extent, other cases may cause merge. */
+			if (inline_extents == 0) {
+				/* blkaddr can be NULL_ADDR, so need to check before update. */
+				INLINE_EXT_STAT_INC(&g_iext_info, overwrite_ext_count);
+				goto add_entry;
+			}
+			if (index < inline_extents)
+				right = index;
+			if (index - 1 >= 0)
+				index = left = index - 1;
+			/* index may not change but extent content has already changed. */
+			fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+			fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+			blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+			len = F2FS_EXT_LEN(&eh->exts[index]);
+			break;
+		}
+		/* 6. split extent. */
+		if ((blk_start == NEW_ADDR || blk_start == NULL_ADDR) && blk_start == blkaddr)
+			goto out;
+		if (blk_start != NEW_ADDR && blk_start != NULL_ADDR &&
+				blk_start + fofs - fofs_start == blkaddr)
+			goto out;
+		if (fofs_start == fofs || fofs_end == fofs)
+			max_split_cnt = 1;
+		else
+			max_split_cnt = 2;
+		switch (max_split_cnt) {
+		case 1:
+			/*
+			 * Corner cases:
+			 * 1. actual split count maybe 0 or 1, because @ext might merge with another
+			 * extent.
+			 * 2. truncate fofs at first even though ext can not merge and no space,
+			 * because ext will add to inline extent area or may out of range of inline
+			 * extent area.
+			 */
+			eh->exts[index].len = cpu_to_le32(F2FS_EXT_LEN(&eh->exts[index]) - 1);
+			eh->exts[index].fofs = cpu_to_le32(fofs == fofs_start ?
+							fofs_start + 1 : fofs_start);
+			if (blk_start != NEW_ADDR && blk_start != NULL_ADDR)
+				eh->exts[index].blk_addr = cpu_to_le32(fofs == fofs_start ?
+							blk_start + 1 : blk_start);
+			/* add ext at index or 'index + 1' */
+			if (fofs == fofs_end) {
+				INLINE_EXT_STAT_INC(&g_iext_info, split_right_count);
+				/* may be can merge with the right of index */
+				if (index + 1 < inline_extents)
+					right = index + 1;
+				else {
+					index++; /* insert to next position. */
+					goto add_entry;
+				}
+			} else {
+				INLINE_EXT_STAT_INC(&g_iext_info, split_left_count);
+				/* may be can merge with the left of index */
+				if (index - 1 >= 0)
+					index = left = index - 1;
+				else
+					goto add_entry;
+			}
+			fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+			fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+			blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+			len = F2FS_EXT_LEN(&eh->exts[index]);
+			break;
+		case 2:
+			if (inline_extents + max_split_cnt > max_inline_extents) {
+				ret = -ENOSPC;
+				goto out;
+			}
+			eh->exts[index].len = cpu_to_le32(fofs - fofs_start);
+
+			split.fofs = cpu_to_le32(fofs + 1);
+			split.len = cpu_to_le32(fofs_end - fofs);
+			if (blk_start != NEW_ADDR && blk_start != NULL_ADDR)
+				split.blk_addr = cpu_to_le32(blk_start + fofs - fofs_start + 1);
+			else
+				split.blk_addr = cpu_to_le32(blk_start);
+			__ext_add_one_entry(eh, index + 1, &split);
+			inline_extents = EXT_ENTRY_COUNT(eh);
+			/* add ext between index and 'index + 1' */
+			index++;
+			INLINE_EXT_STAT_INC(&g_iext_info, split_mid_count);
+			goto add_entry;
+		default:
+			ASSERT(0);
+		}
+		break;
+	default:
+		ASSERT(0);
+	}
+	/* 7. try to merge extent. */
+	if (left >= 0 && __is_extent_mergeable(&eh->exts[left], &ext))
+		merge_bits |= 1;
+	if (right >= 0 && __is_extent_mergeable(&ext, &eh->exts[right]))
+		merge_bits |= (1 << 1);
+	switch (merge_bits) {
+	case 1:
+		eh->exts[left].len = cpu_to_le32(F2FS_EXT_LEN(&eh->exts[left]) + 1);
+		INLINE_EXT_STAT_INC(&g_iext_info, right_merge_count);
+		goto out;
+	case 2:
+		eh->exts[right].len = cpu_to_le32(F2FS_EXT_LEN(&eh->exts[right]) + 1);
+		eh->exts[right].fofs = cpu_to_le32(fofs);
+		eh->exts[right].blk_addr = cpu_to_le32(blkaddr);
+		INLINE_EXT_STAT_INC(&g_iext_info, left_merge_count);
+		goto out;
+	case 3:
+		eh->exts[left].len = cpu_to_le32(F2FS_EXT_LEN(&eh->exts[left])
+					+ 1 + F2FS_EXT_LEN(&eh->exts[right]));
+		__ext_del_one_entry(eh, right);
+		INLINE_EXT_STAT_INC(&g_iext_info, del_ext_count);
+		INLINE_EXT_STAT_INC(&g_iext_info, lr_merge_count);
+		goto out;
+	default:
+		/* no extent can merge. */
+		ASSERT(merge_bits == 0);
+	}
+	/* insert ext after found index. always false for split case. */
+	if (fofs > fofs_start)
+		index++;
+	INLINE_EXT_STAT_INC(&g_iext_info, insert_new_ext_count);
+add_entry:
+	/*
+	 * Just bypass insert new NULL_ADDR, because the old blkaddr may not
+	 * be NULL_ADDR, and inserting need to delete it at first.
+	 * This will bypass all newly insert operation.
+	 */
+	if (blkaddr == NULL_ADDR) {
+		/* ret = 0; delete succeed. */
+		goto out;
+	}
+	if (inline_extents + 1 > max_inline_extents) {
+		ret = -ENOSPC;
+		goto out;
+	}
+	/* 8. insert as new extent. */
+	INLINE_EXT_STAT_INC(&g_iext_info, add_ext_count);
+	__ext_add_one_entry(eh, index, &ext);
+out:
+	ASSERT(EXT_ENTRY_COUNT(eh) <= max_inline_extents);
+	return ret;
+}
+
+/* Lookup whether fofs is exists in inline extent area. */
+static int __iext_lookup_data_blkaddr(struct f2fs_node *node_blk,
+				block_t fofs, block_t *blkaddr,
+				unsigned int *len)
+{
+	int index, hit;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	block_t blk_start, fofs_start;
+
+	if (inline_extents == 0)
+		return -ENOENT;
+	index = __iext_binsearch_idx(node_blk, fofs);
+	hit = __is_iextent_hit(&eh->exts[index], fofs);
+	if (hit != F2FS_EXT_HIT_MID)
+		return -ENOENT;
+	blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+	fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+	if (blk_start == NEW_ADDR || blk_start == NULL_ADDR) {
+		*blkaddr = blk_start;
+		if (len)
+			*len = 1;
+	} else {
+		*blkaddr = blk_start + fofs - fofs_start;
+		if (len)
+			*len = F2FS_EXT_LEN(&eh->exts[index]) -
+					(fofs - fofs_start);
+	}
+	return 0;
+}
+
+int f2fs_iext_lookup_blkaddr(struct f2fs_node *node_blk,
+					block_t fofs, block_t *blkaddr,
+					unsigned int *len)
+{
+	int error = 0;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	struct f2fs_extent *last_ext = EXT_LAST_INDEX(eh);
+
+	if (EXT_ENTRY_COUNT(eh) == 0 || F2FS_EXT_LOGICAL_END(last_ext) < fofs)
+		error = -ENOENT;
+	else
+		error = __iext_lookup_data_blkaddr(node_blk, fofs,
+						blkaddr, len);
+
+	/* return NULL_ADDR for direct blocks. */
+	if (error && fofs < ADDRS_PER_INODE(&node_blk->i)) {
+		*blkaddr = NULL_ADDR;
+		error = 0;
+		if (len)
+			*len = 1;
+	}
+	return error;
+}
+
+/*
+ * Exceptions:
+ * 1. inline extent area is full, blkaddr is overlap with EXT_LAST_INDEX()
+ *    1.1 blkaddr hit the right/left most or middle blk of EXT_LAST_INDEX()
+ *    1.2 the above cases is similar with extent merge
+ * 2. inline extent area is full, blkaddr is less than EXT_LAST_INDEX()
+ *    2.1 remove EXT_LAST_INDEX() and try again.
+ * 3. inline extent area is full, blkaddr is bigger than EXT_LAST_INDEX(), just
+ *    drop it.
+ *
+ * The above exceptions will be handled twice at most, because 1 insert
+ * operation may cause 2 extent insert operations at most.
+ *
+ * This function inform whether need to mark inode as dirty through return
+ * value.
+ */
+
+int f2fs_iext_update_data_blkaddr(struct f2fs_node *node_blk,
+					block_t fofs, block_t blkaddr)
+{
+	int error = 0, retry_cnt = 2, hit, direct_blocks = ADDRS_PER_INODE(&node_blk->i);
+	unsigned int len;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	struct f2fs_extent *last_ext;
+	block_t fofs_start;
+
+retry:
+	ASSERT(retry_cnt >= 0);
+	ASSERT(EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(&node_blk->i));
+	error = __iext_insert_idx(node_blk, fofs, blkaddr);
+
+	if (!error)
+		return 0;
+	/* fofs doesn't exists in inline extent area and bigger than last fofs. */
+	if (error == -E2BIG && fofs >= direct_blocks)
+		return F2FS_IEXT_INSERT_DROP;
+	/* evict the last extent and try to insert again. */
+	/* must be after __iext_insert_idx, which might remove extent. */
+	last_ext = EXT_LAST_INDEX(eh);
+	ASSERT(last_ext);
+	if (!last_ext)
+		return F2FS_IEXT_INSERT_CONVERT;
+	fofs_start = F2FS_EXT_LOGICAL_START(last_ext);
+	len = F2FS_EXT_LEN(last_ext);
+	hit = __is_iextent_hit(last_ext, fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		/*
+		 * if last extent cover direct blocks, we must interrupt and
+		 * trigger format conversion.
+		 */
+		if (fofs_start < direct_blocks) {
+			error = F2FS_IEXT_INSERT_CONVERT;
+			INLINE_EXT_STAT_INC(&g_iext_info, trigger_ext_format_convert);
+			goto out;
+		}
+		/*
+		 * whether fofs exceed ADDRS_PER_INODE or not, just delete the
+		 * lastest extent and try again.
+		 */
+		INLINE_EXT_STAT_INC(&g_iext_info, evict_last_ext_cnt);
+		__ext_del_one_entry(eh, EXT_ENTRY_COUNT(eh) - 1);
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		/*
+		 * don't need to cache it in inline extent area and old mapping
+		 * has already removed.
+		 */
+		if (fofs > direct_blocks - 1) {
+			INLINE_EXT_STAT_INC(&g_iext_info, drop_insert_new_ext_cnt);
+			error = F2FS_IEXT_INSERT_REMOVED;
+			goto out;
+		}
+		INLINE_EXT_STAT_INC(&g_iext_info, trigger_ext_format_convert);
+		error = F2FS_IEXT_INSERT_CONVERT;
+		goto out;
+	case F2FS_EXT_HIT_MID:
+		/*
+		 * if `len == 1` then {fofs, blkaddr, 1} already overwrite old
+		 * extent.
+		 */
+		ASSERT(len > 1);
+		/*
+		 * truncate[fofs + 1, fofs_start + len -1] and replace last_ext
+		 * with {fofs, blkaddr, 1}
+		 * `fofs == fofs_start` will never happen, because
+		 * __iext_insert_idx will truncate fofs.
+		 */
+		/*
+		 * truncate [fofs, fofs_start + len - 1] when fofs are out of range of
+		 * direct_blocks.
+		 */
+		if (fofs > fofs_start && fofs > direct_blocks - 1) {
+			last_ext->len = cpu_to_le32(fofs - fofs_start);
+			INLINE_EXT_STAT_INC(&g_iext_info, truncate_last_ext_cnt);
+			if (EXT_ENTRY_COUNT(eh) == MAX_INLINE_EXTENTS(&node_blk->i)) {
+				error = F2FS_IEXT_INSERT_REMOVED;
+				goto out;
+			}
+		} else {
+			error = F2FS_IEXT_INSERT_CONVERT;
+			goto out;
+		}
+		break;
+	}
+	ASSERT(EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(&node_blk->i));
+	retry_cnt--;
+	goto retry;
+out:
+	return error;
+}
+
+static int __iext_convert_to_inline_extent(struct f2fs_node *direct_node,
+				       struct f2fs_node *extent_node)
+{
+	int i = 0, error = 0, direct_blocks = ADDRS_PER_INODE(&direct_node->i);
+	__le32 *arr = (__le32 *)blkaddr_in_node(direct_node);
+
+	for (; i < direct_blocks; i++) {
+		error = __iext_insert_idx(extent_node, i,
+					le32_to_cpu(arr[i]));
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
+int f2fs_iext_convert_to_inline_extent(struct f2fs_node *node_blk)
+{
+	bool updated = false;
+	int ret;
+	struct f2fs_node *convert_node;
+
+	if (f2fs_iext_support_inline_extent(node_blk))
+		goto out;
+
+	/* Allocate temporary buffer for conversion */
+	convert_node = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(convert_node);
+
+	memcpy(convert_node, node_blk, F2FS_BLKSIZE);
+	f2fs_iext_init_inline_extent(node_blk);
+	ret = __iext_convert_to_inline_extent(convert_node, node_blk);
+	if (ret)
+		memcpy(node_blk, convert_node, F2FS_BLKSIZE);
+	else
+		updated = true;
+	free(convert_node);
+
+out:
+	return updated;
+}
+
+static void __iext_convert_to_direct_blocks(struct f2fs_node *direct_node,
+					struct f2fs_node *extent_node)
+{
+	int i = 0, direct_blocks = ADDRS_PER_INODE(&direct_node->i);
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(extent_node);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int j, len;
+	struct f2fs_extent *ext;
+	block_t fofs_start = 0, blk_start;
+	__le32 *arr = (__le32 *)blkaddr_in_node(direct_node);
+
+	/* set default to NULL_ADDR. */
+	memset(arr, 0, sizeof(__le32) * direct_blocks);
+	for (; fofs_start < direct_blocks && i < inline_extents; i++) {
+		ext = &eh->exts[i];
+		len = F2FS_EXT_LEN(ext);
+		fofs_start = F2FS_EXT_LOGICAL_START(ext);
+		blk_start = F2FS_EXT_PHYSICAL_START(ext);
+		for (j = 0; j < len && fofs_start < direct_blocks; j++) {
+			if (blk_start == NULL_ADDR || blk_start == NEW_ADDR)
+				arr[fofs_start++] = cpu_to_le32(blk_start);
+			else
+				arr[fofs_start++] = cpu_to_le32(blk_start + j);
+		}
+	}
+}
+
+void f2fs_iext_convert_to_direct_blocks(struct f2fs_node *node_blk)
+{
+	struct f2fs_node *convert_node;
+
+	/* Allocate temporary buffer for conversion */
+	convert_node = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(convert_node);
+
+	memcpy(convert_node, node_blk, F2FS_BLKSIZE);
+	__iext_convert_to_direct_blocks(node_blk, convert_node);
+	free(convert_node);
+}
+
+/* truncate extent starting from @fofs. */
+void f2fs_iext_truncate_from_blkaddr(struct f2fs_node *node_blk, block_t fofs)
+{
+	int index, hit;
+	unsigned int len;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	struct f2fs_extent *ext;
+	block_t fofs_start;
+
+	if (inline_extents == 0)
+		return;
+	index = __iext_binsearch_idx(node_blk, fofs);
+
+	ext = &eh->exts[index];
+
+	hit = __is_iextent_hit(ext, fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		ASSERT(index == 0);
+		eh->cnt = cpu_to_le32(0);
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		eh->cnt = cpu_to_le32(index + 1);
+		break;
+	case F2FS_EXT_HIT_MID:
+		fofs_start = F2FS_EXT_LOGICAL_START(ext);
+		len = F2FS_EXT_LEN(ext);
+
+		if (len == 1 || fofs == fofs_start) {
+			eh->cnt = cpu_to_le32(index);
+			break;
+		}
+		eh->cnt = cpu_to_le32(index + 1);
+		ext->len = cpu_to_le32(fofs - fofs_start);
+		break;
+	default:
+		ASSERT(0);
+	}
+}
+
+void f2fs_iext_init_inline_extent(struct f2fs_node *node_blk)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+
+	eh->magic1 = cpu_to_le32(F2FS_IEXT_FORMAT_MAGIC1);
+	eh->magic2 = cpu_to_le32(F2FS_IEXT_FORMAT_MAGIC2);
+	eh->cnt = cpu_to_le32(0);
+}
+
+/* Check if node block supports inline extent format */
+bool f2fs_iext_support_inline_extent(struct f2fs_node *node_blk)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+
+	return (le32_to_cpu(eh->magic1) == F2FS_IEXT_FORMAT_MAGIC1 &&
+		le32_to_cpu(eh->magic2) == F2FS_IEXT_FORMAT_MAGIC2);
+}
+
+block_t f2fs_iext_last_fofs(struct f2fs_node *node_blk)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)blkaddr_in_node(node_blk);
+
+	if (EXT_ENTRY_COUNT(eh) == 0)
+		return 0;
+
+	return F2FS_EXT_LOGICAL_END(EXT_LAST_INDEX(eh));
+}
+
+void f2fs_iext_show_stat(void)
+{
+	DBG(3, "Inline extent statistics:\n");
+	DBG(3, "  - left_merge_count: %llu\n", g_iext_info.left_merge_count);
+	DBG(3, "  - right_merge_count: %llu\n", g_iext_info.right_merge_count);
+	DBG(3, "  - fast_right_merge_count: %llu\n", g_iext_info.fast_right_merge_count);
+	DBG(3, "  - lr_merge_count: %llu\n", g_iext_info.lr_merge_count);
+	DBG(3, "  - split_left_count: %llu\n", g_iext_info.split_left_count);
+	DBG(3, "  - split_right_count: %llu\n", g_iext_info.split_right_count);
+	DBG(3, "  - split_mid_count: %llu\n", g_iext_info.split_mid_count);
+	DBG(3, "  - insert_new_ext_count: %llu\n", g_iext_info.insert_new_ext_count);
+	DBG(3, "  - overwrite_ext_count: %llu\n", g_iext_info.overwrite_ext_count);
+	DBG(3, "  - add_ext_count: %llu\n", g_iext_info.add_ext_count);
+	DBG(3, "  - del_ext_count: %llu\n", g_iext_info.del_ext_count);
+	DBG(3, "  - evict_last_ext_cnt: %llu\n", g_iext_info.evict_last_ext_cnt);
+	DBG(3, "  - truncate_last_ext_cnt: %llu\n", g_iext_info.truncate_last_ext_cnt);
+	DBG(3, "  - drop_insert_new_ext_cnt: %llu\n", g_iext_info.drop_insert_new_ext_cnt);
+	DBG(3, "  - trigger_ext_format_convert: %llu\n", g_iext_info.trigger_ext_format_convert);
+}
+
+#endif /* HAVE_INLINE_EXTENT */
diff --git a/fsck/iextent.h b/fsck/iextent.h
new file mode 100644
index 00000000..1ecf8c4b
--- /dev/null
+++ b/fsck/iextent.h
@@ -0,0 +1,100 @@
+/**
+ * iextent.h
+ *
+ * Copyright (c) 2026 Xiaomi Technology Co., Ltd.
+ *             http://www.mi.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __IEXTENT_H__
+#define __IEXTENT_H__
+
+#include "fsck.h"
+
+#ifdef HAVE_INLINE_EXTENT
+
+/* Extent header format with dual magic numbers */
+#define F2FS_IEXT_FORMAT_MAGIC1	0xF2F5EF00 /* F2FS Extent Format Magic 1 */
+#define F2FS_IEXT_FORMAT_MAGIC2	(-3U) /* F2FS Extent Format Magic 2 */
+
+struct f2fs_iext_header {
+	__le32 magic1;		/* first magic # to identify extent format */
+	__le32 magic2;		/* second magic # to identify extent format */
+	__le32 cnt;		/* total # of extents */
+	struct f2fs_extent exts[];
+};
+
+/* Extent macros - match kernel definition */
+#define MAX_INLINE_EXTENTS(inode)	((ADDRS_PER_INODE(inode) * sizeof(__le32) \
+					- sizeof(struct f2fs_iext_header)) / sizeof(struct f2fs_extent))
+
+#define EXT_FIRST_INDEX(__hdr__) ((__hdr__)->exts)
+#define EXT_ENTRY_COUNT(__hdr__) (le32_to_cpu((__hdr__)->cnt))
+#define EXT_LAST_INDEX(__hdr__) \
+	(EXT_ENTRY_COUNT(__hdr__) ? &(__hdr__)->exts[EXT_ENTRY_COUNT(__hdr__) - 1] : NULL)
+
+/* Use blk_addr field name as defined in f2fs_fs.h */
+#define F2FS_EXT_LEN(ext) (le32_to_cpu((ext)->len))
+#define F2FS_EXT_LOGICAL_START(ext) (le32_to_cpu((ext)->fofs))
+#define F2FS_EXT_LOGICAL_END(ext) ((F2FS_EXT_LOGICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+#define F2FS_EXT_PHYSICAL_START(ext) (le32_to_cpu((ext)->blk_addr))
+#define F2FS_EXT_PHYSICAL_END(ext) ((F2FS_EXT_PHYSICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+
+/* Return codes for insert operations */
+enum {
+	F2FS_IEXT_INSERT_NORMAL = 0,	/* insert extent correctly */
+	F2FS_IEXT_INSERT_CONVERT,	/* inline area cannot cover all direct blocks */
+	F2FS_IEXT_INSERT_DROP,		/* didn't modify inode page, no space and fofs is too big */
+	F2FS_IEXT_INSERT_REMOVED,	/* modified inode page, but didn't insert due to no space */
+};
+
+/* f2fs_iext_info - Inline extent management information */
+struct f2fs_iext_info {
+	/* Statistics counters for debugging */
+	unsigned long long left_merge_count;
+	unsigned long long right_merge_count;
+	unsigned long long fast_right_merge_count;
+	unsigned long long lr_merge_count;
+	unsigned long long split_left_count;
+	unsigned long long split_right_count;
+	unsigned long long split_mid_count;
+	unsigned long long insert_new_ext_count;
+	unsigned long long overwrite_ext_count;
+	unsigned long long add_ext_count;
+	unsigned long long del_ext_count;
+	unsigned long long evict_last_ext_cnt;
+	unsigned long long truncate_last_ext_cnt;
+	unsigned long long drop_insert_new_ext_cnt;
+	unsigned long long trigger_ext_format_convert;
+};
+
+/* Macro for inline extent statistics increment */
+#define INLINE_EXT_STAT_INC(iext_info, stat) \
+	do { \
+		(iext_info)->stat++; \
+	} while (0)
+
+/* Global iext_info variable */
+extern struct f2fs_iext_info g_iext_info;
+
+int f2fs_iext_sanity_check(struct f2fs_node *node_blk);
+/* Function declarations - using struct f2fs_node* for userspace */
+int f2fs_iext_lookup_blkaddr(struct f2fs_node *node_blk, block_t fofs,
+			      block_t *blkaddr, unsigned int *len);
+int f2fs_iext_update_data_blkaddr(struct f2fs_node *node_blk, block_t fofs,
+				   block_t blkaddr);
+int f2fs_iext_convert_to_inline_extent(struct f2fs_node *node_blk);
+void f2fs_iext_convert_to_direct_blocks(struct f2fs_node *node_blk);
+void f2fs_iext_truncate_from_blkaddr(struct f2fs_node *node_blk, block_t fofs);
+void f2fs_iext_init_inline_extent(struct f2fs_node *node_blk);
+bool f2fs_iext_support_inline_extent(struct f2fs_node *node_blk);
+block_t f2fs_iext_last_fofs(struct f2fs_node *node_blk);
+
+/* Show statistics */
+void f2fs_iext_show_stat(void);
+
+#endif /* HAVE_INLINE_EXTENT */
+
+#endif /* __IEXTENT_H__ */
diff --git a/fsck/mount.c b/fsck/mount.c
index 6f640a08..023af7fe 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -10,6 +10,9 @@
  */
 #include "fsck.h"
 #include "node.h"
+#ifdef HAVE_INLINE_EXTENT
+#include "iextent.h"
+#endif
 #include "xattr.h"
 #include "quota.h"
 #include <locale.h>
@@ -357,7 +360,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		if (i + ofs >= DEF_ADDRS_PER_INODE)
 			break;
 
-		blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
+		blkaddr = datablock_addr(node, i);
 
 		if (blkaddr == 0x0)
 			continue;
@@ -2507,6 +2510,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	struct node_info ni;
 	block_t oldaddr, startaddr, endaddr;
 	bool node_blk_alloced = false;
+	bool write_inode = false;
 	int ret;
 
 	if (node_blk == NULL) {
@@ -2525,7 +2529,36 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	if (IS_INODE(node_blk)) {
 		int ofs = get_extra_isize(node_blk);
 
-		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
+		oldaddr = datablock_addr(node_blk, ofs_in_node);
+#ifdef HAVE_INLINE_EXTENT
+		if (f2fs_iext_support_inline_extent(node_blk)) {
+			int err = 0, direct_blocks = ADDRS_PER_INODE(&node_blk->i);
+			block_t fofs;
+
+			/* Calculate file offset (fofs) from ofs_in_node */
+			fofs = start_bidx_of_node(ofs_of_node(node_blk), node_blk) + ofs_in_node;
+			ASSERT(fofs == ofs_in_node);
+
+			/* Step 1: Truncate all blocks after direct_blocks position */
+			if (f2fs_iext_last_fofs(node_blk) >= direct_blocks)
+				f2fs_iext_truncate_from_blkaddr(node_blk, direct_blocks);
+
+			if (fofs >= direct_blocks)
+				ASSERT(0);
+			/* Step 2: Try to insert new address in inline extent format */
+			err = f2fs_iext_update_data_blkaddr(node_blk, fofs,
+					newaddr);
+			DBG(1, "update iext mapping fofs=%u, newaddr: %u\n", fofs, newaddr);
+			if (err) {
+				/* Step 3: If insertion failed, convert to direct blocks format */
+				DBG(1, "Converting from inline extent to direct blocks at fofs=%u\n",
+						fofs);
+				f2fs_iext_convert_to_direct_blocks(node_blk);
+				/* For non-inode nodes or non-inline-extent format, use direct addressing */
+				node_blk->i.i_addr[ofs + ofs_in_node] = cpu_to_le32(newaddr);
+			}
+		} else
+#endif
 		node_blk->i.i_addr[ofs + ofs_in_node] = cpu_to_le32(newaddr);
 		if (node_blk_alloced) {
 			ret = update_inode(sbi, node_blk, &ni.blk_addr);
@@ -2552,6 +2585,14 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 		}
 		ret = dev_read_block(node_blk, ni.blk_addr);
 		ASSERT(ret >= 0);
+#ifdef HAVE_INLINE_EXTENT
+		if (f2fs_iext_support_inline_extent(node_blk) &&
+				f2fs_iext_last_fofs(node_blk) >= ADDRS_PER_INODE(&node_blk->i)) {
+			DBG(1, "through dnode update iext mapping newaddr: %u\n", newaddr);
+			f2fs_iext_truncate_from_blkaddr(node_blk, ADDRS_PER_INODE(&node_blk->i));
+			write_inode = true;
+		}
+#endif
 	}
 
 	/* check extent cache entry */
@@ -2559,12 +2600,13 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	endaddr = startaddr + le32_to_cpu(node_blk->i.i_ext.len);
 	if (oldaddr >= startaddr && oldaddr < endaddr) {
 		node_blk->i.i_ext.len = 0;
-
-		/* update inode block */
-		if (node_blk_alloced)
-			ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
+		write_inode = true;
 	}
 
+	/* update inode block */
+	if (write_inode && node_blk_alloced)
+		ASSERT(update_inode(sbi, node_blk, &ni.blk_addr) >= 0);
+
 	if (node_blk_alloced)
 		free(node_blk);
 }
@@ -4237,6 +4279,7 @@ out:
 		if (check_nat_bits(sbi, sb, cp) && c.fix_on)
 			write_nat_bits(sbi, sb, cp, sbi->cur_cp);
 	}
+
 	return 0;
 }
 
@@ -4268,6 +4311,10 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
 
 	free(sbi->ckpt);
 	free(sbi->raw_super);
+
+#ifdef HAVE_INLINE_EXTENT
+	f2fs_iext_show_stat();
+#endif
 }
 
 #ifdef WITH_ANDROID
diff --git a/fsck/node.c b/fsck/node.c
index 8d4479c5..644f4c8e 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -100,6 +100,36 @@ void set_data_blkaddr(struct dnode_of_data *dn)
 	struct f2fs_node *node_blk = dn->node_blk;
 	unsigned int ofs_in_node = dn->ofs_in_node;
 
+#ifdef HAVE_INLINE_EXTENT
+	if (f2fs_iext_support_inline_extent(dn->inode_blk)) {
+		int ret = 0, direct_blocks = ADDRS_PER_INODE(&dn->inode_blk->i);
+		block_t fofs;
+
+		fofs = start_bidx_of_node(ofs_of_node(node_blk), dn->node_blk) + ofs_in_node;
+
+		/* Step 1: Truncate all blocks after direct_blocks position */
+		if (f2fs_iext_last_fofs(dn->inode_blk) >= direct_blocks) {
+			f2fs_iext_truncate_from_blkaddr(dn->inode_blk, direct_blocks);
+			dn->idirty = 1;
+		}
+
+		if (fofs < direct_blocks) {
+			/* Step 2: Try to insert new address in inline extent format */
+			ret = f2fs_iext_update_data_blkaddr(dn->inode_blk, fofs,
+					dn->data_blkaddr);
+			if (!ret) {
+				dn->idirty = 1;
+				return;
+			}
+			/* Step 3: If insertion failed, convert to direct blocks format */
+			DBG(1, "Converting from inline extent to direct blocks at fofs=%u\n",
+			    fofs);
+			f2fs_iext_convert_to_direct_blocks(dn->inode_blk);
+		}
+		/* For non-inode nodes or non-inline-extent format, use direct addressing */
+	}
+#endif
+
 	addr_array = blkaddr_in_node(node_blk);
 	addr_array[ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
 	if (dn->node_blk != dn->inode_blk)
diff --git a/fsck/node.h b/fsck/node.h
index 19f1e571..2f5ff769 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -17,6 +17,9 @@
 #define _NODE_H_
 
 #include "fsck.h"
+#ifdef HAVE_INLINE_EXTENT
+#include "iextent.h"
+#endif
 
 static inline bool IS_INODE(struct f2fs_node *node)
 {
@@ -64,6 +67,21 @@ static inline block_t datablock_addr(struct f2fs_node *node_page,
 	__le32 *addr_array;
 
 	ASSERT(node_page);
+
+#ifdef HAVE_INLINE_EXTENT
+	/* Principle #7: Check inline extent format first, then fallback */
+	if (IS_INODE(node_page) && f2fs_iext_support_inline_extent(node_page)) {
+		block_t blkaddr;
+
+		/* Query inline extent, node offset is equal to file's offset */
+		if (f2fs_iext_lookup_blkaddr(node_page, offset, &blkaddr, NULL) == 0)
+			return blkaddr;
+		/* If not found in inline extent, inline extent may encounter bug. */
+		ASSERT(0);
+	}
+#endif
+
+	/* Traditional node block path */
 	addr_array = blkaddr_in_node(node_page);
 	return le32_to_cpu(addr_array[offset]);
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
