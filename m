Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8D2DCC46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 07:00:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpmLJ-00056q-0Z; Thu, 17 Dec 2020 06:00:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kpmLH-00056j-Os
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=90GG3TwRVSMM1OsmtP2NLkQdCXafLA1ofNsqcQa5GQk=; b=MP5r+19RfxPH+xkL3Po/u7jeAk
 HhoOxBurz1GCWIQa9lngs076W+d0KI630bq2j2z4zdNH/PhIc+2Q+ZiicJTt0jBoV7Za4vtrC5uhd
 0jqg83LSmLJ+0Z0MaUUk/El0N2+mgPbMZ2/pLUD2AiBoIoKgqdGWvJOoxPn+8oPohRuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=90GG3TwRVSMM1OsmtP2NLkQdCXafLA1ofNsqcQa5GQk=; b=m
 h7fZdfjLVQWNuJD2jfcKqa/iiL8CcSSYdhlzgojSnRl6KDRynbnG9Jcsl/FifldHXlGQYJkQy/qt/
 FTde9LNMUE6e083GxQ/Q26+EVhMAQTrCOVtT/sQDLoGV7LNWTF55WrrgEglFUQrVZke32wYBDLoQq
 UnTu60kME0mSbCEw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpmLB-00HH27-TU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:00:47 +0000
Date: Wed, 16 Dec 2020 22:00:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608184831;
 bh=aY/GSxis8NqXm3WJEC5H98M0rzq9rwgDSfVSN9kOJbI=;
 h=From:To:Cc:Subject:From;
 b=P5dldCYOSC1WrM3+KNi0x3zpnA9WqxSrksbVccUGWt5siIsK6YR041bRoWTljiU4X
 eYgoRSTerU5inQcvr2KsJ63gOMrimCn+uzYO2N55a6KpW8b5t12L/ytKKY7DKODmu0
 jSLwwvyFRohmFT2v2GHphYu9Y8U81H4BVbI6XZZX6PPSFj8fRGIgNO8g0TkUYEaAX9
 MaSwJY/yu/kRIQxkbvTNYNterAKjOSZDnGKQvN6QnBBiBQVjYLUnpt7uYC8SPs7yL1
 f+4b+YapZ3+NS4+mGqaFvyOQbahLiFbM2NRTaHOdDOWkaMccplMBF4s/tidr056rW+
 mVvupLwkdbWTg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <X9rz/haGgEG0pmMa@google.com>
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
X-Headers-End: 1kpmLB-00HH27-TU
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.11-rc1
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thank you so much,

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.11-rc1

for you to fetch changes up to 75e91c888989cf2df5c78b251b07de1f5052e30e:

  f2fs: compress: fix compression chksum (2020-12-10 09:13:53 -0800)

----------------------------------------------------------------
f2fs-for-5.11-rc1

In this round, we've made more work into per-file compression support. For
example, F2FS_IOC_GET|SET_COMPRESS_OPTION provides a way to change the
algorithm or cluster size per file. F2FS_IOC_COMPRESS|DECOMPRESS_FILE provides
a way to compress and decompress the existing normal files manually along with
a new mount option, compress_mode=fs|user, which can control who compresses the
data. Chao also added a checksum feature with a mount option so that we are able
to detect any corrupted cluster. In addition, Daniel contributed casefolding
with encryption patch, which will be used for Android devices.

Enhancement:
 - add ioctls and mount option to manage per-file compression feature
 - support casefolding with encryption
 - support checksum for compressed cluster
 - avoid IO starvation by replacing mutex with rwsem
 - add sysfs, max_io_bytes, to control max bio size

Bug fix:
 - fix use-after-free issue when compression and fsverity are enabled
 - fix consistency corruption during fault injection test
 - fix data offset for lseek
 - get rid of buffer_head which has 32bits limit in fiemap
 - fix some bugs in multi-partitions support
 - fix nat entry count calculation in shrinker
 - fix some stat information

And, we've refactored some logics and fix minor bugs as well.

----------------------------------------------------------------
Chao Yu (10):
      f2fs: fix to seek incorrect data offset in inline data file
      f2fs: move ioctl interface definitions to separated file
      f2fs: avoid unneeded data copy in f2fs_ioc_move_range()
      f2fs: fix compat F2FS_IOC_{MOVE,GARBAGE_COLLECT}_RANGE
      f2fs: fix to avoid REQ_TIME and CP_TIME collision
      f2fs: compress: support chksum
      f2fs: fix kbytes written stat for multi-device case
      f2fs: fix to account inline xattr correctly during recovery
      f2fs: fix shift-out-of-bounds in sanity_check_raw_super()
      f2fs: compress: fix compression chksum

