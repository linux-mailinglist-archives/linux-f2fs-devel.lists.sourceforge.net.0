Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57EA39313
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWn-0004sl-On;
	Tue, 18 Feb 2025 05:52:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0004sA-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+DXT/7jgKhUnDWqt8Mtbn1jWwn4NhU9BvgnRZLnP7oI=; b=jwMXcgwW3LL8p1Y2UlhRMKwYTY
 nFxP/aI8GoGUBZeYuOv2Jqet6UV0OvAp2qTcQs3UcyNWI4gjX5hidXslh3zi0/ILkN6eEPoXmaHzb
 xssq5d8oq1P7gqXkg5jiutH7aPmBxBxjcWQbC97TTYOihgt7i7F8LETMDKVddgWODsrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+DXT/7jgKhUnDWqt8Mtbn1jWwn4NhU9BvgnRZLnP7oI=; b=KudP9/I9aWX5TZ5UOMsU0u7Pfp
 GxNSUczin62OYRMs+4OyvsSxdg1ZwW8JMaLq4+dmkkA541KmE8Y9WYsWO5qrIUcu//qWPZjncyZi7
 Xqx8AY7kLxA2RplYBa7OtOLNuTITUdg8pvvbAiIlm5JSkw3LhHj484fxmcGrKY/sOgZE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bX-VD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+DXT/7jgKhUnDWqt8Mtbn1jWwn4NhU9BvgnRZLnP7oI=; b=X0ySKVfv41IZznMQtusWy7gBIZ
 wpoe37tHDKtafHvjPDLFSbzN+kgAtnt1DnRjeDMXNnMWLOI1g7/ZLgRkuayEhuu659MYURymOmoaF
 0r95q15LolTymW7dgBW+jHPw3FJSB2QwI4PpF6SRNMmH71YpQGhnVZ+lEAjkUveVynKBzvlAiWuKL
 WiyeZK7vYmFzvRzK2QKWbieHg4gQ1aHLvH9ZbqANfn3B1CzH9FPO7tQYVdevLbn1tORTFjqPAsL0A
 0len7Lgj/GvMOPK98pi2WHsFz2TyAk2TmvFbN30S6H4TDOSwSbEQWqY0fMLPM9ujeCc3d/6eU/yXO
 CwWQGsww==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWd-00000002Tsg-2p0c; Tue, 18 Feb 2025 05:52:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:50 +0000
Message-ID: <20250218055203.591403-17-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All its callers now have access to a folio, so pass it in.
 Removes an access to page->mapping. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 3 ++-
 fs/f2fs/node.c
 | 8 ++++---- fs/f2fs/segment.c | 2 +- 4 files changed, 8 insertions(+), 7
 d [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWj-0007bX-VD
Subject: [f2fs-dev] [PATCH 16/27] f2fs: Convert f2fs_in_warm_node_list() to
 take a folio
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

All its callers now have access to a folio, so pass it in.  Removes
an access to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/f2fs.h    | 3 ++-
 fs/f2fs/node.c    | 8 ++++----
 fs/f2fs/segment.c | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5ec4395ef06d..d297e9ae6391 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -358,7 +358,7 @@ static void f2fs_write_end_io(struct bio *bio)
 				folio->index != nid_of_node(&folio->page));
 
 		dec_page_count(sbi, type);
-		if (f2fs_in_warm_node_list(sbi, &folio->page))
+		if (f2fs_in_warm_node_list(sbi, folio))
 			f2fs_del_fsync_node_entry(sbi, &folio->page);
 		clear_page_private_gcing(&folio->page);
 		folio_end_writeback(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a941a0750712..bbaa61da83a8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3667,7 +3667,8 @@ struct node_info;
 
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid);
 bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type);
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct page *page);
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi,
+		const struct folio *folio);
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi);
 void f2fs_del_fsync_node_entry(struct f2fs_sb_info *sbi, struct page *page);
 void f2fs_reset_fsync_node_info(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index db97624e30b3..da28e295c701 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -310,10 +310,10 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 							start, nr);
 }
 
-bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct page *page)
+bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, const struct folio *folio)
 {
-	return NODE_MAPPING(sbi) == page->mapping &&
-			IS_DNODE(page) && is_cold_node(page);
+	return NODE_MAPPING(sbi) == folio->mapping &&
+			IS_DNODE(&folio->page) && is_cold_node(&folio->page);
 }
 
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
@@ -1694,7 +1694,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
 
 	/* should add to global list before clearing PAGECACHE status */
-	if (f2fs_in_warm_node_list(sbi, page)) {
+	if (f2fs_in_warm_node_list(sbi, folio)) {
 		seq = f2fs_add_fsync_node_entry(sbi, page);
 		if (seq_id)
 			*seq_id = seq;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 088b4ad81771..0c5fdb58ade3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3916,7 +3916,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		if (fscrypt_inode_uses_fs_layer_crypto(folio->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
 		folio_end_writeback(folio);
-		if (f2fs_in_warm_node_list(fio->sbi, fio->page))
+		if (f2fs_in_warm_node_list(fio->sbi, folio))
 			f2fs_del_fsync_node_entry(fio->sbi, fio->page);
 		goto out;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
