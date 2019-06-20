Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FA4DBC7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 22:53:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he446-0000fS-Kv; Thu, 20 Jun 2019 20:53:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1he443-0000ex-Lg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 20:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UrF+kpMJC0iyELm6UB+QhZL8pcdu679i9r6Rc2XnKs4=; b=dI7iomhyDAZY9e5x3uQ/OCzaF2
 p46LCivXMlLKoLjc1Ij0AVwqdJnj4y6pXWllqIeLT8PQzaqFAfpDl5+uiE1WW+NB1zoR/JQXt2Fjl
 KVSEJYdLsqhsRDRPwQBSA35snIS80DU0FuUB5zEpFWv1+gYk+VQwoez1ryoS6tSnD63o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UrF+kpMJC0iyELm6UB+QhZL8pcdu679i9r6Rc2XnKs4=; b=f
 3NWrnW6kiMBfewv+JWd6Op85/q0PhRvfbVrIgYetZU3ENSLk69UTCw8XfiMh2D1gKtZsVJ3lm8LrU
 YIoLdFZICaVfqdA78HOcwSTw8DSEuk+eRM7XPVcaNjPan02Smplzns4E/ibDXXCeZArotx1YbI2O1
 uhYdGc5jV88tQl5A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he442-006vUi-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 20:53:50 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C2682082C;
 Thu, 20 Jun 2019 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561064021;
 bh=X6B+Zhldy9yBGu5j9RqKwhapPc3BLPDI8huH3Wndls8=;
 h=From:To:Cc:Subject:Date:From;
 b=dqfaE2HK8jP8fu/2cFgT0S7AoNynMGB6eAfZLtg32Ly+eBxhsl+ceC/e3UIQTRugS
 fv59SWODL6WvddAVooSim5HU/G2WyoVpnQysddle6gbSivhloEsEvbBgPW27irjvax
 PhyPDD20CtZPAky4HmkbWQ0LjnEQoTuE25DMg9s8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 20 Jun 2019 13:50:27 -0700
Message-Id: <20190620205043.64350-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: readme.md]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 1.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1he442-006vUi-OZ
Subject: [f2fs-dev] [PATCH v5 00/16] fs-verity: read-only file-based
 authenticity protection
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

