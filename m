Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A16181DCA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 17:27:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC4Cw-0003sz-7A; Wed, 11 Mar 2020 16:27:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jC4Cu-0003sr-4L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 16:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zO/stjkBXEyBU+1Jg0pVaRdkT+cyc6rfHFs3zg18v/I=; b=NhsXWAdQVSJeRd10VeB7fft2Yh
 ptPRa3cBTs2V04m3eSmpn/OHLJ8meXbmJJeOVBcKJZgsY8xSHT8BjwBXH3MaBgInqOgRfWCgHXlXh
 gFdL79kDfGozxGmIzw++N1TVisBDGsvsbsrdwLEDQ4RLtKVgu20CbrtR+1g/kogUrEvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zO/stjkBXEyBU+1Jg0pVaRdkT+cyc6rfHFs3zg18v/I=; b=H
 k76rP4q17/qXeQwhHv3Zz0+JhaY05Hc15PZwvGlyqIcSQnjf+ARgs0zMrF3eD5G7WAiK3KvKyZXyp
 2/lYIVaUf6URyJpk+4l1P7CSA+eTHevZm1kpzEfUQtYgmA6X71j+BVSdjN7539JVMpTlD79SNMWRk
 nwP36uj2Ac6Ws1ek=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC4Cr-00FkKG-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 16:27:44 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03E70206BE;
 Wed, 11 Mar 2020 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583944056;
 bh=6Vo3+x0qJalhkBRtWzcGky+bHsuwVfFeSdbQXvVkhUQ=;
 h=Date:From:To:Cc:Subject:From;
 b=yMJ5i1TnwI1bH7wYGWAQujoySrxYNb6JJqlT3ces9qWP3xXNA8Jr4wWMtImW9UVOG
 wxmOxSc07MpcO69zm6fENyc/zI44TvJn37V0sfYPdsBYV4bMyN8yBI2eTp3AYgaW7/
 cW4GPNXM3wHuqLIfupBz6q+FYpyRB5J3jUvj5X1I=
Date: Wed, 11 Mar 2020 09:27:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200311162735.GA152176@google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
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
X-Headers-End: 1jC4Cr-00FkKG-Cx
Subject: [f2fs-dev] [GIT PULL] f2fs for 5.6-rc6
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

Sorry for late pull request. Could you please consider this?

Thanks,

The following changes since commit b19e8c68470385dd2c5440876591fddb02c8c402:

  Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux (2020-02-13 14:36:57 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-5.6-rc6

for you to fetch changes up to 2536ac6872e5265b4d9d263122cee02e3d5cae1d:

  f2fs: allow to clear F2FS_COMPR_FL flag (2020-03-11 08:25:38 -0700)

----------------------------------------------------------------
f2fs-for-5.6-rc6

Some major bug fixes wrt compression:
- compressed block count
- memory access and leak
- remove obsolete fields
- flag controls

And some others:
- replace rwsem with spinlock
- potential deadlock

----------------------------------------------------------------
Chao Yu (14):
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

Eric Biggers (1):
      f2fs: fix leaking uninitialized memory in compressed clusters

Jaegeuk Kim (1):
      f2fs: fix wrong check on F2FS_IOC_FSSETXATTR

Sahitya Tummala (1):
      f2fs: fix the panic in do_checkpoint()

 fs/f2fs/checkpoint.c | 34 +++++++++++-----------------------
 fs/f2fs/compress.c   | 24 ++++++++++++++----------
 fs/f2fs/data.c       | 23 ++++++++---------------
 fs/f2fs/f2fs.h       | 18 ++++++++++--------
 fs/f2fs/file.c       | 40 +++++++++++++++++++++++++---------------
 fs/f2fs/gc.c         |  5 ++++-
 fs/f2fs/inode.c      | 25 +++++++++++++++++++++----
 fs/f2fs/namei.c      |  2 +-
 fs/f2fs/node.c       | 18 ++++++++----------
 fs/f2fs/shrinker.c   |  2 +-
 fs/f2fs/super.c      |  7 ++++---
 fs/f2fs/xattr.c      |  3 ---
 12 files changed, 107 insertions(+), 94 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
