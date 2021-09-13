Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EFD40884C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Sep 2021 11:34:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mPiLa-0008Lf-KG; Mon, 13 Sep 2021 09:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <gregkh@linuxfoundation.org>) id 1mPiLY-0008LS-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Sep 2021 09:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XvHQOu9l4DP8EFrpN4BTIm0zt0tMEmmBO/olLQkXAI4=; b=lbjSPrUnTlXkpIa9GtkCFvE7OD
 A3X/ClQkvlyr3qxKJ5qU8VgFKhmossDJHVfs0urtZcnO7gdoFjb4fbD9gJ0LfN4o/zl5aKqPOA8Ye
 MH+n1n8gT+Umg1/OD9Oce0CXfDTKmRMcTYMjkT6IFScPrfYtDeG9wTiwuAt5X4UyJZnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XvHQOu9l4DP8EFrpN4BTIm0zt0tMEmmBO/olLQkXAI4=; b=jSuxUzFfOdn0n2lrb/VMK19l5l
 0jlC9QbGwfXFcRdrwnYrY+JFJimGNUQD8GV5sa/+reCLMuhawAkDXIDfEBMP10dSR10Xmq2vmN8p+
 TmzQcpyikOzLfC0ea0IYyva3nZCN14QOh2ByCa9t89TLqjpr8GpmXNqdV8i+IhzfL0tM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mPiLX-0002z1-TJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Sep 2021 09:33:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE23561004;
 Mon, 13 Sep 2021 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631525626;
 bh=cp2igwOu4f/N6poavOzpskXOVS/dM6dEmEfPLkIM0sU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=ce7OHBBh7wT8Tr/0I3fVYs5P7yQraEVsVqYfm+l4STczrSnbbMry/iZEXZTwRD/yD
 /vRUmWVZ8jEaj4UPStgNmgfcUg9t9XQh0b6svfmwgqPh9Us7TXhpBoM2EuH1ta6lZ2
 metv6InprcmLD810uG9hvgYHHRBmvyh8THxuSW4s=
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Sep 2021 11:33:36 +0200
In-Reply-To: <20210908215033.1122580-4-ebiggers@kernel.org>
Message-ID: <16315256162465@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled f2fs: report correct st_size for encrypted symlinks to the 4.19-stable
 tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mPiLX-0002z1-TJ
Subject: [f2fs-dev] Patch "f2fs: report correct st_size for encrypted
 symlinks" has been added to the 4.19-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    f2fs: report correct st_size for encrypted symlinks

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     f2fs-report-correct-st_size-for-encrypted-symlinks.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Mon Sep 13 11:31:12 AM CEST 2021
From: Eric Biggers <ebiggers@kernel.org>
Date: Wed,  8 Sep 2021 14:50:32 -0700
Subject: f2fs: report correct st_size for encrypted symlinks
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20210908215033.1122580-4-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 461b43a8f92e68e96c4424b31e15f2b35f1bbfa9 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after f2fs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: cbaf042a3cc6 ("f2fs crypto: add symlink encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/f2fs/namei.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1219,9 +1219,18 @@ static const char *f2fs_encrypted_get_li
 	return target;
 }
 
+static int f2fs_encrypted_symlink_getattr(const struct path *path,
+					  struct kstat *stat, u32 request_mask,
+					  unsigned int query_flags)
+{
+	f2fs_getattr(path, stat, request_mask, query_flags);
+
+	return fscrypt_symlink_getattr(path, stat);
+}
+
 const struct inode_operations f2fs_encrypted_symlink_inode_operations = {
 	.get_link       = f2fs_encrypted_get_link,
-	.getattr	= f2fs_getattr,
+	.getattr	= f2fs_encrypted_symlink_getattr,
 	.setattr	= f2fs_setattr,
 #ifdef CONFIG_F2FS_FS_XATTR
 	.listxattr	= f2fs_listxattr,


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/ubifs-report-correct-st_size-for-encrypted-symlinks.patch
queue-4.19/ext4-report-correct-st_size-for-encrypted-symlinks.patch
queue-4.19/fscrypt-add-fscrypt_symlink_getattr-for-computing-st_size.patch
queue-4.19/f2fs-report-correct-st_size-for-encrypted-symlinks.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
