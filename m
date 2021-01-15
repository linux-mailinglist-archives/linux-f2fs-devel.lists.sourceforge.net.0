Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B32F8465
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:30:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0Trn-0005SH-MF; Fri, 15 Jan 2021 18:30:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0Trl-0005Rm-M5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4jZVd791bUsllaaDOp/5Mazzapufb0tY4xZi+bEaJeg=; b=Se/m4VOBUVz61hd1yHYeGNLTdQ
 BAH9Q0kbABNsdwAzNxBOwCrgDl+eA50PbFfSRRaAvoWGd+5h8dRe0+CQnoWlbScNYZFOXXebscRic
 byojqMFBeawSisBLPSxr7XZY3k61WaDbJEwHHU9dHu3oIMD+DfU8FX5UPkSy5Exb+fOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4jZVd791bUsllaaDOp/5Mazzapufb0tY4xZi+bEaJeg=; b=L
 +7mXLw/QDo9Xr6tY3JSESbuhnVxdtd8ECjeC24NdqZTSuRRAEB4uum715cIq0MC7DgMhBqIAt1nm2
 SX/h6RWi44/yWXSoRLJUPqVoueMt3hmoQp/ia4nLnTJ3PSQ56paeHCDXs0wCAcD4E3tu4G88pSIQa
 6TU8wCOfOyqEv6jI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0Trd-00GOTF-5v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:30:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87D5923359;
 Fri, 15 Jan 2021 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610735419;
 bh=gbwHQXXZKxRoHuz77f1Py7JkaZk+PrkkEL4SXZfN1k8=;
 h=From:To:Cc:Subject:Date:From;
 b=VrPYc/2WCxMzwABozjzRrG5k8JEnW1j2pOZmztZuqSio4PBIwXpGmH8Uq3rDXUK+8
 3V1wGv0S4+HAEGvjlJHq5k90//6jK3taGRi3allFMFHPYqmO2TnwgiIEq37upbkQAx
 ugLQ3flBdoxZvMVgtj0PNpxRl54HYBax+xEcNbpCDj7sYid5V96QZNt/3ZYn4Smziu
 b2Zh3lGcKal8fnrtljbUXYQ1PAkHfaKz9R+nse0u9470GGVCvSe+U1Nj+wIkWrYeEq
 zB0mYu7cPrhhCK+1FV6i2L5IuTeRRTcT0A9z4LmTiZkq45e3c64rziL4TwSKfvtxi4
 qKj5eeI4WTq8Q==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 15 Jan 2021 10:28:33 -0800
Message-Id: <20210115182837.36333-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0Trd-00GOTF-5v
Subject: [f2fs-dev] [xfstests RFC PATCH 0/4] Test the
 FS_IOC_READ_VERITY_METADATA ioctl
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

This RFC patchset adds tests for the FS_IOC_READ_VERITY_METADATA ioctl
which I've proposed at
https://lkml.kernel.org/linux-fscrypt/20210115181819.34732-1-ebiggers@kernel.org/T/#u.

It relies on a new 'dump_metadata' subcommand for the 'fsverity' program
from fsverity-utils, which I've proposed at
https://lkml.kernel.org/linux-fscrypt/20210115182402.35691-1-ebiggers@kernel.org/T/#u.

The tests run on ext4 and f2fs (the filesystems that support fs-verity).

Eric Biggers (4):
  generic: factor out helpers for fs-verity built-in signatures
  generic: add helpers for dumping fs-verity metadata
  generic: test retrieving verity Merkle tree and descriptor
  generic: test retrieving verity signature

 common/verity         | 73 ++++++++++++++++++++++++++++++++++++++-
 tests/generic/577     | 15 ++------
 tests/generic/901     | 79 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/901.out | 16 +++++++++
 tests/generic/902     | 66 ++++++++++++++++++++++++++++++++++++
 tests/generic/902.out |  7 ++++
 tests/generic/group   |  2 ++
 7 files changed, 245 insertions(+), 13 deletions(-)
 create mode 100755 tests/generic/901
 create mode 100644 tests/generic/901.out
 create mode 100644 tests/generic/902
 create mode 100644 tests/generic/902.out

-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
