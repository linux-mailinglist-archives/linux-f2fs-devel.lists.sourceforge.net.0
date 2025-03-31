Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E49A76E36
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVg-0005bw-6a;
	Mon, 31 Mar 2025 20:13:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVT-0005ZH-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KJqrOpz1CT/HziQlpTCAkPrgBlSRw4AVxB5qKur9UZw=; b=IhD0KyKuIeaUF9V65FhkjhOGYr
 7kiRhpjAUrCUa0sWgOBWy3pzz8cQXBCeRhUEdOztzA3l3zupUWk3apDEcC9paALwY9XbCozk0YThW
 dBOMWgFklspYvmRgtcjaSpsZEyNkYIMRY7O3tHweYegreoDnZ8/Q+pqwfZ6+tmUVkbhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KJqrOpz1CT/HziQlpTCAkPrgBlSRw4AVxB5qKur9UZw=; b=R1ck5oDV7e7XDUpIVPRTRc9NOA
 vM6ehakPlN7UAxMo4tsiyaiFnwTIchiqSnuQbSh9g3uLK0dv6hiEEzMZJ5TGzVQfoddwOoYwovGBp
 DmVbvdtDIdM1TVRPMPkfkcUoYSRKC/cxh/yjueOyBH5LggBx/joP75SF1nlvLJ1JTz+M=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVN-0003Y8-3v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KJqrOpz1CT/HziQlpTCAkPrgBlSRw4AVxB5qKur9UZw=; b=inyXvzHyBbQieWRvvFnbMvqWEG
 ocirwt785uCIs7l5VfIP1scFw41hqSQ7LKMtZ8nL9v9SGTWEZnHWmXVIgFWIM4iOUA9S/zoTat3hk
 uB5KkMp7O+PCu3i33WmViUmh3Mev0MRxvoq9qSRoyvmAA47tEBpIiJG8UJkyUgQJWHtlI3jSPQwl3
 zi5MiIqRQ6dGP15SjIMn/C58wLrgVjG4YAF7x5iiiRXomVWpIMGlgxXyucccoUdYIIuwrE6aigTP+
 VDYDF9NWFhTYSyr1qP+9mP49plhuI/jdqsqiqfSN6lwBdyNOPjFeAikKVKbRMHfmOX6eAJQPn1fyk
 TneIxaag==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVG-00000004RW4-2hYD;
 Mon, 31 Mar 2025 20:13:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:31 +0100
Message-ID: <20250331201256.1057782-12-willy@infradead.org>
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
 Content preview: Save four calls to compound_head(). Also remove the call to
 f2fs_wait_on_page_writeback() as this was already done by
 f2fs_grab_meta_folio()
 and writeback can't have restarted in the meantime since we [...] 
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
X-Headers-End: 1tzLVN-0003Y8-3v
Subject: [f2fs-dev] [PATCH 011/153] f2fs: Use a folio in commit_checkpoint()
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

Save four calls to compound_head().  Also remove the call
to f2fs_wait_on_page_writeback() as this was already done by
f2fs_grab_meta_folio() and writeback can't have restarted in the
meantime since we hold the folio locked.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bb4a2af73103..6e25975950fa 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1407,30 +1407,28 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	};
 
 	/*
-	 * filemap_get_folios_tag and lock_page again will take
+	 * filemap_get_folios_tag and folio_lock again will take
 	 * some extra time. Therefore, f2fs_update_meta_pages and
 	 * f2fs_sync_meta_pages are combined in this function.
 	 */
-	struct page *page = f2fs_grab_meta_page(sbi, blk_addr);
+	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
 	int err;
 
-	f2fs_wait_on_page_writeback(page, META, true, true);
+	memcpy(folio_address(folio), src, PAGE_SIZE);
 
-	memcpy(page_address(page), src, PAGE_SIZE);
-
-	set_page_dirty(page);
-	if (unlikely(!clear_page_dirty_for_io(page)))
+	folio_mark_dirty(folio);
+	if (unlikely(!folio_clear_dirty_for_io(folio)))
 		f2fs_bug_on(sbi, 1);
 
 	/* writeout cp pack 2 page */
-	err = __f2fs_write_meta_page(page, &wbc, FS_CP_META_IO);
+	err = __f2fs_write_meta_page(&folio->page, &wbc, FS_CP_META_IO);
 	if (unlikely(err && f2fs_cp_error(sbi))) {
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return;
 	}
 
 	f2fs_bug_on(sbi, err);
-	f2fs_put_page(page, 0);
+	f2fs_folio_put(folio, false);
 
 	/* submit checkpoint (with barrier if NOBARRIER is not set) */
 	f2fs_submit_merged_write(sbi, META_FLUSH);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
