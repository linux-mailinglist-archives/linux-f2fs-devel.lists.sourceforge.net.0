Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75049A57061
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 19:22:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqcKt-0005Ke-71;
	Fri, 07 Mar 2025 18:22:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tqcKp-0005KQ-5Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gYAlq/IZDrN3gAui/tjJNHWS0bZWyHE15MvZlcNIc7w=; b=chcbKT4isiZQqs6mHQIexeDOtD
 jSuJkVF7D16iA8cgUEgV/kbC9XAmAAcn71yk4XDILpN9q8CZNPHbVaIDZXFo5pJFfhk58p/LEPIkR
 1GIPVUsIfDCUuRctGEGEyQ6PrVmJiGxgdlG3sMG439Kd9Yz4p7oGFYaAlalb+uUF666c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gYAlq/IZDrN3gAui/tjJNHWS0bZWyHE15MvZlcNIc7w=; b=C1NnPuloFH18GePPEl0ySxeFj0
 YAi6dZkR2eg+BPoz4zKuzQAtAUkAR0XApBYvM8csy+BEjDl3nzvoABaoLotzM7kvNYQFLJxjCbnzD
 S1gKlqR19KocH83E50DRKMgj8ouvWCgLQP8MZGCU6aakdUIo/qLISBjnT0UqxYr2dGvc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqcKj-0004XR-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=gYAlq/IZDrN3gAui/tjJNHWS0bZWyHE15MvZlcNIc7w=; b=pxuuq4CW9Iqdi84kFmqDjILnCV
 6FAlDmRWy/ei0ycQzlm3+S+Y2ZkukBFrShMxfUcspswCkMVP5pwJ6ZrAC4+BR6Geu0CJylIRL2Aos
 OFrO8ZrSeP6GR3iMW+m7H+2gCi8EifCp9l+J9mQHSxANR1Rdy8xQRj1aAiJu1h/JURJD0TEoGn/8b
 V+c8qT3iUC6Qr/Tu0kP65Grf8jtJoT4jjdifftwSnZ1ftUrtdFWd2WPuydAY7FJhAxDekUqDqU+lv
 RF6Whu009Y9HnLxZT1K0x93jpqfJV4Ve0wtLULzlfiLsQkOAnfpXCH1ACt0ETb/OAQYmEdasUvmot
 ojzeikpw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tqcKX-0000000EFjT-15dZ; Fri, 07 Mar 2025 18:21:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  7 Mar 2025 18:21:48 +0000
Message-ID: <20250307182151.3397003-3-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182151.3397003-1-willy@infradead.org>
References: <20250307182151.3397003-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mappings which implement writepages should not implement
 writepage
 as it can only harm writeback patterns. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 24 1 file changed, 24 deletions(-)
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1tqcKj-0004XR-H7
Subject: [f2fs-dev] [PATCH 2/4] f2fs: Remove f2fs_write_data_page()
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

Mappings which implement writepages should not implement writepage
as it can only harm writeback patterns.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a80d5ef9acbb..cdd63e8ad42e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2935,29 +2935,6 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	return err;
 }
 
-static int f2fs_write_data_page(struct page *page,
-					struct writeback_control *wbc)
-{
-	struct folio *folio = page_folio(page);
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	struct inode *inode = folio->mapping->host;
-
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
-		goto out;
-
-	if (f2fs_compressed_file(inode)) {
-		if (f2fs_is_compressed_cluster(inode, folio->index)) {
-			folio_redirty_for_writepage(wbc, folio);
-			return AOP_WRITEPAGE_ACTIVATE;
-		}
-	}
-out:
-#endif
-
-	return f2fs_write_single_data_page(folio, NULL, NULL, NULL,
-						wbc, FS_DATA_IO, 0, true);
-}
-
 /*
  * This function was copied from write_cache_pages from mm/page-writeback.c.
  * The major change is making write step of cold data page separately from
@@ -4111,7 +4088,6 @@ static void f2fs_swap_deactivate(struct file *file)
 const struct address_space_operations f2fs_dblock_aops = {
 	.read_folio	= f2fs_read_data_folio,
 	.readahead	= f2fs_readahead,
-	.writepage	= f2fs_write_data_page,
 	.writepages	= f2fs_write_data_pages,
 	.write_begin	= f2fs_write_begin,
 	.write_end	= f2fs_write_end,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
