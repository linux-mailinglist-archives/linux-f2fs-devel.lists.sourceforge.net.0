Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA722CCC6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 03:23:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkeGy-0001GV-5K; Thu, 03 Dec 2020 02:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kkeGv-0001GK-LN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vedVFNHKKMnQrKdQtENUqBG9S2lmj1uGSaGiAV8HLJ8=; b=ZpbCS8LGOlZb8udfQ6u6uXD3Nw
 KInwmXjPHJmBSWdyhjOKXgdWfZ41v6a9oOJdmHjWBoVGjMC1ZqYL0S+Apdgos2GvgxE/GhIcvS2ks
 8L+7d181qgufcgd1K+5ydqWX0cIOXYUbbnDmRAAzBFcK3r8vp8QtCn9MAr+i3Lgofam0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vedVFNHKKMnQrKdQtENUqBG9S2lmj1uGSaGiAV8HLJ8=; b=h
 LYteREhA1jBagFg1auTOibQy7qKmU4Oipt3LDV5gMjFt7oLg0gGE50LG1S5rMxP7PpzbpaVZWshAN
 nsRWKdA5QGd113WcY9PD14HWZa5l9snDwlZmYhgy03Og9SQxXCDKPI1Vg14CnM9LvsQopI0bo6rM5
 QIZvuheDGxcjyP34=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkeGn-00GwaT-2i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 02:23:05 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-fscrypt@vger.kernel.org
Date: Wed,  2 Dec 2020 18:20:32 -0800
Message-Id: <20201203022041.230976-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1kkeGn-00GwaT-2i
Subject: [f2fs-dev] [PATCH v2 0/9] Allow deleting files with unsupported
 encryption policy
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

Currently it's impossible to delete files that use an unsupported
encryption policy, as the kernel will just return an error when
performing any operation on the top-level encrypted directory, even just
a path lookup into the directory or opening the directory for readdir.

It's desirable to return errors for most operations on files that use an
unsupported encryption policy, but the current behavior is too strict.
We need to allow enough to delete files, so that people can't be stuck
with undeletable files when downgrading kernel versions.  That includes
allowing directories to be listed and allowing dentries to be looked up.

This series fixes this (on ext4, f2fs, and ubifs) by treating an
unsupported encryption policy in the same way as "key unavailable" in
the cases that are required for a recursive delete to work.

The actual fix is in patch 9, so see that for more details.

Patches 1-8 are cleanups that prepare for the actual fix by removing
direct use of fscrypt_get_encryption_info() by filesystems.

This patchset applies to branch "master" (commit 4a4b8721f1a5) of
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.

Changed since v1:
  - Made some minor updates to commit messages.
  - Added Reviewed-by tags.

Eric Biggers (9):
  ext4: remove ext4_dir_open()
  f2fs: remove f2fs_dir_open()
  ubifs: remove ubifs_dir_open()
  ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
  fscrypt: introduce fscrypt_prepare_readdir()
  fscrypt: move body of fscrypt_prepare_setattr() out-of-line
  fscrypt: move fscrypt_require_key() to fscrypt_private.h
  fscrypt: unexport fscrypt_get_encryption_info()
  fscrypt: allow deleting files with unsupported encryption policy

 fs/crypto/fname.c           |  8 +++-
 fs/crypto/fscrypt_private.h | 28 ++++++++++++++
 fs/crypto/hooks.c           | 16 +++++++-
 fs/crypto/keysetup.c        | 20 ++++++++--
 fs/crypto/policy.c          | 22 +++++++----
 fs/ext4/dir.c               | 16 ++------
 fs/ext4/namei.c             | 10 +----
 fs/f2fs/dir.c               | 10 +----
 fs/ubifs/dir.c              | 11 +-----
 include/linux/fscrypt.h     | 75 +++++++++++++++++++------------------
 10 files changed, 126 insertions(+), 90 deletions(-)


base-commit: 4a4b8721f1a5e4b01e45b3153c68d5a1014b25de
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
