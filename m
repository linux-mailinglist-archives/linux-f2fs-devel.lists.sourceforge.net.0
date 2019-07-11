Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB865E46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 19:13:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlcdd-0000wm-Hw; Thu, 11 Jul 2019 17:13:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hlcdc-0000wf-AM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 17:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ltUKjxI4P3vAkDjFa2tt1UCWMprBt/FXvc+x5OcnOQ=; b=c0yJViMo23gesOeBtugA0v9UZa
 JWrYm4FlHKxPI5qx3MwzvbyFzi0VlvEOO7R9CG9ZXpmIOnle/PAipI4tR1tk/jZSXy2TXfEYU3MtP
 TGFayPBDpVcb31BiOxpOh8j6aPlJUQgmjhLShVcJQQnrCQMoNt/3PR9DrWxfrUmnZlPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9ltUKjxI4P3vAkDjFa2tt1UCWMprBt/FXvc+x5OcnOQ=; b=V
 xJ1qFGYssbiUImt8fXlnTc6IEnsfqn184w6XLCePPUvY+HxRkbtQxxA9J/2j5ecDbc1kxh7jORDjl
 Y2b5Zp9zHklGoTZKB78mqU1Iy2r+y+zN1tRCsv+8a8R+MrSWwkeYlrxFAK72RAz6rK8uTdEbKwzOL
 fQ9ZOUfaqdMIPkKY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlcdb-00FP9T-2C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 17:13:44 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7453C20872;
 Thu, 11 Jul 2019 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562865217;
 bh=bvCqdNXA0lNVRHiKVn7GV3+2W08VEttCRx0QEFub0cs=;
 h=Date:From:To:Cc:Subject:From;
 b=0TqnHc8qfAgJztGG94YdRuN4xG2kZaS6sbf1z74YUdhdwMk2kV4Stu438wlgeKV8L
 oh3vC96kARmmtfPmwIhzbWFROiLU1zK2h36Bc/YzMJEobAdVQGMHqA8iWxDsHuoFlw
 sJBgH8E0onMZ8EOj+HQItpmYf2qEOsOwt7zk0lAw=
Date: Thu, 11 Jul 2019 10:13:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190711171336.GA66396@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1hlcdb-00FP9T-2C
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.3
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

The following changes since commit e0654264c4806dc436b291294a0fbf9be7571ab6:

  Merge tag 'backlight-next-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight (2019-05-14 10:45:03 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.3

for you to fetch changes up to 2d008835ec2fcf6eef3285e41e62a5eabd1fe76b:

  f2fs: improve print log in f2fs_sanity_check_ckpt() (2019-07-10 18:44:47 -0700)

----------------------------------------------------------------
f2fs-for-5.3-rc1

In this round, we've introduced native swap file support which can exploit DIO,
enhanced existing checkpoint=disable feature with additional mount option to
tune the triggering condition, and allowed user to preallocate physical blocks
in a pinned file which will be useful to avoid f2fs fragmentation in append-only
workloads. In addition, we've fixed subtle quota corruption issue.

Enhancement:
 - add swap file support which uses DIO
 - allocate blocks for pinned file
 - allow SSR and mount option to enhance checkpoint=disable
 - enhance IPU IOs
 - add more sanity checks such as memory boundary access

Bug fix:
 - quota corruption in very corner case of error-injected SPO case
 - fix root_reserved on remount and some wrong counts
 - add missing fsck flag

Some patches were also introduced to clean up ambiguous i_flags and debugging
messages codes.

----------------------------------------------------------------
Chao Yu (10):
      f2fs: fix to check layout on last valid checkpoint park
      f2fs: add bio cache for IPU
      f2fs: fix to avoid deadloop if data_flush is on
      f2fs: fix to do sanity check on segment bitmap of LFS curseg
      f2fs: fix sparse warning
      f2fs: avoid get_valid_blocks() for cleanup
      f2fs: print kernel message if filesystem is inconsistent
      f2fs: use generic EFSBADCRC/EFSCORRUPTED
      f2fs: set SBI_NEED_FSCK for xattr corruption case
      f2fs: improve print log in f2fs_sanity_check_ckpt()

Daniel Rosenberg (4):
      f2fs: Lower threshold for disable_cp_again
      f2fs: Fix root reserved on remount
      f2fs: Fix accounting for unusable blocks
      f2fs: Add option to limit required GC for checkpoint=disable

Eric Biggers (1):
      f2fs: separate f2fs i_flags from fs_flags and ext4 i_flags

Geert Uytterhoeven (1):
      f2fs: Use DIV_ROUND_UP() instead of open-coding

Heng Xiao (1):
      f2fs: fix to avoid long latency during umount

Jaegeuk Kim (7):
      f2fs: link f2fs quota ops for sysfile
      f2fs: allow ssr block allocation during checkpoint=disable period
      f2fs: add missing sysfs entries in documentation
      f2fs: add a rw_sem to cover quota flag changes
      f2fs: allocate blocks for pinned file
      f2fs: support swap file w/ DIO
      f2fs: allow all the users to pin a file

Joe Perches (1):
      f2fs: introduce f2fs_<level> macros to wrap f2fs_printk()

Kimberly Brown (1):
      f2fs: replace ktype default_attrs with default_groups

Ocean Chen (1):
      f2fs: avoid out-of-range memory access

Park Ju Hyung (1):
      f2fs: always assume that the device is idle under gc_urgent

Qiuyang Sun (1):
      f2fs: ioctl for removing a range from F2FS

Sahitya Tummala (3):
      f2fs: add error prints for debugging mount failure
      f2fs: fix f2fs_show_options to show nodiscard mount option
      f2fs: fix is_idle() check for discard type

Wang Shilong (1):
      f2fs: only set project inherit bit for directory

 Documentation/ABI/testing/sysfs-fs-f2fs |   8 +
 Documentation/filesystems/f2fs.txt      | 133 ++++++-
 fs/f2fs/checkpoint.c                    | 107 +++---
 fs/f2fs/data.c                          | 249 +++++++++++--
 fs/f2fs/debug.c                         |   7 +
 fs/f2fs/dir.c                           |  16 +-
 fs/f2fs/extent_cache.c                  |   7 +-
 fs/f2fs/f2fs.h                          | 129 +++----
 fs/f2fs/file.c                          | 302 ++++++++++------
 fs/f2fs/gc.c                            | 196 +++++++++-
 fs/f2fs/inline.c                        |  16 +-
 fs/f2fs/inode.c                         |  78 ++--
 fs/f2fs/namei.c                         |  10 +-
 fs/f2fs/node.c                          |  38 +-
 fs/f2fs/recovery.c                      |  43 +--
 fs/f2fs/segment.c                       | 170 +++++++--
 fs/f2fs/segment.h                       |  16 +-
 fs/f2fs/super.c                         | 610 +++++++++++++++-----------------
 fs/f2fs/sysfs.c                         |  28 +-
 fs/f2fs/xattr.c                         |  10 +-
 include/trace/events/f2fs.h             |  11 +-
 21 files changed, 1409 insertions(+), 775 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
