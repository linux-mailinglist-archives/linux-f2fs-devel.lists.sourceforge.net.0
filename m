Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC63B9C8E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Jul 2021 08:55:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lzD51-000848-EU; Fri, 02 Jul 2021 06:55:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lzD4y-00083o-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vtU0CoXp5jJNVaYY51Ubv72UKLak/G2Gxd4Fa5rSrSg=; b=CbeW73WyUKauZP+4OX/UJnXKVP
 GDd8MoPEN3MYleB7fOay2oUlnZWW9fchWkJe4cH3rrqY+XTMvNAnf0QPFplFP02D4NrG1gWDTGnoE
 4hTqh/7Cf6jUS2tdfcxL8CxW7A6cF5ktIcjFgpwk4SrTFnDC4VnCXfxGdaL+g1TafmIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vtU0CoXp5jJNVaYY51Ubv72UKLak/G2Gxd4Fa5rSrSg=; b=XjL73iKIZtrteat05ZeHk7idme
 BhVYPXVobVaHrIyA2/QlegrucBUqAN19cKMaYiRtMaeFb99RXF6O3/yx6UASl1VGh+xhCXEcdueG7
 wgwmHyLdw9I+0VrHDXFsxProGbDnzfp/Ccb1hb/Hz+Maw7sQJ0YZfclKwdbgX9+tb2dM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lzD4m-0004ON-Vj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Jul 2021 06:55:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A419F61416;
 Fri,  2 Jul 2021 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625208891;
 bh=8UwGI3mTEOy+/FNQC2YBcGZZYXAkamywQ/BEcm9u/PU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bn/fBOYp3M8tUVY2Ebpw1Q47/lWTLSOQ+UWnSo+oVj4xZO7jBEZ9Wu1cyV6oLrjB1
 wuoEQ5TLRZ86nsoPIVZ+f7ip9+en17J39v+pGwJ9AOrJvlph0XvJSUgm6jwHyedRM2
 HOQZkcuz29/kb7XRvZaLkLymKDYI4oVQzAKIOR0oLqgRVzDXqRrwhuyOz/bKcmIz/4
 4OzQppuvSS+8tjlf9zZHd3bKnqTo3MpfQghXb1m/rXOfUPfbkqzO+ZTYAhOLjdYwqF
 ImwrigtKqh+S4TycOXhqEoX7+Qk7TgnvEEDzz/R7PaCMN/43fJOnvplzZkz6Ts8Wnf
 MSx1YWjnRsnAQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu,  1 Jul 2021 23:53:49 -0700
Message-Id: <20210702065350.209646-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.0 (++)
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lzD4m-0004ON-Vj
Subject: [f2fs-dev] [PATCH 4/5] ubifs: report correct st_size for encrypted
 symlinks
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
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

The stat() family of syscalls report the wrong size for encrypted
symlinks, which has caused breakage in several userspace programs.

Fix this by calling fscrypt_symlink_getattr() after ubifs_getattr() for
encrypted symlinks.  This function computes the correct size by reading
and decrypting the symlink target (if it's not already cached).

For more details, see the commit which added fscrypt_symlink_getattr().

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/file.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2e4e1d159969..5cfa28cd00cd 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1630,6 +1630,17 @@ static const char *ubifs_get_link(struct dentry *dentry,
 	return fscrypt_get_symlink(inode, ui->data, ui->data_len, done);
 }
 
+static int ubifs_symlink_getattr(struct user_namespace *mnt_userns,
+				 const struct path *path, struct kstat *stat,
+				 u32 request_mask, unsigned int query_flags)
+{
+	ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
+
+	if (IS_ENCRYPTED(d_inode(path->dentry)))
+		return fscrypt_symlink_getattr(path, stat);
+	return 0;
+}
+
 const struct address_space_operations ubifs_file_address_operations = {
 	.readpage       = ubifs_readpage,
 	.writepage      = ubifs_writepage,
@@ -1655,7 +1666,7 @@ const struct inode_operations ubifs_file_inode_operations = {
 const struct inode_operations ubifs_symlink_inode_operations = {
 	.get_link    = ubifs_get_link,
 	.setattr     = ubifs_setattr,
-	.getattr     = ubifs_getattr,
+	.getattr     = ubifs_symlink_getattr,
 	.listxattr   = ubifs_listxattr,
 	.update_time = ubifs_update_time,
 };
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
