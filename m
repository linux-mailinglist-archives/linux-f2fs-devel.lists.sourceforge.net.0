Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4B142303
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 07:08:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itQEi-0006xE-2w; Mon, 20 Jan 2020 06:08:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itQEg-0006x7-TO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 06:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z7cd83LaWhEZ28DgHXZjGeR3QbRfJ6KMnsgZcsPAjrE=; b=UJ6icp2ZMQ0KjPTyzxXg4sDCym
 uleBpNnVMdyxqA5pqD/86jpJe+R9d3l08IzDE9ktXBO0T+NYn+13fesXvRnOIQ2DKi8ULRKkQfMCy
 jqT/QI8pAg1KQfpcFz1D/zzxAucbyOBbX+yxrnxRGUH5Vt8LuvugLmJfrEgNxWWbXrbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z7cd83LaWhEZ28DgHXZjGeR3QbRfJ6KMnsgZcsPAjrE=; b=H
 R53YZ5D9QCT23Wl51dw4bd371289SpADKJb3yEhS19ag47x0uGCuOASYe6/a512NPQA/0cV0iwqnp
 XY3o1VZBgr/FnbE6Y8ZX70CQERuqrMfXZAMjDyvHd8ug2sC1fKHfR2m9ug4oQlNVCiMhFBmyG+pzd
 33s7rmSkyjOGdTAk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itQEf-00EdAd-N5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 06:08:30 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23AF72073A;
 Mon, 20 Jan 2020 06:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579500499;
 bh=vXDa7ReBep0t1iBlcWB2T87bMhiP9s/H3lDJdDPQErA=;
 h=From:To:Cc:Subject:Date:From;
 b=EJxMqhiexC9D9GSnjVpbpE4UHvRvOuMwYSeWTItv76T9/XLZAhlRkdKtuajoYsnOL
 W+aW/xjnINdGJt+apMkE1TNd44JCaKBAopXzdosKByIwtlst8dLFX9KLF9i7sxZAFE
 JZoFJFK8ttdCd8/ZDgBx6pkKhG6qVsDNoEeTH/ak=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 19 Jan 2020 22:07:32 -0800
Message-Id: <20200120060732.390362-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1itQEf-00EdAd-N5
Subject: [f2fs-dev] [PATCH] fscrypt: don't print name of busy file when
 removing key
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When an encryption key can't be fully removed due to file(s) protected
by it still being in-use, we shouldn't really print the path to one of
these files to the kernel log, since parts of this path are likely to be
encrypted on-disk, and (depending on how the system is set up) the
confidentiality of this path might be lost by printing it to the log.

This is a trade-off: a single file path often doesn't matter at all,
especially if it's a directory; the kernel log might still be protected
in some way; and I had originally hoped that any "inode(s) still busy"
bugs (which are security weaknesses in their own right) would be quickly
fixed and that to do so it would be super helpful to always know the
file path and not have to run 'find dir -inum $inum' after the fact.

But in practice, these bugs can be hard to fix (e.g. due to asynchronous
process killing that is difficult to eliminate, for performance
reasons), and also not tied to specific files, so knowing a file path
doesn't necessarily help.

So to be safe, for now let's just show the inode number, not the path.
If someone really wants to know a path they can use 'find -inum'.

Fixes: b1c0ec3599f4 ("fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl")
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyring.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 098ff2e0f0bb4..ab41b25d4fa1b 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -776,9 +776,6 @@ static int check_for_busy_inodes(struct super_block *sb,
 	struct list_head *pos;
 	size_t busy_count = 0;
 	unsigned long ino;
-	struct dentry *dentry;
-	char _path[256];
-	char *path = NULL;
 
 	spin_lock(&mk->mk_decrypted_inodes_lock);
 
@@ -797,22 +794,14 @@ static int check_for_busy_inodes(struct super_block *sb,
 					 struct fscrypt_info,
 					 ci_master_key_link)->ci_inode;
 		ino = inode->i_ino;
-		dentry = d_find_alias(inode);
 	}
 	spin_unlock(&mk->mk_decrypted_inodes_lock);
 
-	if (dentry) {
-		path = dentry_path(dentry, _path, sizeof(_path));
-		dput(dentry);
-	}
-	if (IS_ERR_OR_NULL(path))
-		path = "(unknown)";
-
 	fscrypt_warn(NULL,
-		     "%s: %zu inode(s) still busy after removing key with %s %*phN, including ino %lu (%s)",
+		     "%s: %zu inode(s) still busy after removing key with %s %*phN, including ino %lu",
 		     sb->s_id, busy_count, master_key_spec_type(&mk->mk_spec),
 		     master_key_spec_len(&mk->mk_spec), (u8 *)&mk->mk_spec.u,
-		     ino, path);
+		     ino);
 	return -EBUSY;
 }
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
