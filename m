Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA351A0516
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 05:02:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLeVs-0003Jm-Cn; Tue, 07 Apr 2020 03:02:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jLeVr-0003Je-9b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 03:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gKbtuG5Upgm6arrbxJFVx2BflxRckQiy7ajCmIsLVmY=; b=miPsjx7g9NJpmZS4BJSHVvaeiH
 vvnmZmK/zonCsyhr4LFKEAqShMopRR7KV8AbPZhqIvyt4RunSQ1vWazjx1487PFeiDh1VZB40FZ25
 F/czVWq0E2hpGlSgpQxgRLZ8auu3q0lqG8Ig+87u+uVOWTzXk84J1ab8cPeRftIKMGPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gKbtuG5Upgm6arrbxJFVx2BflxRckQiy7ajCmIsLVmY=; b=d
 HTMmPrnNUzrZjDrRhIQfUEQYdAt+3CQvpPGwBCsfDNGMIEPR/OKgu6f9hhhYxHmrnQKUM94v5PrEK
 NjU7LOnUUOFUk5dhwPzJiYXOF3zFaHCqjW0ag2ZDiKOK9musR47XvEQoi9WfAHG9Vw2uWW61hKIOX
 npSGZxsYqWSXs5vQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLeVk-009kvX-QR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 03:02:55 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F72B2074F;
 Tue,  7 Apr 2020 03:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586228563;
 bh=H8kMi72CQfJQI3ITFQxHLoqUXy4N5fipuw3W/neWU/E=;
 h=Date:From:To:Cc:Subject:From;
 b=U3JBEfQqwuXNuc7cm7z6/c/FrmxW0K+4gW67st351yTGJ4cM9qd5fimXezXoPobt2
 7sQgO2h4eqsPY6r577qME7U3afEDbqwj6OnFWlWHSMg9UJFM8OPXeXYJVsLqh7NmDU
 toSL9NgNkXarKTwmHTS7Ps+d2YXdIOFLumBanL6s=
Date: Mon, 6 Apr 2020 20:02:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200407030242.GA139449@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jLeVk-009kvX-QR
Subject: [f2fs-dev] [GIT PULL] f2fs-5.7-rc1
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
Cc: kernel-team@android.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thank you,

The following changes since commit b19e8c68470385dd2c5440876591fddb02c8c402:

  Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2020-02-13 14:36:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.7-rc1

for you to fetch changes up to 531dfae52e8c386f72fc4935b97486409291fdb1:

  f2fs: keep inline_data when compression conversion (2020-04-03 10:21:32 -0700)

----------------------------------------------------------------
f2fs-for-5.7-rc1

In this round, we've mainly focused on fixing bugs and addressing issues in
recently introduced compression support.

Enhancement:
- add zstd support, and set LZ4 by default
- add ioctl() to show # of compressed blocks
- show mount time in debugfs
- replace rwsem with spinlock
- avoid lock contention in DIO reads

Some major bug fixes wrt compression:
- compressed block count
- memory access and leak
- remove obsolete fields
- flag controls

Other bug fixes and clean ups:
- fix overflow when handling .flags in inode_info
- fix SPO issue during resize FS flow
- fix compression with fsverity enabled
- potential deadlock when writing compressed pages
- show missing mount options

