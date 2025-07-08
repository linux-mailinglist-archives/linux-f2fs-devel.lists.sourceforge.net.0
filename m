Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8048AFD421
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaGYm7YG/2Wz8kz+iSs+0Ok3s87DYbmpEotzIKxBkdo=; b=M2NcJgpjOTsCB5o8Dq2NMxSioc
	qq+HN2/eOnNXX13RQevF7DdInGb3sMLMtxj2i6bRvcPOl11cVNIYlNmMFxZHPBQYezeaqgdG3T/wI
	BZMhAs4CFhABvgVr6+u8CnZX1H6hcV+XWNn5iBC5rhHmMBEcGXl+JfSZvwJ6YOKWvNzw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjp-0005Uz-3d;
	Tue, 08 Jul 2025 17:04:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjo-0005Us-5l
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F4/w04KQO0VdKX7p0ZrOXgL2D1LHACZJ081o3J0pqpY=; b=mgJ93QZUW+ee2KdCVlOEF3Jf3v
 AxpeifimnawGwmF/PNmeAO4H/1hXBloYNqpPQuDdfPIUO9P6zZa6NrfqLYhBA2Qzo6hQx4Sid0kUI
 seiB/s6MX0R30/urNjLqF6+IT2fO249YqCd1iWutJML6Fq0w7fjqsAIGwRTGGC8XDnqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F4/w04KQO0VdKX7p0ZrOXgL2D1LHACZJ081o3J0pqpY=; b=m1t7UnCL+hcsnaaqHM0qJoJRI1
 l4r5qvsawyOxH4FDM4SpFFXJUjmrfjLJcalI5fUji6yJUQwNXRdWsG0BjneidNqELwHIyb4DDIMiN
 2g0Yo9GoNHxX3PjJwwNkJBw23aQdyTeISpbHmvK6FBuqarkCYcnnxN1RRoiQafCaUzkk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjn-0006ED-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=F4/w04KQO0VdKX7p0ZrOXgL2D1LHACZJ081o3J0pqpY=; b=LZKu+x91OekwL9f4ZQawgqoG9F
 srksH6nDcYDdgdHIAsSeqiYfibcmlzrCNphGZ/eq8AyWUoAJFLx2UIAg3dXn68l9qbK6U2lMskj1d
 nny8U0qnHItUjUIMLY9+72u9Xs1OltXDvK+EfqGFbRag7Doq9fakD2QHLYggyK3sRlyUxKYJATFx5
 2uHbiqNkLHaIlHDFgrfiabeVai6mg1EwaXfU82J9zYXo6X7vSPb90D4VCRkge3trGS0TMkEgSlnj7
 Rn7MOyj1eCGAdqiRZEqAv/aBx31G/JAamcPuGyLFJjOZYtkvBGziE4UUmd5D2RV/JoZKt75fZlv3a
 2zr1R2QQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T5u-1Y4O;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:24 +0100
Message-ID: <20250708170359.111653-28-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 2 +- fs/f2fs/node.h
 | 2 +- fs/f2fs/recovery.c | 2 +- 3 files changed, 3 insertions(+),
 3 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjn-0006ED-Qf
Subject: [f2fs-dev] [PATCH 27/60] f2fs: Pass a folio to is_fsync_dnode()
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

Both callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c     | 2 +-
 fs/f2fs/node.h     | 2 +-
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f8620b262b72..7ea5a98399a7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1744,7 +1744,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	fio.old_blkaddr = ni.blk_addr;
 	f2fs_do_write_node_page(nid, &fio);
-	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(&folio->page));
+	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(folio));
 	dec_page_count(sbi, F2FS_DIRTY_NODES);
 	f2fs_up_read(&sbi->node_write);
 
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index f8d26d1b9cd0..17afa6d51053 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -404,7 +404,7 @@ static inline int is_node(const struct page *page, int type)
 }
 
 #define is_cold_node(page)	is_node(page, COLD_BIT_SHIFT)
-#define is_fsync_dnode(page)	is_node(page, FSYNC_BIT_SHIFT)
+#define is_fsync_dnode(folio)	is_node(&folio->page, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(page)	is_node(page, DENT_BIT_SHIFT)
 
 static inline void set_cold_node(const struct folio *folio, bool is_dir)
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 01704055b4c2..3434be2d7865 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -429,7 +429,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			break;
 		}
 
-		if (!is_fsync_dnode(&folio->page))
+		if (!is_fsync_dnode(folio))
 			goto next;
 
 		entry = get_fsync_inode(head, ino_of_node(folio));
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
