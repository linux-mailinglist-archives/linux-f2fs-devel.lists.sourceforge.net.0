Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4393A86C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 22:58:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWMaW-0003eq-R3;
	Tue, 23 Jul 2024 20:58:24 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sWMaV-0003ek-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 20:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TKaYBJ2RwymJymTJEzZlcwufzWp6l0S0inWVIkYi3To=; b=KKLREHeJSLGO0BLqPCv5aVFNeN
 kudHdz1BH4Sjsu4sJHrAlydCljKZ0QYOYTbgXlVynXKsYalIRw2OF6mXXpHwlfxQLEaITzPu3zv6V
 IP6oEmW2XQ91PMP4M2K3C1ZD1RJ41OQJIR5rWzHEc8IeGzIH65NwkFf1Y80uR8Qcu4WA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TKaYBJ2RwymJymTJEzZlcwufzWp6l0S0inWVIkYi3To=; b=d
 ns+g3yRQm72Qvlbm0O0/ceLX404SDH0uwDldkBOou2luR1GL5W1qvj3zdVgRBnTgNkWwcwdWUN/SA
 PaOarpzxCDr1SXs6GVYaqAwPnjiX3+LNybCsnXWo3YBCTgZfHnQmJM9eFjRkK5t6G+DI0gmdJnCg3
 fSzILEWYgUB4Enow=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWMaT-0002gY-Pt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 20:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 130B1CE0E85;
 Tue, 23 Jul 2024 20:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E427C4AF0A;
 Tue, 23 Jul 2024 20:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721768294;
 bh=vm7lqq1pDxSm5ib+uVF8/2QogGR2IqVX/x2iZhX1M7Y=;
 h=Date:From:To:Cc:Subject:From;
 b=XZhq7PtAx+SnLRsa8uewjsgGUJ2AljP4PR3dX+TwHyYC3U1VioXOljDT7QUHaJCS0
 N+PF09Z3raEl+K5cB2XdEyI4kl2ZLSI9b+plwqEUgS39TVvdb6+2D1c2CJU39BDH2l
 XV0W/KICOv9ZoUeykCFraoA4MT0gWbuguayu9ZqxI4IcPNyYA/wERKHnuYuKmQOjco
 mvZxlRpvXCNRmdCnPDl5Byvh1qMttYFop+vhN3I9YJcifoWpUfJ2BIAJqn5kzM897S
 wUYPPgwLA8t/7/jTqJCx5o2BE8tzrHoFIX+6U+/jbu7MGEVU3lgvT6EngGtyqDs9Gx
 qRnQuct817Q8Q==
Date: Tue, 23 Jul 2024 20:58:12 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ZqAZZAmghKIaBAkJ@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sWMaT-0002gY-Pt
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.11-rc1
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

The following changes since commit 2ef5971ff345d3c000873725db555085e0131961:

  Merge tag 'vfs-6.10-rc4.fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs (2024-06-11 12:04:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.11-rc1

for you to fetch changes up to bed6b0317441d82c32506750ccd868d83850e6f4:

  f2fs: clean up addrs_per_{inode,block}() (2024-07-10 23:15:36 +0000)

----------------------------------------------------------------
f2fs update for 6.11-rc1

It's a pretty small update including mostly minor bug fixes in zoned storage
along with the large section support.

Enhancement:
 - add support for FS_IOC_GETFSSYSFSPATH
 - enable atgc dynamically if conditions are met
 - use new ioprio Macro to get ckpt thread ioprio level
 - remove unreachable lazytime mount option parsing

Bug fix:
 - fix null reference error when checking end of zone
 - fix start segno of large section
 - fix to cover read extent cache access with lock
 - don't dirty inode for readonly filesystem
 - allocate a new section if curseg is not the first seg in its zone
 - only fragment segment in the same section
 - truncate preallocated blocks in f2fs_file_open()
 - fix to avoid use SSR allocate when do defragment
 - fix to force buffered IO on inline_data inode

And, it includes some minor code clean-ups, and sanity checks.

----------------------------------------------------------------
Chao Yu (12):
      f2fs: fix to do sanity check on F2FS_INLINE_DATA flag in inode during GC
      f2fs: fix to do sanity check on blocks for inline_data inode
      f2fs: add support for FS_IOC_GETFSSYSFSPATH
      f2fs: fix to force buffered IO on inline_data inode
      f2fs: fix to don't dirty inode for readonly filesystem
      f2fs: fix return value of f2fs_convert_inline_inode()
      f2fs: fix to cover read extent cache access with lock
      f2fs: fix to truncate preallocated blocks in f2fs_file_open()
      f2fs: remove redundant sanity check in sanity_check_inode()
      f2fs: fix to update user block counts in block_operations()
      f2fs: clean up F2FS_I()
      f2fs: clean up addrs_per_{inode,block}()

Daejun Park (1):
      f2fs: fix null reference error when checking end of zone

Eric Sandeen (1):
      f2fs: remove unreachable lazytime mount option parsing

Jaegeuk Kim (2):
      f2fs: clean up set REQ_RAHEAD given rac
      f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr is valid

Sheng Yong (3):
      f2fs: alloc new section if curseg is not the first seg in its zone
      f2fs: fix start segno of large section
      f2fs: only fragment segment in the same section

Sunmin Jeong (2):
      f2fs: use meta inode for GC of atomic file
      f2fs: use meta inode for GC of COW file

Zhiguo Niu (5):
      f2fs: fix to remove redundant SBI_NEED_FSCK flag set
      f2fs: fix to avoid use SSR allocate when do defragment
      f2fs: use new ioprio Macro to get ckpt thread ioprio level
      f2fs: enable atgc dynamically if conditions are met
      f2fs: fix to use mnt_{want,drop}_write_file replace file_{start,end}_wrtie

 fs/f2fs/checkpoint.c    |  11 ++--
 fs/f2fs/compress.c      |   2 +-
 fs/f2fs/data.c          |  27 ++++++----
 fs/f2fs/extent_cache.c  |  48 +++++++----------
 fs/f2fs/f2fs.h          |  78 +++++++++++++++-------------
 fs/f2fs/file.c          | 135 ++++++++++++++++++++++++++++++++++--------------
 fs/f2fs/gc.c            |  24 ++++++---
 fs/f2fs/inline.c        |  28 ++++++++--
 fs/f2fs/inode.c         |  84 ++++++++++++------------------
 fs/f2fs/namei.c         |  20 +++----
 fs/f2fs/recovery.c      |  11 ++--
 fs/f2fs/segment.c       |  54 +++++++++++++++----
 fs/f2fs/segment.h       |   3 +-
 fs/f2fs/super.c         |  11 +---
 fs/f2fs/sysfs.c         |  12 ++---
 include/linux/f2fs_fs.h |   7 ++-
 16 files changed, 329 insertions(+), 226 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
