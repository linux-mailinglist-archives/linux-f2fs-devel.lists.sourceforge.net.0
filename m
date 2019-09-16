Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17EB3458
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2019 07:21:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i9jRf-0004cj-OY; Mon, 16 Sep 2019 05:21:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1i9jRd-0004cX-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 05:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jonRj+WqMJ4M4yufFJ40uDPw10qiwbG/H8Xv2von7zg=; b=iLaK9LmyCishJoMme0i2NjSkzE
 y3zWbT8/QfxqtG2aCtdMKUbSvc0RmBTtT7oGEVdnCyYuaQY+6WCeVxunJxAVrIiDVIw9vapunTL8v
 znpsdGTVp7/SpCsQz4Eonk7vQbuG/FSq73OFFSIYWZVJkh6jhCrW0DLgM85jzDSDIn5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jonRj+WqMJ4M4yufFJ40uDPw10qiwbG/H8Xv2von7zg=; b=C
 LgfQ3q3oq5uQOn/jUm4D1+iPIf/PUKjJHRSa5faTKg5m6Q174+NbTwJwDQqH7iu8HjQ0GCs2410AG
 3b0W53+RqMm9u8pL+wKW7EVrUrCkTh+Bn/PtUpDVnrTVr15+k+tIVJ3ggv2N8P1Th0TNfBhAP9mzn
 WbN3DsfWToRgfseA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i9jRc-007BpF-JR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 05:21:01 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7A222067B;
 Mon, 16 Sep 2019 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568611255;
 bh=0Zp0/Naz0WUbXJutjSKemevgHRocsO7EMFcWzb2dl1Y=;
 h=Date:From:To:Cc:Subject:From;
 b=awni9dksgHmJx9gTvqey0ukMhUw0fPydoBJv1SubKwoyxuqe/OomgiDpv4zwSvTWq
 6IrShbxft+Mr7JZGQUrgh1plwzdI2vlB6mlsPM2p3hP/7vnJMyzgYN+WqvIrmSoljM
 YtEjpk63iNa20lYgzpkEpwq/Bpbx8ft2uu4xPGEg=
Date: Sun, 15 Sep 2019 22:20:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190916052053.GB8269@sol.localdomain>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i9jRc-007BpF-JR
Subject: [f2fs-dev] [GIT PULL] fs-verity for 5.4
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
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to 95ae251fe82838b85c6d37e5a1775006e2a42ae0:

  f2fs: add fs-verity support (2019-08-12 19:33:51 -0700)

----------------------------------------------------------------
Hi Linus,

Please consider pulling fs-verity for 5.4.

fs-verity is a filesystem feature that provides Merkle tree based
hashing (similar to dm-verity) for individual readonly files, mainly for
the purpose of efficient authenticity verification.

This pull request includes:

(a) The fs/verity/ support layer and documentation.

(b) fs-verity support for ext4 and f2fs.

Compared to the original fs-verity patchset from last year, the UAPI to
enable fs-verity on a file has been greatly simplified.  Lots of other
things were cleaned up too.

fs-verity is planned to be used by two different projects on Android;
most of the userspace code is in place already.  Another userspace tool
("fsverity-utils"), and xfstests, are also available.  e2fsprogs and
f2fs-tools already have fs-verity support.  Other people have shown
interest in using fs-verity too.

I've tested this on ext4 and f2fs with xfstests, both the existing tests
and the new fs-verity tests.  This has also been in linux-next since
July 30 with no reported issues except a couple minor ones I found
myself and folded in fixes for.

Ted and I will be co-maintaining fs-verity.


There will be some fairly straightforward merge conflicts with the ext4
and f2fs trees.  I've tested the resolution of these in linux-next.

This will also "silently" conflict (compiler warning only) with the key
ACLs patchset, if you merge it again this cycle.  The resolution is to
translate the key permissions to an ACL in fs/verity/signature.c.  I
suggest using the resolution in linux-next, which I've tested.  This
resolution avoids making any behavior changes; note that some of the old
permissions map to multiple new permissions.

