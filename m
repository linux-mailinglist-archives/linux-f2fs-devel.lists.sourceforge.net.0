Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899B14ADB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2020 02:47:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwFyB-0005jv-Qv; Tue, 28 Jan 2020 01:47:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iwFyA-0005jh-PS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 01:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uPLxE0yx4d8ggPA+AhBtScmSO65CTs7+hTymkD2+jW0=; b=BOSXc+3a/cSUOfEfDDlCtZvhpt
 lYwq/YCz/4sPtZ4MtGYReLUMmysk74DGNUq86iQQlD09q3//vMmCitOyWFtfe9vrMZjuQHrW+o2d5
 M7oL+GTzJAOR3F+kxYQjd9EJyYgAARhMfvkn3sXOa2zVq/yb5PzPDNuJnxS5l10QG7yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uPLxE0yx4d8ggPA+AhBtScmSO65CTs7+hTymkD2+jW0=; b=N
 YM6crGCZwH/bHi0zDIfCt/AelnwhYdW9G9VkXVEkbG5jMr6Iu4lTCxaRlcxJQ4SZ9qwXgqRen3nQ0
 dgC4XcF3EkES2Bi6Y+Neh7ZvmqxCqhEFS2RO+0FNu0tTD3J5BRPSgM/8kErqNdeuNV4upr8k9OF+n
 /9Lzk6W8hhpVi4D8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iwFy5-007hPq-FU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 01:47:10 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6233214AF;
 Tue, 28 Jan 2020 01:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580176015;
 bh=lr1TtkPAw46qDf+d4N/SnYvTgRxlT3N0rKG9IJ6qTbA=;
 h=Date:From:To:Cc:Subject:From;
 b=cqYd7QKXvUceC5PzgPSZ/bE2097stte3DG4D2oPME66YdL+7ulDNPgc2DupoZg8cb
 2xo7bClv8D0TskJO5zx3lNoQTU+xAk0kLYPI/Dn41ItM/+egz25uOG3zMUXG+lS7jX
 c/2mes651GtPNlOmgecueJBMSymiMQY8ZbJAHV1s=
Date: Mon, 27 Jan 2020 17:46:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200128014653.GA960@sol.localdomain>
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
X-Headers-End: 1iwFy5-007hPq-FU
Subject: [f2fs-dev] [GIT PULL] fscrypt updates for 5.6
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit fd6988496e79a6a4bdb514a4655d2920209eb85d:

  Linux 5.5-rc4 (2019-12-29 15:29:16 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to edc440e3d27fb31e6f9663cf413fad97d714c060:

  fscrypt: improve format of no-key names (2020-01-22 14:50:03 -0800)

----------------------------------------------------------------

- Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
  provided via a keyring key.

- Prepare for the new dirhash method (SipHash of plaintext name) that
  will be used by directories that are both encrypted and casefolded.

- Switch to a new format for "no-key names" that prepares for the new
  dirhash method, and also fixes a longstanding bug where multiple
  filenames could map to the same no-key name.

- Allow the crypto algorithms used by fscrypt to be built as loadable
  modules when the fscrypt-capable filesystems are.

- Optimize fscrypt_zeroout_range().

- Various cleanups.

----------------------------------------------------------------
Daniel Rosenberg (3):
      fscrypt: don't allow v1 policies with casefolding
      fscrypt: derive dirhash key for casefolded directories
      fscrypt: improve format of no-key names

Eric Biggers (22):
      fscrypt: support passing a keyring key to FS_IOC_ADD_ENCRYPTION_KEY
      fscrypt: use crypto_skcipher_driver_name()
      fscrypt: verify that the crypto_skcipher has the correct ivsize
      fscrypt: constify struct fscrypt_hkdf parameter to fscrypt_hkdf_expand()
      fscrypt: constify inode parameter to filename encryption functions
      fscrypt: move fscrypt_d_revalidate() to fname.c
      fscrypt: introduce fscrypt_needs_contents_encryption()
      fscrypt: split up fscrypt_supported_policy() by policy version
      fscrypt: check for appropriate use of DIRECT_KEY flag earlier
      fscrypt: move fscrypt_valid_enc_modes() to policy.c
      fscrypt: remove fscrypt_is_direct_key_policy()
      fscrypt: don't check for ENOKEY from fscrypt_get_encryption_info()
      fscrypt: include <linux/ioctl.h> in UAPI header
      fscrypt: remove redundant bi_status check
      fscrypt: optimize fscrypt_zeroout_range()
      fscrypt: document gfp_flags for bounce page allocation
      ubifs: use IS_ENCRYPTED() instead of ubifs_crypt_is_encrypted()
      fscrypt: don't print name of busy file when removing key
      fscrypt: add "fscrypt_" prefix to fname_encrypt()
      fscrypt: clarify what is meant by a per-file key
      ubifs: don't trigger assertion on invalid no-key filename
      ubifs: allow both hash and disk name to be provided in no-key names

Herbert Xu (1):
      fscrypt: Allow modular crypto algorithms

 Documentation/filesystems/fscrypt.rst |  75 ++++++--
 fs/crypto/Kconfig                     |  22 ++-
 fs/crypto/bio.c                       | 114 ++++++++----
 fs/crypto/crypto.c                    |  57 +-----
 fs/crypto/fname.c                     | 316 +++++++++++++++++++++++++++-------
 fs/crypto/fscrypt_private.h           |  58 +++----
 fs/crypto/hkdf.c                      |   2 +-
 fs/crypto/hooks.c                     |  47 ++++-
 fs/crypto/keyring.c                   | 147 +++++++++++++---
 fs/crypto/keysetup.c                  | 102 ++++++-----
 fs/crypto/keysetup_v1.c               |  19 +-
 fs/crypto/policy.c                    | 170 ++++++++++++------
 fs/ext4/Kconfig                       |   1 +
 fs/ext4/dir.c                         |   2 +-
 fs/f2fs/Kconfig                       |   1 +
 fs/f2fs/dir.c                         |   2 +-
 fs/inode.c                            |   3 +-
 fs/ubifs/Kconfig                      |   1 +
 fs/ubifs/dir.c                        |  16 +-
 fs/ubifs/file.c                       |   4 +-
 fs/ubifs/journal.c                    |  10 +-
 fs/ubifs/key.h                        |   1 -
 fs/ubifs/ubifs.h                      |   7 -
 include/linux/fscrypt.h               | 122 +++++--------
 include/uapi/linux/fscrypt.h          |  14 +-
 25 files changed, 864 insertions(+), 449 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
