Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IgzKC1VGWoFvggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A48E5FF9EB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BonIu0muJMdB4JHaIp61aOimm/DffLIjUPm0gGqACxI=; b=GtB6jilULHTg7N09S9ihMzCZpJ
	B4A6wMjmVTuvVtmI0Zu64JQYN+vBDvTbdRciXTKLtN+lJsTdAUgw7kXEVCGAVA/PhgVWmMmjBesma
	A+1m2/xch/gHuqPJ0rnWRE2IkgbDj/Dzw6nY++DXtG2F5GNotFrFVhe2EMm5GjU1dSKk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt2p-0001OC-Ia;
	Fri, 29 May 2026 08:58:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt2g-0001K6-V1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MPnhcfVynmofLXLuuUstE3R1PvMYKnrdYcM1N7PxiDE=; b=dTV6I1R/SI/YmyVT3RL4IvLJaK
 +VvusnMvmKGOle/0oI5M336xuKlUOWBvjzOQwEcvIM/+RgWoz/uw2JvgqMQ0U9qJ2vLw6lT8jGr4a
 N8YqW+WzDM7tXqiuRwWHyLv/X3XQYMxdVUjxx/g2QYAo17NLGkrrpjbwoOYTj2Dg55jU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MPnhcfVynmofLXLuuUstE3R1PvMYKnrdYcM1N7PxiDE=; b=O
 TjkzH7S/X8flklvzfiWIZ8TTHDa9wNrdLHvXN69u/2DwJY0qfIWvFo4OBbT0C3ISyRIOysgdWMqW3
 jTCseV3/oCcVfSxB2cpF1iZVQcLm57HeDc9IUz+rxrssWIjCrJsMOJDo8lhqIbH1V32Zf3pl6buxk
 XzmoSFjU5rwqVJbk=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt2T-0001AG-RX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:58:03 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82fbdd60b64so11092780b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045073; x=1780649873; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPnhcfVynmofLXLuuUstE3R1PvMYKnrdYcM1N7PxiDE=;
 b=oRdOf1kzL8QQmtgPPBx3gn/EGz53e7DWvOI15dK2li7gWN/51RwDTFWpb+roTHIsMp
 14G+wJYEgC9t8hQbo+/hO3l3PcDVJZ2XieF26hWtxbHxvZim9jaPqyhza6AUt3ozt2Mk
 JRu1sc2uai8OuHbZ0OY76W4u32PzF7NlzOsW0VBS/7X2tvfF9PEX5RgG+MIcZXQyBI0s
 MonlzW7FLJ9EH3vSj9o6ij7B4fZOKjuX1Y+1xBBkwPTTpXVBXfiLPG2QY0VyAreNjqhc
 bNfk22B8HQm0jBR2M1KcL3SN7lZtU9CAvuulRn5BYfe/uXVp7kkRDOk2Cv4hwxk9Uy4I
 roAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045073; x=1780649873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPnhcfVynmofLXLuuUstE3R1PvMYKnrdYcM1N7PxiDE=;
 b=XLo684bZOPOqX4jHDgED6T4EEW5G+gi4kSjL/rt1hUl4n+7jhFpWdfUyPQ9oJBrjKn
 Hv1R83bwx6igOTme3P03eIrXU48DdYTKvHggWhGfwobW3BaV7FHRp2DfNoqgApx/0pe8
 qAia5emXq8keNYStrdTzcgwc4x3R3IETLhrhYFw0I67Xop+r7ZLtDCSZyD/Gd3eaH5XF
 3AALqYWZF58YgxsCm43FBqGo4ixdZBBeJLgxIy151amoFygqHe0phK9Go19KU4A8qwxa
 PKLvVNBnyKJ+YL3O+8Zwq9v16KYh0R0TikinHXjxBuSWKjJ5xzjlmJqsTHZVmQMftUNy
 1wPg==
X-Gm-Message-State: AOJu0YxorQJSHRzBrMa30oRBIxPkhPTYx2NeixW9+tWWL28Fizf+/o7X
 RgGapU0cfaeLZRXooro25G1hYUcAa3aeXnIJUrY+u/fWeRBAdBgr0I+mvHfQXA==
