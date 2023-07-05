Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6855748B05
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jul 2023 19:54:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qH6hk-0004Bm-O8;
	Wed, 05 Jul 2023 17:54:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qH6hj-0004Bg-T0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 17:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YMmjx/sCA4z4RW14U8Txv5fmqkxOwx5dwEpgUJNYDcs=; b=F/d2JaJIxUVLFWLjhMaxlXCJOg
 zpx2Q7hSsDWRq1KvYI060w8yFXo9sbqTZoeRCWz0041Hi/eSQ36yGDS5XHS5AN4Bb2Wj84oMJU/bs
 PTDG/QHh9ONGBhlhREAOEsRFj4Wxyey5PSIOjYAEMUm3yMVQvTDd9nULHBu7sp+kGX0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YMmjx/sCA4z4RW14U8Txv5fmqkxOwx5dwEpgUJNYDcs=; b=Y
 Mel8UJnwPqzWTcIJxG/IwyshDgA5FBwrl5m91TFNG3rGExh+hMcuZ8dBabcTVa2ywqCpf4M9YRh6z
 haCxSCSH/wKQHgyMuk9a0zcmmqUJQWNe/FGikDddTtj8FtBaGR5FlIzMk3yi7FpQgPd/yw0QZdHFQ
 H3pPyS9unbDp3ErE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qH6hj-007RWj-HF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jul 2023 17:54:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 272A7616A1;
 Wed,  5 Jul 2023 17:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDDAC433C8;
 Wed,  5 Jul 2023 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688579649;
 bh=dARvtCqevcFs7cEBkKPgIyn3T/VpvfVRygiyzunP5AU=;
 h=Date:From:To:Cc:Subject:From;
 b=Pa+em2JFcBLWxVhMOXKCkMpwzkzwmW+yqnr2FQNJ5Sd9uR8/gWNGI91B/cJC6yzS+
 /mRqOnasVbrRUODmXLqbtVpEy7Up/c76VzGgAogZ5yQ+D3ggBjrKhxXAVgma7B6TON
 zeQo37isgSQesqfHl3pQZb4kGLNGN0D6+LySK8xk1eycQJrJQUC80vB5FMFMwsWIB2
 45hEkEa56bxAMUB5KI/ToJrzIRwFEv4CXAWGSopP+qKjbHixVP1uVuqjWYPUnMqqoP
 dNJ5jUjGOrmVmgAK4ZxAdzaVqWdhDss7EZsNN0IHAPLkYiydb02Do0EOKPcxw+t4iZ
 ndTb2SrX02P2A==
Date: Wed, 5 Jul 2023 10:54:07 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZKWuP6+mGdW/W0/P@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thank
 you. Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qH6hj-007RWj-HF
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.5
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

Thank you.

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.5-rc1

for you to fetch changes up to a6ec83786ab9f13f25fb18166dee908845713a95:

  f2fs: fix to do sanity check on direct node in truncate_dnode() (2023-06-30 16:38:27 -0700)

----------------------------------------------------------------
f2fs update for 6.5-rc1

In this cycle, we've mainly investigated the zoned block device support along
with patches such as correcting write pointers between f2fs and storage, adding
asynchronous zone reset flow, and managing the number of open zones. Other than
them, f2fs adds another mount option, "errors=x" to specify how to handle when
it detects an unexpected behavior at runtime.

Enhancement:
 - support errors=remount-ro|continue|panic mountoption
 - enforce some inode flag policies
 - allow .tmp compression given extensions
 - add some ioctls to manage the f2fs compression
 - improve looped node chain flow
 - avoid issuing small-sized discard commands during checkpoint
 - implement an asynchronous zone reset

Bug fix:
 - fix deadlock in xattr and inode page lock
 - fix and add sanity check in some error paths
 - fix to avoid NULL pointer dereference f2fs_write_end_io() along with put_super
 - set proper flags to quota files
 - fix potential deadlock due to unpaired node_write lock use
 - fix over-estimating free section during FG GC
 - fix the wrong condition to determine atomic context

As usual, also there are a number of patches having code refactoring and minor
clean-ups.

