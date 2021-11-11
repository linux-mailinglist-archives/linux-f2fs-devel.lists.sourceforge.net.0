Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C644D0A0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Nov 2021 05:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ml1RD-0007kH-Tp; Thu, 11 Nov 2021 04:11:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1ml1RC-0007kB-SP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Nov 2021 04:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KQekGbiSGAUJtv3DslzxESzLH6BcA5OYuS4CCyum5U0=; b=HpfTVrIUik5eNAtMQL9J38ejsh
 f8FkDMBl6q5dEctXJaBUrTW87IACRU33pLIiizA7mkVD34/0o8dgAiIGMVjtFH5Hd7O+IDgSLTh2m
 tZsMECrrS0jj1tECG0vkTaCigaoc2i8C+I0yEybbZPOU6eCNnJCiMw//ebYxIb4bmMxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KQekGbiSGAUJtv3DslzxESzLH6BcA5OYuS4CCyum5U0=; b=B
 vs+Wc0v26z7fPF0r0SkNhhgsHonZmuHk5M0bKvd1Myd0iQG+LoKWBE0nlMVw4dQpv4euhSi9KOdwD
 qmfNlp14dU+4L6ragxiMK6dTyEU8X/Na0cHlD9m9j1XyITPntO/iRPX0OGxJhGhAuUrHOVj1/Jwrs
 rGsQ7o57Bz6+wiHk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ml1R5-0005mE-JH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Nov 2021 04:11:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCDCE60FC1;
 Thu, 11 Nov 2021 04:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636603872;
 bh=vgAxuNwViN2XHRE6zeJ/9nuvsz9bgt95XkxynKqhdfs=;
 h=Date:From:To:Cc:Subject:From;
 b=HD9TyPY0vCIjiQst1kXUgesc1HDw3vBbtZ91kKAfkEZGaEAuPnYCEDgq/WQUmUY05
 T3l5dHo6FIZnCuJEmyNzcgxOHhev/nO6kK+Jbm6MwuekdpWX4L1dP0BaygZa6NZFtn
 k4Q7W17iYihQLb0dyM9aURQaGb25XXRxhb3qBkXUfZYhKdB7lVV2WNSvtE9JaV7TPb
 //D33f3lnfqvcnqlAIpl7m4b5JO6EFJl4ZljNfXjPiXyFliOxEqNq04LhKCIUI3j2u
 OvLPB6vEJWshliGy5zqy3WlFBTxk9CSR4PX5vtMknBHREUeT8GrHp5bMIMpAMcGbAf
 d0le2hLZtaL7g==
Date: Wed, 10 Nov 2021 20:11:10 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YYyX3oZXNAjYzG0A@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ml1R5-0005mE-JH
Subject: [f2fs-dev] [GIT PULL] f2fs update for 5.16-rc1
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

The following changes since commit ff1ffd71d5f0612cf194f5705c671d6b64bf5f91:

  Merge tag 'hyperv-fixes-signed-20210915' of git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux (2021-09-15 17:18:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.16-rc1

for you to fetch changes up to 5429c9dbc9025f9a166f64e22e3a69c94fd5b29b:

  f2fs: fix UAF in f2fs_available_free_memory (2021-11-09 08:23:17 -0800)

----------------------------------------------------------------
f2fs-for-5.16-rc1

In this cycle, we've applied relatively small number of patches which fix subtle
corner cases mainly, while introducing a new mount option to be able to fragment
the disk intentionally for performance tests.

Enhancement:
 - add a mount option to fragmente on-disk layout to understand the performance
 - support direct IO for multi-partitions
 - add a fault injection of dquot_initialize

Bug fix:
 - address some lockdep complaints
 - fix a deadlock issue with quota
 - fix a memory tuning condition
 - fix compression condition to improve the ratio
 - fix disabling compression on the non-empty compressed file
 - invalidate cached pages before IPU/DIO writes

And, we've added some minor clean-ups as usual.

----------------------------------------------------------------
Chao Yu (7):
      f2fs: quota: fix potential deadlock
      f2fs: avoid attaching SB_ACTIVE flag during mount
      f2fs: introduce excess_dirty_threshold()
      f2fs: fix wrong condition to trigger background checkpoint correctly
      f2fs: multidevice: support direct IO
      f2fs: fix incorrect return value in f2fs_sanity_check_ckpt()
      f2fs: support fault injection for dquot_initialize()

Daeho Jeong (2):
      f2fs: include non-compressed blocks in compr_written_block
      f2fs: introduce fragment allocation mode mount option

Dongliang Mu (1):
      f2fs: fix UAF in f2fs_available_free_memory

Fengnan Chang (1):
      f2fs: compress: fix overwrite may reduce compress ratio unproperly

Gao Xiang (1):
      f2fs: fix up f2fs_lookup tracepoints

Hyeong-Jun Kim (2):
      f2fs: compress: disallow disabling compress on non-empty compressed file
      f2fs: invalidate META_MAPPING before IPU/DIO write

Jaegeuk Kim (1):
      f2fs: should use GFP_NOFS for directory inodes

Keoseong Park (1):
      f2fs: fix to use WHINT_MODE

Qing Wang (1):
      f2fs: replace snprintf in show functions with sysfs_emit

Weichao Guo (1):
      f2fs: set SBI_NEED_FSCK flag when inconsistent node block found

 Documentation/ABI/testing/sysfs-fs-f2fs | 16 ++++++
 Documentation/filesystems/f2fs.rst      | 19 +++++++
 fs/f2fs/checkpoint.c                    |  8 ++-
 fs/f2fs/compress.c                      | 20 +++++++
 fs/f2fs/data.c                          | 95 +++++++++++++++++++++++++--------
 fs/f2fs/f2fs.h                          | 54 ++++++++++++++++---
 fs/f2fs/file.c                          |  6 +--
 fs/f2fs/gc.c                            |  5 +-
 fs/f2fs/inline.c                        |  2 +-
 fs/f2fs/inode.c                         |  4 +-
 fs/f2fs/namei.c                         | 32 +++++------
 fs/f2fs/node.c                          |  1 +
 fs/f2fs/node.h                          |  5 --
 fs/f2fs/recovery.c                      | 14 ++---
 fs/f2fs/segment.c                       | 83 +++++++++++++++++++++-------
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/super.c                         | 39 +++++++++++++-
 fs/f2fs/sysfs.c                         | 24 ++++++++-
 fs/f2fs/verity.c                        |  2 +-
 fs/f2fs/xattr.c                         |  2 +-
 include/trace/events/f2fs.h             | 33 ++++++++----
 21 files changed, 359 insertions(+), 106 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
