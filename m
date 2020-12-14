Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3542D9305
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Dec 2020 06:55:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kogpw-0003Eq-UH; Mon, 14 Dec 2020 05:55:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kogkt-00030i-Fl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 05:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQboTwske26/GAxkTtodHnwP1cqi1wAZP6EOZVYjDRE=; b=LW9roQtW79tjoJJ31rDTnkvODh
 s+GHli+iLglJBq1OYVvF95c6sp4OrqOBz33goxUoOBY1Fd7eQJFXdQxTdGyG0iZuUs9k1jfDz+EOY
 STwQUbzM0oXlLc0IOa2TRa2JfkvR3w2IF9vZvREHQ7lxiN62EsKRIje6BTl2PWU5tZCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zQboTwske26/GAxkTtodHnwP1cqi1wAZP6EOZVYjDRE=; b=S
 QkiWq0qTGWF/EJs7ZpOJLenTWGxv1jcBaFFad27ZLrMF45jVOwmEor7e2V1OhYnuik3n+1bzngvis
 A9bd0os2rW98J6ekGlub1pTTSxEb8d80Z6ic8SJZ+ZuCGFRdK0l9iKRO5O0jW7yvQOb8tfv4CdBG+
 0GN2UbZ8s1Z/J++g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kogkh-00BvRm-LM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 05:50:43 +0000
Date: Sun, 13 Dec 2020 21:50:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607925021;
 bh=26wjFmCwOjxbjwCPVnXE7SyqfSynEV7b+ddO/h17k4I=;
 h=From:To:Cc:Subject:From;
 b=n/muPa2CduuxaSl+0TEAyvxRjflWJBxicz+gMGJDNpvNXQogxADu7X/WVccGdAlqi
 xZmuIv3FwteKOr+Qlv5ddaktdmXQSJIeBxTQzP16O7fUFoPzMSDKpKdMu63zQ/rf4L
 nkHx5mxptVdfc2WBUpiRT71HanPgKK5fmug5mHDGtTbGZJ04bJI4hhRlBraAVBb4nv
 2cZYgMGX+sIph52A0SHSdKjUYTKcBWNBX29/dwftRvi2vV6JlukFQMNZnsxn+m7tOy
 ADB2dQgI4vwseN0mcDjFLUWzBh0NPkgsiv/xrwLG41ZNV1WkrtMPXaL3OR1Cb1vFdS
 nTBmup/vMTS6A==
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <X9b9G8p8AiRAzDwV@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kogkh-00BvRm-LM
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.11
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to a14d0b6764917b21ee6fdfd2a8a4c2920fbefcce:

  fscrypt: allow deleting files with unsupported encryption policy (2020-12-02 18:25:01 -0800)

----------------------------------------------------------------

This release there are some fixes for longstanding problems, as well as
some cleanups:

- Fix a race condition where a duplicate filename could be created in an
  encrypted directory if a syscall that creates a new filename raced
  with the directory's encryption key being added.

- Allow deleting files that use an unsupported encryption policy.

- Simplify the locking for 'struct fscrypt_master_key'.

- Remove kernel-internal constants from the UAPI header.

As usual, all these patches have been in linux-next with no reported
issues, and I've tested them with xfstests.

----------------------------------------------------------------
Eric Biggers (16):
      fscrypt: remove kernel-internal constants from UAPI header
      fscrypt: add fscrypt_is_nokey_name()
      ext4: prevent creating duplicate encrypted filenames
      f2fs: prevent creating duplicate encrypted filenames
      ubifs: prevent creating duplicate encrypted filenames
      fscrypt: remove unnecessary calls to fscrypt_require_key()
      fscrypt: simplify master key locking
      ext4: remove ext4_dir_open()
      f2fs: remove f2fs_dir_open()
      ubifs: remove ubifs_dir_open()
      ext4: don't call fscrypt_get_encryption_info() from dx_show_leaf()
      fscrypt: introduce fscrypt_prepare_readdir()
      fscrypt: move body of fscrypt_prepare_setattr() out-of-line
      fscrypt: move fscrypt_require_key() to fscrypt_private.h
      fscrypt: unexport fscrypt_get_encryption_info()
      fscrypt: allow deleting files with unsupported encryption policy

 fs/crypto/fname.c            |   8 +++-
 fs/crypto/fscrypt_private.h  |  56 +++++++++++++++-------
 fs/crypto/hooks.c            |  55 +++++++++++----------
 fs/crypto/keyring.c          |  10 +---
 fs/crypto/keysetup.c         |  44 +++++++++++------
 fs/crypto/policy.c           |  27 +++++++----
 fs/ext4/dir.c                |  16 ++-----
 fs/ext4/namei.c              |  13 ++---
 fs/f2fs/dir.c                |  10 +---
 fs/f2fs/f2fs.h               |   2 +
 fs/ubifs/dir.c               |  28 +++++------
 include/linux/fscrypt.h      | 112 ++++++++++++++++++++++++++++---------------
 include/uapi/linux/fscrypt.h |   5 +-
 13 files changed, 227 insertions(+), 159 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