This is a redesigned version of the fs-verity patchset, implementing
Ted's suggestion to build the Merkle tree in the kernel
(https://lore.kernel.org/linux-fsdevel/20190207031101.GA7387@mit.edu/).
This greatly simplifies the UAPI, since the verity metadata no longer
needs to be transferred to the kernel.  Now to enable fs-verity on a
file, one simply calls FS_IOC_ENABLE_VERITY, passing it this structure:

	struct fsverity_enable_arg {
		__u32 version;
		__u32 hash_algorithm;
		__u32 block_size;
		__u32 salt_size;
		__u64 salt_ptr;
		__u32 sig_size;
		__u32 __reserved1;
		__u64 sig_ptr;
		__u64 __reserved2[11];
	};

The filesystem then builds the file's Merkle tree and stores it in a
filesystem-specific location associated with the file.  Afterwards,
FS_IOC_MEASURE_VERITY can be used to retrieve the file measurement
("root hash").  The way the file measurement is computed is also
effectively part of the API (it has to be), but it's logically
independent of where/how the filesystem stores the Merkle tree.

The API is fully documented in Documentation/filesystems/fsverity.rst,
along with other aspects of fs-verity.  I also added an FAQ section that
answers frequently asked questions about fs-verity, e.g. why isn't it
all at the VFS level, why isn't it part of IMA, why does the Merkle tree
need to be stored on-disk, etc.

Overview
--------

This patchset implements fs-verity for ext4 and f2fs.  fs-verity is
similar to dm-verity, but implemented on a per-file basis: a Merkle tree
is used to measure (hash) a read-only file's data as it is paged in.
ext4 and f2fs hide this Merkle tree beyond the end of the file, but
other filesystems can implement it differently if desired.

In general, fs-verity is intended for use on writable filesystems;
dm-verity is still recommended on read-only ones.

Similar to fscrypt, most of the code is in fs/verity/, and not too many
filesystem-specific changes are needed.  The Merkle tree is built by the
filesystem when the FS_IOC_ENABLE_VERITY ioctl is executed.

fs-verity provides a file measurement (hash) in constant time and
verifies data on-demand.  Thus, it is useful for efficiently verifying
the authenticity of large files of which only a small portion may be
accessed, such as Android application package (APK) files.  It may also
be useful in "audit" use cases where file hashes are logged.

fs-verity can also provide better protection against malicious disks
than an ahead-of-time hash, since fs-verity re-verifies data each time
it's paged in.  Note, however, that any authenticity guarantee is still
dependent on verification of the file measurement and other relevant
metadata in a way that makes sense for the overall system; fs-verity is
only a tool to help with this.

This patchset doesn't include IMA support for fs-verity file
measurements.  This is planned and we'd like to collaborate with the IMA
maintainers.  Although fs-verity can be used on its own without IMA,
fs-verity is primarily a lower level feature (think of it as a way of
hashing a file), so some users may still need IMA's policy mechanism.
However, an optional in-kernel signature verification mechanism within
fs-verity itself is also included.

This patchset is based on v5.2-rc3.  It can also be found in git at tag
fsverity_2019-06-20 of:

	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git

fs-verity has a userspace utility:

	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git

xfstests for fs-verity can be found at branch "fsverity" of:

	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git

fs-verity is supported by f2fs-tools v1.11.0+ and e2fsprogs v1.45.2+.

Examples of setting up fs-verity protected files can be found in the
README.md file of fsverity-utils.

Other useful references include:

  - Documentation/filesystems/fsverity.rst, added by the first patch.

  - LWN coverage of v3 patchset: https://lwn.net/Articles/790185/

  - LWN coverage of v2 patchset: https://lwn.net/Articles/775872/

  - LWN coverage of v1 patchset: https://lwn.net/Articles/763729/

  - Presentation at Linux Security Summit North America 2018:
      - Slides: https://schd.ws/hosted_files/lssna18/af/fs-verity%20slide%20deck.pdf
      - Video: https://www.youtube.com/watch?v=Aw5h6aBhu6M
      (This corresponded to the v1 patchset; changes have been made since then.)

  - LWN coverage of LSFMM 2018 discussion: https://lwn.net/Articles/752614/

Changed since v4:

  - Made ext4 and f2fs store the verity metadata beginning at a 64K
    aligned boundary, to be ready for architectures with 64K pages.

  - Made ext4 store the verity descriptor size in the file data stream,
    so that no xattr is needed.

  - Added support for empty files.

  - A few minor cleanups.

Changed since v3:

  - The FS_IOC_GETFLAGS ioctl now returns the verity flag.

  - Fixed setting i_verity_info too early.

  - Restored pagecache invalidation in FS_IOC_ENABLE_VERITY.

  - Fixed truncation of fsverity_enable_arg::hash_algorithm.

  - Reject empty files for both open and enable, not just enable.

  - Added a couple more FAQ entries to the documentation.

  - A few minor cleanups.

  - Rebased onto v5.2-rc3.

Changed since v2:

  - Large redesign: the Merkle tree is now built by
    FS_IOC_ENABLE_VERITY, rather than being provided by userspace.  The
    fsverity_operations provide an interface for filesystems to read and
    write the Merkle tree from/to a filesystem-specific location.

  - Lot of refactoring, cleanups, and documentation improvements.

  - Many simplifications, such as simplifying the fsverity_descriptor
    format, dropping CRC-32 support, and limiting the salt size.

  - ext4 and f2fs now store an xattr that gives the location of the
    fsverity_descriptor, so loading it is more straightforward.

  - f2fs no longer counts the verity metadata in the on-disk i_size,
    making it consistent with ext4.

  - Replaced the filesystem-specific fs-verity kconfig options with
    CONFIG_FS_VERITY.

  - Replaced the filesystem-specific verity bit checks with IS_VERITY().

Changed since v1:

  - Added documentation file.

  - Require write permission for FS_IOC_ENABLE_VERITY, rather than
    CAP_SYS_ADMIN.

  - Eliminated dependency on CONFIG_BLOCK and clarified that filesystems
    can verify a page at a time rather than a bio at a time.

  - Fixed conditions for verifying holes.

  - ext4 now only allows fs-verity on extent-based files.

  - Eliminated most of the assumptions that the verity metadata is
    stored beyond EOF, in case filesystems want to do things
    differently.

  - Other cleanups.

Eric Biggers (16):
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
  f2fs: add fs-verity support

 Documentation/filesystems/fsverity.rst | 710 +++++++++++++++++++++++++
 Documentation/filesystems/index.rst    |   1 +
 Documentation/ioctl/ioctl-number.txt   |   1 +
 MAINTAINERS                            |  12 +
 fs/Kconfig                             |   2 +
 fs/Makefile                            |   1 +
 fs/ext4/Makefile                       |   1 +
 fs/ext4/ext4.h                         |  23 +-
 fs/ext4/file.c                         |   4 +
 fs/ext4/inode.c                        |  48 +-
 fs/ext4/ioctl.c                        |  12 +
 fs/ext4/readpage.c                     | 207 ++++++-
 fs/ext4/super.c                        |  18 +-
 fs/ext4/sysfs.c                        |   6 +
 fs/ext4/verity.c                       | 354 ++++++++++++
 fs/f2fs/Makefile                       |   1 +
 fs/f2fs/data.c                         |  72 ++-
 fs/f2fs/f2fs.h                         |  23 +-
 fs/f2fs/file.c                         |  40 ++
 fs/f2fs/inode.c                        |   5 +-
 fs/f2fs/super.c                        |   3 +
 fs/f2fs/sysfs.c                        |  11 +
 fs/f2fs/verity.c                       | 233 ++++++++
 fs/f2fs/xattr.h                        |   2 +
 fs/verity/Kconfig                      |  55 ++
 fs/verity/Makefile                     |  10 +
 fs/verity/enable.c                     | 355 +++++++++++++
 fs/verity/fsverity_private.h           | 185 +++++++
 fs/verity/hash_algs.c                  | 279 ++++++++++
 fs/verity/init.c                       |  61 +++
 fs/verity/measure.c                    |  57 ++
 fs/verity/open.c                       | 357 +++++++++++++
 fs/verity/signature.c                  | 207 +++++++
 fs/verity/verify.c                     | 281 ++++++++++
 include/linux/fs.h                     |  11 +
 include/linux/fsverity.h               | 209 ++++++++
 include/uapi/linux/fs.h                |   1 +
 include/uapi/linux/fsverity.h          |  40 ++
 38 files changed, 3839 insertions(+), 59 deletions(-)
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

-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
