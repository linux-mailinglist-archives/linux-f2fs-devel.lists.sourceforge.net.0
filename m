Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF54000DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 15:58:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mM9iI-0007rM-TY; Fri, 03 Sep 2021 13:58:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1mM9iI-0007qx-1y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 13:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KyTlW9a0aWU/AxLVqzylIjHrxs2WlInYcKH7DzOIWYY=; b=Z/I3yOJs06tREbdsG6g5Ug2NMt
 DbAvIhdJhNrH6XtcZBjz60qAfL/PYJ5EUXrfrLjm8Q6IouNXVuQy22zKlCr+pWCIcicE7C4RGsvOU
 jLeSnX2zDKzUVUdRJZLVRC8DBJS4O1hROGtkSVy9kHDFlHiATqooIj5HiRhl+fz63tNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KyTlW9a0aWU/AxLVqzylIjHrxs2WlInYcKH7DzOIWYY=; b=XQZH2g/SjaP3Ii9+nfeNBTxDUK
 Wp+3HGvPFA+3oT1YkPPg8ct0BbefcILz+LXVsV+d62Amkc/IToC6IUFFUJ4WrcTRoZ1qfEbxtDRki
 R9PLO6Kdk2JD87jd+mHU8FC3votBYnt74xmJtb7fBhoZ4OYLwzRq0WPLqIWZqkg1D0QM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mM9iH-00D7p3-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 13:58:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C76C61059;
 Fri,  3 Sep 2021 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630677512;
 bh=3JczALKSBTk1hoa+l3wjU/1B6GmvFcHC4FgmTxWCdd4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Z6abzN+SPDPATMoJxEW1NczAOKsVmKNIyfB5wimRULsuo75KwEfHzKLEeFyzm9C2e
 g9eqG3J4iyn7M/ebfWLE6YqOYOmGLhPczmu6JDIvl6RljR+KJG0ylBjBmnP4R6C0np
 kGfT9XBGw8OK2PItPyUnlhhuDoiV6+jhOeNHhngc=
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 03 Sep 2021 15:58:16 +0200
In-Reply-To: <20210901164041.176238-5-ebiggers@kernel.org>
Message-ID: <163067749626136@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled ubifs: report correct st_size for encrypted symlinks to the 5.4-stable
 tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mM9iH-00D7p3-Dv
Subject: [f2fs-dev] Patch "ubifs: report correct st_size for encrypted
 symlinks" has been added to the 5.4-stable tree
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

    ubifs: report correct st_size for encrypted symlinks

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     ubifs-report-correct-st_size-for-encrypted-symlinks.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Sep  3 03:56:23 PM CEST 2021
From: Eric Biggers <ebiggers@kernel.org>
Date: Wed,  1 Sep 2021 09:40:41 -0700
Subject: ubifs: report correct st_size for encrypted symlinks
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20210901164041.176238-5-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 064c734986011390b4d111f1a99372b7f26c3850 upstream.

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ubifs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ubifs/file.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1629,6 +1629,16 @@ static const char *ubifs_get_link(struct
 	return fscrypt_get_symlink(inode, ui->data, ui->data_len, done);
 }
 
+static int ubifs_symlink_getattr(const struct path *path, struct kstat *stat,
+				 u32 request_mask, unsigned int query_flags)
+{
+	ubifs_getattr(path, stat, request_mask, query_flags);
+
+	if (IS_ENCRYPTED(d_inode(path->dentry)))
+		return fscrypt_symlink_getattr(path, stat);
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1654,7 +1664,7 @@ const struct inode_operations ubifs_file
 const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
-	.getattr     = ubifs_getattr,
+	.getattr     = ubifs_symlink_getattr,
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/ubifs-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/ext4-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/fscrypt-add-fscrypt_symlink_getattr-for-computing-st_size.patch
queue-5.4/f2fs-report-correct-st_size-for-encrypted-symlinks.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
