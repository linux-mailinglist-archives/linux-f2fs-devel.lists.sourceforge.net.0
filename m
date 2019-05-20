Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C0B23D68
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBQ-0004pd-7n; Mon, 20 May 2019 16:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBO-0004pD-R5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GzWhROu4+TYQnPdOw7Ea/BZG0+JZk8Ww8fCk68Gxm5E=; b=geCc8BqynJw4ifes1VZtbqzL07
 BV9D/y97FeQp/B+cWFZitjF/C1rBFI/P7z0eC6wVykLCnNRFU7UPWlZrzzYV5vZG4UHRQ5JMiBHoD
 gVconEUxPX1QvPNp0KSDOb5xb/SsD48Jnvykt6Fsv8XNW7Dw+i7zSa7qUs9x16IPD1LQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GzWhROu4+TYQnPdOw7Ea/BZG0+JZk8Ww8fCk68Gxm5E=; b=MuN86imnEr3ZJc/LzVc5+7uXVT
 z7iXQOu5vMyP4R5Xyoxc1fQwTnvwQMq6z+w5ofI8RZyO3BZgZuGD4QtBDR+3aZ7BLQeCMyWfimCTd
 G64iYfBUrN8+vBbfenbP+zPXJy6cMsgoXu4YA4clHtAPlfAkbgjNpTB0PWT+88zQZcIo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBN-0005Ja-Mb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:38 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8212217D4;
 Mon, 20 May 2019 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369825;
 bh=jzDa4sIscNqlfHv7tNu4xnhMMMwK6J7mZB9Z89E3MiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ob/JPjcP7714BGREu627MvS2LQxzV4JLdnXXWnMnDH1YTlzvo+9t2j3I8S0VudDhS
 92QsFC9y2jHVMwi4utg/5SWjCEOHa1YtdAC7FNlADEUtX7+2Dy4fSi2Eh4HmQr2LUQ
 Yja0pYrVp6mCFfIxfZ6/DnkEoG3ukGh4lW90ADZk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:50 -0700
Message-Id: <20190520162952.156212-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBN-0005Ja-Mb
Subject: [f2fs-dev] [PATCH v2 12/14] ext4: decrypt only the needed blocks in
 ext4_block_write_begin()
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chandan Rajendra <chandan@linux.ibm.com>

In ext4_block_write_begin(), only decrypt the blocks that actually need
to be decrypted (up to two blocks which intersect the boundaries of the
region that will be written to), rather than assuming blocksize ==
PAGE_SIZE and decrypting the whole page.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
(EB: rebase onto previous changes, improve the commit message,
 and move the check for encrypted inode)
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/inode.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 0e6536a22a465..8b3ea9c8ac988 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1164,8 +1164,9 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	int err = 0;
 	unsigned blocksize = inode->i_sb->s_blocksize;
 	unsigned bbits;
-	struct buffer_head *bh, *head, *wait[2], **wait_bh = wait;
-	bool decrypt = false;
+	struct buffer_head *bh, *head, *wait[2];
+	int nr_wait = 0;
+	int i;
 
 	BUG_ON(!PageLocked(page));
 	BUG_ON(from > PAGE_SIZE);
@@ -1217,24 +1218,30 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 		    !buffer_unwritten(bh) &&
 		    (block_start < from || block_end > to)) {
 			ll_rw_block(REQ_OP_READ, 0, 1, &bh);
-			*wait_bh++ = bh;
-			decrypt = IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
+			wait[nr_wait++] = bh;
 		}
 	}
 	/*
 	 * If we issued read requests, let them complete.
 	 */
-	while (wait_bh > wait) {
-		wait_on_buffer(*--wait_bh);
-		if (!buffer_uptodate(*wait_bh))
+	for (i = 0; i < nr_wait; i++) {
+		wait_on_buffer(wait[i]);
+		if (!buffer_uptodate(wait[i]))
 			err = -EIO;
 	}
 	if (unlikely(err)) {
 		page_zero_new_buffers(page, from, to);
-	} else if (decrypt) {
-		err = fscrypt_decrypt_pagecache_blocks(page, PAGE_SIZE, 0);
-		if (err)
-			clear_buffer_uptodate(*wait_bh);
+	} else if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
+		for (i = 0; i < nr_wait; i++) {
+			int err2;
+
+			err2 = fscrypt_decrypt_pagecache_blocks(page, blocksize,
+								bh_offset(wait[i]));
+			if (err2) {
+				clear_buffer_uptodate(wait[i]);
+				err = err2;
+			}
+		}
 	}
 
 	return err;
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