----------------------------------------------------------------
Chao Yu (53):
      f2fs: fix to wait all node page writeback
      f2fs: fix to avoid NULL pointer dereference
      f2fs: recycle unused compress_data.chksum feild
      f2fs: add missing function name in kernel message
      f2fs: fix to avoid potential deadlock
      f2fs: fix to check i_compr_blocks correctly
      f2fs: cover last_disk_size update with spinlock
      f2fs: remove i_sem lock coverage in f2fs_setxattr()
      f2fs: fix inconsistent comments
      f2fs: fix to avoid using uninitialized variable
      f2fs: fix to avoid use-after-free in f2fs_write_multi_pages()
      f2fs: fix to account compressed inode correctly
      f2fs: fix to check dirty pages during compressed inode conversion
      f2fs: allow to clear F2FS_COMPR_FL flag
      f2fs: clean up codes with {f2fs_,}data_blkaddr()
      f2fs: clean up parameter of macro XATTR_SIZE()
      f2fs: fix to show norecovery mount option
      f2fs: clean up lfs/adaptive mount option
      f2fs: clean up bggc mount option
      f2fs: introduce DEFAULT_IO_TIMEOUT
      f2fs: add prefix for f2fs slab cache name
      f2fs: fix to avoid triggering IO in write path
      f2fs: introduce F2FS_IOC_GET_COMPRESS_BLOCKS
      f2fs: avoid __GFP_NOFAIL in f2fs_bio_alloc
      f2fs: fix to show tracepoint correctly
      f2fs: use kmem_cache pool during inline xattr lookups
      f2fs: fix to update f2fs_super_block fields under sb_lock
      f2fs: fix to account compressed blocks in f2fs_compressed_blocks()
      f2fs: don't mark compressed inode dirty during f2fs_iget()
      f2fs: fix potential deadlock on compressed quota file
      f2fs: don't change inode status under page lock
      f2fs: fix to avoid potential deadlock
      f2fs: clean up f2fs_may_encrypt()
      f2fs: fix NULL pointer dereference in f2fs_write_begin()
      f2fs: don't trigger data flush in foreground operation
      f2fs: don't call fscrypt_get_encryption_info() explicitly in f2fs_tmpfile()
      f2fs: fix to clear PG_error if fsverity failed
      f2fs: fix NULL pointer dereference in f2fs_verity_work()
      f2fs: fix potential .flags overflow on 32bit architecture
      f2fs: fix to avoid double unlock
      f2fs: fix to use f2fs_readpage_limit() in f2fs_read_multi_pages()
      f2fs: clean up {cic,dic}.ref handling
      f2fs: change default compression algorithm
      f2fs: compress: fix to call missing destroy_compress_ctx()
      f2fs: compress: add .{init,destroy}_decompress_ctx callback
      f2fs: compress: support zstd compress algorithm
      f2fs: clean up dic->tpages assignment
      f2fs: show compression in statx
      f2fs: fix to verify tpage before releasing in f2fs_free_dic()
      f2fs: switch discard_policy.timeout to bool type
      f2fs: add missing CONFIG_F2FS_FS_COMPRESSION
      f2fs: fix to disable compression on directory
      f2fs: keep inline_data when compression conversion

DongDongJu (1):
      f2fs: delete DIO read lock

Eric Biggers (1):
      f2fs: fix leaking uninitialized memory in compressed clusters

Gustavo A. R. Silva (1):
      f2fs: xattr.h: Replace zero-length array with flexible-array member

Jaegeuk Kim (5):
      f2fs: fix wrong check on F2FS_IOC_FSSETXATTR
      f2fs: show mounted time
      f2fs: add migration count iff migration happens
      f2fs: skip GC when section is full
      f2fs: skip migration only when BG_GC is called

Sahitya Tummala (3):
      f2fs: fix the panic in do_checkpoint()
      f2fs: Fix mount failure due to SPO after a successful online resize FS
      f2fs: Add a new CP flag to help fsck fix resize SPO issues

Takashi Iwai (1):
      f2fs: Use scnprintf() for avoiding potential buffer overflow

YueHaibing (1):
      f2fs: xattr.h: Make stub helpers inline

 Documentation/ABI/testing/sysfs-fs-f2fs |   5 +
 Documentation/filesystems/f2fs.txt      |   4 +-
 fs/f2fs/Kconfig                         |   9 +
 fs/f2fs/checkpoint.c                    |  42 ++---
 fs/f2fs/compress.c                      | 317 ++++++++++++++++++++++++++------
 fs/f2fs/data.c                          | 141 ++++++++------
 fs/f2fs/debug.c                         |   3 +
 fs/f2fs/dir.c                           |  16 +-
 fs/f2fs/f2fs.h                          | 206 ++++++++++++---------
 fs/f2fs/file.c                          |  91 +++++----
 fs/f2fs/gc.c                            |  51 +++--
 fs/f2fs/inode.c                         |  29 ++-
 fs/f2fs/namei.c                         |  12 +-
 fs/f2fs/node.c                          |  33 ++--
 fs/f2fs/recovery.c                      |  12 +-
 fs/f2fs/segment.c                       |  54 +++---
 fs/f2fs/segment.h                       |   2 +-
 fs/f2fs/shrinker.c                      |   2 +-
 fs/f2fs/super.c                         |  89 +++++----
 fs/f2fs/sysfs.c                         |  50 +++--
 fs/f2fs/xattr.c                         |  67 +++++--
 fs/f2fs/xattr.h                         |   9 +-
 include/linux/f2fs_fs.h                 |   1 +
 include/trace/events/f2fs.h             |   3 +-
 24 files changed, 820 insertions(+), 428 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
