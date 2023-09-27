Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3858E7B0062
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Sep 2023 11:35:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlQwi-0005Av-Il;
	Wed, 27 Sep 2023 09:35:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qlQwe-00059q-LR;
 Wed, 27 Sep 2023 09:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=; b=bcDGdJbvhs1Wp+xbENyNqeJ797
 aGQm3nbzt1DB6OiisvL86FMqJXX9UWmcLd83bNJ5bOMdhqW7NuT4Wj2iQRgKI2or4o142NBIijU6B
 OAA6xq54oJXOr1QNmEXjmKtdTtQ7ZKRWphQbDkD/iQBhTGoL9WPWcj+mBl+JnmUGt8T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=; b=B
 UmoBhc4g8pFGfXPPD96MfF+ZOq5smEuJEoCxQ9rL3I73/4ijnLmU0blJkpb5CRj0a1YQyC/hemRsf
 gxTHh9lJGXqlDKGecmAwFoWNBYI4oav+C3dRU07L3LzWReigmm+rj7PMgRdIDcQgcDT6t2posTS4H
 GEpQc/hr+TpMErdU=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qlQwY-0006rT-1O; Wed, 27 Sep 2023 09:34:59 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 967601FD5E;
 Wed, 27 Sep 2023 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1695807283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=;
 b=AFBlD5DhZEt1NESHiYyz8SkegLzofp7eJ1WULrYqvNawr6FwYRs8YvfnxMMuueLH4oaPAr
 4/E8CfUtgD9JCSYdgqDNPTGf3WDqWggCkDqswdM4bg88sfMPDeWHH5NIlB2Bfj+JpMt9FG
 ZcOWlzLEUXG/bpJ8Kbaqy4vRi+qRmpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1695807283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8yq/EWr5xgyIq2expGTOm/a8E50tdoL6jyUvlCURtkA=;
 b=mg4W9cwL1b35dhDAXFy+IpXoqDtwwHWZKy46oqV5YDeY2A866tqG4ZHrqCDezVtTxVLjRN
 B2SqzI+xFxiJavDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779CF13A74;
 Wed, 27 Sep 2023 09:34:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YqW3HDP3E2X+EgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 27 Sep 2023 09:34:43 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id DAA33A07C9; Wed, 27 Sep 2023 11:34:42 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Date: Wed, 27 Sep 2023 11:34:06 +0200
Message-Id: <20230818123232.2269-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761; i=jack@suse.cz;
 h=from:subject:message-id; bh=szriGynEGZ/XhMNms+k06ASpRGig2ulDzrbrydRWx/Q=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBlE/cIrHCVKGuvNFZzgT9xiRfuRKr6Es2Qs4om7G7p
 jp8k2rmJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZRP3CAAKCRCcnaoHP2RA2XGWB/
 4+O+K19fPnUyIouL+A+izJvDBxQbTCWLdn5TEMu5YdIMbi0dvnwAfknt+NWIhJaTQX2oqlgt3Z+UIT
 peMYb+jQZabj8X4xHMMy3Sfq64tRwodJHlZby5Ux9AfTZe49zDp4M4B3yxQqarEhmz6e4FJUGDaSej
 vcJmLz6AuSnYuAh4QK/3jCXQrEElZRTjarZjfbunWocM/2dQ7CB+rOSwKJcRMoDpqntU8QyArxca4l
 q6I2pBMNjnYMgjtG+ABGSBtTrj87TuJSTB3V8qtI38sfCYjMVVEoQiJKuUm1GMh2sPOFelwVMXMCJH
 mKs8UbSjcFd3wsbJXc8EOKLxzYparl
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, this is a v3 of the patch series which implements the
 idea of blkdev_get_by_*() calls returning bdev_handle which is then passed
 to blkdev_put() [1]. This makes the get and put calls for bdevs more ob [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qlQwY-0006rT-1O
Subject: [f2fs-dev] [PATCH v4 0/29] block: Make blkdev_get_by_*() return
 handle
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-nvme@lists.infradead.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jack Wang <jinpu.wang@ionos.com>,
 Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

this is a v3 of the patch series which implements the idea of blkdev_get_by_*()
calls returning bdev_handle which is then passed to blkdev_put() [1]. This
makes the get and put calls for bdevs more obviously matching and allows us to
propagate context from get to put without having to modify all the users
(again!). In particular I need to propagate used open flags to blkdev_put() to
be able count writeable opens and add support for blocking writes to mounted
block devices. I'll send that series separately.

The series is based on Btrfs tree's for-next branch [2] as of today as the
series depends on Christoph's changes to btrfs device handling.  Patches have
passed some reasonable testing - I've tested block changes, md, dm, bcache,
xfs, btrfs, ext4, swap. More testing or review is always welcome. Thanks! I've
pushed out the full branch to:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle

to ease review / testing. Christian, can you pull the patches to your tree
to get some exposure in linux-next as well? Thanks!

Changes since v3:
* Rebased on top on btrfs tree

Changes since v2:
* Rebased on top of current vfs tree
* Added some acks
* Reflected minor nits from Christoph
* Added missing conversion of blkdev_put() calls in cramfs and erofs
* Fixed possible leak of bdev handle in xfs if logdev is the same as fs dev

Changes since v1:
* Rebased on top of current vfs tree
* Renamed final functions to bdev_open_by_*() and bdev_release()
* Fixed detection of exclusive open in blkdev_ioctl() and blkdev_fallocate()
* Fixed swap conversion to properly reinitialize swap_info->bdev_handle
* Fixed xfs conversion to not oops with rtdev without logdev
* Couple other minor fixups

								Honza

[1] https://lore.kernel.org/all/ZJGNsVDhZx0Xgs2H@infradead.org
[2] git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next

CC: Alasdair Kergon <agk@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Anna Schumaker <anna@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Coly Li <colyli@suse.de
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Kleikamp <shaggy@kernel.org>
CC: David Sterba <dsterba@suse.com>
CC: dm-devel@redhat.com
CC: drbd-dev@lists.linbit.com
CC: Gao Xiang <xiang@kernel.org>
CC: Jack Wang <jinpu.wang@ionos.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: jfs-discussion@lists.sourceforge.net
CC: Joern Engel <joern@lazybastard.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>
CC: Kent Overstreet <kent.overstreet@gmail.com>
CC: linux-bcache@vger.kernel.org
CC: linux-btrfs@vger.kernel.org
CC: linux-erofs@lists.ozlabs.org
CC: <linux-ext4@vger.kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-mm@kvack.org
CC: linux-mtd@lists.infradead.org
CC: linux-nfs@vger.kernel.org
CC: linux-nilfs@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: linux-xfs@vger.kernel.org
CC: "Md. Haris Iqbal" <haris.iqbal@ionos.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Minchan Kim <minchan@kernel.org>
CC: ocfs2-devel@oss.oracle.com
CC: reiserfs-devel@vger.kernel.org
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Song Liu <song@kernel.org>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: target-devel@vger.kernel.org
CC: Ted Tso <tytso@mit.edu>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: xen-devel@lists.xenproject.org

Previous versions:
Link: http://lore.kernel.org/r/20230629165206.383-1-jack@suse.cz # v1
Link: http://lore.kernel.org/r/20230810171429.31759-1-jack@suse.cz # v2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
