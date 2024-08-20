Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C26957C05
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 05:47:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgFq7-0007OV-3S;
	Tue, 20 Aug 2024 03:47:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgFq4-0007OP-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJ395t/DI3f3KuV2Ba3nm6yeqnl7hQuZTauYfbbIJAw=; b=brtc7/LbxkAwzdgmB+8mO9BBge
 tdlswkPiyu8V1WptttWwqzs3aSycYGSVNTneLlEan9LmAvsZxWK78FycXc1dv1uxnodeuQyfLo/l/
 cLGiQv6RwBrCWheIChjoXLhdN+yb6UBnu5q5COVlNyQ5Uc+D+LT7qF8v9rZceGJVrK/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJ395t/DI3f3KuV2Ba3nm6yeqnl7hQuZTauYfbbIJAw=; b=FaDWzC5UZlNfs0zJ48acFLv/EH
 dmw6H1fRPg5BmAUqMczFgA/VNeYMiZg4FR82pVFxcLNMo7suRgFMe5yePEGCPOR2LGCO9yjTHEzLZ
 5Z9qw3qNyQsrQgYwEPjkMQYBesFpK2xx5l0SHt8N3L8yczpah37Og0UE8Uz1lW8BSoGk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgFq4-0006Rh-Mm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 03:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5DA9360DC4;
 Tue, 20 Aug 2024 03:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57E5C4AF12;
 Tue, 20 Aug 2024 03:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724125630;
 bh=kI9JNrkqcWakqf9nzqIrzXTTjP9TFX7SUhwYCeGt3EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pTSo7mKbZOK8myMmYn594lSgctp4XIcijOYlsvx2gOEJGuPOKdAIWsrSVnrtHlNNU
 nL9hKGb8XNnac4eQw9yX0YGX9FyhJUSv/qzdWC3lyTOxmOaLwflmO0+DGIJS46aZpI
 M9i8s10phwWK5Lb0R/+15nuN2Y8WGnXqbWEjCXnSAtId8gkJhyIK9dPJ2GveRFXG8J
 vdSEFt2ubmKrMECQwr67lfZdS8Ql3UafBJlAZDsK6Zd3wEPaYq7lG6DNT7NvlIo/B4
 yxC4kLeDYgUO5ngRKW1qR3IKBtm9RSS7cEizepcwHAqBv1MPfbrxibgmpFclvqkDPk
 qh/QOp8PFXf9w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Aug 2024 11:46:50 +0800
Message-Id: <20240820034654.698236-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820034654.698236-1-chao@kernel.org>
References: <20240820034654.698236-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 --- fs/f2fs/data.c | 26 +++++++++++++ 1 file changed, 13 insertions(+), 13
 deletions(-) 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgFq4-0006Rh-Mm
Subject: [f2fs-dev] [PATCH v2 4/8] f2fs: convert f2fs_do_write_data_page()
 to use folio
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
 fs/f2fs/data.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e114d738b6b4..c57ddee2c7c5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2648,8 +2648,8 @@ static inline bool need_inplace_update(struct f2fs_io_info *fio)
 
 int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 {
-	struct page *page = fio->page;
-	struct inode *inode = page->mapping->host;
+	struct folio *folio = page_folio(fio->page);
+	struct inode *inode = folio->mapping->host;
 	struct dnode_of_data dn;
 	struct node_info ni;
 	bool ipu_force = false;
@@ -2658,14 +2658,14 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* Use COW inode to make dnode_of_data for atomic write */
 	atomic_commit = f2fs_is_atomic_file(inode) &&
-				page_private_atomic(fio->page);
+				page_private_atomic(folio_page(folio, 0));
 	if (atomic_commit)
 		set_new_dnode(&dn, F2FS_I(inode)->cow_inode, NULL, NULL, 0);
 	else
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 
 	if (need_inplace_update(fio) &&
-	    f2fs_lookup_read_extent_cache_block(inode, page->index,
+	    f2fs_lookup_read_extent_cache_block(inode, folio->index,
 						&fio->old_blkaddr)) {
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
@@ -2680,7 +2680,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi))
 		return -EAGAIN;
 
-	err = f2fs_get_dnode_of_data(&dn, page->index, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, folio->index, LOOKUP_NODE);
 	if (err)
 		goto out;
 
@@ -2688,8 +2688,8 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* This page is already truncated */
 	if (fio->old_blkaddr == NULL_ADDR) {
-		ClearPageUptodate(page);
-		clear_page_private_gcing(page);
+		folio_clear_uptodate(folio);
+		clear_page_private_gcing(folio_page(folio, 0));
 		goto out_writepage;
 	}
 got_it:
@@ -2715,7 +2715,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		if (err)
 			goto out_writepage;
 
-		set_page_writeback(page);
+		folio_start_writeback(folio);
 		f2fs_put_dnode(&dn);
 		if (fio->need_lock == LOCK_REQ)
 			f2fs_unlock_op(fio->sbi);
@@ -2723,11 +2723,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		if (err) {
 			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(&fio->encrypted_page);
-			end_page_writeback(page);
+			folio_end_writeback(folio);
 		} else {
 			set_inode_flag(inode, FI_UPDATE_WRITE);
 		}
-		trace_f2fs_do_write_data_page(page_folio(page), IPU);
+		trace_f2fs_do_write_data_page(folio, IPU);
 		return err;
 	}
 
@@ -2749,17 +2749,17 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (err)
 		goto out_writepage;
 
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 
 	if (fio->compr_blocks && fio->old_blkaddr == COMPRESS_ADDR)
 		f2fs_i_compr_blocks_update(inode, fio->compr_blocks - 1, false);
 
 	/* LFS mode write path */
 	f2fs_outplace_write_data(&dn, fio);
-	trace_f2fs_do_write_data_page(page_folio(page), OPU);
+	trace_f2fs_do_write_data_page(folio, OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	if (atomic_commit)
-		clear_page_private_atomic(page);
+		clear_page_private_atomic(folio_page(folio, 0));
 out_writepage:
 	f2fs_put_dnode(&dn);
 out:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
