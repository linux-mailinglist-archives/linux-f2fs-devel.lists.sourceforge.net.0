Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B119F2CCC98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:27:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeLE-0001qk-BP; Thu, 03 Dec 2020 02:27:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeGs-0001AS-JE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8br3x4k9pXI77eytM2IZZTYC0mxqrNaCjoK2lGM+tyo=; b=gMwsrN+BUZrUGt0iR7ecSwaMHl
 o9ToXRnmewSzsGyQ5UUBx1ATletmxlGzxFIvuesDzdg878yHp77/jsZ+1qR3xFuvI5M++MsZu9nBo
 9Oe/1mtgliq8xmry5vluoPcZ0dvgFxbe117zanf8RboC4gb0fLNDIzbusO/yuX1fOzMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8br3x4k9pXI77eytM2IZZTYC0mxqrNaCjoK2lGM+tyo=; b=BXR6vmXsmh5dQgiTaAUCddekRC
 C9jx7R4/mhPALRB1tGOQd5Kdb19rICOyXHhL40E/mg2zRo5vgspitR1isTO2DrNO/CwBvdPnlu6HY
 yppE3yuCKdygZKww9qsNMUG4k76sj1RdA5VQ4rIMk/i09CSfAnaiQ6kC6op7lT/raMbg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGn-00CSo6-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:02 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:33 -0800
Message-Id: <20201203022041.230976-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203022041.230976-1-ebiggers@kernel.org>
References: <20201203022041.230976-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1kkeGn-00CSo6-Gb
Subject: [f2fs-dev] [PATCH v2 1/9] ext4: remove ext4_dir_open()
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
Cc: linux-fsdevel@vger.kernel.org, Andreas Dilger <adilger@dilger.ca>,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since encrypted directories can be opened and searched without their key
being available, and each readdir and ->lookup() tries to set up the
key, trying to set up the key in ->open() too isn't really useful.

Just remove it so that directories don't need an ->open() method
anymore, and so that we eliminate a use of fscrypt_get_encryption_info()
(which I'd like to stop exporting to filesystems).

Reviewed-by: Andreas Dilger <adilger@dilger.ca>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/dir.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index ca50c90adc4c4..16bfbdd5007c7 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -616,13 +616,6 @@ static int ext4_dx_readdir(struct file *file, struct dir_context *ctx)
 	return 0;
 }
 
-static int ext4_dir_open(struct inode * inode, struct file * filp)
-{
-	if (IS_ENCRYPTED(inode))
-		return fscrypt_get_encryption_info(inode) ? -EACCES : 0;
-	return 0;
-}
-
 static int ext4_release_dir(struct inode *inode, struct file *filp)
 {
 	if (filp->private_data)
@@ -664,7 +657,6 @@ const struct file_operations ext4_dir_operations = {
 	.compat_ioctl	= ext4_compat_ioctl,
 #endif
 	.fsync		= ext4_sync_file,
-	.open		= ext4_dir_open,
 	.release	= ext4_release_dir,
 };
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
