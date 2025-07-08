Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B836AFD446
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0PjcnjUYeP/iMPVZDqDzZX5IsDZgjLo/A/PBRfl2nU=; b=jTFX1rDPjGLSwl9BGbkZj2aaOx
	zE0tnX2RUP8WiRDXDYk6yThFosuHXmOwddHhFwKDpJ4VvSEe4LKq4j/ClCPIJAHCi5hGlkcjWnnY3
	RznfbVQ6gQeNFJRz0mecmQUaajxI2yz7ddt+wCpFsbEs5byyCvZudt1FW5nD64ESIU8Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0005XX-FW;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0005V4-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=moXPZDdMAcuiR+MD4EWvc+34DuXo+C50yJGLuy/xMTM=; b=H1DdFniCkjyL54nTCzqEdA529C
 Bc/u0Jj74uKOeK+L7YaquYm2AqPOc8lxPV+7GisAKNiCGDNAZZIBQedVn3DrgTT/Nq1msbLSTKLzx
 KjWsAz5sGYLq/twTdYSE9/gNgsnHprThgN+/ttVZXpKVyFn+px/55Lj9F/zCKqxCMGiQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=moXPZDdMAcuiR+MD4EWvc+34DuXo+C50yJGLuy/xMTM=; b=Jfe6tyzlT52p5/sxFyj/eggJGE
 h4MNQGYKwPEBmm3pyWIsICc5VsRJb0fSjweAWPoIrE66pYrlc9tcwtllcq8m4bh+ndxTq4WeQ+5wP
 z32SsrORO12AEJUADTs8UHh1MF+99oK/jZeZtSaNTJScWMFEvOGVCOkvG+XebT6WSyCU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjn-0006EC-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=moXPZDdMAcuiR+MD4EWvc+34DuXo+C50yJGLuy/xMTM=; b=cNWAd7iqbdqdo09xqTQu/0bK/H
 WfsWcFtDcOAeIFfROnpU35flk2fmf7agEsiEhUtWxlLp1wQ9nM4tJAPCd9gDf9ynrp7h1KhBMGrlS
 7SI208vzz8Lw6NSyZ9hI3n/9dzL+Csgj2/FmotuOuzT9aMuwHGR/51pxElcYerc/pQ5tFp02sf5OE
 sXHkfyIZwNvlEvNZ7KDlWYvl4s9ipg+S7kOnbSxOFK70vGXKqm/RXljPHssaOPZt1hJLrsaA3w7qS
 QweNmO0grZDiZBLuxQp9gk1wksmrFXpiT5dG+iqwXkNJergP5x2xrj1OW1hTrSPOdBDkTswq70v0V
 syBxS/Fw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T5i-0Qhg;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:22 +0100
Message-ID: <20250708170359.111653-26-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 2 +- fs/f2fs/node.h
 | 8 ++++---- 2 files changed, 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjn-0006EC-H7
Subject: [f2fs-dev] [PATCH 25/60] f2fs: Pass a folio to cpver_of_node()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 2 +-
 fs/f2fs/node.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9c47f1e73421..89a27bbc0226 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1485,7 +1485,7 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
-			  ofs_of_node(page), cpver_of_node(page),
+			  ofs_of_node(page), cpver_of_node(folio),
 			  next_blkaddr_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 91a037a1815d..f8d26d1b9cd0 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -262,9 +262,9 @@ static inline unsigned int ofs_of_node(const struct page *node_page)
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
-static inline __u64 cpver_of_node(const struct page *node_page)
+static inline __u64 cpver_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_page);
+	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
 	return le64_to_cpu(rn->footer.cp_ver);
 }
 
@@ -321,12 +321,12 @@ static inline bool is_recoverable_dnode(const struct folio *folio)
 
 	/* Don't care crc part, if fsck.f2fs sets it. */
 	if (__is_set_ckpt_flags(ckpt, CP_NOCRC_RECOVERY_FLAG))
-		return (cp_ver << 32) == (cpver_of_node(&folio->page) << 32);
+		return (cp_ver << 32) == (cpver_of_node(folio) << 32);
 
 	if (__is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
 
-	return cp_ver == cpver_of_node(&folio->page);
+	return cp_ver == cpver_of_node(folio);
 }
 
 /*
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
