Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F0A76EB1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWQ-00019U-RX;
	Mon, 31 Mar 2025 20:14:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVi-0000lm-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yra+0+SOP9Pc7vKcN3fM29bgRTO24uEOdz31HSwaM58=; b=kD2OtYut1ubOdIzBWXptoRLTUj
 0D8RAREc8FiSprt70JOEZkM6D9xKWEGtq1nx9pFLVT997ydqnRR5AG8O4Ln8fKY8y81uT4uNnNPP8
 vp+hdz/G/4M9H2raTWyTK/GSG8n0P46GoeNielE3Sm3VOpz2rHj0xnU5tN7nFag0YOIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yra+0+SOP9Pc7vKcN3fM29bgRTO24uEOdz31HSwaM58=; b=R2cG/KIbljKkVDxcaa68xXwk5/
 GlHIKy4tdAHlBCMmPhKy26rvYcXbCGYPUg0q9UMvErGLhT1NkeL1fShMCCO+XY2uBRMRWvlAd06lE
 Jub2e2LcIZ0J9FBNS5BGgL6UqcGi26F5sJh3utqpev056jKr2i70sJtk2+OZxWMyFptc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVi-0003em-8Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Yra+0+SOP9Pc7vKcN3fM29bgRTO24uEOdz31HSwaM58=; b=uS1+rjJT+r+GepAoWlJ5hXpJny
 gIJy7/TTOHL7bELg9cGzIefxo1QLkFRC5g5dP/wIKk4C30JYQ++ODoDzYvY9E+i7Amnro3/n6YNzm
 SHgh6vG3/3TehZW+92pnKScTpbt7DEKY4KOgkDESoMFKBs0x3KF+pi26bW5e+6iiFNuQQv4t1zW92
 1pyEMR86WN3L/Nuc3tB8+kOtc3iQB0y9jhMXqcKdPrV0EBDO1beyFahLjn2+ZuaH+n4Tf8YLbzMWV
 w54RpEgkg/Zfudh0uFJMPVRH07en+6yXWmtvQS1HosOW+I+Npdia+bepaqGSvrab8cQqmKuFzkftg
 tZ1KSA8w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVW-00000004SFg-3Yhj;
 Mon, 31 Mar 2025 20:13:18 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:03 +0100
Message-ID: <20250331201256.1057782-104-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove a call to compound_head(). Signed-off-by: Matthew
 Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 10 +++++----- 1 file
 changed, 5 insertions(+),
 5 deletions(-) diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
 index 8e175e5ee23f..58f427e9d1f7 100644 --- a/fs/f2fs/inline.c +++
 b/fs/f2fs/inline.c
 @@ -729,21 +729,21 @@ void f2fs_delete_inline_entry(struct f2fs_d [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVi-0003em-8Q
Subject: [f2fs-dev] [PATCH 103/153] f2fs: Use a folio in
 f2fs_empty_inline_dir()
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

Remove a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 8e175e5ee23f..58f427e9d1f7 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -729,21 +729,21 @@ void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry, struct page *page,
 bool f2fs_empty_inline_dir(struct inode *dir)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	struct page *ipage;
+	struct folio *ifolio;
 	unsigned int bit_pos = 2;
 	void *inline_dentry;
 	struct f2fs_dentry_ptr d;
 
-	ipage = f2fs_get_inode_page(sbi, dir->i_ino);
-	if (IS_ERR(ipage))
+	ifolio = f2fs_get_inode_folio(sbi, dir->i_ino);
+	if (IS_ERR(ifolio))
 		return false;
 
-	inline_dentry = inline_data_addr(dir, ipage);
+	inline_dentry = inline_data_addr(dir, &ifolio->page);
 	make_dentry_ptr_inline(dir, &d, inline_dentry);
 
 	bit_pos = find_next_bit_le(d.bitmap, d.max, bit_pos);
 
-	f2fs_put_page(ipage, 1);
+	f2fs_folio_put(ifolio, true);
 
 	if (bit_pos < d.max)
 		return false;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
