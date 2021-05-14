Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 478873806FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 May 2021 12:14:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lhUpr-0003yO-Ts; Fri, 14 May 2021 10:14:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lhUpq-0003yH-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 10:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuiRjkIVdBJ4qLiM2q+xHdgLXq0/CwiXT2qH5mIM1QI=; b=Q7jRMgS26iprQbjA8zRkc/wNUa
 Ydddu/QDRBRmyvKo20nz0maKIb0058XZcqcXk6zeTqm+UUUViLJDt9BbezJ7R2+IrNcS/pPNopxEa
 JTrRyJqb/sDLFSn6dwFQSPzMZfq3Zm3JI2QwqtTZrqKCyXb9s7jFbgDttEBDxMhLxSpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZuiRjkIVdBJ4qLiM2q+xHdgLXq0/CwiXT2qH5mIM1QI=; b=B
 Hnkw7ioDAvb8ZMdBoD4DQZsCuSBdGnA924kIN2vLlFEsYV6+8Vjx5ZLe7ne1+GDUEXlrNghuyrgEv
 +TdMwOxOh8/kUVDUE6/1CDE0VyChDolS44PdMduVVjl8gVHJ1bwvNSuAG3PPWqUbQU0/U/JGmpN24
 Q8xHSgRiZedKcrug=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lhUpm-0000Z2-ME
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 May 2021 10:14:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0FB3613AA;
 Fri, 14 May 2021 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620987253;
 bh=ti35DWvjjXET7XuI9BAF+V+AMh3UIKweXBk2BcOMOiM=;
 h=Date:From:To:Cc:Subject:From;
 b=IUBAohzO/B15+HaPGczZmguSUWEh3Jkk2WSFR3FB+qQqtyr+SKM5YNNiwobai2OxC
 /tgLcC/DM8QTsY+Xc1YsQP/ypkKpKKhthqc7KQnnvrn5pMfZ3P8Y5WVSk2V7Kwa1wD
 tK1DdgFfxauri6q8QeRngySBM56+7TFCD28hQmP+xvhNqn11xCA/plbOFUZxqyv/N8
 52bfa6PWMfA9S5QM5AW+gAwMiUTzSrd4d/UFJiW4rbBhXHwPaHWuIKJkW8eeT4iDYt
 rr4Nm11kAGYWL2YJIKb3ezHT4AtF28oOi9gyW1hLGfk2VpG+O1JW9GhSkrOcEvZ49K
 z6pZM5FwA+RxQ==
Date: Fri, 14 May 2021 03:14:12 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YJ5NdFzVb1f9aVqG@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lhUpm-0000Z2-ME
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 5.13-rc1
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

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-5.13-rc1-fix

for you to fetch changes up to f395183f9544ba2f56b25938d6ea7042bd873521:

  f2fs: return EINVAL for hole cases in swap file (2021-05-12 07:38:00 -0700)

----------------------------------------------------------------
f2fs-5.13-rc1-fix

This series of patches fix some critical bugs such as memory leak in compression
flows, kernel panic when handling errors, and swapon failure due to newly added
condition check.

----------------------------------------------------------------
Chao Yu (3):
      f2fs: compress: fix to free compress page correctly
      f2fs: compress: fix race condition of overwrite vs truncate
      f2fs: compress: fix to assign cc.cluster_idx correctly

Jaegeuk Kim (4):
      f2fs: avoid null pointer access when handling IPU error
      f2fs: support iflag change given the mask
      f2fs: avoid swapon failure by giving a warning first
      f2fs: return EINVAL for hole cases in swap file

 fs/f2fs/compress.c | 55 +++++++++++++++++++++++-------------------------------
 fs/f2fs/data.c     | 39 +++++++++++++++++++++++++++-----------
 fs/f2fs/f2fs.h     |  2 +-
 fs/f2fs/file.c     |  3 ++-
 fs/f2fs/segment.c  |  4 ++--
 5 files changed, 56 insertions(+), 47 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
