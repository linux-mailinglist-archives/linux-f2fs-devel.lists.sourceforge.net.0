Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBAAFD43E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoF+0MeekxH1o/9yEYmODGvqS71E5sVQowuVu1/gTq8=; b=m4XVppyvZLz6u28G5+mzpBIQWK
	chx8B+ky4PTY/IRUmkSHmUxFpACGFjDwXbI7gcTOP+qUfotp4h/WHTiFklOm6etK7mN3dyKaPNiNF
	irVvxlx4Gf3Oc1oRRiwc3tCsxfEoCs/5fUxiZofvVvooHkbIqyVz27nj+Qh46R0o+6Y8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjy-0005I6-8E;
	Tue, 08 Jul 2025 17:04:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0005Fm-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AZp9UX0CE168x4PJWjZ3VHXWl6nB1HhF4TSGgM6muBs=; b=cq+f4wvzOPU2tNW3rvH3mHbxIF
 la0dqnTwzO7kBr3bsf3vN5tUT8dnA6tIfsXy8XpJz6uhjK7ZXpJLCCNmtllZeQ5X2nC2Tx80Np35m
 kMdBMeA00S14OQnuP46xtmsxoabSthXyzKFgJwujwigHW81JtWC7AmCBMuiacYS0pEsQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AZp9UX0CE168x4PJWjZ3VHXWl6nB1HhF4TSGgM6muBs=; b=FlcZ4soHy7n3nSRTSf0y0CnB8z
 1Sr0BrjbTq1mz7IEM+hvVVJG0ibg65VMXZ1X/teycfs2W9wOl/La8sPA3XLUN19aUKDxd9piBeYiD
 VYXy6/X1uZtdGprvGxJj5tDMV77/Qgk4HGKxAyeYbAeaMi739Lk3OZIGZPVnwmH7yEvM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjs-0006F2-9k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AZp9UX0CE168x4PJWjZ3VHXWl6nB1HhF4TSGgM6muBs=; b=L3w3OXSQfwvz9iIuV1DqDpxlHJ
 +3kithGrNxi+D9Sif+xeMIDi1lj+Nv14x8A2ySzvNs5ZynPWgYoIYlWqUy96FgTQJIj0O08oLFY7d
 LHXXC5UO2KJo0RwFFBJUi3H3seoP0eYly3Vd9oYLRCPW8Nr3XfxUfvktULCGwOSgNoiVaL5YMQ4lZ
 SQMeRAi0WTNeAnN3IA6lJOxDQse1JQGjwNmOOm28apPh119y32HYJBpmqNHa7SKSbcjuQEtnP39R0
 qZ0GcaORjVooSPTbFSEgKYQYTJGjbMd8YrFlUsjEKCVVgzJdhm75RuHkGA9cPzH1/G7cCcK4GpXtb
 S5FxmKCw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjg-00000000T5V-3bDy;
 Tue, 08 Jul 2025 17:04:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:20 +0100
Message-ID: <20250708170359.111653-24-willy@infradead.org>
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
 Content preview:  The only caller has folios so pass them in. Also mark them
 as const to help the compiler. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.h | 7 ++++--- fs/f2fs/recovery.c | 2 +- 2 files changed,
 5 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1uZBjs-0006F2-9k
Subject: [f2fs-dev] [PATCH 23/60] f2fs: Pass folios to copy_node_footer()
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

The only caller has folios so pass them in.  Also mark them as const to help
the compiler.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.h     | 7 ++++---
 fs/f2fs/recovery.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index d1c15fc0ddd8..0fd4a09d6e2f 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -293,10 +293,11 @@ static inline void fill_node_footer(struct page *page, nid_t nid,
 					(old_flag & OFFSET_BIT_MASK));
 }
 
-static inline void copy_node_footer(struct page *dst, struct page *src)
+static inline void copy_node_footer(const struct folio *dst,
+		const struct folio *src)
 {
-	struct f2fs_node *src_rn = F2FS_NODE(src);
-	struct f2fs_node *dst_rn = F2FS_NODE(dst);
+	struct f2fs_node *src_rn = F2FS_NODE(&src->page);
+	struct f2fs_node *dst_rn = F2FS_NODE(&dst->page);
 	memcpy(&dst_rn->footer, &src_rn->footer, sizeof(struct node_footer));
 }
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 380055000083..185632ef790f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -758,7 +758,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 	}
 
-	copy_node_footer(&dn.node_folio->page, &folio->page);
+	copy_node_footer(dn.node_folio, folio);
 	fill_node_footer(&dn.node_folio->page, dn.nid, ni.ino,
 					ofs_of_node(&folio->page), false);
 	folio_mark_dirty(dn.node_folio);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
