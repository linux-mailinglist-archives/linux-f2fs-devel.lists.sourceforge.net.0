Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85893AFD42A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boaD6Qw3S1nB5gs8ocT/H5Pt+p1NM88TcTeKm9bNJWE=; b=CEm+aIbwFQ7dYHkVXw3kHmHDjh
	GBgiNgrgKkGINjRvGEBJ9jvQWfDJJMTGo57HcM5eErn81dXJAxnjoOTdmzKwD6bOUOlXDbQiCocxW
	VsszWMEGZW4dR6jZxv6MOu+gWAkxltfgXj7EaOugBImbAyri7h/kQpN3CJkocVLUrcuk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjs-0002mx-Cr;
	Tue, 08 Jul 2025 17:04:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjq-0002lx-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CWfa7fDtMhG2+8sl3cNQI33u3OTU3hHhhVMN1vOS9N0=; b=HHe2RwbBHSP9oFE8D0xjdO7qAr
 5W7yWGFzQmtcD2cZ8IyeTOb2r4ys6b54D2P/1eJfr1P4cRUftrUBEfpZ7p/4HJpLcAtNR0lT4ual+
 tapjBz0N8GgHj2ZHznQL5U/KDojS0TzZjIOLj7dqYHaT2vdshaBBkgAOxOheru+3RzWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CWfa7fDtMhG2+8sl3cNQI33u3OTU3hHhhVMN1vOS9N0=; b=hmcFs3onA9SaLe6YH6JXyoLoBY
 HmqH2FCS3TTcYCDS/G5lYwNtm+jXgBV0t86JHrvHEOp0UitkmJ3pg0cMT7e0kRRdGAjfgix9L3jUD
 wKrXxz1jGVRwr+tlvDVxq6cJ0s/ouNNf4xJlzvjeCodCGP4DUAPq1KTrmUl18KnqPu7k=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006EU-30 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=CWfa7fDtMhG2+8sl3cNQI33u3OTU3hHhhVMN1vOS9N0=; b=wVEA/7ETDeCPDlPE8a4C+BjLhv
 ngEjX53xzE5vlHVQs7AcVb2cvyLOgl22LcXgggndeHWzOL6bOgMfasUOzMA2oyBGVNSrgism13EWA
 52Nfw0RctkyxETUbcuVmleIc8BMKNCEa7RPnh7g9c4BwSFY+Lq70Izf7Z7T4WDB8vJ/V0HtImb8h4
 VXm4H1OekoX0VFCEYLen8jEgFSXj6Yez7NBmmowZXbEZTvIXgwfoX3dVKCfPchzD9WBXQwPkZOvxn
 zYoJc6H5a5zkDYSWShZHdF/egeyRAtAbVmnON2gQvFNriFJCxWjYRBWl2XVJzyty2jBkp71kXEMDW
 u86Bdxmw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7h-2xaG;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:40 +0100
Message-ID: <20250708170359.111653-44-willy@infradead.org>
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
 Content preview:  We have two folios to deal with here;
 one carries the metadata
 and the other points to the data. They may be the same, but if it's compressed,
 the data_folio will differ from the metadata folio. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1uZBjq-0006EU-30
Subject: [f2fs-dev] [PATCH 43/60] f2fs: Use a folio in f2fs_merge_page_bio()
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

We have two folios to deal with here; one carries the metadata and the
other points to the data.  They may be the same, but if it's compressed,
the data_folio will differ from the metadata folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7ea37ff517c6..01c0358ef66f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -886,15 +886,15 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio = *fio->bio;
-	struct page *page = fio->encrypted_page ?
-			fio->encrypted_page : fio->page;
+	struct folio *data_folio = fio->encrypted_page ?
+			page_folio(fio->encrypted_page) : fio->folio;
 	struct folio *folio = fio->folio;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
 		return -EFSCORRUPTED;
 
-	trace_f2fs_submit_folio_bio(page_folio(page), fio);
+	trace_f2fs_submit_folio_bio(data_folio, fio);
 
 	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
 						fio->new_blkaddr))
@@ -905,16 +905,16 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 		f2fs_set_bio_crypt_ctx(bio, folio->mapping->host,
 				folio->index, fio, GFP_NOIO);
 
-		add_bio_entry(fio->sbi, bio, page, fio->temp);
+		add_bio_entry(fio->sbi, bio, &data_folio->page, fio->temp);
 	} else {
-		if (add_ipu_page(fio, &bio, page))
+		if (add_ipu_page(fio, &bio, &data_folio->page))
 			goto alloc_new;
 	}
 
 	if (fio->io_wbc)
 		wbc_account_cgroup_owner(fio->io_wbc, folio, folio_size(folio));
 
-	inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));
+	inc_page_count(fio->sbi, WB_DATA_TYPE(&data_folio->page, false));
 
 	*fio->last_block = fio->new_blkaddr;
 	*fio->bio = bio;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
