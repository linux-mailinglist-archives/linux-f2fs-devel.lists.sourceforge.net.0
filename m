Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A83A39318
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWq-0000KJ-8J;
	Tue, 18 Feb 2025 05:52:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWn-0000JL-P5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8hfEr/bs2O93cTTYBjuHfYQrmaf2LnuSS7qSOXK8nGg=; b=bDrXhp/FFh/KVQ4PwGHgYXmA2E
 aqWI/Eoc2N7vzmisyfbdQYsSLWnOLlo7lK4LXow7XOVgP2ulrBJoiHU6NIfBWpNOjPUDtYj1kAc7Z
 NP0OV5rxBuW68R3DCwI9FuVjp1cHFIY34OEPkl2kje62+92A6m/WHR9YAQwY7npiviNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8hfEr/bs2O93cTTYBjuHfYQrmaf2LnuSS7qSOXK8nGg=; b=IZr2aLrFMY1rOc6gzdKX+UDhwb
 OCfdFsjvoIGLZCi00hd02c1Ko1cneKfsyhA2Q5Xkv+5615Yx832MjwKkuVVmT4dBn1bkym5YfTPlV
 K/njq6yI0ToQRywWpm9feXcUD4Qs2mD3YMMGMtnKFC9Ssxqq3cgCGsM6T+sbJLAlsna0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWn-0007c9-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8hfEr/bs2O93cTTYBjuHfYQrmaf2LnuSS7qSOXK8nGg=; b=ZBJn8dKca5FE5jhJgQAJMDN0W3
 ps1D9yGjREvu8T/x6oOTyJ2u30HcwMcb5641vNoqBPsDxuSRD5gxF2yJwnNcr3kBFSpfewiLcfm6z
 /P16nriyVs75bzWhXI5a7UsPG1YDIaKvtdo8nW8fcZ7m8KcrT25cD7wVvfRmUdJHLkVUOJdb65kIB
 +S5nGmfyfgip+RZ+1/up3N0WIHdix+gDb/uC4134lG/CH1lttGZJrQnD3rC9UPUJR5yEeEJEvzRZa
 9G/VZSBmS0mM0FXzN/UBfZdW8NiHd8VOZcGbydXDU1Caj5AvlWUuOLWhU2OFXhge49otVx+p+cCje
 7rGs/MMw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002Try-2aHs; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:44 +0000
Message-ID: <20250218055203.591403-11-willy@infradead.org>
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
 Content preview: Convert f2fs_grab_cache_page() into f2fs_grab_cache_folio()
 and add a wrapper. Removes several calls to deprecated functions.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 37
 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+), 12 deletions(-) 
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
X-Headers-End: 1tkGWn-0007c9-Uu
Subject: [f2fs-dev] [PATCH 10/27] f2fs: Add f2fs_grab_cache_folio()
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

Convert f2fs_grab_cache_page() into f2fs_grab_cache_folio()
and add a wrapper.  Removes several calls to deprecated functions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5e01a08afbd7..cf664ca38905 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2767,33 +2767,46 @@ static inline s64 valid_inode_count(struct f2fs_sb_info *sbi)
 	return percpu_counter_sum_positive(&sbi->total_valid_inode_count);
 }
 
-static inline struct page *f2fs_grab_cache_page(struct address_space *mapping,
-						pgoff_t index, bool for_write)
+static inline struct folio *f2fs_grab_cache_folio(struct address_space *mapping,
+		pgoff_t index, bool for_write)
 {
-	struct page *page;
+	struct folio *folio;
 	unsigned int flags;
 
 	if (IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION)) {
+		fgf_t fgf_flags;
+
 		if (!for_write)
-			page = find_get_page_flags(mapping, index,
-							FGP_LOCK | FGP_ACCESSED);
+			fgf_flags = FGP_LOCK | FGP_ACCESSED;
 		else
-			page = find_lock_page(mapping, index);
-		if (page)
-			return page;
+			fgf_flags = FGP_LOCK;
+		folio = __filemap_get_folio(mapping, index, fgf_flags, 0);
+		if (!IS_ERR(folio))
+			return folio;
 
 		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC))
-			return NULL;
+			return ERR_PTR(-ENOMEM);
 	}
 
 	if (!for_write)
-		return grab_cache_page(mapping, index);
+		return filemap_grab_folio(mapping, index);
 
 	flags = memalloc_nofs_save();
-	page = grab_cache_page_write_begin(mapping, index);
+	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+			mapping_gfp_mask(mapping));
 	memalloc_nofs_restore(flags);
 
-	return page;
+	return folio;
+}
+
+static inline struct page *f2fs_grab_cache_page(struct address_space *mapping,
+						pgoff_t index, bool for_write)
+{
+	struct folio *folio = f2fs_grab_cache_folio(mapping, index, for_write);
+
+	if (IS_ERR(folio))
+		return NULL;
+	return &folio->page;
 }
 
 static inline struct page *f2fs_pagecache_get_page(
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
