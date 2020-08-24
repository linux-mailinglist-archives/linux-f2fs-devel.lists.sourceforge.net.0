Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A224F260
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 08:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kA5oL-0002Aw-Qs; Mon, 24 Aug 2020 06:18:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kA5oL-0002Al-99
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eTytA6+3y4Po9Hme+7xm8vvdfibYXRJad7JIRTBOCVg=; b=lPN+dSlkMRS7zz6yShN8Sk4C0B
 Nly6y8ZX+/6YY+Ca9C7X7/DsxXIASCxHHDzYlYaRFub4pHIsR8ncLaX25QVjug90qb82PY3YKd6Nb
 lTxrFlpvR+QMcFXzkrpPsbF3jx9XxLL4kWbGuE0Uj1zNGl05iWc1d5wK9y5uFDFghYb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eTytA6+3y4Po9Hme+7xm8vvdfibYXRJad7JIRTBOCVg=; b=G
 Xe+vKfD83h657SUfQYJGyqib/DabcuuQbb/n6g39XkJMtSPlyMmREZ4e9BezyAR2zWjHwZEZG+3e3
 Ev4Hgz58g56jZXGr1Gg6wHZHogRiN0gmPU6Wwc6mWYXBV4YmUDsKuRAVNikPNocqdbMVMVwMUKlkc
 UTQfp+C7iwd+3Ffk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kA5oH-00GmMP-QM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:29 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD6CF206B5;
 Mon, 24 Aug 2020 06:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249898;
 bh=5Cg/F/P1MsSIqNAEKm5EcA85tMzmQDFgxtq+BwsOiXY=;
 h=From:To:Cc:Subject:Date:From;
 b=f893nZOHOk74YywNd+s2c7KM7U+ApkFK+G5wAxPqs247sQ2FcptH0qP9EtwzvEYBf
 LROjPrF6b7H17wnj5KGsZaPkgvTF6yctFlLpC0zde7Uvt1Qfhq8ilvE8jBprCzObNr
 jbaGalIhOAIFifcUwA2qyoWoyI0iCcGdq4CofU6w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 23 Aug 2020 23:17:04 -0700
Message-Id: <20200824061712.195654-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kA5oH-00GmMP-QM
Subject: [f2fs-dev] [RFC PATCH 0/8] fscrypt: avoid GFP_NOFS-unsafe key setup
 during transaction
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series fixes some deadlocks which are theoretically possible due to
fscrypt_get_encryption_info() being GFP_NOFS-unsafe, and thus not safe
to be called from within an ext4 transaction or under f2fs_lock_op().

The problem is solved by new helper functions which allow setting up the
key for new inodes earlier.  Patch 1 adds these helper functions.  Also
see that patch for a more detailed description of this problem.

Patches 2-6 then convert ext4, f2fs, and ubifs to use these new helpers.

Patch 7-8 then clean up a few things afterwards.

Coincidentally, this also solves some of the ordering problems that
ceph fscrypt support will have.  For more details about this, see the
discussion on Jeff Layton's RFC patchset for ceph fscrypt support
(https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u)
However, fscrypt_prepare_new_inode() still requires that the new
'struct inode' exist already, so it might not be enough for ceph yet.

This patchset applies to v5.9-rc2.

Eric Biggers (8):
  fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
  ext4: factor out ext4_xattr_credits_for_new_inode()
  ext4: remove some #ifdefs in ext4_xattr_credits_for_new_inode()
  ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
  fscrypt: remove fscrypt_inherit_context()
  fscrypt: stop pretending that key setup is nofs-safe

 fs/crypto/fscrypt_private.h |   3 +
 fs/crypto/hooks.c           |  10 +-
 fs/crypto/inline_crypt.c    |   7 +-
 fs/crypto/keysetup.c        | 190 ++++++++++++++++++++++++++++--------
 fs/crypto/keysetup_v1.c     |   8 +-
 fs/crypto/policy.c          |  64 +++++++-----
 fs/ext4/ialloc.c            | 118 +++++++++++-----------
 fs/f2fs/dir.c               |   2 +-
 fs/f2fs/f2fs.h              |  16 ---
 fs/f2fs/namei.c             |   7 +-
 fs/ubifs/dir.c              |  26 ++---
 include/linux/fscrypt.h     |  18 +++-
 12 files changed, 293 insertions(+), 176 deletions(-)

-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