X-Gm-Gg: Acq92OHagm4DV+0z62ZPmek+ArDg/CFCX0tC5f7XM52tHcO3x2e36T1hfM1mYatoCBD
 5Bt9Bmzk5TRGZXjYYdjq4sk1PQN3OWfPEF1f5leaVWaI5i8YqmhyXUmdSyb7JPtF1zYKQ+OnkEU
 0WqLfn4ULroaWCJEzyfo/fa0cbPmjfLRLyet9f4OLRDbOQOhZSWXskLHtAuY3kNiu0fqc2uWiIa
 /L3/XGpttB0wmdE12UWk8H7zLXKUiLHmrDvnER7xGO62EiZ1vLrQOCatotEjxxhO4SPIe8GXqF3
 eJs2l1ISqEXzKEGdIb2PxYt1AqUlvo2Xm3FyZ6Td9Q0WYOo/SGbczbrwRf6krpxhH2OGokcOzwC
 kJLWx4oBKiQsgbiCFxqkVjBEFdYwD8dh9KyS3E120rEwe9q9R1fLaGApbOLYv6U9QvNQscl0jCn
 HiyezEB8djUWhj0GYSU7yNnln7XqAmHtYYr9IDmYiWG1Ca/5PgQDo56DtVr2rbYElYA17kWcLM3
 EbMyzpY
X-Received: by 2002:a05:6a00:3d42:b0:83f:9c6:9c with SMTP id
 d2e1a72fcca58-84212a7ad81mr2194977b3a.10.1780045072218; 
 Fri, 29 May 2026 01:57:52 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84214d0513bsm1216639b3a.61.2026.05.29.01.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:57:51 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:57:43 +0800
Message-ID: <20260529085745.2664678-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt2T-0001AG-RX
Subject: [f2fs-dev] [RFC PATCH v2 1/3] fsck: add inline extent format support
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
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 7A48E5FF9EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
v2:
- Rename __is_extent_mergeable to __is_iextent_mergeable.
- Remove NULL_ADDR caching support from merge/split logic.
- Unify fofs range check to "fofs >= direct_blocks".
- Fix f2fs_iext_sanity_check overlap detection (use <= instead of <).
- Fix f2fs_iext_truncate_from_blkaddr write ordering to match kernel.
- Refactor datablock_addr/set_data_blkaddr to reduce #ifdef nesting.
- Code style fixes to comply with 80-column limit.
---
 fsck/dump.c    |   4 +-
 fsck/fsck.c    |  39 ++-
 fsck/iextent.c | 787 +++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/iextent.h | 100 +++++++
 fsck/mount.c   |  67 ++++-
 fsck/node.c    |  31 ++
 fsck/node.h    |  16 +
 7 files changed, 1029 insertions(+), 15 deletions(-)
 create mode 100644 fsck/iextent.c
 create mode 100644 fsck/iextent.h

diff --git a/fsck/dump.c b/fsck/dump.c
index c68dc6e..d7ecfa8 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -547,8 +547,8 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	/* check data blocks in inode */
 	for (i = 0; i < addr_per_inode; i++, ofs++)
-		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
-			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), type);
+		dump_data_blk(sbi, ofs * F2FS_BLKSIZE,
+			datablock_addr(node_blk, i), type);
 
 	/* check node blocks in inode */
 	for (i = 0; i < 5; i++) {
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4fca4dd..cbc1cfe 100644
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
@@ -1498,6 +1512,18 @@ skip_dot_fix:
 	}
 
 	if (need_fix && f2fs_dev_is_writable()) {
+#ifdef HAVE_INLINE_EXTENT
+		/*
+		 * Truncate inline extent area to direct blocks boundary.
+		 * This removes any extent entries beyond ADDRS_PER_INODE,
+		 * ensuring inline extent doesn't reference indirect node
+		 * blocks.
+		 */
+		ASSERT(IS_INODE(node_blk));
+		if (f2fs_iext_support_inline_extent(node_blk))
+			f2fs_iext_truncate_from_blkaddr(node_blk,
+					ADDRS_PER_INODE(&node_blk->i));
+#endif
 		ret = update_block(sbi, node_blk, &ni->blk_addr, NULL);
 		ASSERT(ret >= 0);
 	}
@@ -3366,7 +3392,7 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 	struct f2fs_node *node;
 	struct node_info ni;
 	nid_t nid;
