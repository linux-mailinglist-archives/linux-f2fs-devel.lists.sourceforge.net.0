Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D79DB27A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:20:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWwo-00043L-FX;
	Thu, 28 Nov 2024 05:20:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWwn-00043C-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dy71ss898p37uRqaXMyONW8lh7P9naY2oExdKIClcn4=; b=PdVZpduCCBfun/+QBEQf4ZOFuY
 uOgEHoF3hQemxr+CpCVUyY2e+EeO3uRF5bCSCbNRwW99HB//5xxne1ttlqqnA3rdLuw7ueZpJK9qi
 zyDeTEm0iwcTgcBCSGNe6ecIVNqEd3dagLokCJacr+kA48YCmXspKD/4kLMVSZIbVwes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dy71ss898p37uRqaXMyONW8lh7P9naY2oExdKIClcn4=; b=TtFpwreMVezYlqazWs7x5YANmX
 mhmZkvQAV+aUfCwsSrIH7F2rPq8ZLU+g/tgwtgqGJZ0QEW8tbIEN2dwaztsbO4WtBzyQB784ZOoCp
 YcVjcTg8AF0SxEXlC9a1ZdCd8Q/XiZAly2TdGjvG1/mDLfCOKhiz+KA6E0t+x97/Z69Q=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWwn-0004id-KW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Dy71ss898p37uRqaXMyONW8lh7P9naY2oExdKIClcn4=; b=Qh9XW1eYE2QCJ2B4Jzon5iCr75
 dcZO5/Oc9ckmwiScFjlwwv+/TDXeMmIKuHkleYI8LxLUyv9EPGH2slnkuDcxyeSHEczxXu4XFGU8h
 MpZVQDtoKZkLPGsWEOl4hfmlzD91vFZqgy5Sn7wzImLh1bJK5MXtBR5oyVoCwlBg2zBPQ6UmZiqvT
 GlqfrXd5SU6Sv7vzyJCLWqQlBJCeGfOiuflU3NqNEJV0S/Wwa+zqfDvJK/IYB9M33iD+3lWXC8HAx
 1QYyr9xGe/EpB5Nuc4Fkb4d1nQ2/hqVDiNsAKFNMm6QBj/ZW4GBGoFGHlCJePHjAmCaw/Dd0qrpa7
 NATKg2kw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbq-00000002DFn-30is; Thu, 28 Nov 2024 04:58:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:20 +0000
Message-ID: <20241128045828.527559-6-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove accesses to page->index and page->mapping as well as
 unnecessary calls to page_file_mapping(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 6 +++---
 include/trace/events/f2fs.h
 | 30 +++++++++++++++ 2 files changed, 18 insertions(+), 18 deletio [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWwn-0004id-KW
Subject: [f2fs-dev] [PATCH 05/11] f2fs: Convert submit tracepoints to take a
 folio
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

Remove accesses to page->index and page->mapping as well as
unnecessary calls to page_file_mapping().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c              |  6 +++---
 include/trace/events/f2fs.h | 30 +++++++++++++++---------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a2478c2afb3a..7cb2272c723e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -697,7 +697,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 			META_GENERIC : DATA_GENERIC_ENHANCE)))
 		return -EFSCORRUPTED;
 
-	trace_f2fs_submit_page_bio(page, fio);
+	trace_f2fs_submit_folio_bio(page_folio(page), fio);
 
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
@@ -894,7 +894,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
 		return -EFSCORRUPTED;
 
-	trace_f2fs_submit_page_bio(page, fio);
+	trace_f2fs_submit_folio_bio(page_folio(page), fio);
 
 	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
 						fio->new_blkaddr))
@@ -1018,7 +1018,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 
 	io->last_block_in_bio = fio->new_blkaddr;
 
-	trace_f2fs_submit_page_write(fio->page, fio);
+	trace_f2fs_submit_folio_write(page_folio(fio->page), fio);
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 2851c823095b..3253f45508e8 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1119,11 +1119,11 @@ TRACE_EVENT(f2fs_reserve_new_blocks,
 		(unsigned long long)__entry->count)
 );
 
-DECLARE_EVENT_CLASS(f2fs__submit_page_bio,
+DECLARE_EVENT_CLASS(f2fs__submit_folio_bio,
 
-	TP_PROTO(struct page *page, struct f2fs_io_info *fio),
+	TP_PROTO(struct folio *folio, struct f2fs_io_info *fio),
 
-	TP_ARGS(page, fio),
+	TP_ARGS(folio, fio),
 
 	TP_STRUCT__entry(
 		__field(dev_t, dev)
@@ -1138,9 +1138,9 @@ DECLARE_EVENT_CLASS(f2fs__submit_page_bio,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= page_file_mapping(page)->host->i_sb->s_dev;
-		__entry->ino		= page_file_mapping(page)->host->i_ino;
-		__entry->index		= page->index;
+		__entry->dev		= folio->mapping->host->i_sb->s_dev;
+		__entry->ino		= folio->mapping->host->i_ino;
+		__entry->index		= folio->index;
 		__entry->old_blkaddr	= fio->old_blkaddr;
 		__entry->new_blkaddr	= fio->new_blkaddr;
 		__entry->op		= fio->op;
@@ -1149,7 +1149,7 @@ DECLARE_EVENT_CLASS(f2fs__submit_page_bio,
 		__entry->type		= fio->type;
 	),
 
-	TP_printk("dev = (%d,%d), ino = %lu, page_index = 0x%lx, "
+	TP_printk("dev = (%d,%d), ino = %lu, folio_index = 0x%lx, "
 		"oldaddr = 0x%llx, newaddr = 0x%llx, rw = %s(%s), type = %s_%s",
 		show_dev_ino(__entry),
 		(unsigned long)__entry->index,
@@ -1160,22 +1160,22 @@ DECLARE_EVENT_CLASS(f2fs__submit_page_bio,
 		show_block_type(__entry->type))
 );
 
-DEFINE_EVENT_CONDITION(f2fs__submit_page_bio, f2fs_submit_page_bio,
+DEFINE_EVENT_CONDITION(f2fs__submit_folio_bio, f2fs_submit_folio_bio,
 
-	TP_PROTO(struct page *page, struct f2fs_io_info *fio),
+	TP_PROTO(struct folio *folio, struct f2fs_io_info *fio),
 
-	TP_ARGS(page, fio),
+	TP_ARGS(folio, fio),
 
-	TP_CONDITION(page->mapping)
+	TP_CONDITION(folio->mapping)
 );
 
-DEFINE_EVENT_CONDITION(f2fs__submit_page_bio, f2fs_submit_page_write,
+DEFINE_EVENT_CONDITION(f2fs__submit_folio_bio, f2fs_submit_folio_write,
 
-	TP_PROTO(struct page *page, struct f2fs_io_info *fio),
+	TP_PROTO(struct folio *folio, struct f2fs_io_info *fio),
 
-	TP_ARGS(page, fio),
+	TP_ARGS(folio, fio),
 
-	TP_CONDITION(page->mapping)
+	TP_CONDITION(folio->mapping)
 );
 
 DECLARE_EVENT_CLASS(f2fs__bio,
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
