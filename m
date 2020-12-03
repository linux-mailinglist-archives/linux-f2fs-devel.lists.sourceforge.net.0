Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F912CCC69
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:23:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeGq-0007qg-Fg; Thu, 03 Dec 2020 02:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeGp-0007qa-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRD8hbHzPF1EOaQwh7ZVAc/pj3cTjcFQqLfuuGbNAHk=; b=aUiCIP/E7L09DO8oxAtVwfcbPg
 yVW5lz3ecugfTK6cjntTmYyHeK4YLUjo5HevJ0MlAp1GmrXmkBpXOzEdueh35P29epri0WJQRAxFW
 UvMsrd4bHjpE8rsO17hp08tgbpQ9SlxsHnDrF8y/SW6mksNIV44s/WFPeWxSpIxh2XHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRD8hbHzPF1EOaQwh7ZVAc/pj3cTjcFQqLfuuGbNAHk=; b=Ua/XYpHc6s1mJBcJd++byELy4j
 SjvQjz0spY5GtBuWVOryq+VOpBbPRxaXC2EPZcnY2bK79bboDfOKucCvfKQRwqjTxYSIUlrEXLo0j
 XUDrIpmNDBvAIqTTQcbbwtp2Fkz97r3GtpBOKH2HXTsZ96J8it4h3YPYfGeeUs5k/Vg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGn-00GwaW-2c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:22:59 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:34 -0800
Message-Id: <20201203022041.230976-3-ebiggers@kernel.org>
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
X-Headers-End: 1kkeGn-00GwaW-2c
Subject: [f2fs-dev] [PATCH v2 2/9] f2fs: remove f2fs_dir_open()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
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

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 4b9ef8bbfa4a9..47bee953fc8d8 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1081,19 +1081,11 @@ static int f2fs_readdir(struct file *file, struct dir_context *ctx)
 	return err < 0 ? err : 0;
 }
 
-static int f2fs_dir_open(struct inode *inode, struct file *filp)
-{
-	if (IS_ENCRYPTED(inode))
-		return fscrypt_get_encryption_info(inode) ? -EACCES : 0;
-	return 0;
-}
-
 const struct file_operations f2fs_dir_operations = {
 	.llseek		= generic_file_llseek,
 	.read		= generic_read_dir,
 	.iterate_shared	= f2fs_readdir,
 	.fsync		= f2fs_sync_file,
-	.open		= f2fs_dir_open,
 	.unlocked_ioctl	= f2fs_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = f2fs_compat_ioctl,
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