Daeho Jeong (5):
      f2fs: add F2FS_IOC_GET_COMPRESS_OPTION ioctl
      f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl
      f2fs: add compress_mode mount option
      f2fs: add F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
      f2fs: fix race of pending_pages in decompression

Daniel Rosenberg (3):
      libfs: Add generic function for setting dentry_ops
      fscrypt: Have filesystems handle their d_ops
      f2fs: Handle casefolding with Encryption

Hyeongseok Kim (1):
      f2fs: fix double free of unicode map

Jack Qiu (3):
      f2fs: init dirty_secmap incorrectly
      f2fs: inline: correct comment in f2fs_recover_inline_data
      f2fs: inline: fix wrong inline inode stat

Jaegeuk Kim (8):
      f2fs: call f2fs_get_meta_page_retry for nat page
      f2fs: rename logical_to_blk and blk_to_logical
      f2fs: use new conversion functions between blks and bytes
      f2fs: fix wrong block count instead of bytes
      f2fs: remove buffer_head which has 32bits limit
      f2fs: avoid race condition for shrinker count
      f2fs: don't allow any writes on readonly mount
      f2fs: introduce max_io_bytes, a sysfs entry, to limit bio size

Liu Song (1):
      f2fs: remove writeback_inodes_sb in f2fs_remount

Sahitya Tummala (1):
      f2fs: change to use rwsem for cp_mutex

Yangtao Li (3):
      f2fs: Remove unnecessary unlikely()
      f2fs: convert to F2FS_*_INO macro
      f2fs: don't check PAGE_SIZE again in sanity_check_raw_super()

Zhang Qilong (1):
      f2fs: Remove the redundancy initialization

 Documentation/ABI/testing/sysfs-fs-f2fs |   7 +
 Documentation/filesystems/f2fs.rst      |  36 +++
 MAINTAINERS                             |   1 +
 fs/crypto/fname.c                       |   4 -
 fs/crypto/fscrypt_private.h             |   1 -
 fs/crypto/hooks.c                       |   1 -
 fs/ext4/dir.c                           |   7 -
 fs/ext4/ext4.h                          |   4 -
 fs/ext4/namei.c                         |   1 +
 fs/ext4/super.c                         |   5 -
 fs/f2fs/acl.c                           |   2 +-
 fs/f2fs/checkpoint.c                    |  39 ++-
 fs/f2fs/compress.c                      |  26 +-
 fs/f2fs/compress.h                      |   0
 fs/f2fs/data.c                          | 211 +++++++++-------
 fs/f2fs/debug.c                         |  11 +-
 fs/f2fs/dir.c                           | 105 +++++---
 fs/f2fs/f2fs.h                          | 181 ++++++--------
 fs/f2fs/file.c                          | 422 ++++++++++++++++++++++++++++----
 fs/f2fs/gc.c                            |   4 +-
 fs/f2fs/hash.c                          |  11 +-
 fs/f2fs/inline.c                        |  11 +-
 fs/f2fs/inode.c                         |   3 +
 fs/f2fs/namei.c                         |   1 +
 fs/f2fs/node.c                          |  41 ++--
 fs/f2fs/node.h                          |   4 +-
 fs/f2fs/recovery.c                      |  16 +-
 fs/f2fs/segment.c                       |  51 ++--
 fs/f2fs/shrinker.c                      |   4 +-
 fs/f2fs/super.c                         |  70 +++---
 fs/f2fs/sysfs.c                         |   5 +-
 fs/libfs.c                              |  70 ++++++
 fs/ubifs/dir.c                          |   1 +
 include/linux/f2fs_fs.h                 |   2 +-
 include/linux/fs.h                      |   1 +
 include/linux/fscrypt.h                 |   7 +-
 include/trace/events/f2fs.h             |   1 +
 include/uapi/linux/f2fs.h               |  98 ++++++++
 38 files changed, 1075 insertions(+), 390 deletions(-)
 create mode 100644 fs/f2fs/compress.h
 create mode 100644 include/uapi/linux/f2fs.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
