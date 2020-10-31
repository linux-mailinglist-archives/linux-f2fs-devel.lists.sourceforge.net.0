Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD02A1A5C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Oct 2020 20:59:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYx20-0004rN-0d; Sat, 31 Oct 2020 19:59:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kYx1y-0004rF-Do
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 19:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yc6o+PrMlPeVdturJ7Pn5TciO9uzpDEXBtRWhXnp7P0=; b=fhSGBmA9txmfUz4uL9KDcp9dUJ
 w5L9fANyeis1ZZNr2gFkITWNHqwnDloTIxVs6dCvuCxBPYx15nVaHCtqxsRlusLHUm8KH+lW7KQzk
 QwxZb2teLvmzt4El3EJQ6G/y/ZLVaptdijPyvMXC301aPM+KnuVdgKk12V7q29vC74/0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yc6o+PrMlPeVdturJ7Pn5TciO9uzpDEXBtRWhXnp7P0=; b=W
 ZC1ZVjF2YtKtDqwDkzNxEpQWaUWo3hWuQQfQx8qONHTvuvM63YJQks3VE0JRlbhobCGUk2RDI3KUY
 Rh78QT/TqNef1oQ1xDH02RkYtof+DFbEXS9r+SOJ1ZNtDiCPp0FcEHj1694JaB4x8FXDzpgXXuZ+N
 QIdbL7alpXsBajPs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYx1r-00EWZc-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 19:59:18 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 286D8206E9;
 Sat, 31 Oct 2020 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604174338;
 bh=pg93KM0ZOaLrR1WbAPRS3b1mszl+k1+y2wAs9bVDi5Q=;
 h=From:To:Cc:Subject:Date:From;
 b=UH8w45+kfcmduZ8atKoG5GbgzR5hQSSgbgMIL7cm7kgUuiZRIVidWyQxwokMuD8+u
 9JiGIKFzkz2qFmK9c4vCN3onboqPNLvAKukZFNr91O7GLdbYzHfvIhf+nbQGTqwF+q
 3sRN68nNeoO2CGO606/e08Tcl+ORtAZqAg2grkAQ=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 31 Oct 2020 12:58:09 -0700
Message-Id: <20201031195809.377983-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kYx1r-00EWZc-Q7
Subject: [f2fs-dev] [PATCH 4.4] f2fs crypto: avoid unneeded memory
 allocation in ->readdir
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

commit e06f86e61d7a67fe6e826010f57aa39c674f4b1b upstream.
[This backport fixes a regression in 4.4-stable caused by commit
11a6e8f89521 ("f2fs: check memory boundary by insane namelen"), which
depended on this missing commit.  This bad backport broke f2fs
encryption because it moved the incrementing of 'bit_pos' to earlier in
f2fs_fill_dentries() without accounting for it being used in the
encrypted dir case.  This caused readdir() on encrypted directories to
start failing.  Tested with 'kvm-xfstests -c f2fs -g encrypt'.]

When decrypting dirents in ->readdir, fscrypt_fname_disk_to_usr won't
change content of original encrypted dirent, we don't need to allocate
additional buffer for storing mirror of it, so get rid of it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index e2ff0eb16f89c..c1130914d6ed7 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -820,15 +820,8 @@ bool f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			int save_len = fstr->len;
 			int ret;
 
-			de_name.name = kmalloc(de_name.len, GFP_NOFS);
-			if (!de_name.name)
-				return false;
-
-			memcpy(de_name.name, d->filename[bit_pos], de_name.len);
-
 			ret = f2fs_fname_disk_to_usr(d->inode, &de->hash_code,
 							&de_name, fstr);
-			kfree(de_name.name);
 			if (ret < 0)
 				return true;
 
-- 
2.29.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
