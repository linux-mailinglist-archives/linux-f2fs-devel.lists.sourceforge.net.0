Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB429560D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2024 03:21:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sfr53-0003N4-R8;
	Mon, 19 Aug 2024 01:21:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sfr51-0003Mk-Pg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O/d/yLZxdWXm3LACI5wnoFWsTHRd1QfG8qJyIocENrY=; b=A+EJSsfnPh5cBmF/ghO8JDKdMh
 GGY3TG3fkW7YJGqBUxbE3qT+vkD+FOCL0d2NG4WRpRS518nLjrUcaE+6q1+yLxdC9lzr3niLKTNXH
 ZRIy+Ga4pMwkVzDyHm78WgSdBlqrh0z8/3A+K/s56hawclu16Ew8dzL0zR8FtBYL7Q9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O/d/yLZxdWXm3LACI5wnoFWsTHRd1QfG8qJyIocENrY=; b=ShGtpqijheNjAXunj3xKllcCZV
 2Aqq+5lIyg97m8EQCDbqDgY0veRjVpjJaQW6SdVRH6cv5uxmytn7D97MTZs8taUdoi+ToVqYw6V+p
 2zfmYP0sfIr+FfYU38qHh/2si3qQzdvAev2jHwchSQvYjln1E9OweUwmLVQNg7RFZcjE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sfr50-0003Zf-Vc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Aug 2024 01:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B6B260A6B;
 Mon, 19 Aug 2024 01:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3BEC4AF19;
 Mon, 19 Aug 2024 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724030456;
 bh=RpwG5EcmusMtZWl0L7ZY9zxIw8uIi4krsgEzFuO4KFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Th6dCCdQGDzOtEZSZjnPrqBeHpr5QJzZnwjwLFhujXirJ34pPAg5/3+zPrQya/Gjf
 JEUsUA3q9nc+M35u3hOkqS1I3QJj8wSoWTmnasStfKiztj8pLpMs825wUoViepVpbx
 CCA0y6ba4dhgJOwd978Qs9XFxzmNkXVMFiH7qCz1hc8VJqnLQmAe9M7g1E8FSYFF8T
 EmZwPzGHSUzAU/LhCixQReRJ5cOFPQp70JoaqRfsRbuzSzL9U0L5dTXJ77epZmhFrk
 Fcdq4Tl6QZoPE2KW+NyRDxrFoCwk90IR85WP5t2abt8hwVSoQPDVY87jZ3lrwZ12bY
 VxhPtiFXw6qwQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Aug 2024 09:20:17 +0800
Message-Id: <20240819012023.3871272-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240819012023.3871272-1-chao@kernel.org>
References: <20240819012023.3871272-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 19 ++++++++++--------- 1 file changed, 10 insertions(+), 
 9 deletions(-) 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sfr50-0003Zf-Vc
Subject: [f2fs-dev] [PATCH 2/8] f2fs: convert f2fs_write_end() to use folio
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
 fs/f2fs/data.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9e1ade13060c..e114d738b6b4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3378,7 +3378,7 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
 }
 
 static int prepare_write_begin(struct f2fs_sb_info *sbi,
-			struct page *page, loff_t pos, unsigned len,
+			struct folio *folio, loff_t pos, unsigned int len,
 			block_t *blk_addr, bool *node_changed)
 {
 	struct inode *inode = folio->mapping->host;
@@ -3425,7 +3425,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 				set_page_private_inline(ipage);
 			goto out;
 		}
-		err = f2fs_convert_inline_page(&dn, page);
+		err = f2fs_convert_inline_page(&dn, folio_page(folio, 0));
 		if (err || dn.data_blkaddr != NULL_ADDR)
 			goto out;
 	}
@@ -3629,7 +3629,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	folio = page_folio(page);
 
 	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len
+		err = prepare_atomic_write_begin(sbi, folio, pos, len,
 					&blkaddr, &need_balance, &use_cow);
 	else
 		err = prepare_write_begin(sbi, folio, pos, len,
@@ -3698,7 +3698,8 @@ static int f2fs_write_end(struct file *file,
 			loff_t pos, unsigned len, unsigned copied,
 			struct page *page, void *fsdata)
 {
-	struct inode *inode = page->mapping->host;
+	struct folio *folio = page_folio(page);
+	struct inode *inode = folio->mapping->host;
 
 	trace_f2fs_write_end(inode, pos, len, copied);
 
@@ -3707,17 +3708,17 @@ static int f2fs_write_end(struct file *file,
 	 * should be PAGE_SIZE. Otherwise, we treat it with zero copied and
 	 * let generic_perform_write() try to copy data again through copied=0.
 	 */
-	if (!PageUptodate(page)) {
+	if (!folio_test_uptodate(folio)) {
 		if (unlikely(copied != len))
 			copied = 0;
 		else
-			SetPageUptodate(page);
+			folio_mark_uptodate(folio);
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	/* overwrite compressed file */
 	if (f2fs_compressed_file(inode) && fsdata) {
-		f2fs_compress_write_end(inode, fsdata, page->index, copied);
+		f2fs_compress_write_end(inode, fsdata, folio->index, copied);
 		f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 
 		if (pos + copied > i_size_read(inode) &&
@@ -3730,10 +3731,10 @@ static int f2fs_write_end(struct file *file,
 	if (!copied)
 		goto unlock_out;
 
-	set_page_dirty(page);
+	folio_mark_dirty(folio);
 
 	if (f2fs_is_atomic_file(inode))
-		set_page_private_atomic(page);
+		set_page_private_atomic(folio_page(folio, 0));
 
 	if (pos + copied > i_size_read(inode) &&
 	    !f2fs_verity_in_progress(inode)) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