-	int ofs, i, err;
+	int i, err;
 
 	node = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node);
@@ -3397,9 +3423,8 @@ static void fsck_disconnect_file(struct f2fs_sb_info *sbi, nid_t ino,
 	if (!(node->i.i_inline & (F2FS_INLINE_DATA | F2FS_INLINE_DENTRY))) {
 		u32 addrs = ADDRS_PER_INODE(&node->i);
 
-		ofs = get_extra_isize(node);
 		for (i = 0; i < addrs; i++) {
-			block_t addr = le32_to_cpu(node->i.i_addr[ofs + i]);
+			block_t addr = datablock_addr(node, i);
 			if (!addr)
 				continue;
 			release_block_cnt(sbi, dealloc);
diff --git a/fsck/iextent.c b/fsck/iextent.c
new file mode 100644
index 0000000..af73ae0
--- /dev/null
+++ b/fsck/iextent.c
@@ -0,0 +1,787 @@
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
+			F2FS_EXT_PHYSICAL_START(ix) >
+			UINT_MAX - F2FS_EXT_LEN(ix))
+			return -EINVAL;
+		if (k == 0)
+			continue;
+		if (F2FS_EXT_LOGICAL_START(ix)
+				<= F2FS_EXT_LOGICAL_END(&ix[-1]))
+			return -EINVAL;
+	}
+	return 0;
+}
+
+/*
+ * Borrowed from ext4_ext_binsearch_idx in kernel.
+ *
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
+static void __ext_add_one_entry(struct f2fs_iext_header *eh, int index,
+			struct f2fs_extent *ext)
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
+			(inline_extents - index - 1) *
+			sizeof(struct f2fs_extent));
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
+	block_t start = F2FS_EXT_LOGICAL_START(ext);
+	block_t end = F2FS_EXT_LOGICAL_END(ext);
+
+	if (fofs < start)
+		return F2FS_EXT_HIT_LEFT;
+	if (fofs > end)
+		return F2FS_EXT_HIT_RIGHT;
+	return F2FS_EXT_HIT_MID;
+}
+
+static bool __is_iextent_mergeable(struct f2fs_extent *left,
+			struct f2fs_extent *right)
+{
+	block_t left_blk_start = F2FS_EXT_PHYSICAL_START(left);
+	block_t right_blk_start = F2FS_EXT_PHYSICAL_START(right);
+
+	if (F2FS_EXT_LOGICAL_END(left) + 1 != F2FS_EXT_LOGICAL_START(right))
+		return false;
+
+	/* NEW_ADDR always can merge. */
+	if (left_blk_start == right_blk_start) {
+		/*
+		 * In fallocate context, FALLOC_FL_COLLAPSE_RANGE mode might
+		 * cause `left_blk_start == right_blk_start` and not equal
+		 * NEW_ADDR.
+		 */
+		if (left_blk_start == NEW_ADDR)
+			return true;
+		return false;
+	}
+	if (left_blk_start == NULL_ADDR ||
+			left_blk_start == NEW_ADDR ||
+			right_blk_start == NULL_ADDR ||
+			right_blk_start == NEW_ADDR)
+		return false;
+	if (F2FS_EXT_PHYSICAL_END(left) + 1 != F2FS_EXT_PHYSICAL_START(right))
+		return false;
+
+	return true;
+}
+
+/*
+ * 1. all single extent insert operation must check mergeable at first even for
+ * split case.
+ * 2. all -ENOSPC error will delete the old mapping except for case which will
+ * split extent into 2 separate extent and insert new one.
+ * 3. index point to 0th extent or extent which first fofs is bigger than @fofs.
+ * 4. delete old mapping before insert new one even for extent which len is 1.
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
+	if (__is_iextent_mergeable(last_ext, &ext)) {
+		last_ext->len = cpu_to_le32(F2FS_EXT_LEN(last_ext) + 1);
+		INLINE_EXT_STAT_INC(&g_iext_info, fast_right_merge_count);
+		goto out;
+	}
+
+	if (max_inline_extents == inline_extents &&
+			fofs > F2FS_EXT_LOGICAL_END(last_ext)) {
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
+			/*
+			 * just overwrite for single extent, other cases may
+			 * cause merge.
+			 */
+			if (inline_extents == 0) {
+				/*
+				 * blkaddr can be NULL_ADDR, so need to check
+				 * before update.
+				 */
+				INLINE_EXT_STAT_INC(&g_iext_info,
+						overwrite_ext_count);
+				goto add_entry;
+			}
+			if (index < inline_extents)
+				right = index;
+			if (index - 1 >= 0)
+				index = left = index - 1;
+			/*
+			 * index may not change but extent content has already
+			 * changed.
+			 */
+			fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+			fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+			blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+			len = F2FS_EXT_LEN(&eh->exts[index]);
+			break;
+		}
+		/* 6. split extent. */
+		if (blk_start == NEW_ADDR && blk_start == blkaddr)
+			goto out;
+		if (blk_start != NEW_ADDR &&
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
+			 * 1. actual split count maybe 0 or 1, because @ext
+			 * might merge with another extent.
+			 * 2. truncate fofs at first even though ext can not
+			 * merge and no space, because ext will add to inline
+			 * extent area or may out of range of inline extent
+			 * area.
+			 */
+			eh->exts[index].len = cpu_to_le32(
+					F2FS_EXT_LEN(&eh->exts[index]) - 1);
+			eh->exts[index].fofs = cpu_to_le32(fofs == fofs_start ?
+					fofs_start + 1 : fofs_start);
+			if (blk_start != NEW_ADDR)
+				eh->exts[index].blk_addr = cpu_to_le32(
+						fofs == fofs_start ?
+						blk_start + 1 : blk_start);
+			/* add ext at index or 'index + 1' */
+			if (fofs == fofs_end) {
+				INLINE_EXT_STAT_INC(&g_iext_info,
+						split_right_count);
+				/* may be can merge with the right of index */
+				if (index + 1 < inline_extents)
+					right = index + 1;
+				else {
+					index++; /* insert to next position. */
+					goto add_entry;
+				}
+			} else {
+				INLINE_EXT_STAT_INC(&g_iext_info,
+						split_left_count);
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
+			if (inline_extents + max_split_cnt >
+					max_inline_extents) {
+				ret = -ENOSPC;
+				goto out;
+			}
+			eh->exts[index].len = cpu_to_le32(fofs - fofs_start);
+
+			split.fofs = cpu_to_le32(fofs + 1);
+			split.len = cpu_to_le32(fofs_end - fofs);
+			if (blk_start != NEW_ADDR)
+				split.blk_addr = cpu_to_le32(blk_start +
+						fofs - fofs_start + 1);
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
+	if (left >= 0 && __is_iextent_mergeable(&eh->exts[left], &ext))
+		merge_bits |= 1;
+	if (right >= 0 && __is_iextent_mergeable(&ext, &eh->exts[right]))
+		merge_bits |= (1 << 1);
+	switch (merge_bits) {
+	case 1:
+		eh->exts[left].len = cpu_to_le32(
+				F2FS_EXT_LEN(&eh->exts[left]) + 1);
+		INLINE_EXT_STAT_INC(&g_iext_info, right_merge_count);
+		goto out;
+	case 2:
+		eh->exts[right].len = cpu_to_le32(
+				F2FS_EXT_LEN(&eh->exts[right]) + 1);
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
+	 * Just bypass insert new NULL_ADDR, because the old blkaddr can not
+	 * be NULL_ADDR, and inserting need to delete it at first.
+	 * This will bypass all newly NULL_ADDR insert operation.
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
+	if (blk_start == NEW_ADDR) {
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
+	int error = 0, retry_cnt = 2, hit;
+	int direct_blocks = ADDRS_PER_INODE(&node_blk->i);
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
+	/*
+	 * fofs doesn't exists in inline extent area and bigger than last
+	 * fofs. Caller only need to give up insert.
+	 */
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
+			INLINE_EXT_STAT_INC(&g_iext_info,
+					trigger_ext_format_convert);
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
+		if (fofs >= direct_blocks) {
+			INLINE_EXT_STAT_INC(&g_iext_info,
+					drop_insert_new_ext_cnt);
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
+		 * truncate [fofs + 1, fofs_start + len - 1] and replace
+		 * last_ext with {fofs, blkaddr, 1}.
+		 * `fofs == fofs_start` will never happen, because
+		 * __iext_insert_idx will truncate fofs.
+		 *
+		 * truncate [fofs, fofs_start + len - 1] when fofs are out of
+		 * range of [0, direct_blocks).
+		 */
+		if (fofs > fofs_start && fofs >= direct_blocks) {
+			last_ext->len = cpu_to_le32(fofs - fofs_start);
+			INLINE_EXT_STAT_INC(&g_iext_info,
+					truncate_last_ext_cnt);
+			if (EXT_ENTRY_COUNT(eh) ==
+					MAX_INLINE_EXTENTS(&node_blk->i)) {
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
+bool f2fs_iext_convert_to_inline_extent(struct f2fs_node *node_blk)
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
+			if (blk_start == NEW_ADDR)
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
+		ext->len = cpu_to_le32(fofs - fofs_start);
+		eh->cnt = cpu_to_le32(index + 1);
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
+	eh->cnt = 0;
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
+	DBG(3, "  - fast_right_merge_count: %llu\n",
+			g_iext_info.fast_right_merge_count);
+	DBG(3, "  - lr_merge_count: %llu\n", g_iext_info.lr_merge_count);
+	DBG(3, "  - split_left_count: %llu\n", g_iext_info.split_left_count);
+	DBG(3, "  - split_right_count: %llu\n", g_iext_info.split_right_count);
+	DBG(3, "  - split_mid_count: %llu\n", g_iext_info.split_mid_count);
+	DBG(3, "  - insert_new_ext_count: %llu\n",
+			g_iext_info.insert_new_ext_count);
+	DBG(3, "  - overwrite_ext_count: %llu\n",
+			g_iext_info.overwrite_ext_count);
+	DBG(3, "  - add_ext_count: %llu\n", g_iext_info.add_ext_count);
+	DBG(3, "  - del_ext_count: %llu\n", g_iext_info.del_ext_count);
+	DBG(3, "  - evict_last_ext_cnt: %llu\n",
+			g_iext_info.evict_last_ext_cnt);
+	DBG(3, "  - truncate_last_ext_cnt: %llu\n",
+			g_iext_info.truncate_last_ext_cnt);
+	DBG(3, "  - drop_insert_new_ext_cnt: %llu\n",
+			g_iext_info.drop_insert_new_ext_cnt);
+	DBG(3, "  - trigger_ext_format_convert: %llu\n",
+			g_iext_info.trigger_ext_format_convert);
+}
+
+#endif /* HAVE_INLINE_EXTENT */
diff --git a/fsck/iextent.h b/fsck/iextent.h
new file mode 100644
index 0000000..45d2ee0
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
+#define F2FS_IEXT_FORMAT_MAGIC1	0xF2F5EF00 /* F2FS Extent Format. */
+/* Use invalid data blkaddr as inline-extent identifier. */
+#define F2FS_IEXT_FORMAT_MAGIC2	(-3U)
+struct f2fs_iext_header {
+	__le32 magic1;		/* magic1 # to identify extent format. */
+	/* magic2 # cannot be a valid blkaddr in non-inline-extent format.*/
+	__le32 magic2;
+	__le32 cnt;		/* total # of extents. */
+	struct f2fs_extent exts[];
+};
+
+/* Extent macros - match kernel definition */
+#define MAX_INLINE_EXTENTS(inode)	((ADDRS_PER_INODE(inode) * \
+			sizeof(__le32) - sizeof(struct f2fs_iext_header)) / \
+			sizeof(struct f2fs_extent))
+
+#define EXT_FIRST_INDEX(__hdr__) ((__hdr__)->exts)
+#define EXT_ENTRY_COUNT(__hdr__) (le32_to_cpu((__hdr__)->cnt))
+#define EXT_LAST_INDEX(__hdr__) \
+			(EXT_ENTRY_COUNT(__hdr__) ? \
+			&(__hdr__)->exts[EXT_ENTRY_COUNT(__hdr__) - 1] : \
+			NULL)
+
+/* Use blk_addr field name as defined in f2fs_fs.h */
+#define F2FS_EXT_LEN(ext) (le32_to_cpu((ext)->len))
+#define F2FS_EXT_LOGICAL_START(ext) (le32_to_cpu((ext)->fofs))
+#define F2FS_EXT_LOGICAL_END(ext) \
+			((F2FS_EXT_LOGICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+#define F2FS_EXT_PHYSICAL_START(ext) (le32_to_cpu((ext)->blk_addr))
+#define F2FS_EXT_PHYSICAL_END(ext) \
+			((F2FS_EXT_PHYSICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+
+struct f2fs_iext_info {
+	/* stat for inline extent code coverage. */
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
+enum {
+	/* insert extent correctly */
+	F2FS_IEXT_INSERT_NORMAL = 0,
+	/* inline area cannot cover all direct blocks */
+	F2FS_IEXT_INSERT_CONVERT,
+	/* didn't modify inode page, no space and fofs is too big */
+	F2FS_IEXT_INSERT_DROP,
+	/* modified inode buffer, but didn't insert due to no space */
+	F2FS_IEXT_INSERT_REMOVED,
+};
+
+#define INLINE_EXT_STAT_INC(iext_info, stat) \
+	do { \
+		(iext_info)->stat++; \
+	} while (0)
+
+int f2fs_iext_sanity_check(struct f2fs_node *node_blk);
+int f2fs_iext_lookup_blkaddr(struct f2fs_node *node_blk, block_t fofs,
+			      block_t *blkaddr, unsigned int *len);
+int f2fs_iext_update_data_blkaddr(struct f2fs_node *node_blk, block_t fofs,
+				   block_t blkaddr);
+bool f2fs_iext_convert_to_inline_extent(struct f2fs_node *node_blk);
+void f2fs_iext_convert_to_direct_blocks(struct f2fs_node *node_blk);
+void f2fs_iext_truncate_from_blkaddr(struct f2fs_node *node_blk, block_t fofs);
+void f2fs_iext_init_inline_extent(struct f2fs_node *node_blk);
+bool f2fs_iext_support_inline_extent(struct f2fs_node *node_blk);
+block_t f2fs_iext_last_fofs(struct f2fs_node *node_blk);
+void f2fs_iext_show_stat(void);
+
+#endif /* HAVE_INLINE_EXTENT */
+
+#endif /* __IEXTENT_H__ */
diff --git a/fsck/mount.c b/fsck/mount.c
index 2f4e6c9..975fc8f 100644
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
@@ -359,7 +362,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		if (i + ofs >= DEF_ADDRS_PER_INODE)
 			break;
 
-		blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
+		blkaddr = datablock_addr(node, i);
 
 		if (blkaddr == 0x0)
 			continue;
@@ -2512,6 +2515,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	struct node_info ni;
 	block_t oldaddr, startaddr, endaddr;
 	bool node_blk_alloced = false;
+	bool write_inode = false;
 	int ret;
 
 	if (node_blk == NULL) {
@@ -2539,7 +2543,41 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	if (IS_INODE(node_blk)) {
 		int ofs = get_extra_isize(node_blk);
 
-		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
+		oldaddr = datablock_addr(node_blk, ofs_in_node);
+#ifdef HAVE_INLINE_EXTENT
+		if (f2fs_iext_support_inline_extent(node_blk)) {
+			int err = 0;
+			int direct_blocks = ADDRS_PER_INODE(&node_blk->i);
+			block_t fofs;
+
+			fofs = start_bidx_of_node(ofs_of_node(node_blk),
+					node_blk) + ofs_in_node;
+			ASSERT(fofs == ofs_in_node);
+
+			/* Truncate all blocks after direct_blocks position */
+			if (f2fs_iext_last_fofs(node_blk) >= direct_blocks)
+				f2fs_iext_truncate_from_blkaddr(node_blk,
+					direct_blocks);
+
+			if (fofs >= direct_blocks)
+				ASSERT(0);
+			err = f2fs_iext_update_data_blkaddr(node_blk, fofs,
+					newaddr);
+			DBG(1, "update iext mapping fofs=%u, newaddr: %u\n",
+					fofs, newaddr);
+			if (err) {
+				DBG(1, "Converting from inline extent to direct blocks at fofs=%u\n",
+						fofs);
+				f2fs_iext_convert_to_direct_blocks(node_blk);
+				/*
+				 * For non-inode nodes or non-inline-extent
+				 * format, use direct addressing.
+				 */
+				node_blk->i.i_addr[ofs + ofs_in_node] =
+						cpu_to_le32(newaddr);
+			}
+		} else
+#endif
 		node_blk->i.i_addr[ofs + ofs_in_node] = cpu_to_le32(newaddr);
 		if (node_blk_alloced) {
 			ret = update_inode(sbi, node_blk, &ni.blk_addr);
@@ -2566,6 +2604,17 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 		}
 		ret = dev_read_block(node_blk, ni.blk_addr);
 		ASSERT(ret >= 0);
+#ifdef HAVE_INLINE_EXTENT
+		if (f2fs_iext_support_inline_extent(node_blk) &&
+				f2fs_iext_last_fofs(node_blk) >=
+				ADDRS_PER_INODE(&node_blk->i)) {
+			DBG(1, "through dnode update iext mapping newaddr: %u\n",
+				newaddr);
+			f2fs_iext_truncate_from_blkaddr(node_blk,
+					ADDRS_PER_INODE(&node_blk->i));
+			write_inode = true;
+		}
+#endif
 	}
 
 	/* check extent cache entry */
@@ -2573,12 +2622,13 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
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
@@ -4268,6 +4318,7 @@ out:
 		if (check_nat_bits(sbi, sb, cp) && c.fix_on)
 			write_nat_bits(sbi, sb, cp, sbi->cur_cp);
 	}
+
 	return 0;
 }
 
@@ -4299,6 +4350,10 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
 
 	free(sbi->ckpt);
 	free(sbi->raw_super);
+
+#ifdef HAVE_INLINE_EXTENT
+	f2fs_iext_show_stat();
+#endif
 }
 
 #ifdef WITH_ANDROID
diff --git a/fsck/node.c b/fsck/node.c
index 8d4479c..356a81a 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -100,6 +100,37 @@ void set_data_blkaddr(struct dnode_of_data *dn)
 	struct f2fs_node *node_blk = dn->node_blk;
 	unsigned int ofs_in_node = dn->ofs_in_node;
 
+#ifdef HAVE_INLINE_EXTENT
+	if (f2fs_iext_support_inline_extent(dn->inode_blk)) {
+		int ret = 0;
+		int direct_blocks = ADDRS_PER_INODE(&dn->inode_blk->i);
+		block_t fofs;
+
+		fofs = start_bidx_of_node(ofs_of_node(node_blk),
+					dn->node_blk) + ofs_in_node;
+
+		/* Truncate all blocks after direct_blocks position */
+		if (f2fs_iext_last_fofs(dn->inode_blk) >= direct_blocks) {
+			f2fs_iext_truncate_from_blkaddr(dn->inode_blk,
+					direct_blocks);
+			dn->idirty = 1;
+		}
+
+		if (fofs < direct_blocks) {
+			ret = f2fs_iext_update_data_blkaddr(dn->inode_blk, fofs,
+					dn->data_blkaddr);
+			if (!ret) {
+				dn->idirty = 1;
+				return;
+			}
+			DBG(1, "Converting from inline extent to direct blocks at fofs=%u\n",
+			    fofs);
+			f2fs_iext_convert_to_direct_blocks(dn->inode_blk);
+		}
+		/* For non-inode nodes or non-inline-extent format, fallback. */
+	}
+#endif
+
 	addr_array = blkaddr_in_node(node_blk);
 	addr_array[ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
 	if (dn->node_blk != dn->inode_blk)
diff --git a/fsck/node.h b/fsck/node.h
index f3e2c46..023d636 100644
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
@@ -64,6 +67,19 @@ static inline block_t datablock_addr(struct f2fs_node *node_page,
 	__le32 *addr_array;
 
 	ASSERT(node_page);
+
+#ifdef HAVE_INLINE_EXTENT
+	if (IS_INODE(node_page) && f2fs_iext_support_inline_extent(node_page)) {
+		block_t blkaddr;
+
+		/* Query inline extent, node offset is equal to file's offset */
+		if (f2fs_iext_lookup_blkaddr(node_page, offset,
+					&blkaddr, NULL) == 0)
+			return blkaddr;
+		/* If not found in inline extent, it's unexpected. */
+		ASSERT(0);
+	}
+#endif
 	addr_array = blkaddr_in_node(node_page);
 	return le32_to_cpu(addr_array[offset]);
 }
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
