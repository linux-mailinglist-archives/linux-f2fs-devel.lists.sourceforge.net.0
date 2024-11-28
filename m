Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 799579DB27B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:20:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWx2-0002t8-9a;
	Thu, 28 Nov 2024 05:20:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWx0-0002t0-7q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E4qvjk6xulwxLYsNACNgPuFsqf+6imceNlF2ACLP9HU=; b=ZlfHbiETo2W7b/xBotMPa8FLj2
 szSgMxiwI+9z//PKau34GBxp9k+pMvOywxdQC/3KnFhIWjC6ckZzRBS4Y24S1ySY0aOahsxSQhx4a
 x+drxhYL/gPCfi8GT/DF8fGOM2+/zxPRLM8E1eE02mTYJxtgsUcPHnBhtjbzOgWjnIx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E4qvjk6xulwxLYsNACNgPuFsqf+6imceNlF2ACLP9HU=; b=SsN6ia6W7X5vye9hBnmhuBzeQ1
 I/BcKg7DIfsvSpRimXbWN44sAoELqk+A3zStSBGgiAoFIlrhOiVIAl87LYwjVV82b17uwSlVgW9Ca
 VK78xTexS53vWNQCFo8w1P6TEQ1iKbZGozN8Wo6wIf7jjfOPirfTGybNqT0KWQIMcdns=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWwz-0004ja-MX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=E4qvjk6xulwxLYsNACNgPuFsqf+6imceNlF2ACLP9HU=; b=P5j13l5NZf+fGXWiD8862gLMJ4
 p2qyInW353nrzOk+e5PjXD8khsUk7L0sPz7AUZm6gFvRJiW7ODfEE/asZ3S0D6+KxrJ7WKGIaWJIM
 NL6yT5q0mdBkH2bEmV1oeNqZet9fMCoFrKuSERcZakyqwWDoLsMLdxxc0idO2fvGfijeIoyHZU2u3
 aFlmoNIvrez97m4rQdn1+tp3jAxmRja+VLacC2NNCwCLhAYkanpoyaEIvjfxCgUGx3qlU1L+GCdYD
 KuT7MHgKQl5JABFDCfxCo6wLYY8nIbGKBmURw4dpf/Vue50ZiRlgqtCbcCqrkDPgU6N/d1hDlNrQa
 RdxbpdSg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbq-00000002DFh-2TNg; Thu, 28 Nov 2024 04:58:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:19 +0000
Message-ID: <20241128045828.527559-5-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove accesses to page->index and an unnecessary reference
 to page->mapping. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/compress.c | 8 +++++--- 1 file changed, 5 insertions(+),
 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tGWwz-0004ja-MX
Subject: [f2fs-dev] [PATCH 04/11] f2fs: Use a folio in
 f2fs_write_compressed_pages()
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

Remove accesses to page->index and an unnecessary reference to
page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 494baa1e8bd3..0b55b2695c9b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1282,6 +1282,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.encrypted = fscrypt_inode_uses_fs_layer_crypto(cc->inode) ?
 									1 : 0,
 	};
+	struct folio *folio;
 	struct dnode_of_data dn;
 	struct node_info ni;
 	struct compress_io_ctx *cic;
@@ -1293,7 +1294,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
-		mapping_set_error(cc->rpages[0]->mapping, -EIO);
+		mapping_set_error(inode->i_mapping, -EIO);
 		goto out_free;
 	}
 
@@ -1320,7 +1321,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			goto out_put_dnode;
 	}
 
-	psize = (loff_t)(cc->rpages[last_index]->index + 1) << PAGE_SHIFT;
+	folio = page_folio(cc->rpages[last_index]);
+	psize = folio_pos(folio) + folio_size(folio);
 
 	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
 	if (err)
@@ -1343,7 +1345,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	for (i = 0; i < cc->valid_nr_cpages; i++) {
 		f2fs_set_compressed_page(cc->cpages[i], inode,
-					cc->rpages[i + 1]->index, cic);
+				page_folio(cc->rpages[i + 1])->index, cic);
 		fio.compressed_page = cc->cpages[i];
 
 		fio.old_blkaddr = data_blkaddr(dn.inode, dn.node_page,
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
