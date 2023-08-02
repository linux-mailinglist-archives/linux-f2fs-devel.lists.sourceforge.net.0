Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F9476D26D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzC-0004CR-LK;
	Wed, 02 Aug 2023 15:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDz6-0004CE-QV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b4U6bkV1Hpe1BTMHR6FYKzJdXgCv2eIo7grqFPPTqjk=; b=YVbxccT8RafEu5OpFBDgKnU1aZ
 33GCKVReDot+bxlIhHracvdu5AcGd1MRcxWBnG4hdj7qHNdwetwrRC+z2inYFPiw4kZgS5n2R2+h7
 +mqU5e5Hy3Jz3j9D+l6oeUV2wyyfx6T7+aMc0d5RYEK7XazqXCVSy9+drLZwkGSY+I9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b4U6bkV1Hpe1BTMHR6FYKzJdXgCv2eIo7grqFPPTqjk=; b=g
 J7GpiGQwGn5FVSLuCor5jAZTtKKideXRhFeXud/F5WlAIiTuHBDW9zwrjlkaG47Hg0aHPasKAPWzU
 m+daDH+psWi532FJSki8nMZnGLuq7Pig3RcvwG1Y1Im7myzv2ketBA6rCBr4mMblhBHM+4UmYP3B6
 c6taWKCDhDR4BnbE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDz2-0004SN-Sx for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=b4U6bkV1Hpe1BTMHR6FYKzJdXgCv2eIo7grqFPPTqjk=; b=mEmIb7uaUaKOwJY8lv1GETQvVo
 WNRAbVgAX3I0Nq8v6CM/Qo1DrhqE34m6F/BDf6xyn9aDiz8ir/jR+j+b6N3vmF4ctRKkZekSnf/xi
 uUswI0ekQNU4ccZrtb1iKIfKRkjifCinoSifA+mjBzEDaNBg7gOhnCnHmtnIl+lP+7yi1X0U5ECrV
 CBu/ROThv8CXmTxygF8pUmZ+UHKpiHPjUS4CpeuY+nPNuUWnZTnad0/okenZbctCPywHMdIKttcRj
 Mov5cp0eIKS0KO0w/8rDBjKZPumqCJP1eChnKXGXEVAMc4/RbvHBDfEltpKwT7S55Y91Tb9SGytMS
 jH+0LgHw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDyh-005GCS-2F; Wed, 02 Aug 2023 15:41:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:19 +0200
Message-Id: <20230802154131.2221419-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series sits on top of the vfs.super branch in
 the VFS tree and does a few closely related things: 1) it also converts nilfs2
 and btrfs to the new scheme where the file system only opens the block devices
 after we know that a new super_block was allocated. 2) it then makes sure
 that for all file s [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRDz2-0004SN-Sx
Subject: [f2fs-dev] more blkdev_get and holder work
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series sits on top of the vfs.super branch in the VFS tree and does a
few closely related things:

  1) it also converts nilfs2 and btrfs to the new scheme where the file system
     only opens the block devices after we know that a new super_block was
     allocated.
  2) it then makes sure that for all file system openers the super_block is
     stored in bd_holder, and makes use of that fact in the mark_dead method
     so that it doesn't have to fall get_super and thus can also work on
     block devices that sb->s_bdev doesn't point to
  3) it then drops the fs-specific holder ops in ext4 and xfs and uses the
     generic fs_holder_ops there

A git tree is available here:

    git://git.infradead.org/users/hch/misc.git fs-holder-rework

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/fs-holder-rework

Diffstat:
 fs/btrfs/super.c           |   67 ++++++++++++++++---------------------
 fs/btrfs/volumes.c         |    8 ++--
 fs/btrfs/volumes.h         |    2 -
 fs/ext4/super.c            |   18 +++-------
 fs/f2fs/super.c            |    7 +--
 fs/nilfs2/super.c          |   81 ++++++++++++++++-----------------------------
 fs/super.c                 |   44 ++++++++++++++++++------
 fs/xfs/xfs_super.c         |   32 +++++++----------
 include/linux/blkdev.h     |    2 +
 include/linux/fs_context.h |    2 +
 10 files changed, 126 insertions(+), 137 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