----------------------------------------------------------------
Chao Yu (18):
      f2fs: support errors=remount-ro|continue|panic mountoption
      f2fs: fix potential deadlock due to unpaired node_write lock use
      f2fs: renew value of F2FS_MOUNT_*
      f2fs: renew value of F2FS_FEATURE_*
      f2fs: fix to set noatime and immutable flag for quota file
      f2fs: clean up w/ sbi->log_sectors_per_block
      f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
      f2fs: don't reset unchangable mount option in f2fs_remount()
      f2fs: flush error flags in workqueue
      f2fs: fix to drop all dirty meta/node pages during umount()
      f2fs: avoid dead loop in f2fs_issue_checkpoint()
      f2fs: check return value of freeze_super()
      f2fs: introduce F2FS_QUOTA_DEFAULT_FL for cleanup
      f2fs: compress: fix to check validity of i_compress_flag field
      f2fs: do more sanity check on inode
      f2fs: fix error path handling in truncate_dnode()
      f2fs: fix compile warning in f2fs_destroy_node_manager()
      f2fs: fix to do sanity check on direct node in truncate_dnode()

Christoph Hellwig (1):
      f2fs: set FMODE_CAN_ODIRECT instead of a dummy direct_IO method

Christophe JAILLET (1):
      f2fs: remove some dead code

Chunhai Guo (1):
      f2fs: Detect looped node chain efficiently

Colin Ian King (1):
      f2fs: remove redundant assignment to variable err

Daeho Jeong (3):
      f2fs: maintain six open zones for zoned devices
      f2fs: close unused open zones while mounting
      f2fs: check zone write pointer points to the end of zone

Daejun Park (1):
      f2fs: add async reset zone command support

Jaegeuk Kim (5):
      f2fs: fix the wrong condition to determine atomic context
      f2fs: assign default compression level
      f2fs: do not issue small discard commands during checkpoint
      f2fs: compress tmp files given extension
      f2fs: fix deadlock in i_xattr_sem and inode page lock

Li Zetao (1):
      f2fs: remove redundant goto statement in f2fs_read_single_page()

Sheng Yong (4):
      f2fs: add helper to check compression level
      f2fs: cleanup MIN_INLINE_XATTR_SIZE
      f2fs: add f2fs_ioc_get_compress_blocks
      f2fs: only set release for file that has compressed data

Wu Bo (1):
      f2fs: fix args passed to trace_f2fs_lookup_end

Yangtao Li (6):
      f2fs: add sanity check for proc_mkdir
      f2fs: do not allow to defragment files have FI_COMPRESS_RELEASED
      f2fs: flag as supporting buffered async reads
      f2fs: add sanity compress level check for compressed file
      f2fs: convert to use sbi directly
      f2fs: refactor struct f2fs_attr macro

Yonggil Song (1):
      f2fs: Fix over-estimating free section during FG GC

Yunlei He (2):
      f2fs: update mtime and ctime in move file range method
      f2fs: remove unneeded page uptodate check/set

 Documentation/filesystems/f2fs.rst |  16 +++
 fs/f2fs/checkpoint.c               |   7 +-
 fs/f2fs/compress.c                 |  41 +++++-
 fs/f2fs/data.c                     |  71 +++++++++-
 fs/f2fs/dir.c                      |   9 +-
 fs/f2fs/f2fs.h                     | 124 ++++++++++-------
 fs/f2fs/file.c                     |  77 ++++++----
 fs/f2fs/gc.c                       |  43 ++++--
 fs/f2fs/inode.c                    | 207 ++++++++++++++++++---------
 fs/f2fs/iostat.c                   |   1 +
 fs/f2fs/namei.c                    |  32 +++--
 fs/f2fs/node.c                     |  45 +++---
 fs/f2fs/node.h                     |   3 +-
 fs/f2fs/recovery.c                 |  75 +++++++---
 fs/f2fs/segment.c                  | 162 ++++++++++++++++-----
 fs/f2fs/super.c                    | 252 ++++++++++++++++++++++++++++-----
 fs/f2fs/sysfs.c                    | 279 +++++++++++++++++++++++--------------
 fs/f2fs/xattr.c                    |   6 +-
 fs/f2fs/xattr.h                    |   1 +
 include/linux/f2fs_fs.h            |   1 +
 include/trace/events/f2fs.h        |  24 +++-
 21 files changed, 1069 insertions(+), 407 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
