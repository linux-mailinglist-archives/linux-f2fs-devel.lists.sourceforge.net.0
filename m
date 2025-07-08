Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D032FAFD447
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09oCuOPe7qO7r5F7jfkrWIX6Hjh8EHrSSqEcEGTcIxI=; b=Ty6uo28T+CA8/kNn3q5+OjAQvL
	SPREeZl2Orazh+niLCqlpVVVHkfEGa+bGhjtuz/9J0uKBo8o+rBwkSKpztqQjE7tHvjA1Z8zb6Xme
	rVaW5OWI4i/tS5vjfPB4aictprIqj7efH0OQ47Vu1HEUDpK/3Usvt7llI5qKTs7QYdVE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk0-0002sl-Mz;
	Tue, 08 Jul 2025 17:04:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjx-0002qX-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtLgyPVOH2toaYTm2SMwGjy4upOF9YiheG2RSXlIRgo=; b=iCvQfthEXZbvM5FsrP7sKEIbiO
 6Ay1qTX+34eWSpcaDLe5vuz8u5+zo7OkiWNfFzVdQPQu35+ec6BgPrP3i1ph72wAwFLXmXkz9e75k
 Gl+LdBnsUo7BWZWA5IMTwGBqiPzv/8dDuQomAIJRU4W8Gyrbp2gsmvH/cN5FkPLMOUfo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtLgyPVOH2toaYTm2SMwGjy4upOF9YiheG2RSXlIRgo=; b=ayf/DKO4qPw8ohzKuMtmfIT4Aj
 v2SMbdYojN5G6FEl15A0uVp8tMXDg9p4F0Mi3Jsx8renLhmqUE15aD2lburN7ePwOmESYi3/N8/Vy
 fXjuNUfEI7PicBR5mne+6Ah3lDXS8rDeA4MTH5CMK2LRHFdpcbZ2TResNQx2XJONJ2Fc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjx-0006HR-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HtLgyPVOH2toaYTm2SMwGjy4upOF9YiheG2RSXlIRgo=; b=GkIVCHA8klnOx4pZJJeuNNO2rU
 q1oeZwWB2C1ZpYKYF7SdxeVDAAMc1SekGQEkndxmwzp/nzwOqQ+SLTw35m3v3O1cFZ4Nrm6mv+e6j
 FyDPASfq9UZoZ4AZ+GDREyddlYMP4ozksMpdopNAp1FcaNmVvQ0fNBabOIqdMLSYTWM7V0nQs+tDI
 IUiyvg9lM9dCywX2+vuyKs1zjFlQbw2Cic/RGSXR1UVLvCYSw6RbXaBKd34zH9Y1YSUCap+MSoqTv
 oI1T4+M9vkdzkQdionltimk2peGLS7JW4tuihYNyKyxlUapZ++pU51Ugx8ng5/IXvG/1b7ItjZI03
 zcAvlJfQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T9e-3qr4;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:55 +0100
Message-ID: <20250708170359.111653-59-willy@infradead.org>
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
 Content preview:  Most callers pass NULL,
 and the one that passes a page already
 has a folio. Also convert __submit_merged_write_cond() to take a folio.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 8 ++++----
 fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c | 2 +- 3 files changed, 6 insertions(+),
 6 deletions(-) 
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
X-Headers-End: 1uZBjx-0006HR-C2
Subject: [f2fs-dev] [PATCH 58/60] f2fs: Pass a folio to
 f2fs_submit_merged_write_cond()
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

Most callers pass NULL, and the one that passes a page already has a
folio.  Also convert __submit_merged_write_cond() to take a folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c    | 8 ++++----
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/segment.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 18c5b619f48e..b82d8784248e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -638,7 +638,7 @@ static void __f2fs_submit_merged_write(struct f2fs_sb_info *sbi,
 }
 
 static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
-				struct inode *inode, struct page *page,
+				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type, bool force)
 {
 	enum temp_type temp;
@@ -650,7 +650,7 @@ static void __submit_merged_write_cond(struct f2fs_sb_info *sbi,
 			struct f2fs_bio_info *io = sbi->write_io[btype] + temp;
 
 			f2fs_down_read(&io->io_rwsem);
-			ret = __has_merged_page(io->bio, inode, page, ino);
+			ret = __has_merged_page(io->bio, inode, &folio->page, ino);
 			f2fs_up_read(&io->io_rwsem);
 		}
 		if (ret)
@@ -668,10 +668,10 @@ void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type)
 }
 
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
-				struct inode *inode, struct page *page,
+				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type)
 {
-	__submit_merged_write_cond(sbi, inode, page, ino, type, false);
+	__submit_merged_write_cond(sbi, inode, folio, ino, type, false);
 }
 
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1ea8ecffec83..3ae1f15205c5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3982,7 +3982,7 @@ void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
-				struct inode *inode, struct page *page,
+				struct inode *inode, struct folio *folio,
 				nid_t ino, enum page_type type);
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 					struct bio **bio, struct folio *folio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 667611c86f8c..ab64c262dcf6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4197,7 +4197,7 @@ void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
 		struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 
 		/* submit cached LFS IO */
-		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, type);
+		f2fs_submit_merged_write_cond(sbi, NULL, folio, 0, type);
 		/* submit cached IPU IO */
 		f2fs_submit_merged_ipu_write(sbi, NULL, folio);
 		if (ordered) {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
