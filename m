Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7219283A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 13:28:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH59R-00025d-UE; Wed, 25 Mar 2020 12:28:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+51ae3af3ded1af5ce3db+6058+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jH59Q-00025J-Hu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eHCeht8Jl87loSG9fXCjdqcbTJKVdxCg8ZdFEYMWIr8=; b=RiNRmU5NUYBogg9O+ZTd9Xu/1i
 2vduwEkQrRD5LQwoXuelWy2sqOElcF5fZPFnQz4dKfESp2MIoyFTRgVjqaikJQreXr+G28HQRG9do
 m243AuUBJaKVvZeS4mgpj6VYVQBBecsMLpKGV51ehtLUJZF7od0tK3hCFcZn0lKMMqO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eHCeht8Jl87loSG9fXCjdqcbTJKVdxCg8ZdFEYMWIr8=; b=UKO3Y9l9MpM8YUlSrFC4/E0oe5
 CxA8Ofp1zPWp9JbMThhG+8IFaAuErry9OhiH1MHFMsGMWgfhczl0qE33L/9+dv/GXL9+K4gueJY2w
 v4cvJSJQm+TrkhzidmHVFrFzZCp7tsviq1DRwT7KMScKxRUTMDNmpMFwa1pW3Y/HmF0w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH59N-006chC-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eHCeht8Jl87loSG9fXCjdqcbTJKVdxCg8ZdFEYMWIr8=; b=uus+icWQcHSgAhoVsInQ++TwUI
 qDZjpBIzOwTvK1ys0gtNgZMNwLbEpGG+kCXKe1BpCKD/yrrceIcRvozFaFgfDrpFwWvAnN7oiy6zq
 mCXVDurYXZaCyFTKOpw5bG1a+BmrxjcUBMiu41iw96exliyRhjrSapCoqIleisGdAulAQVi5J+Bf9
 VQHrQGHnkRJy9Dci9+GOp2e5v06DmOQjXrFaCrMIXYeL2JoBxk9knaHgcXDB/0skewK8pto97zhig
 T5p/CqzfS8zKMU5afyd2Rl3n8Tc4iEpyoJsbsrU0HqTdGK2oqdMQXJsckOLHgmrLKFkypME5RXkT9
 SenBw6DQ==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH599-0003Ko-4c; Wed, 25 Mar 2020 12:28:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Date: Wed, 25 Mar 2020 13:28:24 +0100
Message-Id: <20200325122825.1086872-4-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325122825.1086872-1-hch@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH59N-006chC-Ox
Subject: [f2fs-dev] [PATCH 3/4] fs: don't call ->dirty_inode for lazytime
 timestamp updates
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is no need to call into ->dirty_inode for lazytime timestamp
updates that use the I_DIRTY_TIME flag, as file systems per definition
must ignore them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/inode.c   | 8 +-------
 fs/f2fs/super.c   | 3 ---
 fs/fs-writeback.c | 8 +++-----
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index fa0ff78dc033..dbdcf3cc0e64 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5805,17 +5805,11 @@ void ext4_dirty_inode(struct inode *inode, int flags)
 {
 	handle_t *handle;
 
-	if (flags == I_DIRTY_TIME)
-		return;
 	handle = ext4_journal_start(inode, EXT4_HT_INODE, 2);
 	if (IS_ERR(handle))
-		goto out;
-
+		return;
 	ext4_mark_inode_dirty(handle, inode);
-
 	ext4_journal_stop(handle);
-out:
-	return;
 }
 
 int ext4_change_inode_journal_flag(struct inode *inode, int val)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 529334573944..5f3221ade64e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1091,9 +1091,6 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
 			inode->i_ino == F2FS_META_INO(sbi))
 		return;
 
-	if (flags == I_DIRTY_TIME)
-		return;
-
 	if (is_inode_flag_set(inode, FI_AUTO_RECOVER))
 		clear_inode_flag(inode, FI_AUTO_RECOVER);
 
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index dc2d65c765ae..482781da8be1 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2252,16 +2252,14 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
 	 * dirty the inode itself
 	 */
-	if (flags & (I_DIRTY_INODE | I_DIRTY_TIME)) {
+	if (flags & I_DIRTY_INODE) {
 		trace_writeback_dirty_inode_start(inode, flags);
-
 		if (sb->s_op->dirty_inode)
 			sb->s_op->dirty_inode(inode, flags);
-
 		trace_writeback_dirty_inode(inode, flags);
-	}
-	if (flags & I_DIRTY_INODE)
+
 		flags &= ~I_DIRTY_TIME;
+	}
 	dirtytime = flags & I_DIRTY_TIME;
 
 	/*
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
