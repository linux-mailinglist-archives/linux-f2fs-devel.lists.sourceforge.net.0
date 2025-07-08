Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9EEAFD42D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjgAVGrZUxejwEK0PWy5ozt/CD0OOy+BzE7dx/zHpvg=; b=KMNQ9WT7aqOV9VsdtmM3C6E5W4
	Cq+zC5V+qxEMpk+TE5CF/xNPCzfGo94kMpnkqxvoT1ujVhPwno16qVj08PSwNFtGI82x9lmBN8RXs
	AEpyFBHahI81pnDilWC0wI2b0f+QmMv+m2CZfo1ow6/0amqNrAoT3B5uzggZKC1OoMds=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjt-0002nY-8N;
	Tue, 08 Jul 2025 17:04:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjr-0002mF-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PA/L/FfUdNp65k+zbwzWEv1cIAwIjkGSouW5jFw5I9U=; b=H/wKTNCOS5hh9EpUUMXPsZilnG
 hYLEeSlqlrxC2BfsyIYSABH/VBnW3Kt6+3Gno2fuU9aHDNDAxGuV+lHC6wiMKj+IJq11sdZFGiMtd
 5pM4zdR8Pc+4Y739jM8w6m5bvdZ+5B3V/wB9DM3dFUICIW/k+l4sbP7N3VdX8nFwkYZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PA/L/FfUdNp65k+zbwzWEv1cIAwIjkGSouW5jFw5I9U=; b=d7dF2BGxNKXvW22pejM1V1tPZi
 E8PG6tnMjNTo1S0goH1NAgkPupL5nyrB9Oa7JpJiKB5DwjrDvmuCikTJ0eyz0Y+GZtpCJTDr3QE8B
 dq0sZ1m2vPr6ep2gORgCqnOkYY9FsP9c4qONqebfKq70eIyg7R2TahVFO+v8xsX2QaqM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EM-GD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=PA/L/FfUdNp65k+zbwzWEv1cIAwIjkGSouW5jFw5I9U=; b=Dg/aJ5yDNnqJj3vbl6N6jf++hN
 LPdQ3+I+1uaVMRroM/Bt2uuv9WS3WoaGjbHweYyF40ebO+orh2nfuekOeSGX42Zkn+R9XLzO6o5Jh
 vVnhTudU+xPGoMVwY3igyxUNhaDhbWMs8Q6A3VY+HxwhVrxqR52g38CsZILjCOKyIhLOTOwMW4mdP
 kqVK1XZQeTAz/fQH3sfNLD/40JDhYAzW7EBNQTdkYX4G7bDg44bKZHeeiASp4htGTBGWADyJDFL8J
 Ik6eisWlLIqDi6ir2s77FF7fxY8BSKrv7TeN8LIjv05zaysUwCLEu/q+so2pnEvtpuR+CXehasn06
 oZT7ofZw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T3a-0Z71;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:02 +0100
Message-ID: <20250708170359.111653-6-willy@infradead.org>
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
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/extent_cache.c
 | 4 ++-- fs/f2fs/f2fs.h | 2 +- fs/f2fs/inode.c | 2 +- 3 files changed,
 4 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1uZBjp-0006EM-GD
Subject: [f2fs-dev] [PATCH 05/60] f2fs: Pass a folio to
 sanity_check_extent_cache()
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
 fs/f2fs/extent_cache.c | 4 ++--
 fs/f2fs/f2fs.h         | 2 +-
 fs/f2fs/inode.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..41b08814242c 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -19,10 +19,10 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
+bool sanity_check_extent_cache(struct inode *inode, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
+	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_info ei;
 	int devi;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1243264f4170..d278b5117629 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4350,7 +4350,7 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 /*
  * extent_cache.c
  */
-bool sanity_check_extent_cache(struct inode *inode, struct page *ipage);
+bool sanity_check_extent_cache(struct inode *inode, struct folio *ifolio);
 void f2fs_init_extent_tree(struct inode *inode);
 void f2fs_drop_extent_tree(struct inode *inode);
 void f2fs_destroy_extent_node(struct inode *inode);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 083d52a42bfb..6ce6279e4eb5 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -531,7 +531,7 @@ static int do_read_inode(struct inode *inode)
 
 	init_idisk_time(inode);
 
-	if (!sanity_check_extent_cache(inode, &node_folio->page)) {
+	if (!sanity_check_extent_cache(inode, node_folio)) {
 		f2fs_folio_put(node_folio, true);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
