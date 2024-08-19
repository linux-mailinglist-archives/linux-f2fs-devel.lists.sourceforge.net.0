Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF49560DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2024 03:21:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sfr58-0000PQ-W1;
	Mon, 19 Aug 2024 01:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sfr56-0000PH-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJ395t/DI3f3KuV2Ba3nm6yeqnl7hQuZTauYfbbIJAw=; b=dZOe8TJpomj9kVfRJ5l1BaBn1L
 ixLG2bFEZVDrD7npt3F8sWOKmDI9KnHIh6Tzm9PYXrQI1/B7Lm5yHntHOVlcWPWiIZoRra68xjlC/
 uX8iK7PXzNxEMHbQovGGtl65tzgVTGG/QlQ+vlT8Db13O16PuqYSn4teGMI/fjKChxrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hJ395t/DI3f3KuV2Ba3nm6yeqnl7hQuZTauYfbbIJAw=; b=UBMVoEN0adp9jpMaVugbc48pKR
 OJ8DRoR7Q8179qzapCP0IGJWiB+IwjiRlKGRxJFFBdVF63kNvXaQ1q6neZU72iil9dhYKJUNoaKED
 00417TXtGB444S0lbFsGPjVHDLARKWyMMCdTFNx+1uU/GY2zaDfgTNY1UnFtKfz5JZ9o=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfr56-0003Zt-8S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 804B6CE0922;
 Mon, 19 Aug 2024 01:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9F2C4AF0B;
 Mon, 19 Aug 2024 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724030460;
 bh=kI9JNrkqcWakqf9nzqIrzXTTjP9TFX7SUhwYCeGt3EY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5aXqjCFwU2zWIIRqIcR0mUWgN+gKVG4jGh5mBRNloM2Tcu2DEeZ6Ov/50czBUnOA
 XaE8p+rZnG7GvEr7J5iuj4chzfwrNycFJfqo3Y4cmUDtdDl53vRx5H0GDHZGN1HEih
 TJLU+jCgMPM+UKGicQORpyliYLhSANIPPVpOgq3dRO1H3j6YVYg2JeuGImDjFLgssL
 vCdCxTzs1Uz6bWNybfmlPIGzxkqGjAZp2TjIG5LAp8r2IhBCgdiwEqybEG83XUDrBg
 2hL+8hR/ujVQoPi+3K8OqDUMliYwtRN36+QLpsdSD7frriKY4OP5dxPq8JmcTKuPZB
 pC6insOss6X6Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Aug 2024 09:20:19 +0800
Message-Id: <20240819012023.3871272-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240819012023.3871272-1-chao@kernel.org>
References: <20240819012023.3871272-1-chao@kernel.org>
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
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sfr56-0003Zt-8S
Subject: [f2fs-dev] [PATCH 4/8] f2fs: convert f2fs_do_write_data_page() to
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
