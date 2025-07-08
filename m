Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C744AFD434
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVfMWxi4YorhP+gdPfF+r+ewF3rMjzyLOohlsZP3tAo=; b=fT8PSFe3YC7I5bwQ9iqEZWR/OV
	F9dzmMFuEX3dFTe9ML94SMaTgk9+xDBqLh1bO+PPVO6gRBPbtSZcNbDDlnXRbhijyH9OUaUL7UD41
	kNgTio+2bX6+S9iL7f2p9mQL0/vo75vjAJcHH8Q8583K89ib9ZbnS/Q83/fOUv651X1c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjv-0002ox-7H;
	Tue, 08 Jul 2025 17:04:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0002oC-1f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7nDxBQy5NxymSKyqPA/reDSPFgPBrrZI4yYbQbuvBQ=; b=dcvpN2XN7iwFNDNCsCSSk94CpT
 EmSAqe9FW/Ue0BNsXJKtpp7l5z2DiwiUKc0vzfrtnMf0PySyPXrqPOi/QrfOitHOsX6vE73lEnq1m
 U/TlT+QvYkExHgmLgfk/D2fcibHxBRheWJLKOMdgNTgockmW/AlgVdOLtOqKO00A1h3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7nDxBQy5NxymSKyqPA/reDSPFgPBrrZI4yYbQbuvBQ=; b=Y+0aXsCKJJdRYOwAr0iKHEBa7D
 CX9eOyCxJN6hmN1GMSEID+oFlbmxVwIyHHnZ89ZyskRm3z+8uZzq4g73UNMpNTzczdzdEwacM9DzG
 8p97xINBMeFesNIm2SR0xQLx8qL915fVT0AhfiG3W6Mue5wbkVbAGCM4n1cD6H/7IgTk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006Eh-Q8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=h7nDxBQy5NxymSKyqPA/reDSPFgPBrrZI4yYbQbuvBQ=; b=uwfXxbKff7dt8z00dl3uUJH0ku
 kISowJshvjr4e/3jDP9oTJw7vPgFoKMnVnYBYPKToSGW2AOMry5TmjG1mQ63r7RtaAtUmAkH0vXUB
 kXON0PGGAsh7hYZdWkpuyi0o/L9Rta1GTA2FBNGWwVXPiasWqTzQZPvI8y8TrPeg5pY0wFyLCixZj
 3EeV7ZxBfiUdJrYeP9TI2b4uyow8kfY1KdvJMfEKnjbVzIzhrIVfjN4yoWc10G0+QDi65G38Uo6ih
 L5rHcNeVTBvmYAsK4X+qq77EAPJA3PE1FJQwH0F0UR/g/LPbMSju11zl07AxWhL89wsXb9Ojiqe1i
 fPXmu+NQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4R-1KBq;
 Tue, 08 Jul 2025 17:04:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:10 +0100
Message-ID: <20250708170359.111653-14-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have a folio so pass it in. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 6 +++---
 fs/f2fs/node.h
 | 2 +- 2 files changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjq-0006Eh-Q8
Subject: [f2fs-dev] [PATCH 13/60] f2fs: Pass a folio to set_dentry_mark()
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

All callers have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 6 +++---
 fs/f2fs/node.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 26d3bc7597d9..f964b526b73c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1863,7 +1863,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			f2fs_folio_wait_writeback(folio, NODE, true, true);
 
 			set_fsync_mark(&folio->page, 0);
-			set_dentry_mark(&folio->page, 0);
+			set_dentry_mark(folio, 0);
 
 			if (!atomic || folio == last_folio) {
 				set_fsync_mark(&folio->page, 1);
@@ -1872,7 +1872,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
 						f2fs_update_inode(inode, folio);
-					set_dentry_mark(&folio->page,
+					set_dentry_mark(folio,
 						f2fs_need_dentry_mark(sbi, ino));
 				}
 				/* may be written by other thread */
@@ -2087,7 +2087,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto continue_unlock;
 
 			set_fsync_mark(&folio->page, 0);
-			set_dentry_mark(&folio->page, 0);
+			set_dentry_mark(folio, 0);
 
 			if (!__write_node_folio(folio, false, &submitted,
 					wbc, do_balance, io_type, NULL)) {
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 75e03f994847..69384832f84b 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -432,5 +432,5 @@ static inline void set_mark(struct page *page, int mark, int type)
 	f2fs_inode_chksum_set(F2FS_P_SB(page), page);
 #endif
 }
-#define set_dentry_mark(page, mark)	set_mark(page, mark, DENT_BIT_SHIFT)
+#define set_dentry_mark(folio, mark)	set_mark(&folio->page, mark, DENT_BIT_SHIFT)
 #define set_fsync_mark(page, mark)	set_mark(page, mark, FSYNC_BIT_SHIFT)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
