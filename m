Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE5BCF548
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Oct 2025 14:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpsBB1D/ayDaI8WAhSGnp2N9keajdgvBwSqvlwBMQ24=; b=RVaQX7gPnGLNbgN17fpNoBvXgW
	VzufoW+N/+NjZERGCw1rhoLHSrSd5iK4SqR/67+wrwKyW7AIGrIO5RPG5SQjVf+p6TrbTLAy+obBm
	z+Ul1uR0a1AGzDhquQf9L/IlkHM+UEo+LGpQJSsqoZdrAsshW353FpO+wfywSpi82w0E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7YkU-00037T-FD;
	Sat, 11 Oct 2025 12:30:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7Yk9-000376-QC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 12:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xhKDj9Cx+7ofhX/nPkkB5ooDTx7TfzOu+PlnLTeKoU=; b=jAv1OXiz0s6Kx5kNdk5khymZiy
 Ev/48xixNUyYsuwmMD4eUxdQfmPHSUEwSAFasg7ZieZxLRtCIP6bPP7DWWyriYACKnVSAqxPn3SJH
 vRpImDkDfnrlFPGXxMplZ7IOXH7+JtqSZxsQc58nYfAduLcyZS877OYUWiLWA8enAyRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0xhKDj9Cx+7ofhX/nPkkB5ooDTx7TfzOu+PlnLTeKoU=; b=msl5XYOalXEi/F0E7ycRPcADS4
 L6ffSw0+VZ8HJQzZxmB/9VqPYVhLItTCv1jYzTcNTlsTL7v9L68ni5wUjWbZEIaou6M1AwhWJiYLK
 YqYZ4it6g2GnUQkRAwsfQlwsaEQT8SLPNHLYGQLEei0b3iilLQy3eU9redrzlrTEp/38=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7Yk8-0000fS-Pk for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 12:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5867043DEF;
 Sat, 11 Oct 2025 12:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0702AC4CEF8;
 Sat, 11 Oct 2025 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760185826;
 bh=j5Do0yEYWFVVwdRlND6Cw+nMvx36/xJMFo/q2e6EW4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qr2Xk3SYbF/shCekw1NrIZgU01io5am9C34ipibY6blC++skZIKsKk+MpBJJFqA8x
 fvM8njFPXx/rFR0IPMJIXH5W+6vRU/tmFNi6hrAUAJ4TSxt26UMwvUUmyt89q2iayJ
 +iH1yxEFZvK62RTF44KH7WGq3DQb0xdKoDa9JWILq5eDBm4V7AlFR9+l805tWR7lDl
 XQe0y2dNoWGe+eZxMCZFe8IeU6TaMyRrzM6Cy5f9dWE/wl7UAaB86uBqCAhS+pmQxr
 +suhOphl7vVgCUg75OwNfQfWU2rR2e9dhbIN+juXwG7VvK0WpTHyt8+U2yFPF5ZZII
 RFuY/7jC4K1pQ==
To: jaegeuk@kernel.org
Date: Sat, 11 Oct 2025 20:30:16 +0800
Message-ID: <20251011123016.715964-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
In-Reply-To: <20251011123016.715964-1-chao@kernel.org>
References: <20251011123016.715964-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [ cut here ] kernel BUG at fs/f2fs/data.c:358! Call Trace:
 <IRQ> blk_update_request+0x5eb/0xe70 block/blk-mq.c:987
 blk_mq_end_request+0x3e/0x70
 block/blk-mq.c:1149 blk_complete_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: syzkaller.appspot.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7Yk8-0000fS-Pk
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix to do sanity check on node footer
 in {read, write}_end_io
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

-----------[ cut here ]------------
kernel BUG at fs/f2fs/data.c:358!
Call Trace:
 <IRQ>
 blk_update_request+0x5eb/0xe70 block/blk-mq.c:987
 blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1149
 blk_complete_reqs block/blk-mq.c:1224 [inline]
 blk_done_softirq+0x107/0x160 block/blk-mq.c:1229
 handle_softirqs+0x283/0x870 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0xca/0x1f0 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>

In f2fs_write_end_io(), it detects there is inconsistency in between
node page index (nid) and footer.nid of node page.

If footer of node page is corrupted in fuzzed image, then we load corrupted
node page w/ async method, e.g. f2fs_ra_node_pages() or f2fs_ra_node_page(),
in where we won't do sanity check on node footer, once node page becomes
dirty, we will encounter this bug after node page writeback.

