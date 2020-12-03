Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A24672CCC97
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:27:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeLE-0001qa-88; Thu, 03 Dec 2020 02:27:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeGp-00019h-Gi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0HIwsO4zvLAuwTanCKLGN+5LWj8AyYeshtk57Tlflg4=; b=LUk0B7LgTwqaLOLApQljJfW+6a
 +pwO74jvyJq7rDA4wK8xOPSep58vbJLbK/Y1d6+7sGCW0G41+8qubCxstTTwsXyfb/55FlntJ7ark
 fWR9ZC/qXrKqlIt1YMq7rXh/Wy16LHtOSrbMrWxGEA4PQr50Z2/m0yDmfL81WiVg+qXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0HIwsO4zvLAuwTanCKLGN+5LWj8AyYeshtk57Tlflg4=; b=iYAS0Wy72Xc6up+Nid35JJGI6b
 ny8XhqWgFxgxVSERxBVbQGIKHcuSlek/S5cDkavnGl6CrAPQQKfbVP1WY38XJF/332vfDuDK3Czbe
 XHqIOqBLuGwSpCBap0vTg37XjL+S3Q5HP1iMasd0FrIFhHsC+wU+WBdBx7LmZbCuDd3Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGn-00CSo8-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:22:59 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:35 -0800
Message-Id: <20201203022041.230976-4-ebiggers@kernel.org>
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
X-Headers-End: 1kkeGn-00CSo8-Gp
Subject: [f2fs-dev] [PATCH v2 3/9] ubifs: remove ubifs_dir_open()
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

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 08fde777c3247..009fbf844d3e6 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1619,14 +1619,6 @@ int ubifs_getattr(const struct path *path, struct kstat *stat,
 	return 0;
 }
 
-static int ubifs_dir_open(struct inode *dir, struct file *file)
-{
-	if (IS_ENCRYPTED(dir))
-		return fscrypt_get_encryption_info(dir) ? -EACCES : 0;
-
-	return 0;
-}
-
 const struct inode_operations ubifs_dir_inode_operations = {
 	.lookup      = ubifs_lookup,
 	.create      = ubifs_create,
@@ -1653,7 +1645,6 @@ const struct file_operations ubifs_dir_operations = {
 	.iterate_shared = ubifs_readdir,
 	.fsync          = ubifs_fsync,
 	.unlocked_ioctl = ubifs_ioctl,
-	.open		= ubifs_dir_open,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
