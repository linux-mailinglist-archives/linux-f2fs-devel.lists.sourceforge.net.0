Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7227177C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4G8L-0003bU-QK;
	Wed, 31 May 2023 07:20:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4G8J-0003bN-43 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rTj30peRJt6m0YoKqBvWmseSjfUD4Z/EcECC7rWKQqY=; b=m9so83c5KngCanqWsMFolBCkne
 LX9ND8LeVBPBT3hD7SBN0A7foS165YLrH7Sw/veDmwJikmMvcwXS8k708Ju4K8xBBGZIWy4xQtBo9
 EqTb/PnJ1um/uZcVIENeORG6xWBG7ij8ZlM95wVydZLABPYan8h0j4ZxgqmfTjU5b7ew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rTj30peRJt6m0YoKqBvWmseSjfUD4Z/EcECC7rWKQqY=; b=L
 HV5tp1iJDznRplegWPZFttZ4iqQ6bZMzQDfg0GUpSAMl9sy/qIfmyzz0Fip8m1eyt1JQp/WRss9I2
 6jHH5DRHuVQCvEP3RyW2D8dGbQv6a1EM2s9YsgIop7IDJNC0IUM/sEK1LQWrs6c6K48wblAgwaig2
 YchR9cjVemqQo+Sw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4G8F-0004qG-J2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rTj30peRJt6m0YoKqBvWmseSjfUD4Z/EcECC7rWKQqY=; b=JaFUYzfMSOPN52M4KwZuEYVRlQ
 qspmaDHSt+0PBCreJirznNvvorsKcGA4AAgC+3TxCg0mACC0ydyG3dGfhBbJezE3Y0ZtpJF2OgF3Q
 gI2Vu/s5xp9CSycLSHwae8Q9sygUD16H7zP0U7SzIc0nuXifVHJlgqKhPE1D1OZAs4j4K/mSD0zZQ
 IxZJ/z5goKiYfqqD8xLRft7sAoyVj8Y3IQgNP4sLkeSTLlYF9q28/9Oo4E03HX575EHeKdOJkHV/9
 CkyvBQVfQ2OSot0w5Ra4gLl4vsn5TR3UKEAHq6LmBg2GbOKuXJMyE4VqGbDT/CR4c75Sz8C9Y+7i2
 MzqkkGpg==;
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4G7t-00GPh2-1k; Wed, 31 May 2023 07:20:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:19:58 +0200
Message-Id: <20230531072006.476386-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all,
 this series cleans up some of the generic write helper
 calling conventions and the page cache writeback / invalidation for direct
 I/O. This is a spinoff from the no-bufferhead kernel project, for whic [...]
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4G8F-0004qG-J2
Subject: [f2fs-dev] cleanup the filemap / direct I/O interaction v3
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series cleans up some of the generic write helper calling
conventions and the page cache writeback / invalidation for
direct I/O.  This is a spinoff from the no-bufferhead kernel
project, for which we'll want to an use iomap based buffered
write path in the block layer.

Changes since v2:
 - stick to the existing behavior of returning a short write
   if the buffer fallback write or sync fails
 - bring back "fuse: use direct_write_fallback" which accidentally
   got lost in v2

Changes since v1:
 - remove current->backing_dev_info entirely
 - fix the pos/end calculation in direct_write_fallback
 - rename kiocb_invalidate_post_write to
   kiocb_invalidate_post_direct_write
 - typo fixes

diffstat:
 block/fops.c            |   18 +-----
 fs/btrfs/file.c         |    6 --
 fs/ceph/file.c          |    6 --
 fs/direct-io.c          |   10 ---
 fs/ext4/file.c          |   11 +---
 fs/f2fs/file.c          |    3 -
 fs/fuse/file.c          |    4 -
 fs/gfs2/file.c          |    6 --
 fs/iomap/buffered-io.c  |    9 ++-
 fs/iomap/direct-io.c    |   88 ++++++++++++---------------------
 fs/nfs/file.c           |    6 --
 fs/ntfs/file.c          |    2 
 fs/ntfs3/file.c         |    3 -
 fs/xfs/xfs_file.c       |    6 --
 fs/zonefs/file.c        |    4 -
 include/linux/fs.h      |    5 -
 include/linux/pagemap.h |    4 +
 include/linux/sched.h   |    3 -
 mm/filemap.c            |  126 ++++++++++++++++++++++++++----------------------
 19 files changed, 125 insertions(+), 195 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
