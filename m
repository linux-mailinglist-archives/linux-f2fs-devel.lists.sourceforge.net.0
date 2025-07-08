Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF0EAFD449
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGGPXMJnbWnMmSSWbNBFcBZWiWG3fSww1DiDn8z+vtY=; b=YhZonFGuWL3rg9NkO/8AOJqZQr
	dZTa1JpYTYB7LPJZvSPNxa3J7kywMt3VhQsGZwxJWGWXa4ny9JsLIjAqpwvANLPZXPgVcrvbYLuaQ
	7Nrr+IWbZeF2LkGC5mnq9lFjx0HV3B0cIs/FpwoPxR1SQwq6Cmioduhh3bFqxPlD8iZo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0005Xm-QV;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0005VH-Iu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3j1riwNPs/7slBAqmemXanZXjUjg2gNegyuqdx7dcjE=; b=ScOQ8M+Dom5nBrcqe7t9f7rO13
 g5vwLLaFZmd9s+cieG1OHca2OwFsYpN5yOzyTORHrXFTmoV2jKxpzWFsT3vR/ksb12xVAeRuHltWA
 rMJBZpg8LzHop8Hf9i/ZZsOqdTGAJ4q33zKDNHBnvu44mUx5kefZsIew1lUQRf/7Ybbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3j1riwNPs/7slBAqmemXanZXjUjg2gNegyuqdx7dcjE=; b=gTotin0NldT4U4O+ntoPuoK4tm
 FQrXbZqaj0/PeU7X8qJZnkae8Y99b+RKkroH6AtGeeUesUrsrrSvjUHBiHDGfo5Z9btwzM4zH5Tk4
 ei6IxL4x/xELpG4gCIrCsNZMW8UE1p/QP1uhkVLi2pA8PTkTWi45kDTLf4jvApBono+w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjm-0006E2-AL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3j1riwNPs/7slBAqmemXanZXjUjg2gNegyuqdx7dcjE=; b=QVuygs2H6MBJLU8+VK/0Z7aczA
 tsPlLWQ3GDwAAmBNaG4oV5swyVJjfmL9umgGQ7KNdF9QG/jUCBlKhDDHEuKCn1ut6KATFF2xbKCR1
 wRFzM+gtq+lh4SuC03bAXycdWIxmQoPrST9bbZtnM4hDFV/LgZRZS9Ip+kqXRBAQ3PIeNPGEE+yq4
 kEu8Y5EYzhGwkzQdShqHWpqnkoILkOecYQm2FUCSmKEDqRTp0hfF0oef5A8rrUcZFNkIKiqD4nECO
 t3y7Et2RQXDRe6rGwD+GjY+wSomkhsA31ixT/sFQjtJn/Yg2TytZGUb5S/5NosVjmnYpSYULo7gst
 y7Qr1KCw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4o-31zu;
 Tue, 08 Jul 2025 17:04:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:13 +0100
Message-ID: <20250708170359.111653-17-willy@infradead.org>
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
 Content preview:  Most callers pass NULL,
 and the one which passes a page already
 has a folio, so we can pass it in. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c | 10
 +++++----- 2 files changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1uZBjm-0006E2-AL
Subject: [f2fs-dev] [PATCH 16/60] f2fs: Pass a folio to
 f2fs_allocate_data_block()
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

Most callers pass NULL, and the one which passes a page already has a
folio, so we can pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h    |  2 +-
 fs/f2fs/segment.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ae66c40c4b7d..7488ebc7b390 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3858,7 +3858,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			bool recover_newaddr);
 enum temp_type f2fs_get_segment_temp(struct f2fs_sb_info *sbi,
 						enum log_type seg_type);
-int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
+int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
 			struct f2fs_io_info *fio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5653716460ea..91f32c113da4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3747,7 +3747,7 @@ static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
 		get_random_u32_inclusive(1, sbi->max_fragment_hole);
 }
 
-int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
+int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct folio *folio,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
 		struct f2fs_io_info *fio)
@@ -3851,10 +3851,10 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	up_write(&sit_i->sentry_lock);
 
-	if (page && IS_NODESEG(curseg->seg_type)) {
-		fill_node_footer_blkaddr(page, NEXT_FREE_BLKADDR(sbi, curseg));
+	if (folio && IS_NODESEG(curseg->seg_type)) {
+		fill_node_footer_blkaddr(&folio->page, NEXT_FREE_BLKADDR(sbi, curseg));
 
-		f2fs_inode_chksum_set(sbi, page);
+		f2fs_inode_chksum_set(sbi, &folio->page);
 	}
 
 	if (fio) {
@@ -3941,7 +3941,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 	if (keep_order)
 		f2fs_down_read(&fio->sbi->io_order_lock);
 
-	if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
+	if (f2fs_allocate_data_block(fio->sbi, folio, fio->old_blkaddr,
 			&fio->new_blkaddr, sum, type, fio)) {
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
