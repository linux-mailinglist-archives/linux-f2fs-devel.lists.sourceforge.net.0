Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DFDB407EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 16:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wId5biMu95CElFt5w16J9tC3j7ydHTzZ6cz0p4veszA=; b=IJFxvjiYVbMTzUEEuj62YjMhIu
	8O1JRyzUUNf4ubJYFJ/8v3aejTcbvBrjkY6tWK/o4BID4N325jyxBI5z9qdrnPRpTNRqPe/3+lAgP
	H5gOnrxI8AF0XZ+ZI9qzFNBsvbbTlWBi31IqF00jnhib/IY/2alGpJKfaf+quy9+n1dg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utSNZ-0000iM-SA;
	Tue, 02 Sep 2025 14:53:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1utSNY-0000iC-GV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 14:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ep/0IfumP45hCoTXBBN7BbLl3Oq9qqAZ0ENj5B+FFOA=; b=j3UlPrz19Z25JQ0EFrCD39Bf5T
 etzvNO0cqH2SB8x/jJ+Tut06ggn0vkAGpkasFfndbZGSy7t2U8NpArLtaZZWPK1f2znGG3egyYWW0
 vQnv4S1Cq+othwRc5CjY/FBtQxKzTeVVbF6pHCLgSxXReqkK/pVGws9wBb7IfkD5hJz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ep/0IfumP45hCoTXBBN7BbLl3Oq9qqAZ0ENj5B+FFOA=; b=lE1W9+xGSlcgRKn8Ofr9zGYQFs
 U31WsC3PD0kvPvM3iCONiXoJfNaFngs8iqr2pAxOMvb30leLL1gKNl64ewjEURqWWY+rp2W44qp95
 H+TlAbnyLGXfaqrl+ttcIrjuKsjgua0O6RCQ9wO+pDwEvUDUrogJ/fv5JD9Rs2RcId8s=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utSNY-00014R-DN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 14:53:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D53C46020C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Sep 2025 12:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0DEC4CEED;
 Tue,  2 Sep 2025 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756816051;
 bh=kLqXIyG7JMsCDuJdIBF+lJeJW74pc8LBnf2tM9jt1Uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFYoUvU/a82+Q+mx2ySc9N2qiKVLdYxSlJsty9hmy7XzBLjTBxMGJQQsMpSTXHRGq
 IvBsM/QlErZsKuKfefYFfzNVraTP8QuVZtqRsd9Dxso+prgMAVS++xJGf7XBmyH2MU
 3Lr62k2RMxFvo83xqejOtW8es9olKbOL0IXj2vci5oqXuPw3Gayry9dxLs1vOq/L0C
 L3hqoBK1TbGO+17imDn2zjnx5rzr7FLSdzeBImHr3tXgG0pjJlvZDl/iW/jEstBLQr
 7TJSdR7NS3csfRchEHdnu4RKmQ9n31kJn1xcmPvVbzYyxJgcNYQArDbxTX48nruyUD
 iUIpnk+0wmsAQ==
To: jaegeuk@kernel.org
Date: Tue,  2 Sep 2025 20:27:20 +0800
Message-ID: <20250902122720.2750481-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
In-Reply-To: <20250902122720.2750481-1-chao@kernel.org>
References: <20250902122720.2750481-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Below two functions should never fail,
 clean up error handling
 in their callers: 1) f2fs_grab_read_bio() in f2fs_submit_page_read() 2)
 bio_add_folio()
 in f2fs_submit_page_read() Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/data.c
 | 41 ++++++++ 1 file changed, 8 insertions(+), 33 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utSNY-00014R-DN
Subject: [f2fs-dev] [PATCH 2/2] f2fs: clean up error handing of
 f2fs_submit_page_read()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Below two functions should never fail, clean up error handling in their
callers:
1) f2fs_grab_read_bio() in f2fs_submit_page_read()
2) bio_add_folio() in f2fs_submit_page_read()

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 41 ++++++++---------------------------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7961e0ddfca3..990ff6ee322b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1083,7 +1083,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 }
 
 /* This can handle encryption stuffs */
-static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
+static void f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 				 block_t blkaddr, blk_opf_t op_flags,
 				 bool for_write)
 {
@@ -1092,23 +1092,16 @@ static int f2fs_submit_page_read(struct inode *inode, struct folio *folio,
 
 	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
 					folio->index, for_write);
-	if (IS_ERR(bio))
-		return PTR_ERR(bio);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, blkaddr);
 
-	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0)) {
-		iostat_update_and_unbind_ctx(bio);
-		if (bio->bi_private)
-			mempool_free(bio->bi_private, bio_post_read_ctx_pool);
-		bio_put(bio);
-		return -EFAULT;
-	}
+	if (!bio_add_folio(bio, folio, PAGE_SIZE, 0))
+		f2fs_bug_on(sbi, 1);
+
 	inc_page_count(sbi, F2FS_RD_DATA);
 	f2fs_update_iostat(sbi, NULL, FS_DATA_READ_IO, F2FS_BLKSIZE);
 	f2fs_submit_read_bio(sbi, bio, DATA);
-	return 0;
 }
 
 static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
@@ -1265,10 +1258,8 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 		return folio;
 	}
 
-	err = f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
+	f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
 						op_flags, for_write);
-	if (err)
-		goto put_err;
 	return folio;
 
 put_err:
@@ -2145,16 +2136,10 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
 	}
-	if (bio == NULL) {
+	if (bio == NULL)
 		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
 				f2fs_ra_op_flags(rac), index,
 				false);
-		if (IS_ERR(bio)) {
-			ret = PTR_ERR(bio);
-			bio = NULL;
-			goto out;
-		}
-	}
 
 	/*
 	 * If the page is under writeback, we need to wait for
@@ -2303,18 +2288,10 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			bio = NULL;
 		}
 
-		if (!bio) {
+		if (!bio)
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages - i,
 					f2fs_ra_op_flags(rac),
 					folio->index, for_write);
-			if (IS_ERR(bio)) {
-				ret = PTR_ERR(bio);
-				f2fs_decompress_end_io(dic, ret, true);
-				f2fs_put_dnode(&dn);
-				*bio_ret = NULL;
-				return ret;
-			}
-		}
 
 		if (!bio_add_folio(bio, folio, blocksize, 0))
 			goto submit_and_realloc;
@@ -3639,11 +3616,9 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 			err = -EFSCORRUPTED;
 			goto put_folio;
 		}
-		err = f2fs_submit_page_read(use_cow ?
+		f2fs_submit_page_read(use_cow ?
 				F2FS_I(inode)->cow_inode : inode,
 				folio, blkaddr, 0, true);
-		if (err)
-			goto put_folio;
 
 		folio_lock(folio);
 		if (unlikely(folio->mapping != mapping)) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
