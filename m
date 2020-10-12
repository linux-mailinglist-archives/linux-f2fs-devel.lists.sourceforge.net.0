Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F200528BE18
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 18:36:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS0no-0001ZQ-EW; Mon, 12 Oct 2020 16:36:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kS0nn-0001ZJ-G3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 16:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pRi77p+xHW00tzoUl+WrRnEzFC6dW+zoDMyS9CjDqW0=; b=EduotoRg4cpqXAb8oPiAnc9y4B
 1d4ZkQOqiAnQ5BVGlPBBSzgXmZjKhAu0P3XRZ560u9PzMZ5mA+LOihriORuoAePoNsQhfQhkyFxgo
 wOXti2MnAJYYhTQKbJattPgB+4TBm7oqkgpgqlwqzZAGLuZYuJ/v9tQicfegSGmHNvac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pRi77p+xHW00tzoUl+WrRnEzFC6dW+zoDMyS9CjDqW0=; b=H
 QD0an6RNhTzlLAbsCrqgVqGzeolhx8iiMX53Aot7sziFug2I9cOKIlwiHOGDMv2wS4AR/apg4pAce
 MXEPyNshI0cqXmr28le6V3UOVQ/vegAFt/V9kxMEIwP5T3QxumowQo/Vg58Cd/TJYnJQ577xmlmCW
 E60J42tnPBENUGgU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kS0ne-00CLaI-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 16:35:59 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A743C2087E;
 Mon, 12 Oct 2020 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602520545;
 bh=YcQkpt6LAikAkB8QxaNKH7LeylYY9QtLEPxQqeO6Opc=;
 h=Date:From:To:Cc:Subject:From;
 b=h3CNKfqwIHPV7BZ9hlGFurPVOoV3tPc0rsL8zhSQ3bYNeva/1gL1LMR6EgvNgZ1ky
 Iue96vWauoxpSjbJ0nTKmHeG1rslzfbYWaB/Mq5x5OWvhn/dOTTQ8G9m+BlO9Y3Tp0
 Y7SUutsnxm/64ZLRdP9PVhAzUFjaKyM+162FzfvU=
Date: Mon, 12 Oct 2020 09:35:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201012163543.GB858@sol.localdomain>
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
X-Headers-End: 1kS0ne-00CLaI-Cr
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.10
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit f4d51dffc6c01a9e94650d95ce0104964f8ae822:

  Linux 5.9-rc4 (2020-09-06 17:11:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 5b2a828b98ec1872799b1b4d82113c76a12d594f:

  fscrypt: export fscrypt_d_revalidate() (2020-09-28 14:44:51 -0700)

----------------------------------------------------------------

This release, we rework the implementation of creating new encrypted
files in order to fix some deadlocks and prepare for adding fscrypt
support to CephFS, which Jeff Layton is working on.

We also export a symbol in preparation for the above-mentioned CephFS
support and also for ext4/f2fs encrypt+casefold support.

Finally, there are a few other small cleanups.

As usual, all these patches have been in linux-next with no reported
issues, and I've tested them with xfstests.

----------------------------------------------------------------
Eric Biggers (18):
      fscrypt: restrict IV_INO_LBLK_32 to ino_bits <= 32
      fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
      ext4: factor out ext4_xattr_credits_for_new_inode()
      ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
      fscrypt: adjust logging for in-creation inodes
      fscrypt: remove fscrypt_inherit_context()
      fscrypt: require that fscrypt_encrypt_symlink() already has key
      fscrypt: stop pretending that key setup is nofs-safe
      fscrypt: make "#define fscrypt_policy" user-only
      fscrypt: move fscrypt_prepare_symlink() out-of-line
      fscrypt: handle test_dummy_encryption in more logical way
      fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char *'
      fscrypt: use sha256() instead of open coding
      fscrypt: don't call no-key names "ciphertext names"
      fscrypt: rename DCACHE_ENCRYPTED_NAME to DCACHE_NOKEY_NAME
      fscrypt: export fscrypt_d_revalidate()

Jeff Layton (1):
      fscrypt: drop unused inode argument from fscrypt_fname_alloc_buffer

 fs/crypto/crypto.c           |   4 +-
 fs/crypto/fname.c            |  60 ++++++-------
 fs/crypto/fscrypt_private.h  |  10 ++-
 fs/crypto/hooks.c            |  80 +++++++++++------
 fs/crypto/inline_crypt.c     |   7 +-
 fs/crypto/keyring.c          |   9 +-
 fs/crypto/keysetup.c         | 182 +++++++++++++++++++++++++++----------
 fs/crypto/keysetup_v1.c      |   8 +-
 fs/crypto/policy.c           | 209 ++++++++++++++++++++++++-------------------
 fs/ext4/dir.c                |   2 +-
 fs/ext4/ext4.h               |   6 +-
 fs/ext4/ialloc.c             | 119 ++++++++++++------------
 fs/ext4/namei.c              |   7 +-
 fs/ext4/super.c              |  16 ++--
 fs/f2fs/dir.c                |   6 +-
 fs/f2fs/f2fs.h               |  25 +-----
 fs/f2fs/namei.c              |   7 +-
 fs/f2fs/super.c              |  15 ++--
 fs/ubifs/dir.c               |  40 ++++-----
 include/linux/dcache.h       |   2 +-
 include/linux/fscrypt.h      | 159 +++++++++++++-------------------
 include/uapi/linux/fscrypt.h |   6 +-
 22 files changed, 535 insertions(+), 444 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
