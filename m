Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E987E31E047
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Feb 2021 21:28:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lCTRG-0005CD-BD; Wed, 17 Feb 2021 20:28:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lCTRE-0005Bn-Ie
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Feb 2021 20:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V9nCeJcitTNg1GfBjOS5Bsb7hGdWfBRaoeTd8HiJXEU=; b=IvngXorlRE+XQKd3IaYP+Wc+GJ
 3cFP725RamJIM0Fv1TxQQDTVm2724nrFrlWzPP1eavYxE7IAn2mrrCO4LAghRZdzvEYiN0/ftr9vV
 uvIoNt+ByyaJLACBn38jHqLCikpd1rHv1oRaUrDdGzPg5USxi4kNNOblgq2IAthzUc/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V9nCeJcitTNg1GfBjOS5Bsb7hGdWfBRaoeTd8HiJXEU=; b=R
 DXRscSkmRfJ/kgF/dX2s3ool6urPG2TKwOHyWEj3II3PemF1YAQlPSWRLzcUFx3lWr8mbMhU4ncML
 bcPQejTQLEy34ahJBAt6k0sehjo6gTqHm37GRuAMJYMEQl88ku1T0tj7UPcXeUb0u7T/j2CtZnRdT
 HIxA9nHNggNdlRU8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lCTR9-0005xm-92
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Feb 2021 20:28:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82D5A64E68;
 Wed, 17 Feb 2021 20:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613593709;
 bh=23VZSkRr0T33Mc0ai1g+Ty+0gltg7+V4FpAanjCfUEU=;
 h=Date:From:To:Cc:Subject:From;
 b=LFja3qvGqVqtgCD/mh2IMZwOqORP7LWFTOQlJOdBNocv0EBwpbI5PGupffZQlrb9H
 BsPobnVcYgYHIDc+SOC1q2HQKbamxBAWFWixXyC/7Q2+PCIQeWMtJntW5auhCuPItp
 5enK2VhlmQ47qRPdcBF/+/9dRlyoo+5nOpi5bmHPr15WVV0/PXJ3zzQ4fq3X95zzjN
 TTBUnIbAhnzZJRPD3bjNoovmI1i1HDgQ7xg0cUsKYoatzIWAa6uDg/crAEGvItNevr
 NwNomyUogjCVcghH7f4hRZe08HieB+cMyyuSNpFldHZB4KutcjJYzE9tHjNNWheV5R
 eEqfw5ZyQOW/A==
Date: Wed, 17 Feb 2021 12:28:27 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YC18awybSAcVLPbr@google.com>
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
X-Headers-End: 1lCTR9-0005xm-92
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.12-rc1
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

Thanks,

The following changes since commit 76c057c84d286140c6c416c3b4ba832cd1d8984e:

  Merge branch 'parisc-5.11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux (2021-01-27 11:06:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.12-rc1

for you to fetch changes up to 092af2eb180062f5bafe02a75da9856676eb4f89:

  Documentation: f2fs: fix typo s/automaic/automatic (2021-02-16 07:58:35 -0800)

----------------------------------------------------------------
f2fs-for-5.12-rc1

We've added two major features: 1) compression level and 2) checkpoint_merge, in
this round. 1) compression level expands 'compress_algorithm' mount option to
accept parameter as format of <algorithm>:<level>, by this way, it gives a way
to allow user to do more specified config on lz4 and zstd compression level,
then f2fs compression can provide higher compress ratio. 2) checkpoint_merge
creates a kernel daemon and makes it to merge concurrent checkpoint requests as
much as possible to eliminate redundant checkpoint issues. Plus, we can
eliminate the sluggish issue caused by slow checkpoint operation when the
checkpoint is done in a process context in a cgroup having low i/o budget and
cpu shares.

Enhancement:
 - add compress level for lz4 and zstd in mount option
 - checkpoint_merge mount option
 - deprecate f2fs_trace_io

Bug fix:
 - flush data when enabling checkpoint back
 - handle corner cases of mount options
 - missing ACL update and lock for I_LINKABLE flag
 - attach FIEMAP_EXTENT_MERGED in f2fs_fiemap
 - fix potential deadlock in compression flow
 - fix wrong submit_io condition

