Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41B9DB27C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:20:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWxE-0006d3-7I;
	Thu, 28 Nov 2024 05:20:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWxC-0006ct-Q2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HnHj92w7glRgaleaGhAntsffFpXU1keDJ8fk5N7/Y6s=; b=CF6ziqZpCq9KCigQOCOrXJ4c2z
 Sa5bisxkrzBUb+ojFkVOXBgcx2NBB5vN56eYaacIz9gDw9fvrKVTaIvSX4Yz7P98EOt/CrAnIB3gt
 j1/zoWcdi9i+oUOBS24lixYgWWxTAlQgQPPnbJwkGztOSE14yzWz8etnAmR6/I0IKRuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HnHj92w7glRgaleaGhAntsffFpXU1keDJ8fk5N7/Y6s=; b=EO229rAjaEKbGf5HuSj8euYxht
 5NXWrp0c3kDwkqNKPhKbgPal7y7fclmH585xZ87U2nBKAC7GKewDrBjQC2HPYfk0KgqhqsP79Ohr/
 qE86BqlqlmnEpsR5hC5Qak3PBuVNnWcn2JLjnfckW6+GQVbhhyfT6fzimnXaYI25qY5c=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWxB-0004kz-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HnHj92w7glRgaleaGhAntsffFpXU1keDJ8fk5N7/Y6s=; b=risKwemwvGQJdFOlbhgAlcI5B8
 rYY0l1N/4KugWp7QNWcSd99Q+nbZRWPriLIpmWPg8lX9uVYSopdgiMIbtRNJMRflje8RCK1pbiaTx
 l6juMz9PKAerhdG2yHmpkKHqNgXElys94QmI0SgZNwbFkJM19+eNA0+eErOO+aH2ogd7nT2nmzi7x
 dlmuMq2FkwCTyfhjTnBOQSqVv+G1GOcVENf85ZrzN0Zd4oZlY85GdhRVrz34s7LQUVzoZgmaLKzc+
 6idhJxanLa6YHAyxgdlwx7/U7nS0+0BuUA5aO3v+XkXV/alpkkQkyPtfk3jm6eBtYlvvrKEtGPQ98
 m0RQJ92Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbq-00000002DFV-1QpB; Thu, 28 Nov 2024 04:58:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:17 +0000
Message-ID: <20241128045828.527559-3-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This removes an access of page->index. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 3 ++- 1 file
 changed, 2 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
 index 9f8d0f4c8564..c91a2e4fe60c 100644 --- a/fs/f2fs/compress.c +++
 b/fs/f2fs/compress.c
 @@ -1197,7 +1197,8 @@ bool f2fs_compress_write_end(struct [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWxB-0004kz-H7
Subject: [f2fs-dev] [PATCH 02/11] f2fs: Use a folio in
 f2fs_compress_write_end()
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

This removes an access of page->index.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9f8d0f4c8564..c91a2e4fe60c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1197,7 +1197,8 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 		.cluster_size = F2FS_I(inode)->i_cluster_size,
 		.rpages = fsdata,
 	};
-	bool first_index = (index == cc.rpages[0]->index);
+	struct folio *folio = page_folio(cc.rpages[0]);
+	bool first_index = (index == folio->index);
 
 	if (copied)
 		set_cluster_dirty(&cc);
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
