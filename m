Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B6A76E1D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVW-0000sf-3p;
	Mon, 31 Mar 2025 20:13:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVR-0000rx-Ry
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPWMBnVqIo4IO1McDC+JdHD4JUNJS7HczKqUrYGEHc8=; b=ZHksuwSUht0uStSCCe6Vpk7gPm
 xusVHU8o2QQjBzrfx6l8j7zIVV0yH/f2dqheFFJBoa/uMAXIaT3u3S5sNmlWndbHcrcPFcUCEf059
 cOD5Z1/13POTZBo7Pb/Wlj9kNWuPFYzd6i/uIteHn2Jp2CGeK23u4qmruWYUu1InxR/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sPWMBnVqIo4IO1McDC+JdHD4JUNJS7HczKqUrYGEHc8=; b=DwHnAFE6+0FV3ZnrdLtOR5cMXy
 Un8HAIywR8YEarkhZTGvYNeOCe+Xm0OClJP68pjqXmoVKUSX+p+7l7RbQdOWN+/Xhaz/EoQpfJfAc
 b5K75soc8o/wfDz1lyptytQ2JmiGxHLAIqm5p/Rx3X994DC+9J5woL4Uarjdm0eCTLSs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Yo-VL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sPWMBnVqIo4IO1McDC+JdHD4JUNJS7HczKqUrYGEHc8=; b=CHc5qU/lhqYFsifLstqNOkv7PZ
 TMpS4sWonJ94zlep+KHESaUnzOM4ij9HJS5lRiFYmQ7rb0o7KfVv3mirZ3iTUQXijhEAh8m9aBAko
 GM9BFLSc3vw373YlVWK4Vratml5UodMC7uJJ+NhvzBlRqA/qQmcfgoFxTaCGIjX2cvwvKGH48HzwT
 HpElHfZXzHIDE52VxtaM/xPz8ev5s2rzb58sXsP3UdLAos3WbW8mG3xlBx5+2nLyAmJ258mPIcSQY
 BUxFFTpk05rEkncdCUF3MSueS4Ssruhpp7mkok9tjXKAeqHivyuYu+4s4gl4nMGHV8JnOhaY6fOhD
 yJarLmxQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVG-00000004RVr-23YG;
 Mon, 31 Mar 2025 20:13:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:30 +0100
Message-ID: <20250331201256.1057782-11-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Turn f2fs_grab_meta_page() into a wrapper around
 f2fs_grab_meta_folio().
 Saves three hidden calls to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c | 16 ++++++++--------
 fs/f2fs/f2fs.h | 8 +++++++- 2 files changed, 15 insertions(+), 9 deletions(-)
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVR-0003Yo-VL
Subject: [f2fs-dev] [PATCH 010/153] f2fs: Add f2fs_grab_meta_folio()
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

Turn f2fs_grab_meta_page() into a wrapper around f2fs_grab_meta_folio().
Saves three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 16 ++++++++--------
 fs/f2fs/f2fs.h       |  8 +++++++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index cf77987d0698..bb4a2af73103 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -38,20 +38,20 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 /*
  * We guarantee no failure on the returned page.
  */
-struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
+struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index)
 {
 	struct address_space *mapping = META_MAPPING(sbi);
-	struct page *page;
+	struct folio *folio;
 repeat:
-	page = f2fs_grab_cache_page(mapping, index, false);
-	if (!page) {
+	folio = f2fs_grab_cache_folio(mapping, index, false);
+	if (IS_ERR(folio)) {
 		cond_resched();
 		goto repeat;
 	}
-	f2fs_wait_on_page_writeback(page, META, true, true);
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
-	return page;
+	f2fs_folio_wait_writeback(folio, META, true, true);
+	if (!folio_test_uptodate(folio))
+		folio_mark_uptodate(folio);
+	return folio;
 }
 
 static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 443c9d27e5b6..c8965fdcf3cb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3879,7 +3879,7 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
 void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 							unsigned char reason);
 void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
-struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
+struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_tmp_page(struct f2fs_sb_info *sbi, pgoff_t index);
@@ -3922,6 +3922,12 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
 
+static inline
+struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
+{
+	return &f2fs_grab_meta_folio(sbi, index)->page;
+}
+
 /*
  * data.c
  */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
