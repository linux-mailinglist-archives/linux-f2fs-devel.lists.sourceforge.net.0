Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFD8B1F903
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wb60tN6ua8Q9Pkq9RvvIjVcNkF1QEJWyxp7h8278BkA=; b=fFDVbhah1NVII7YpV+NYYwnl2a
	NT+nU74h/QLai55pG0ROyVuotkTtZi9OiR7q2T3hbcURBz17Bt1L4c7KDrfuhOsLIg7Ymmjudzj1C
	oG0b42kl/4+YpZyE5+6AgKa5EyuVLNjKMTjR/z77lklfQwVQ8YUrkPYK0GeJIulbx7SQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yV-00020b-Sx;
	Sun, 10 Aug 2025 08:00:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yV-00020V-8K
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GdPH/+NcW6TAbXooVQlTd8faOiYQtXgqsrfPYMPIfhQ=; b=dSX+NWErfVBfLKuv7NqCkCfeSk
 TvUwpOV5UuVZafbWZ5mrL9iGIw2cq64XfiOaPn2HnoTGSKixqtbdTXU9fJ3VYhVWwE9dDb/UEP3Uy
 4pNCKcL3g2o3u3rNzHKIECQFvelEKnkNPtqx3mstNQtxXTFbiLBmpqu6rLaORHH+QT1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GdPH/+NcW6TAbXooVQlTd8faOiYQtXgqsrfPYMPIfhQ=; b=O
 sOuNkCFd8G9ijxRoUxHXz4sNx+E94CTAFxbQ3S5gqyZ+Ig7xkUyN08BS+AIMcdslna4cxZKZF+XJf
 +RsIDgR6XAjbxyr0/yjbbUMPA1m82hY08rv+HwgsBbyc1dYLDR2xKPrZvgyJqV17Xoh54qB1dqpJp
 BqJXWNw1Lv0nrz2s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yU-00010M-7t for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72453A54F4E;
 Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E84DC4CEEB;
 Sun, 10 Aug 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812807;
 bh=aTHyx1cf8uUcKi9iLPhMiaHNvBZweQxvaRFblGuIkU0=;
 h=From:To:Cc:Subject:Date:From;
 b=WJdGfnTNdEQ6MVf/hGAbh0JwTqoz1Yh+pYp0k313F/a1j/rorDF8R07LPBEZ0sLKf
 6TxIZXJpfRkfiRSg79aTBLrOKodHRWnOYxIzpGNzqukX7W9ZpAjrTaSykO5VbJXU6M
 rkyXb6XfNgNUexzXDTYxsxC562eZhrAIUbuI29XD8/0xg59FuqKZjrrfxyllWOp+0H
 pVx0Qmp2Zi2NnZkdXh0MsxAXjpQMVsGoNDFQBesUFz9qP+u5Wtl/oSyI7pmdRGsa5n
 +v/4jBd7cw61Mw1MmUKzH2i7rF9Ljz955U2e9s4ryWyazVca4ZmDDM7IWpIX6vR9d2
 covGiQZeubuTQ==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:53 -0700
Message-ID: <20250810075706.172910-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a cleaned-up implementation of moving the
 i_crypt_info
 and i_verity_info pointers out of 'struct inode' and into the fs-specific
 part of the inode, as proposed previously by Christian at https [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yU-00010M-7t
Subject: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out of
 struct inode
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a cleaned-up implementation of moving the i_crypt_info and
i_verity_info pointers out of 'struct inode' and into the fs-specific
part of the inode, as proposed previously by Christian at
https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

The high-level concept is still the same: fs/crypto/ and fs/verity/
locate the pointer by adding an offset to the address of struct inode.
The offset is retrieved from fscrypt_operations or fsverity_operations.

I've cleaned up a lot of the details, including:
- Grouped changes into patches differently
- Rewrote commit messages and comments to be clearer
- Adjusted code formatting to be consistent with existing code
- Removed unneeded #ifdefs
- Improved choice and location of VFS_WARN_ON_ONCE() statements
- Added missing kerneldoc for ubifs_inode::i_crypt_info
- Moved field initialization to init_once functions when they exist
- Improved ceph offset calculation and removed unneeded static_asserts
- fsverity_get_info() now checks IS_VERITY() instead of v_ops
- fscrypt_put_encryption_info() no longer checks IS_ENCRYPTED(), since I
  no longer think it's actually correct there.
- verity_data_blocks() now keeps doing a raw dereference
- Dropped fscrypt_set_inode_info() 
- Renamed some functions
- Do offset calculation using int, so we don't rely on unsigned overflow
- And more.

For v4 and earlier, see
https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

I'd like to take this series through the fscrypt tree for 6.18.
(fsverity normally has a separate tree, but by choosing just one tree
for this, we'll avoid conflicts in some places.)

Eric Biggers (13):
  fscrypt: replace raw loads of info pointer with helper function
  fscrypt: add support for info in fs-specific part of inode
  ext4: move crypt info pointer to fs-specific part of inode
  f2fs: move crypt info pointer to fs-specific part of inode
  ubifs: move crypt info pointer to fs-specific part of inode
  ceph: move crypt info pointer to fs-specific part of inode
  fs: remove inode::i_crypt_info
  fsverity: add support for info in fs-specific part of inode
  ext4: move verity info pointer to fs-specific part of inode
  f2fs: move verity info pointer to fs-specific part of inode
  btrfs: move verity info pointer to fs-specific part of inode
  fs: remove inode::i_verity_info
  fsverity: check IS_VERITY() in fsverity_cleanup_inode()

 fs/btrfs/btrfs_inode.h       |  5 ++++
 fs/btrfs/inode.c             |  3 ++
 fs/btrfs/verity.c            |  2 ++
 fs/ceph/crypto.c             |  2 ++
 fs/ceph/inode.c              |  1 +
 fs/ceph/super.h              |  1 +
 fs/crypto/bio.c              |  2 +-
 fs/crypto/crypto.c           | 14 +++++----
 fs/crypto/fname.c            | 11 +++----
 fs/crypto/fscrypt_private.h  |  4 +--
 fs/crypto/hooks.c            |  2 +-
 fs/crypto/inline_crypt.c     | 12 ++++----
 fs/crypto/keysetup.c         | 43 ++++++++++++++++-----------
 fs/crypto/policy.c           |  7 +++--
 fs/ext4/crypto.c             |  2 ++
 fs/ext4/ext4.h               |  8 +++++
 fs/ext4/super.c              |  6 ++++
 fs/ext4/verity.c             |  2 ++
 fs/f2fs/f2fs.h               |  6 ++++
 fs/f2fs/super.c              | 10 ++++++-
 fs/f2fs/verity.c             |  2 ++
 fs/ubifs/crypto.c            |  2 ++
 fs/ubifs/ubifs.h             |  4 +++
 fs/verity/enable.c           |  6 ++--
 fs/verity/fsverity_private.h |  9 +++---
 fs/verity/open.c             | 23 ++++++++-------
 fs/verity/verify.c           |  2 +-
 include/linux/fs.h           | 10 -------
 include/linux/fscrypt.h      | 40 +++++++++++++++++++++++--
 include/linux/fsverity.h     | 57 +++++++++++++++++++++++++++++-------
 30 files changed, 215 insertions(+), 83 deletions(-)


base-commit: 561c80369df0733ba0574882a1635287b20f9de2
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