As usual, we've cleaned up many code flows and fixed minor bugs.

----------------------------------------------------------------
Chao Yu (13):
      f2fs: enhance to update i_mode and acl atomically in f2fs_setattr()
      f2fs: enforce the immutable flag on open files
      f2fs: relocate f2fs_precache_extents()
      f2fs: compress: deny setting unsupported compress algorithm
      f2fs: compress: support compress level
      f2fs: introduce a new per-sb directory in sysfs
      f2fs: fix to tag FIEMAP_EXTENT_MERGED in f2fs_fiemap()
      f2fs: fix out-of-repair __setattr_copy()
      f2fs: trival cleanup in move_data_block()
      f2fs: fix to set/clear I_LINKABLE under i_lock
      f2fs: compress: fix potential deadlock
      f2fs: introduce sb_status sysfs node
      f2fs: relocate inline conversion from mmap() to mkwrite()

Chengguang Xu (1):
      f2fs: fix to use per-inode maxbytes

Daeho Jeong (3):
      f2fs: fix null page reference in redirty_blocks
      f2fs: introduce checkpoint_merge mount option
      f2fs: add ckpt_thread_ioprio sysfs node

Dehe Gu (1):
      f2fs: fix a wrong condition in __submit_bio

Ed Tsai (1):
      Documentation: f2fs: fix typo s/automaic/automatic

Eric Biggers (2):
      f2fs: clean up post-read processing
      libfs: unexport generic_ci_d_compare() and generic_ci_d_hash()

Jack Qiu (1):
      f2fs: remove unused stat_{inc, dec}_atomic_write

Jaegeuk Kim (5):
      f2fs: handle unallocated section and zone on pinned/atgc
      f2fs: deprecate f2fs_trace_io
      f2fs: flush data when enabling checkpoint back
      f2fs: don't grab superblock freeze for flush/ckpt thread
      f2fs: give a warning only for readonly partition

Liu Song (1):
      f2fs: remove unnecessary initialization in xattr.c

Matthew Wilcox (Oracle) (1):
      f2fs: Remove readahead collision detection

Weichao Guo (1):
      f2fs: fix to set inode->i_mode correctly for posix_acl_update_mode

Yi Chen (1):
      f2fs: fix to avoid inconsistent quota data

Zheng Yongjun (1):
      f2fs: Replace expression with offsetof()

 Documentation/ABI/testing/sysfs-fs-f2fs |  32 +++
 Documentation/filesystems/f2fs.rst      |  18 +-
 fs/f2fs/Kconfig                         |  20 +-
 fs/f2fs/Makefile                        |   1 -
 fs/f2fs/acl.c                           |  23 +-
 fs/f2fs/checkpoint.c                    | 177 +++++++++++++-
 fs/f2fs/compress.c                      | 195 +++++++++++----
 fs/f2fs/data.c                          | 404 ++++++++++++--------------------
 fs/f2fs/debug.c                         |  12 +
 fs/f2fs/f2fs.h                          | 104 ++++++--
 fs/f2fs/file.c                          |  57 +++--
 fs/f2fs/gc.c                            |   8 +-
 fs/f2fs/inline.c                        |   4 +
 fs/f2fs/namei.c                         |   8 +
 fs/f2fs/node.c                          |   4 +-
 fs/f2fs/segment.c                       |   7 -
 fs/f2fs/segment.h                       |   4 +-
 fs/f2fs/super.c                         | 198 +++++++++++++---
 fs/f2fs/sysfs.c                         | 132 ++++++++++-
 fs/f2fs/trace.c                         | 165 -------------
 fs/f2fs/trace.h                         |  43 ----
 fs/f2fs/xattr.c                         |  23 +-
 fs/libfs.c                              |   8 +-
 include/linux/f2fs_fs.h                 |   3 +
 include/linux/fs.h                      |   5 -
 25 files changed, 1036 insertions(+), 619 deletions(-)
 delete mode 100644 fs/f2fs/trace.c
 delete mode 100644 fs/f2fs/trace.h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
