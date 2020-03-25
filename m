Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FF4192837
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 13:28:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH59K-0005Dc-Ot; Wed, 25 Mar 2020 12:28:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+51ae3af3ded1af5ce3db+6058+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jH59J-0005DT-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odzXVZYmd7lUAGEV7AWVw3TgYy4WB3IJY3Y6KA2lMSU=; b=ePGp19Ape17SJSYJAgIJqZjRy4
 YqsCG8OUlY1VE+DoMOMLU3uNj2hITW2eYV9IPOTwkX3lZjz2Zzzj7pAOBuUyH+eYMdlsypaKquOx6
 96gMhCFwtQSQVICjx+XdWhipGANonBU/Lnr0mBUdzPOp79ly4TnPnNFCWYWuOBB4YGwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=odzXVZYmd7lUAGEV7AWVw3TgYy4WB3IJY3Y6KA2lMSU=; b=aaLABYE9dsok8lXZEtLEV7GNHH
 IVNModepNDORGk/st8h3kFLHpR07KRRDk7b4xJ3jWfFJCF0EvfOUtkwmNoLwbIkocrQngNkYiXAUG
 2a7dSKCvuoQ83TYNQWg7EXNlD7randHTy3iHeQAY0AvYcmHQVNTjz/u2CZ+NW6yZ+HJA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH59I-00GNjz-LR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 12:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=odzXVZYmd7lUAGEV7AWVw3TgYy4WB3IJY3Y6KA2lMSU=; b=Yau3b5kUjjBG9f4qwQn0pzufd1
 5Zqvc3ruUYCUg8fOAmMK1lAqY2FE/xezNNbjcgBdf+Q4WK1z7s09av07BATn0HCqwWzvJ926BtomF
 80x9nayMW2gMMEjFA5l/P3/rolns3pyvUCNhm4A0qCNkKdZNTZC442m13HrvOW+Jj+tCoSb2MMNPP
 mGc2f7OkhQyID4UzfAqqpl1UsJ7NdSe4B3GR16ej9d9bUu/Vvy0Scl6Htq6owDnm5Qne5FaOwbuB/
 btD5fblL0m9GlHCnv/EJWTtSUUaTMZnuhLEiFglECgdgUGHb7AqrK6b89uFK5i6p98VkKp29roHyd
 JqoCkGog==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH593-0003GS-NL; Wed, 25 Mar 2020 12:28:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>, linux-xfs@vger.kernel.org
Date: Wed, 25 Mar 2020 13:28:22 +0100
Message-Id: <20200325122825.1086872-2-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325122825.1086872-1-hch@lst.de>
References: <20200325122825.1086872-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jH59I-00GNjz-LR
Subject: [f2fs-dev] [PATCH 1/4] ubifs: remove broken lazytime support
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

When "ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs" introduces atime
support to ubifs, it also lazytime support, but that support is
terminally broken, as it causes mark_inode_dirty_sync to be called from
__writeback_single_inode, which will then trigger the locking assert
in ubifs_dirty_inode.  Just remove this broken support for now, it can
be readded later, especially as some infrastructure changes should
make that easier soon.

Fixes: 8c1c5f263833 ("ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ubifs/file.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 743928efffc1..49fe062ce45e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1375,7 +1375,6 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(ui->data_len, 8) };
-	int iflags = I_DIRTY_TIME;
 	int err, release;
 
 	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
@@ -1393,11 +1392,8 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 	if (flags & S_MTIME)
 		inode->i_mtime = *time;
 
-	if (!(inode->i_sb->s_flags & SB_LAZYTIME))
-		iflags |= I_DIRTY_SYNC;
-
 	release = ui->dirty;
-	__mark_inode_dirty(inode, iflags);
+	__mark_inode_dirty(inode, I_DIRTY_SYNC);
 	mutex_unlock(&ui->ui_mutex);
 	if (release)
 		ubifs_release_budget(c, &req);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
