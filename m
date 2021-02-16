Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC30131CF11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Feb 2021 18:31:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lC4CD-0007lp-Uj; Tue, 16 Feb 2021 17:31:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lC4CC-0007lh-0g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Feb 2021 17:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vGLtku8/p6/vWOuOPMmDpVZsrhnc4jsI4JSDnVIUeoM=; b=WoO2ulviPNq6+A8H961n+kERaf
 YB5Llx0GJwoIUba6MstUPFnHc7HyR9N3BJKuiYasdoOcrbhMwMrjWpEa2TdZqh1pdtgCl3vozXHxX
 dL7Jnff3V72XqQudMcWC2pFJ93mSNqmt6tsLCeXB526ZE2iZMApj+mh2hAcHWRAGtUr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vGLtku8/p6/vWOuOPMmDpVZsrhnc4jsI4JSDnVIUeoM=; b=M
 S3bcbYg5zIHrYVQ3AEeTRbzepgaWq8PCTe+XZVzMjMEUsznAji1yQk/Rl5jz/qcJ6Q/V4xidxNRPO
 sj6krWb5UbtMglpkWMamraNXX0x1pisNUVSEuJe6CpfCoGPWsFIHyJEwoqdK0/Jmpx72CE6HKc8d0
 Lw/9Q32GlksnS+Fo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lC4C7-00B8Om-DW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Feb 2021 17:31:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C504D64DA1;
 Tue, 16 Feb 2021 17:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613496677;
 bh=mXnJDdFhDKnuB4BfSnRg55qq72NgQAWh/t0zlWZx1ac=;
 h=Date:From:To:Cc:Subject:From;
 b=drZ2I17AtuopvjlB/V3/59+15qqq0Fx5jdgKbl/5GigP2LPzOJc1m3ojlytCR8Gfi
 lkfbPmltxTG7V8pADiWoPwoMrxKyocNpF5vBvz4AePysb7acjSyXwQWb0duYJdbw/C
 1EACbnbvix33Il1O62ICyquCoPmhapOrhIgPAcCmhdaUJh/wY9nqHrF7Mkiy9WNj8m
 twdc2UEE6l0FZfFLad292feM5Htv70EoKCeRcpEgkvzYILbYQNiH+w5IaxA0BvoKjG
 ZHMvnMlMTLA5VLbXn29PJMGVi0Baq0xejVYPwAmUm1aOTPv3YKo1GFbRjTRRUE+C75
 6jHbe1WXaZ2QQ==
Date: Tue, 16 Feb 2021 09:31:15 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YCwBY/FsxEsnI0M/@sol.localdomain>
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
X-Headers-End: 1lC4C7-00B8Om-DW
Subject: [f2fs-dev] [GIT PULL] fsverity updates for 5.12
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
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The following changes since commit 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04:

  Linux 5.11-rc5 (2021-01-24 16:47:14 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fsverity-for-linus

for you to fetch changes up to 07c99001312cbf90a357d4877a358f796eede65b:

  fs-verity: support reading signature with ioctl (2021-02-07 14:51:19 -0800)

----------------------------------------------------------------

Add an ioctl which allows reading fs-verity metadata from a file.

This is useful when a file with fs-verity enabled needs to be served
somewhere, and the other end wants to do its own fs-verity compatible
verification of the file.  See the commit messages for details.

This new ioctl has been tested using new xfstests I've written for it.

----------------------------------------------------------------
Eric Biggers (6):
      fs-verity: factor out fsverity_get_descriptor()
      fs-verity: don't pass whole descriptor to fsverity_verify_signature()
      fs-verity: add FS_IOC_READ_VERITY_METADATA ioctl
      fs-verity: support reading Merkle tree with ioctl
      fs-verity: support reading descriptor with ioctl
      fs-verity: support reading signature with ioctl

 Documentation/filesystems/fsverity.rst |  76 +++++++++++++
 fs/ext4/ioctl.c                        |   7 ++
 fs/f2fs/file.c                         |  11 ++
 fs/verity/Makefile                     |   1 +
 fs/verity/fsverity_private.h           |  13 ++-
 fs/verity/open.c                       | 133 ++++++++++++++--------
 fs/verity/read_metadata.c              | 195 +++++++++++++++++++++++++++++++++
 fs/verity/signature.c                  |  20 +---
 include/linux/fsverity.h               |  12 ++
 include/uapi/linux/fsverity.h          |  14 +++
 10 files changed, 417 insertions(+), 65 deletions(-)
 create mode 100644 fs/verity/read_metadata.c


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
