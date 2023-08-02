Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F1276D283
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzS-0002LI-Rg;
	Wed, 02 Aug 2023 15:42:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzR-0002L3-DP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9z6iRUB0HpEH9yVJZ8SKsjwqR2QNW5zkViH5X/SDjhI=; b=jcrNyCaZSW9dN8GoB6PD7zdMKk
 MLmnPMGvOQcVMBxuVfN+0KzKd126rGoVh0Vwoa3KdiqN8JqIfDJHnfwF9O+MvcIxK61q7/yHnbXcB
 aNEi4/MBcugwOFFkXbZfw5LGnX/0BKQibgc5ZL/MfgJdC0PfsMxIn1Vii5+vfapDYWj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9z6iRUB0HpEH9yVJZ8SKsjwqR2QNW5zkViH5X/SDjhI=; b=CyKmG06GVRxSLZOHD0STatK6f0
 YGWdHHczM9E3ZRh+Ml6B9etjhm+zNwZ2U3hTnU3U9aogl0SewBxGwS8xhwtbInI8nawNRSSiPd9SD
 ssIgcXcIF+hqWIjpkj0xa999K+H2PEEYNaGcyzGLA/s5aiQsicxXIfcDL6oAbpftCFwg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzP-0004Ta-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9z6iRUB0HpEH9yVJZ8SKsjwqR2QNW5zkViH5X/SDjhI=; b=i+HYYGUwVQd0cBogaXIV5vo/pL
 zWblj0H6yG//E5OamCxdVKjjA+loZfVwsPHotijZMYyONUsXn+hTKEPyxDUrHsRUHCyDEzKsicFlq
 duF5vCrFzEbsPWaI2grnR07yMIRV3pbVI/44jrUI4J6B4XHIeW+91ZQBEGfYVI9o+NZeD/XBGRQP6
 o03BDUtDrFgof5bL0lrd7JoHdf7A7vgTEDPlp/C4wUx9XWGAuylz3IICKc7G/ZBWEMNj+Ucoc47ZZ
 BcPdWnYJZX9Eb6u3srXrOnd8/GtwLWAbFSXxE0MVQIBm2dAmvbZaDYkJWjeg771VMhLIIxgUqbssB
 Om0i9bfQ==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDzD-005GL4-1L; Wed, 02 Aug 2023 15:42:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:28 +0200
Message-Id: <20230802154131.2221419-10-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
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
 Content preview: Just like get_tree_bdev needs to drop s_umount when opening
 the main device, we need to do the same for the ext4 log device to avoid
 a potential lock order reversal with s_unmount for the mark_dead pa [...] 
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
X-Headers-End: 1qRDzP-0004Ta-P1
Subject: [f2fs-dev] [PATCH 09/12] ext4: drop s_umount over opening the log
 device
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

Just like get_tree_bdev needs to drop s_umount when opening the main
device, we need to do the same for the ext4 log device to avoid a
potential lock order reversal with s_unmount for the mark_dead path.

It might be preferable to just drop s_umount over ->fill_super entirely,
but that will require a fairly massive audit first, so we'll do the easy
version here first.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 193d665813b611..2ccb19d345c6dd 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5854,7 +5854,10 @@ static journal_t *ext4_get_dev_journal(struct super_block *sb,
 	if (WARN_ON_ONCE(!ext4_has_feature_journal(sb)))
 		return NULL;
 
+	/* see get_tree_bdev why this is needed and safe */
+	up_write(&sb->s_umount);
 	bdev = ext4_blkdev_get(j_dev, sb);
+	down_write(&sb->s_umount);
 	if (bdev == NULL)
 		return NULL;
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