Cc: stable@kernel.org
Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 13 +++++++++++--
 fs/f2fs/f2fs.h | 11 +++++++++++
 fs/f2fs/node.c | 24 ++++++++++++++----------
 fs/f2fs/node.h |  8 --------
 4 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 775aa4f63aa3..07dcc0211824 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -150,6 +150,12 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
+		if (F2FS_F_SB(folio)->node_inode && is_node_folio(folio)) {
+			if (f2fs_sanity_check_node_footer(F2FS_F_SB(folio),
+				folio, folio->index, NODE_TYPE_REGULAR, true))
+				bio->bi_status = BLK_STS_IOERR;
+		}
+
 		dec_page_count(F2FS_F_SB(folio), __read_io_type(folio));
 		folio_end_read(folio, bio->bi_status == BLK_STS_OK);
 	}
@@ -352,8 +358,11 @@ static void f2fs_write_end_io(struct bio *bio)
 						STOP_CP_REASON_WRITE_FAIL);
 		}
 
-		f2fs_bug_on(sbi, is_node_folio(folio) &&
-				folio->index != nid_of_node(folio));
+		if (is_node_folio(folio)) {
+			f2fs_sanity_check_node_footer(sbi, folio,
+				folio->index, NODE_TYPE_REGULAR, true);
+			f2fs_bug_on(sbi, folio->index != nid_of_node(folio));
+		}
 
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, folio))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b6e35fdd5fd3..839032a4da39 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1504,6 +1504,14 @@ enum f2fs_lookup_mode {
 	LOOKUP_AUTO,
 };
 
+/* For node type in __get_node_folio() */
+enum node_type {
+	NODE_TYPE_REGULAR,
+	NODE_TYPE_INODE,
+	NODE_TYPE_XATTR,
+	NODE_TYPE_NON_INODE,
+};
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr);
 static inline void f2fs_set_bit(unsigned int nr, char *addr);
 static inline void f2fs_clear_bit(unsigned int nr, char *addr);
@@ -3849,6 +3857,9 @@ struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 						enum node_type node_type);
+int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
+					struct folio *folio, pgoff_t nid,
+					enum node_type ntype, bool in_irq);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct folio *f2fs_get_xnode_folio(struct f2fs_sb_info *sbi, pgoff_t xnid);
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2bb9e6d35080..e70c970a3047 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1500,9 +1500,9 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 	f2fs_folio_put(afolio, err ? true : false);
 }
 
-static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
+int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
-					enum node_type ntype)
+					enum node_type ntype, bool in_irq)
 {
 	bool is_inode;
 
@@ -1544,13 +1544,16 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 		goto out_err;
 	return 0;
 out_err:
-	f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
-		  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-		  ntype, nid, nid_of_node(folio), ino_of_node(folio),
-		  ofs_of_node(folio), cpver_of_node(folio),
-		  next_blkaddr_of_node(folio));
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
-	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+	f2fs_warn_ratelimited(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
+		"node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
+		ntype, nid, nid_of_node(folio), ino_of_node(folio),
+		ofs_of_node(folio), cpver_of_node(folio),
+		next_blkaddr_of_node(folio));
+	if (in_irq)
+		f2fs_handle_error_async(sbi, ERROR_INCONSISTENT_FOOTER);
+	else
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 	return -EFSCORRUPTED;
 }
 
@@ -1595,7 +1598,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 		goto out_err;
 	}
 page_hit:
-	err = sanity_check_node_footer(sbi, folio, nid, ntype);
+	err = f2fs_sanity_check_node_footer(sbi, folio, nid, ntype, false);
 	if (!err)
 		return folio;
 out_err:
@@ -1769,7 +1772,8 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 	/* get old block addr of this node page */
 	nid = nid_of_node(folio);
 
-	if (sanity_check_node_footer(sbi, folio, nid, NODE_TYPE_REGULAR)) {
+	if (f2fs_sanity_check_node_footer(sbi, folio, nid,
+					NODE_TYPE_REGULAR, false)) {
 		f2fs_handle_critical_error(sbi, STOP_CP_REASON_CORRUPTED_NID);
 		goto redirty_out;
 	}
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 9cb8dcf8d417..824ac9f0e6e4 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -52,14 +52,6 @@ enum {
 	IS_PREALLOC,		/* nat entry is preallocated */
 };
 
-/* For node type in __get_node_folio() */
-enum node_type {
-	NODE_TYPE_REGULAR,
-	NODE_TYPE_INODE,
-	NODE_TYPE_XATTR,
-	NODE_TYPE_NON_INODE,
-};
-
 /*
  * For node information
  */
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
