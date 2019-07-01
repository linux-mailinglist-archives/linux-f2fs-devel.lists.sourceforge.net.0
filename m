Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 871025C450
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 22:26:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi2sr-0006dQ-F1; Mon, 01 Jul 2019 20:26:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi2sq-0006dJ-7u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=314NgkE3luLEE9CBIb+pShDmju7u+6t4OmzRIumPZxo=; b=GM8Z9hC3Xhh26R6xIKHGnYfqok
 /B08iMQCsE6E0ZRcN2XK9u6/y3ru8neB2SCIth2EWgVWF7t9hleyCAEYdsy6N9bZcnk0tGVtIN+q+
 HOt+WydwiHlm8qmYBg5G+uZPybNJTNtqFjAJ1MQ8l59EuYJDWnI6rvVLLrid/ORaCRNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=314NgkE3luLEE9CBIb+pShDmju7u+6t4OmzRIumPZxo=; b=e
 rPRg4er4zYssMnKEDnbcOyjbn3aH7IRtMnMQi+WUsJOaevVmOb+I/7XcROmaiOI2rf9YfOoFRFvLy
 +1Scc3jKCCdc1fA+ZuD2iVmWuCMy110694mYbGqbzK6oklnpryaAIshof49qcLMLYEwjoK2A3mLEe
 6Uu+rwMcKS8ioDb8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi2t3-000yxK-Og
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:26:55 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E65EA20B7C;
 Mon,  1 Jul 2019 20:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562012808;
 bh=bHXVVLIgc6WfqlmFZzYaV90ylrhq4JfZ8EnmuXsM1vM=;
 h=From:To:Cc:Subject:Date:From;
 b=OSpbrUwWPr0XVE/7R0/wA16gYkmjSek15Tqav6ajumHVktyFYoEoorUuZQF+gflA4
 84F055Vx3NQftnhPrev4FSE19+whHobVMOFxeN4CJyKBcQqhWVncSNbipYtNqAprpc
 VnbcSOFO5cSX4XOoH65e53wf4vd8lDttaWBoyZXQ=
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Mon,  1 Jul 2019 13:26:27 -0700
Message-Id: <20190701202630.43776-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
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
X-Headers-End: 1hi2t3-000yxK-Og
Subject: [f2fs-dev] [PATCH 0/3] f2fs: use generic helpers for
 FS_IOC_{SETFLAGS, FSSETXATTR}
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series converts f2fs to use the new VFS helper functions that check
the parameters of the FS_IOC_SETFLAGS and FS_IOC_FSSETXATTR ioctls.

This applies to the merge of the f2fs/dev and xfs/vfs-for-next branches:

	https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev
	https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/log/?h=vfs-for-next

i.e., this series will apply to mainline after these two branches get
merged into it for 5.3.  Don't apply it to the f2fs tree by itself yet.

See: https://lore.kernel.org/lkml/20190701110603.5abcbb2c@canb.auug.org.au/T/#u

Eric Biggers (3):
  f2fs: use generic checking and prep function for FS_IOC_SETFLAGS
  f2fs: use generic checking function for FS_IOC_FSSETXATTR
  f2fs: remove redundant check from f2fs_setflags_common()

 fs/f2fs/file.c | 63 ++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
