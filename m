Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44656A39321
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWw-00026Q-Js;
	Tue, 18 Feb 2025 05:52:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWr-000256-Bm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7EseUmE3Pl3dQ/iQ4R00hALFgHaX/qw5tdhtdPzOA4=; b=VvBxFRHiBk91fTurOvFXOZogfS
 axikL6JjwDDOMtLpFGUOA4vLKC4APlLFfgZfF2zIr4wI8/aLAuDxMKpZ0aEhIGBoLsVf7Hx4MR8rC
 BMJ2L7AapiUaq2AeZuIJoPLC1/SNqqjelu9gA8eZmi55n0tLOq1OyW5avyqPuBKGsNc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7EseUmE3Pl3dQ/iQ4R00hALFgHaX/qw5tdhtdPzOA4=; b=eP3pZilXpSjN8cM9J408WojuXl
 lwoWDAKq1M/0hIKNv47ZAj/9Y2spnc4ZbpB7X3HggyWftHh9JRC9qGuIxCemrFssJsgO1zxK4HSA7
 oZsIOs+D7B9NFvhq/FTM6vqs/bJWa/Xwin9hSinwo0PXa9tRnaBailMQnQ7shTekwraQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWq-0007cS-6C for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=h7EseUmE3Pl3dQ/iQ4R00hALFgHaX/qw5tdhtdPzOA4=; b=ggIwAahpYTfzpunMOO/Y4kkBsa
 +UW+FeGvk+AXlMfiEwXIqDuoBZ0o4MEJ29Kx7BHv0ZVqxQsa9s1BtvVGrKGDPJQn+KlYF5vQFjC9x
 muY/Kj/ItT6FclsGm45LuucCGN7wvzPEZUuEFB4RUBbed0mReSOn1N60rfsXqGx6lMZuDVM8aa8sK
 4+vKjhGZVBUptcNWdQ53SkT0gxIIbKzbM9i4jpK7NA9uEcYk1HSmKCa7x9n2rsYf5iGj+0qJPi6/A
 kNxZb49BrmPMkd5k+z1AjiEO2dJEkhdAZN1FurMiIzt0SlAwHq2Fvrz97bAWE2npZFIdpPkmNq7uL
 IPGzl2PA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWe-00000002Tte-3jDZ; Tue, 18 Feb 2025 05:52:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:58 +0000
Message-ID: <20250218055203.591403-25-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Retrieve a folio from the page cache and use it throughout.
 Saves five hidden calls to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/file.c | 24 +++++++++++++ 1 file
 changed, 13 insertions(+), 11 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWq-0007cS-6C
Subject: [f2fs-dev] [PATCH 24/27] f2fs: Convert truncate_partial_data_page()
 to use a folio
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Retrieve a folio from the page cache and use it throughout.
Saves five hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f2f298c75921..db2778758dda 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -707,31 +707,33 @@ static int truncate_partial_data_page(struct inode *inode, u64 from,
 	loff_t offset = from & (PAGE_SIZE - 1);
 	pgoff_t index = from >> PAGE_SHIFT;
 	struct address_space *mapping = inode->i_mapping;
-	struct page *page;
+	struct folio *folio;
 
 	if (!offset && !cache_only)
 		return 0;
 
 	if (cache_only) {
-		page = find_lock_page(mapping, index);
-		if (page && PageUptodate(page))
+		folio = filemap_lock_folio(mapping, index);
+		if (IS_ERR(folio))
+		       return 0;
+		if (folio_test_uptodate(folio))
 			goto truncate_out;
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 		return 0;
 	}
 
-	page = f2fs_get_lock_data_page(inode, index, true);
-	if (IS_ERR(page))
-		return PTR_ERR(page) == -ENOENT ? 0 : PTR_ERR(page);
+	folio = f2fs_get_lock_data_folio(inode, index, true);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio) == -ENOENT ? 0 : PTR_ERR(folio);
 truncate_out:
-	f2fs_wait_on_page_writeback(page, DATA, true, true);
-	zero_user(page, offset, PAGE_SIZE - offset);
+	f2fs_folio_wait_writeback(folio, DATA, true, true);
+	folio_zero_segment(folio, offset, folio_size(folio));
 
 	/* An encrypted inode should have a key and truncate the last page. */
 	f2fs_bug_on(F2FS_I_SB(inode), cache_only && IS_ENCRYPTED(inode));
 	if (!cache_only)
-		set_page_dirty(page);
-	f2fs_put_page(page, 1);
+		folio_mark_dirty(folio);
+	f2fs_folio_put(folio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
