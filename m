Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 572E7A76E4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVm-0000oU-5r;
	Mon, 31 Mar 2025 20:13:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVX-0000kB-MI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKgrjelxP/m5iUdyJVlzQ9mEW5/4WxWKBR26K5cV7jY=; b=OUffqXtfNeASlwNbPm3DI3xP61
 hIACF7wg0GUC9c/GwaKo5DfasosVKq+wWklu0+dqRCrsatsKZexFCNCSEtJhmGg0LkN7on1GAZmGd
 VzGwFmYoFGdp6kA7OLwO+gJYwAH+1BtyEv2nIi1GfCUootb1vynsJ1bMyxLCnGXqcFDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MKgrjelxP/m5iUdyJVlzQ9mEW5/4WxWKBR26K5cV7jY=; b=CjTJgLGjvOraeyYoW0q5y8VwDV
 P1ffhKqH08/YsbDK75EuMXRpOBbG0QYivCWJaBo+3ekKBQjijX8wLifSCyo+pNm04nkO4Nn3YYb+6
 4sVoLBtMhkV8CAYjtSHclkAV2J3183ep3exyNUfxTIC7hQVnOTZ5HHeRCXW5aDskUip8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVN-0003YC-Bk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=MKgrjelxP/m5iUdyJVlzQ9mEW5/4WxWKBR26K5cV7jY=; b=SKhTmD8htOxKSDQUDMEqcJRx74
 pkZxXTZzfAH/mtYxl9lmqQjvlSzGmFCIsAEV7o0EvvWOpiAU2HFExcZDHPeJZpm3bieDgzdiP8Eq5
 C6NYsah8RZvQ5hQbcbzYaKtw5BWLUC4bYdlacj16FzueFOpcbWMUS9wfOk74cinTQ+Qu1C8USu/y8
 uIgW5sLJlcdabJyZKhb6zlBiTUjMwZqgJ/ynon3hQUeqByefN4g+8PfaP/kDZ/lpJy3Sf4HCPwc+1
 pQqUFl3068WO5zejt+rngFc/CP95LR988Q1l+3WiMWk/K10otTkhHFbaz1uKbR4ffDxLjwOCrqJ/z
 bV9FICOQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RWX-05XI;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:33 +0100
Message-ID: <20250331201256.1057782-14-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There were some missing conversions from
 f2fs_wait_on_page_writeback()
 to f2fs_folio_wait_writeback(). Saves a call to compound_head() at each
 callsite.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/checkpoint.c
 | 3 +-- fs/f2fs/data.c | 4 ++-- fs/f2fs/file.c | 2 +- 3 files changed, 4
 insertions(+), 5 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVN-0003YC-Bk
Subject: [f2fs-dev] [PATCH 013/153] f2fs: Use f2fs_folio_wait_writeback()
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

There were some missing conversions from f2fs_wait_on_page_writeback()
to f2fs_folio_wait_writeback().  Saves a call to compound_head() at each
callsite.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 3 +--
 fs/f2fs/data.c       | 4 ++--
 fs/f2fs/file.c       | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index fdc310e9f261..55fcb9869531 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -456,8 +456,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 				goto continue_unlock;
 			}
 
-			f2fs_wait_on_page_writeback(&folio->page, META,
-					true, true);
+			f2fs_folio_wait_writeback(folio, META, true, true);
 
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e668497ed3fc..e6921a53c7a1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3129,7 +3129,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (folio_test_writeback(folio)) {
 				if (wbc->sync_mode == WB_SYNC_NONE)
 					goto continue_unlock;
-				f2fs_wait_on_page_writeback(&folio->page, DATA, true, true);
+				f2fs_folio_wait_writeback(folio, DATA, true, true);
 			}
 
 			if (!folio_clear_dirty_for_io(folio))
@@ -3624,7 +3624,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		}
 	}
 
-	f2fs_wait_on_page_writeback(&folio->page, DATA, false, true);
+	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
 	if (len == folio_size(folio) || folio_test_uptodate(folio))
 		return 0;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..25f69a308dde 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -131,7 +131,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		goto out_sem;
 	}
 
-	f2fs_wait_on_page_writeback(folio_page(folio, 0), DATA, false, true);
+	f2fs_folio_wait_writeback(folio, DATA, false, true);
 
 	/* wait for GCed page writeback via META_MAPPING */
 	f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