----------------------------------------------------------------
Eric Biggers (17):
      fs-verity: add a documentation file
      fs-verity: add MAINTAINERS file entry
      fs-verity: add UAPI header
      fs: uapi: define verity bit for FS_IOC_GETFLAGS
      fs-verity: add Kconfig and the helper functions for hashing
      fs-verity: add inode and superblock fields
      fs-verity: add the hook for file ->open()
      fs-verity: add the hook for file ->setattr()
      fs-verity: add data verification hooks for ->readpages()
      fs-verity: implement FS_IOC_ENABLE_VERITY ioctl
      fs-verity: implement FS_IOC_MEASURE_VERITY ioctl
      fs-verity: add SHA-512 support
      fs-verity: support builtin file signatures
      ext4: add basic fs-verity support
      ext4: add fs-verity read support
      ext4: update on-disk format documentation for fs-verity
      f2fs: add fs-verity support

 Documentation/filesystems/ext4/inodes.rst   |   6 +-
 Documentation/filesystems/ext4/overview.rst |   1 +
 Documentation/filesystems/ext4/super.rst    |   2 +
 Documentation/filesystems/ext4/verity.rst   |  41 ++
 Documentation/filesystems/fsverity.rst      | 726 ++++++++++++++++++++++++++++
 Documentation/filesystems/index.rst         |   1 +
 Documentation/ioctl/ioctl-number.rst        |   1 +
 MAINTAINERS                                 |  12 +
 fs/Kconfig                                  |   2 +
 fs/Makefile                                 |   1 +
 fs/ext4/Makefile                            |   1 +
 fs/ext4/ext4.h                              |  23 +-
 fs/ext4/file.c                              |   4 +
 fs/ext4/inode.c                             |  55 ++-
 fs/ext4/ioctl.c                             |  13 +
 fs/ext4/readpage.c                          | 211 ++++++--
 fs/ext4/super.c                             |  18 +-
 fs/ext4/sysfs.c                             |   6 +
 fs/ext4/verity.c                            | 367 ++++++++++++++
 fs/f2fs/Makefile                            |   1 +
 fs/f2fs/data.c                              |  75 ++-
 fs/f2fs/f2fs.h                              |  20 +-
 fs/f2fs/file.c                              |  43 +-
 fs/f2fs/inode.c                             |   5 +-
 fs/f2fs/super.c                             |   3 +
 fs/f2fs/sysfs.c                             |  11 +
 fs/f2fs/verity.c                            | 247 ++++++++++
 fs/f2fs/xattr.h                             |   2 +
 fs/verity/Kconfig                           |  55 +++
 fs/verity/Makefile                          |  10 +
 fs/verity/enable.c                          | 377 +++++++++++++++
 fs/verity/fsverity_private.h                | 185 +++++++
 fs/verity/hash_algs.c                       | 280 +++++++++++
 fs/verity/init.c                            |  61 +++
 fs/verity/measure.c                         |  57 +++
 fs/verity/open.c                            | 356 ++++++++++++++
 fs/verity/signature.c                       | 157 ++++++
 fs/verity/verify.c                          | 281 +++++++++++
 include/linux/fs.h                          |  11 +
 include/linux/fsverity.h                    | 211 ++++++++
 include/uapi/linux/fs.h                     |   1 +
 include/uapi/linux/fsverity.h               |  40 ++
 42 files changed, 3910 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/filesystems/ext4/verity.rst
 create mode 100644 Documentation/filesystems/fsverity.rst
 create mode 100644 fs/ext4/verity.c
 create mode 100644 fs/f2fs/verity.c
 create mode 100644 fs/verity/Kconfig
 create mode 100644 fs/verity/Makefile
 create mode 100644 fs/verity/enable.c
 create mode 100644 fs/verity/fsverity_private.h
 create mode 100644 fs/verity/hash_algs.c
 create mode 100644 fs/verity/init.c
 create mode 100644 fs/verity/measure.c
 create mode 100644 fs/verity/open.c
 create mode 100644 fs/verity/signature.c
 create mode 100644 fs/verity/verify.c
 create mode 100644 include/linux/fsverity.h
 create mode 100644 include/uapi/linux/fsverity.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
