Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D452CCE4C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 03:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SKf56a0j0yF2Or56mFihGrlQzozxgqDK1UEt3g7F2kM=; b=QisdX85OksaPmFoQh7p+WV1Qtj
	7DPnioEgMWsZFHLfr4WxrypQ8HxYLmY6NrzRv0k6dZdW5QXCll65plPKTJREeHkMxUouZlxMovFO8
	+FZ27bHLARtzS/h8fYoTRqVUSwNGngK1ZlxJ/mUMEz3IVujaMcpBuN3RlQ6OyNFWDdHM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQaU-00062T-Rt;
	Fri, 19 Dec 2025 02:51:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vWQaS-00062L-OL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 02:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x8SW513lw3j5EMdR5aHsPDNaU5pTRk0z7eQFpqmypbs=; b=KAH85GGVw+YNL2fViz0nUH40jf
 7IGDPZzMbqKenTyjfIzcNPgJofhjEaRxhn4u9gEGur4XCsvGRmA+oCd8eI6luR0pn9D9hqxPgt03w
 fNSc8+H733EHlRVJAXfTWh0h15Q3MxHXvVnaMbxb/WQRzN0szM9RKAUy3w+Xmm2jW5x0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=x8SW513lw3j5EMdR5aHsPDNaU5pTRk0z7eQFpqmypbs=; b=I
 CyB7DFNmxejk0BlAn0+norO1tAJH8f0X1FovJ5daGdYqwg4lui9aTKwwrKIzU9x7OQjmyFHEEB9ol
 s+Q8uQZjUmumpgWiQACpzPwiJHZBWiO+QqiRY93Ds/cgvOekMCkyeIJVLpsMEOZ/TZQlAP2dzeF1m
 PIuBDigsHl0aQx1k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWQaS-0000II-9j for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 02:51:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F164740E47;
 Fri, 19 Dec 2025 02:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D61C4CEFB;
 Fri, 19 Dec 2025 02:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766112673;
 bh=7nwCctVE0n04bviYWEMRF8gtPwvj7IsimGq8Wj7WUl8=;
 h=From:To:Cc:Subject:Date:From;
 b=I0P7tJuxD56IXkEonlbp43xxYNj4EXaxS8vprt8+3XlEF4zh4ed6w+qI2jky72n7I
 QklXFJGFGOOMuzN+vg0QLK+3Udjg2rSnBG5vGWWRy+1bItAnhzpSiRHcZQMfTlYPnJ
 HwOX5D8hCigSMCTVNBa05FRm03slQ35v2q5Sb+8gNplYM9vMSsrmYFoe8+yQyv2v1P
 0El6c0iFLGtk0nSAlivjAbAGcFJ2/zgCTfqYYkf3x5TxCYAdNFjSFdS9dMvlN0jyzY
 P+LfDtcBN6vdpysYPcGBEdljULSImkHOj1aDot5gYHq10QLBK/cik1P0Kjx3HAO1+/
 dHPz7ZZLx1XOQ==
To: jaegeuk@kernel.org
Date: Fri, 19 Dec 2025 10:51:04 +0800
Message-Id: <20251219025104.12256-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As Zhiguo reported,
 nat entry of quota inode could be corrupted:
 "ino/block_addr=NULL_ADDR in nid=4 entry" We'd better to do sanity check
 on quota inode to detect and record nat.blk_addr inconsistency, so that we
 can have a chance to repair it w/ later fsck. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vWQaS-0000II-9j
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on nat entry of
 quota inode
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Zhiguo reported, nat entry of quota inode could be corrupted:

"ino/block_addr=NULL_ADDR in nid=4 entry"

We'd better to do sanity check on quota inode to detect and record
nat.blk_addr inconsistency, so that we can have a chance to repair
it w/ later fsck.

Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  |  6 +++---
 fs/f2fs/inode.c |  2 +-
 fs/f2fs/node.c  | 11 +++++++++++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65ca1a5eaa88..c458df92bb0d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4928,16 +4928,16 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
 	return false;
 }
 
-static inline bool f2fs_quota_file(struct inode *inode)
+static inline bool f2fs_quota_file(struct f2fs_sb_info *sbi, nid_t ino)
 {
 #ifdef CONFIG_QUOTA
 	int i;
 
-	if (!f2fs_sb_has_quota_ino(F2FS_I_SB(inode)))
+	if (!f2fs_sb_has_quota_ino(sbi))
 		return false;
 
 	for (i = 0; i < MAXQUOTAS; i++) {
-		if (f2fs_qf_ino(F2FS_I_SB(inode)->sb, i) == inode->i_ino)
+		if (f2fs_qf_ino(sbi->sb, i) == ino)
 			return true;
 	}
 #endif
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 921fb02c0f49..d1270b25ad7d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -621,7 +621,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_fop = &f2fs_file_operations;
 		inode->i_mapping->a_ops = &f2fs_dblock_aops;
 		if (IS_IMMUTABLE(inode) && !f2fs_compressed_file(inode) &&
-		    !f2fs_quota_file(inode))
+		    !f2fs_quota_file(sbi, inode->i_ino))
 			mapping_set_folio_min_order(inode->i_mapping, 0);
 	} else if (S_ISDIR(inode->i_mode)) {
 		inode->i_op = &f2fs_dir_inode_operations;
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7feead595ba5..f1e6fa2dccc9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -643,6 +643,17 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		return -EFSCORRUPTED;
 	}
 
+	if (unlikely(f2fs_quota_file(sbi, ni->nid) &&
+		!__is_valid_data_blkaddr(ni->blk_addr))) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_get_node_info of %pS: inconsistent nat entry from qf_ino, "
+			"ino:%u, nid:%u, blkaddr:%u, ver:%u, flag:%u",
+			__builtin_return_address(0),
+			ni->ino, ni->nid, ni->blk_addr, ni->version, ni->flag);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
+	}
+
 	/* cache nat entry */
 	if (need_cache)
 		cache_nat_entry(sbi, nid, &ne);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
