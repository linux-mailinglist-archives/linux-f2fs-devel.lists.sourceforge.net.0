Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB590441173
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 00:29:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhKGE-0006Hj-JZ; Sun, 31 Oct 2021 23:29:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1mhKGC-0006Hd-Vb
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 23:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwoVXAquEuQg5UZImIxzfFjCuQ6OiG/DmKEGfaXCUdY=; b=J6qLVK6bdHfog7c5D2EzUYcO13
 TEixRyM6VQF8+cPfIR5aXvPZjRyhgxFVXwYXU+ewKTxG6R6XYMSgs1alA9PLlCHZpleEaeB7YIfBc
 vXSZKOLBOL/hxh0pelKEMTzAO3+f+ulkYHaNiPEokle9KQrpQztVdGO/OLsXqCKZ2NAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fwoVXAquEuQg5UZImIxzfFjCuQ6OiG/DmKEGfaXCUdY=; b=N
 n489BgZaHK8uaPGYtmhfZri4e14x5MH6KLrIfytNHKMh2lItsQ2XMgsKDCOGTWu2OPaE5SyDbx164
 8mnBcZ2Bl+7Lv3tbE/JtMt4JnrAZ7F84tlMd5z6nR72XmcP9npMM92p14bZLvvWiJBHIve4k6B5pr
 aDjtlGY7TIRd9qzk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mhKAO-0000Cs-Oo
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 23:29:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6632F60E98;
 Sun, 31 Oct 2021 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635722104;
 bh=suxkNGmue9aghjYNtvFMsxbmCggQU/mTEGgyuyM6yEo=;
 h=Date:From:To:Cc:Subject:From;
 b=fpGO32U+MsTNZbHohxpPwvg1Uq/nPjwDaBlA9NFDdb8JtWAGK6sTrbB+lu3yBYkyF
 C912kGL8/qX6nG76cT0WwM6WPK707JMNhvnTL1WWkGh2M5LK7Tqxpqo/tLnDABJkLt
 KquLGV9Z/3RgrdBlXFR2D/SFGhuDx+DdXnJHPEKL4noPzfIGweLhwzdWt36jzXblFS
 M9bf+mET+ZIt9lAOOjbeyet8ziREuNph58SvdfojegO9FZiaaJKNICUKkzQspjqpEz
 Ig8eS55+3Rs5M0buwjx5/KDMVkSANT3fdnOoTLsW761BJyErEqIFMlRRFT2g6yS1Yk
 gJbeRw++6EQtQ==
Date: Sun, 31 Oct 2021 16:15:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YX8jdp73zUDwlB5E@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Headers-End: 1mhKAO-0000Cs-Oo
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.16
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

The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to b7e072f9b77f4c516df96e0c22ec09f8b2e76ba1:

  fscrypt: improve a few comments (2021-10-25 19:11:50 -0700)

----------------------------------------------------------------

Some cleanups for fs/crypto/:

- Allow 256-bit master keys with AES-256-XTS

- Improve documentation and comments

- Remove unneeded field fscrypt_operations::max_namelen

----------------------------------------------------------------
Eric Biggers (5):
      fscrypt: remove fscrypt_operations::max_namelen
      fscrypt: clean up comments in bio.c
      fscrypt: improve documentation for inline encryption
      fscrypt: allow 256-bit master keys with AES-256-XTS
      fscrypt: improve a few comments

 Documentation/block/inline-encryption.rst |  2 +
 Documentation/filesystems/fscrypt.rst     | 83 +++++++++++++++++++++++--------
 fs/crypto/bio.c                           | 32 ++++++------
 fs/crypto/fname.c                         |  3 +-
 fs/crypto/fscrypt_private.h               | 16 ++++--
 fs/crypto/hkdf.c                          | 11 ++--
 fs/crypto/keysetup.c                      | 62 +++++++++++++++++------
 fs/ext4/super.c                           |  1 -
 fs/f2fs/super.c                           |  1 -
 fs/ubifs/crypto.c                         |  1 -
 include/linux/fscrypt.h                   |  3 --
 11 files changed, 150 insertions(+), 65 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
