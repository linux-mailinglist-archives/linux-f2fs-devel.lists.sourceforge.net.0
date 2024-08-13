Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413595074B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHn-0008F6-8R;
	Tue, 13 Aug 2024 14:14:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHj-0008Ev-0I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1WWbNiSMb5R3onZ11REmsXLVkIPus+NYPhsIBIR+2wY=; b=EcAJ68FBhdRqw4uatlabJkaEiS
 VLsB7gWlXe0Bq5K+lMIGzXZSg6L2Ccg6QQjmRx4JRufweAc3ir9E7l269167XoAe/7ImwEWpPPkNG
 hG8LTih2ucagskID1r284vsiYYPcPxxvif9BOOi6j6CQKc0D84KAAm5MGqKZyrgMDSc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1WWbNiSMb5R3onZ11REmsXLVkIPus+NYPhsIBIR+2wY=; b=JUxX8V7l72HJRSCAyR/d35WsBt
 gVUhZ3P9S6nhaurAlt/u9CRXv2NwFy9KnRo9rOl2oG5eEbKT6WN7dybBYTyB2CRzLgWrAGC74syKu
 mdex+NX8gZLhYwfxkYEsp/W/9evvTaRwlI7yVKnD2G68emjd6AsQZ0TSviYqIET396bY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHh-0001Cv-S8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B237CE13C8;
 Tue, 13 Aug 2024 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06D3C4AF09;
 Tue, 13 Aug 2024 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558434;
 bh=zSV7Y8/YinzwLLmItU/Jrj8HlYLGg1vRnshuh+Net40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cENiMq50qkOxvacUzSIJQ0H3mYQZqwrwZCRVGoYN/NYxAR4585QmwPv2X6oIP25Ab
 +B76atRtnt0i0vPyV7ey+Chz74u3vxo+tQq8F0t1Qe4xkPzWm3Q1mfOutV+68ZHGfL
 gL3LAax+IAfoYEUZrQJds2PqTvQDUgxE6F4KPVpR6JhwYjPtXgX52lpn8OTmbbqsHZ
 IWI+Ak0DCF4/y0cNtJ3ssz4YxBbN0FfnDQwRKH129F8CMspElDySjW1R+AThPzK9Gn
 i8EdSn8PIad5ggpkQmwCoImIan/FSUPZrogTJO1c6XfIUmXgDv6iWJ0lPsUMtg6z9y
 1skICs8iQDGcg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:28 +0800
Message-Id: <20240813141331.417067-6-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/checkpoint.c | 2 +- fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c |
 14 +++++++------- 3 files changed, 9 inserti [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHh-0001Cv-S8
Subject: [f2fs-dev] [PATCH 6/9] f2fs: convert f2fs_do_write_meta_page() to
 use folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/segment.c    | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f3d22b8ef2ff..d73d4d05313e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -362,7 +362,7 @@ static int __f2fs_write_meta_page(struct page *page,
 	if (wbc->for_reclaim && page->index < GET_SUM_BLOCK(sbi, 0))
 		goto redirty_out;
 
-	f2fs_do_write_meta_page(sbi, page, io_type);
+	f2fs_do_write_meta_page(sbi, page_folio(page), io_type);
 	dec_page_count(sbi, F2FS_DIRTY_META);
 
 	if (wbc->for_reclaim)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5800ac90a5f7..c29ed8b6eea6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3732,7 +3732,7 @@ bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno);
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi, void *src,
 					block_t blk_addr);
-void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
+void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
 						enum iostat_type io_type);
 void f2fs_do_write_node_page(unsigned int nid, struct f2fs_io_info *fio);
 void f2fs_outplace_write_data(struct dnode_of_data *dn,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 741e46f9d0fd..2d1965bed443 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3822,7 +3822,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		f2fs_up_read(&fio->sbi->io_order_lock);
 }
 
-void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
+void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
 					enum iostat_type io_type)
 {
 	struct f2fs_io_info fio = {
@@ -3831,20 +3831,20 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct page *page,
 		.temp = HOT,
 		.op = REQ_OP_WRITE,
 		.op_flags = REQ_SYNC | REQ_META | REQ_PRIO,
-		.old_blkaddr = page->index,
-		.new_blkaddr = page->index,
-		.page = page,
+		.old_blkaddr = folio->index,
+		.new_blkaddr = folio->index,
+		.page = folio_page(folio, 0),
 		.encrypted_page = NULL,
 		.in_list = 0,
 	};
 
-	if (unlikely(page->index >= MAIN_BLKADDR(sbi)))
+	if (unlikely(folio->index >= MAIN_BLKADDR(sbi)))
 		fio.op_flags &= ~REQ_META;
 
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 	f2fs_submit_page_write(&fio);
 
-	stat_inc_meta_count(sbi, page->index);
+	stat_inc_meta_count(sbi, folio->index);
 	f2fs_update_iostat(sbi, NULL, io_type, F2FS_BLKSIZE);
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
