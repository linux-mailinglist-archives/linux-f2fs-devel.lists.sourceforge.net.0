Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C64AFD426
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upd1WLCTHsi17Dv2hmbF43rdExeX35VzoBffF8cekmU=; b=eAr+ogsM5w1ITF2AAFRseq/5fy
	H43bNKIl6Nj2tJqqXqtduvf6DMayeDk0HBUFg+j9xvidg3DKXwM7M5EbeAJSWsq8z0Vsc9pR616GS
	+m27mgK0dTtSO8L7KN9hDFi6PzpoNgHSv5fCzNLOh26yn6SEXD46aiI0u+hRNYjJN7m8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjr-0007KQ-Kp;
	Tue, 08 Jul 2025 17:04:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0007JQ-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYAhUY4Y3Fz1W+2iuZ2HFhXGNxug5Y/0exSTAkoPIX4=; b=VuklGUsOk+ClV7TdTSb6BuZ2xU
 YPJoBANgjaU67kfpBtuI/4xTz+wfrtN06FVUAOG0tHqPKCVZc33fY8rU3V0PhoJNL/MyRHgnvwj85
 1Gwd3GkzkRngrCJJtQGvhu/5COwDCSKciWsGOc43NcE31hg1yGjWT0xat+ynnQ14am5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KYAhUY4Y3Fz1W+2iuZ2HFhXGNxug5Y/0exSTAkoPIX4=; b=RJJUSMGn7NB6FXMvRuFAXB6kN5
 CbOCPEl9/ydVvuHmdBxv7ANxjLWmxHojFeGhLEP0bb5jl7/9vslmfXsdwvCnYV/oOqYlf02RnUJC4
 eU9au/BEqeNxobIV56PP82mBgfQLhnamHnL8rH4OrCE/2OuLAa3h7UH3sxMANqE0Xv+k=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EI-19 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KYAhUY4Y3Fz1W+2iuZ2HFhXGNxug5Y/0exSTAkoPIX4=; b=fpd26e6QzHmHAcU1nIrmXPYVmM
 LqBKd+7EkacAee4ChNsCjS1DL7XJOsp9m8bzA8pKg4CiieldH7wqfvohlflcreurbPMJpmTzdHsea
 AxQctdNL7vqrb/GhsiW6myPaD2vUCjsTArrfZ/VBE+mTBp0oJ7fzjFKPA0PFr5FdugoUmrapbGzSQ
 0SPGBgmPVORyWZwqzJVyu33dKNZiRCmqZEalkqZUbY1RP2mT3DO2tD7tQu7hFjK0dq4R34uNwXQbs
 lVUYUkIP2QqsaSA366iA1Ska1h4Y5SwIwLPOr534nJbWqyER4lzB+U+/SNo8xK3jrTFk3DEnu/WlS
 FqcW6DiA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjd-00000000T3B-2bNb;
 Tue, 08 Jul 2025 17:04:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:02:58 +0100
Message-ID: <20250708170359.111653-2-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/recovery.c | 8
 ++++---- 1 file changed, 4 insertions(+),
 4 deletions(-) diff --git a/fs/f2fs/recovery.c
 b/fs/f2fs/recovery.c index 51ebed4e1521..f84a96deaa07 100644 ---
 a/fs/f2fs/recovery.c +++ b/fs/f2fs/recovery.c @@ -157, 10 +157,
 10 @@ static int init_recovered_filename( [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjp-0006EI-19
Subject: [f2fs-dev] [PATCH 01/60] f2fs: Pass a folio to recover_dentry()
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

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/recovery.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 51ebed4e1521..f84a96deaa07 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -157,10 +157,10 @@ static int init_recovered_filename(const struct inode *dir,
 	return 0;
 }
 
-static int recover_dentry(struct inode *inode, struct page *ipage,
+static int recover_dentry(struct inode *inode, struct folio *ifolio,
 						struct list_head *dir_list)
 {
-	struct f2fs_inode *raw_inode = F2FS_INODE(ipage);
+	struct f2fs_inode *raw_inode = F2FS_INODE(&ifolio->page);
 	nid_t pino = le32_to_cpu(raw_inode->i_pino);
 	struct f2fs_dir_entry *de;
 	struct f2fs_filename fname;
@@ -233,7 +233,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 	else
 		name = raw_inode->i_name;
 	f2fs_notice(F2FS_I_SB(inode), "%s: ino = %x, name = %s, dir = %lx, err = %d",
-		    __func__, ino_of_node(ipage), name,
+		    __func__, ino_of_node(&ifolio->page), name,
 		    IS_ERR(dir) ? 0 : dir->i_ino, err);
 	return err;
 }
@@ -817,7 +817,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 			}
 		}
 		if (entry->last_dentry == blkaddr) {
-			err = recover_dentry(entry->inode, &folio->page, dir_list);
+			err = recover_dentry(entry->inode, folio, dir_list);
 			if (err) {
 				f2fs_folio_put(folio, true);
 				break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
