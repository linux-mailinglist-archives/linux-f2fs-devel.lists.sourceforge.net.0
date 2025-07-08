Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA65FAFD424
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1Dz6T/sGAsThAkbAlncYKArgFlvlIOQNsrHfc3gqxo=; b=DOe4E16+CJ8VEPgXknJJ226LWA
	rxpa5f9Sw4vTidVFTmn1QnGIGjECESjYcCewWDdEJgcUniVyghxtolHJ9zwDeU0yTa/Xj2L3zUAfw
	vmTz70UVQqoiF2gK47fBZ7352GmjNuokbaDJZjmOSWnUMXIPi/uCNQVFxo9iEEYFNsO8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjq-0002lo-6O;
	Tue, 08 Jul 2025 17:04:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjo-0002lK-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gPA3bBHTK0+dZhKmCFqJx5j8ESnHGrMpOaaT0GaWJk=; b=WKKjS8rTFM8VFt/QNEFqm2O2yM
 4wKm+dpH8sQglJa6GCoHMxa5G2DYcCQ3kD+7Fvdn59EZkHYjkGr4EiakNrVHkhPz+H/ZfCNFgGGCm
 kD02YQ6umv7jm9n1TMbHMuP25h1l4dYNS+0Q7zEU95QprXS+X5jpJVhWe34ocEhNuThw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gPA3bBHTK0+dZhKmCFqJx5j8ESnHGrMpOaaT0GaWJk=; b=VOAuZle+cm8akmnZA18udQErBh
 gM7OYSsEpkDywUJ7HQcI9kqJRfqLZRL4rc3D8PjlHdY2Vp+MMVkGuHEeUGrZXuC7SxiDdmTw5Tg1T
 3pv6ra8eK4I4rInMvWObhLadIyOazS5X4Ivirw+lxGSk+WXkBVahI99Qpas4VvsQ/AJI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjl-0006E1-Rr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8gPA3bBHTK0+dZhKmCFqJx5j8ESnHGrMpOaaT0GaWJk=; b=cQlVKuRlKSfGeKY89MCKXTQccs
 yUkwYTUsd3OuAKiPFni1PDOPeHsKMVJdTn9/lQJe3m1dlzOT8EFaFt6c23X4Mq2/yZO8by/hHKvKP
 bqH6dBKtoEhQmsEzJeG2OrvgkbnuNnrDCcczDveJaYIuMrk041c7dbMgdE09oA+WYHPF/Ro16yqgw
 7zKskkELVZFgz0epZA8vvoiecemUJIdu5CrYVspiLfVL18BTdYubv9kXRi3GvJov8BrCvGL+hIYTK
 KiQgH+ZUOGWs9wuQvkBKEFjyPbeEDW/SWBVGlhX+gSdLaa67mPA6ovRa5EwykNwNpHyRBNxIHy2iT
 AA5S2/Dg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4c-1sS5;
 Tue, 08 Jul 2025 17:04:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:11 +0100
Message-ID: <20250708170359.111653-15-willy@infradead.org>
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
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 6 +++---
 fs/f2fs/node.h
 | 2 +- 2 files changed, 4 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1uZBjl-0006E1-Rr
Subject: [f2fs-dev] [PATCH 14/60] f2fs: Pass a folio to set_fsync_mark()
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
 fs/f2fs/node.c | 6 +++---
 fs/f2fs/node.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f964b526b73c..db41d41f03db 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1862,11 +1862,11 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 
 			f2fs_folio_wait_writeback(folio, NODE, true, true);
 
-			set_fsync_mark(&folio->page, 0);
+			set_fsync_mark(folio, 0);
 			set_dentry_mark(folio, 0);
 
 			if (!atomic || folio == last_folio) {
-				set_fsync_mark(&folio->page, 1);
+				set_fsync_mark(folio, 1);
 				percpu_counter_inc(&sbi->rf_node_block_count);
 				if (IS_INODE(&folio->page)) {
 					if (is_inode_flag_set(inode,
@@ -2086,7 +2086,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			set_fsync_mark(&folio->page, 0);
+			set_fsync_mark(folio, 0);
 			set_dentry_mark(folio, 0);
 
 			if (!__write_node_folio(folio, false, &submitted,
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 69384832f84b..7e7578a547ad 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -433,4 +433,4 @@ static inline void set_mark(struct page *page, int mark, int type)
 #endif
 }
 #define set_dentry_mark(folio, mark)	set_mark(&folio->page, mark, DENT_BIT_SHIFT)
-#define set_fsync_mark(page, mark)	set_mark(page, mark, FSYNC_BIT_SHIFT)
+#define set_fsync_mark(folio, mark)	set_mark(&folio->page, mark, FSYNC_BIT_SHIFT)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
