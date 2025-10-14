Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A798ABD78FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 08:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=059mDo2/uGBl9e/IBTatWMN/bPBCbNQRRuxfIfsiGPU=; b=g075DyF0pror+goELhMVO8CDB0
	re/g5+jttLhKDe+YxaR7+qr7p5CExzoPRtZQywKgMDm3WGiAoMoR/exxrMAeqXRxge7I8TAcvuVD/
	qR91zYxb053DUQfjR9yYlLD1sMqC7b9Wu9uh67mt9js1sEozJjU0acnqG9xtbRurNEes=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8YVJ-0001C2-AD;
	Tue, 14 Oct 2025 06:27:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8YVH-0001Bv-DP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 06:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jROt6FLfEl5DX1GFidaAE/uuDumML805o3kVisMLOvs=; b=gv4seK2Hc0i9oXY7qi6KZQ1y7s
 Xvij1lgPk6z6lHYEWQsW2db+mpIYfYz9AGCt6mrcC1jc+wX1xUVygaWsJqy9iC6XUNmfvvunIG60I
 yKCrJTX6MBBI9IRq+ZlrrW2E15v2GrgK1cftRfDvOCre8vr44aivRygN0ELwL9pi+dj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jROt6FLfEl5DX1GFidaAE/uuDumML805o3kVisMLOvs=; b=KlgAPy9rAxfjcQfOg/D+XoezUY
 ZgQwDg7AznZnrkLhVe3l7B2LcTeUHYMxEvqBcJHPod+1Qm1uPY/DmU5PCdLxI0YsujQc5C0fw4Usd
 bG/nCyj834RfqzH0k1OCvIs7uX0VrEIh6awoE4QSkjYWgSus8wvD3OKVwi7yrdXMecAU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8YVG-0001i4-T4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 06:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7BAFC45933
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 06:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7656DC4CEE7;
 Tue, 14 Oct 2025 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760423232;
 bh=FKeXO7u7xjtZC8nA3BNJBVR9SkDTyf5HtbxaG86K0r4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KaZ6TgJuTxtTogKbk/smzJmxCkIsq3XoxrF8WBgvZgjmf8aK+VUmnPTUEzUS+V3QJ
 9AJYg48JwTtrar5fydC/ZebVt86Sl0fAZeYnIxR9JHLxhU7LCDqMBV7LkmTA0FzHH8
 JexTQEe0D2E9D2utBRlKUawEjYj33omFYqk2IKNZPiv+FdBmjp7Bz46qM5/UOcEakz
 otFfl0J1zWm5lvHo30IyuKlrSATq1r7LaRKH5mN+qdspIjJoZDqpFpmEfHCZfo2sPQ
 6OA/ykZZR3mYKC+ExUua4o7MVxRT8vv03FTZ6AeSbyznCWa3xxdB3zGNIHYfP/cEf5
 GQIACdMci0vhg==
To: jaegeuk@kernel.org
Date: Tue, 14 Oct 2025 14:27:03 +0800
Message-ID: <20251014062704.1734984-3-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
In-Reply-To: <20251014062704.1734984-1-chao@kernel.org>
References: <20251014062704.1734984-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's use f2fs_filemap_get_folio() instead of
 f2fs_pagecache_get_page()
 in ra_data_block() and move_data_block(), then remove f2fs_pagecache_get_page()
 since it has no user. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/f2fs.h
 | 10 fs/f2fs/gc.c | 23 +++++++++++++ 2 files changed, 13 insertions(+), 20
 deletions(-) 
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
X-Headers-End: 1v8YVG-0001i4-T4
Subject: [f2fs-dev] [PATCH 3/4] f2fs: use f2fs_filemap_get_folio() instead
 of f2fs_pagecache_get_page()
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

Let's use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page() in
ra_data_block() and move_data_block(), then remove f2fs_pagecache_get_page()
since it has no user.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 10 ----------
 fs/f2fs/gc.c   | 23 +++++++++++++----------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b6e35fdd5fd3..9cc3b83b8d10 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2961,16 +2961,6 @@ static inline struct folio *f2fs_filemap_get_folio(
 	return __filemap_get_folio(mapping, index, fgp_flags, gfp_mask);
 }
 
-static inline struct page *f2fs_pagecache_get_page(
-				struct address_space *mapping, pgoff_t index,
-				fgf_t fgp_flags, gfp_t gfp_mask)
-{
-	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET))
-		return NULL;
-
-	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
-}
-
 static inline void f2fs_folio_put(struct folio *folio, bool unlock)
 {
 	if (IS_ERR_OR_NULL(folio))
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8abf521530ff..22fe6e2c6d5c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1211,7 +1211,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	struct address_space *mapping = f2fs_is_cow_file(inode) ?
 				F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
 	struct dnode_of_data dn;
-	struct folio *folio;
+	struct folio *folio, *efolio;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.ino = inode->i_ino,
@@ -1266,14 +1266,15 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
 
-	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(sbi),
-					dn.data_blkaddr,
+	efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
 					FGP_LOCK | FGP_CREAT, GFP_NOFS);
-	if (!fio.encrypted_page) {
-		err = -ENOMEM;
+	if (IS_ERR(efolio)) {
+		err = PTR_ERR(efolio);
 		goto put_folio;
 	}
 
+	fio.encrypted_page = &efolio->page;
+
 	err = f2fs_submit_page_bio(&fio);
 	if (err)
 		goto put_encrypted_page;
@@ -1313,7 +1314,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	struct dnode_of_data dn;
 	struct f2fs_summary sum;
 	struct node_info ni;
-	struct folio *folio, *mfolio;
+	struct folio *folio, *mfolio, *efolio;
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
@@ -1407,14 +1408,16 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto up_out;
 	}
 
-	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
-				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
-	if (!fio.encrypted_page) {
-		err = -ENOMEM;
+	efolio = f2fs_filemap_get_folio(META_MAPPING(fio.sbi), newaddr,
+					FGP_LOCK | FGP_CREAT, GFP_NOFS);
+	if (IS_ERR(efolio)) {
+		err = PTR_ERR(efolio);
 		f2fs_folio_put(mfolio, true);
 		goto recover_block;
 	}
 
+	fio.encrypted_page = &efolio->page;
+
 	/* write target block */
 	f2fs_wait_on_page_writeback(fio.encrypted_page, DATA, true, true);
 	memcpy(page_address(fio.encrypted_page),
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
