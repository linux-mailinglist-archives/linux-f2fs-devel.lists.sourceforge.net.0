Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361F26D21D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 06:13:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIlIZ-0006cX-G8; Thu, 17 Sep 2020 04:13:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kIlIT-0006cG-N8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ht1lFzh88X3SO77TvjmM0ey1DtMo+r/fSH8/iGhhl8=; b=d3xU71prFodIrfjKUmaXuHjAw+
 +TOoBsInq0q2ajlHfdiD9Q20JOlgdW/Ir2QC2/PReCl9/oNz5WF2vfZk70a5KyVR9q6upFL35OtET
 +Nnfe2xi3Bfn57sf5dHpkIyVOWVSwQDUwRtw2D7G2TETceCVzF4MdDl/EtUKlkv27nvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6ht1lFzh88X3SO77TvjmM0ey1DtMo+r/fSH8/iGhhl8=; b=i
 4BHOrLD4+9FFL0TUfQgxI6Hwzn9s8vYylvh77TWJQAr0YO9wcH1cLYRYRKP7FzOD03MBzLVu08KFv
 vm7zuuThzxmKLVdNbhCXJsz/d1s8eC+NPj/RfVKuQCCozPVgqzZJnh49SoL/GlDCpdvrgYook58Tm
 0XqBaUm6AmZfs5WE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIlIO-00DZcj-IU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 04:13:25 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2A412074B;
 Thu, 17 Sep 2020 04:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315988;
 bh=tM/vVKpgIq/1E/c7scgrL37P+3enf/GVwfCXmp+Qo8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=aOK1PhygiTi9wUZF8AW5bf7XQaiWHY70xLWcdjs/iUgFVpU9gqRwuzZbiVuk7AtBi
 B2NqUu4X6lglthhCtvW3oOX7A0+0La/otShJwsVcyQZEDOZPwfQ1DaevY6r+cGNDNn
 hNDwgQ+tusdACi9w+UAOmem3muqIGfgD5mdFkFnE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 16 Sep 2020 21:11:23 -0700
Message-Id: <20200917041136.178600-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIlIO-00DZcj-IU
Subject: [f2fs-dev] [PATCH v3 00/13] fscrypt: improve file creation flow
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

This series reworks the implementation of creating new encrypted files
by introducing new helper functions that allow filesystems to set up the
inodes' keys earlier, prior to taking too many filesystem locks.

This fixes deadlocks that are possible during memory reclaim because
fscrypt_get_encryption_info() isn't GFP_NOFS-safe, yet it's called
during an ext4 transaction or under f2fs_lock_op().  It also fixes a
similar deadlock where f2fs can try to recursively lock a page when the
test_dummy_encryption mount option is in use.

It also solves an ordering problem that the ceph support for fscrypt
will have.  For more details about this ordering problem, see the
discussion on Jeff Layton's RFC patchsets for ceph fscrypt support
(v1: https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u
 v2: https://lkml.kernel.org/linux-fscrypt/20200904160537.76663-1-jlayton@kernel.org/T/#u
 v3: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-1-jlayton@kernel.org/T/#u)
Note that v3 of the ceph patchset is based on v2 of this patchset.

Patch 1 adds the above-mentioned new helper functions.  Patches 2-5
convert ext4, f2fs, and ubifs to use them, and patches 6-9 clean up a
few things afterwards.

Finally, patches 10-13 change the implementation of
test_dummy_encryption to no longer set up an encryption key for
unencrypted directories, which was confusing and was causing problems.

This patchset applies to the master branch of
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
It can also be retrieved from tag "fscrypt-file-creation-v3" of
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.

I'm looking to apply this for 5.10; reviews are greatly appreciated!

Changed v2 => v3:
  - Added patch that changes fscrypt_set_test_dummy_encryption() to take
    a 'const char *'.  (Needed by ceph.)
  - Fixed bug where fscrypt_prepare_new_inode() succeeded even if the
    new inode's key couldn't be set up.
  - Fixed bug where fscrypt_prepare_new_inode() wouldn't derive the
    dirhash key for new casefolded directories.
  - Made warning messages account for i_ino possibly being 0 now.

Changed v1 => v2:
  - Added mention of another deadlock this fixes.
  - Added patches to improve the test_dummy_encryption implementation.
  - Dropped an ext4 cleanup patch that can be done separately later.
  - Lots of small cleanups, and a couple small fixes.

Eric Biggers (13):
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
  fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char
    *'

 fs/crypto/crypto.c           |   4 +-
 fs/crypto/fname.c            |  11 +-
 fs/crypto/fscrypt_private.h  |  10 +-
 fs/crypto/hooks.c            |  65 ++++++++----
 fs/crypto/inline_crypt.c     |   7 +-
 fs/crypto/keyring.c          |   9 +-
 fs/crypto/keysetup.c         | 182 +++++++++++++++++++++++--------
 fs/crypto/keysetup_v1.c      |   8 +-
 fs/crypto/policy.c           | 200 ++++++++++++++++++++---------------
 fs/ext4/ext4.h               |   6 +-
 fs/ext4/ialloc.c             | 119 +++++++++++----------
 fs/ext4/super.c              |  17 +--
 fs/f2fs/dir.c                |   2 +-
 fs/f2fs/f2fs.h               |  25 +----
 fs/f2fs/namei.c              |   7 +-
 fs/f2fs/super.c              |  16 +--
 fs/ubifs/dir.c               |  38 +++----
 include/linux/fscrypt.h      | 120 +++++++--------------
 include/uapi/linux/fscrypt.h |   6 +-
 19 files changed, 474 insertions(+), 378 deletions(-)


base-commit: 5e895bd4d5233cb054447d0491d4e63c8496d419
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
