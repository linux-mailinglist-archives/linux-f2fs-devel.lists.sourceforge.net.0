Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A3B108802
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 05:45:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ6FO-0006OU-8K; Mon, 25 Nov 2019 04:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iZ6FM-0006Ny-1E
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 04:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uy4zcft6MSU1vValCfyK+d05EQ7b7ZKOjfYRbVvAWio=; b=W2/oHvLLlZFvsQajH/9+gpYE0O
 w1+dnsF+ZxzuM5FSVKL702YkOwpJpjxUy+5BvrTp2ukhAvevTWQp7yb0jHFgMbkAvB09ChHYERnQv
 yjbNoMT8xmq8S3rHNtnjvGePW2uZPhYsV+nTOgRJttRWZSYHcVaclAcWVfdkjXOoVxt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uy4zcft6MSU1vValCfyK+d05EQ7b7ZKOjfYRbVvAWio=; b=E
 +9CkuKzz4e1jhMu68wUXW2IuzCCs1+ZFvab5NLu3GZNDFg0BFYH67s3J+phi1IYwGV1XkLu//u6z4
 NNwi7FEuCOlpAc6VKy262jzUoSImuVCk2ZNBzlAoczFaqBtWTOOldP6WLULiIqtTdUlNwH1KmKV6T
 0YZwg+dExlbAFdKI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ6FK-00D0Bz-QY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 04:45:11 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E2C42071A;
 Mon, 25 Nov 2019 04:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574657105;
 bh=aSroA1tJkkhrawkEnz+x1J5uQ7dP73E3kkFNwgxCrjc=;
 h=Date:From:To:Cc:Subject:From;
 b=xd6oamJw8cdBpyxa6Dqk9inUzve8hNxbG1AIZD2wMpTNYQ1rW/HtPYBrWv94WluWI
 phH34pvHnUTvLA9VsvUg3VpCVG/FBlpadA5cPHbsWRlRkw1/f/CZzBrvMjxlsTJzBm
 nJhcjw7jyYFZqyAiwy5RVmbNPr8nELP2Cg2b24iY=
Date: Sun, 24 Nov 2019 20:45:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191125044503.GB9817@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZ6FK-00D0Bz-QY
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.5
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to 73f0ec02d670a61afcef49bc0a74d42e324276ea:

  docs: fs-verity: mention statx() support (2019-11-13 12:15:34 -0800)

----------------------------------------------------------------

Expose the fs-verity bit through statx().

----------------------------------------------------------------
Eric Biggers (5):
      docs: fs-verity: document first supported kernel version
      statx: define STATX_ATTR_VERITY
      ext4: support STATX_ATTR_VERITY
      f2fs: support STATX_ATTR_VERITY
      docs: fs-verity: mention statx() support

 Documentation/filesystems/fsverity.rst | 12 ++++++++++--
 fs/ext4/inode.c                        |  5 ++++-
 fs/f2fs/file.c                         |  5 ++++-
 include/linux/stat.h                   |  3 ++-
 include/uapi/linux/stat.h              |  2 +-
 5 files changed, 21 insertions(+), 6 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
