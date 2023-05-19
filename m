Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D65709354
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 May 2023 11:35:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzwWh-0007jE-0N;
	Fri, 19 May 2023 09:35:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+aecf67361b95543ec79f+7208+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pzwWb-0007ix-T9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3wyyoN4jHO/Zsak1kxh+5wE+B9r8QbYeNrqiPeGC/c=; b=kXQ5o1c5y/ERtLz+dtvvubc3ni
 RNvASsJrai3Led8vcd9/a4SeyHoQuy47uWDf0FZ8EDsO2VV99E4KoK2dzccAi9mfZn9aSM3hVF8mN
 PT2XR+tsegxe1oCDee8KDjM6RAPYqvwJswiwxihIT2snrOm6+nZGNxkEQuxSlKUI2Ct8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b3wyyoN4jHO/Zsak1kxh+5wE+B9r8QbYeNrqiPeGC/c=; b=A
 k40hawm4LiN63RHe/tyLLrgHie3FMnrL89aZg5XQMPWBCMHPgtciCOokNvGkB39aMMEEeQu0g/gTD
 tUWFqDGyZKtxZYceSFJRSxN4Umk9iyBDF5kEmwH6koxwoC8CU/K9n4ZZFdfAcROAx8ACKgtBTNQak
 gLPcQzsrckzS8Rks=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzwWY-00DDK7-QC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 May 2023 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=b3wyyoN4jHO/Zsak1kxh+5wE+B9r8QbYeNrqiPeGC/c=; b=4xTOmJL4SZkwf23SC5mh6Q9d6w
 8QH+KDswZ+2G1P8ZxhVXqL1acWhwalcFL5gjcp3rESRLiy81SrWQdPrUu152ypZAPtBDcl6X36MA4
 vAst5eyD9qhG/KfmnSBIFG+NF9yhRKBBRmZNaI8vIy17R3fThdmR69/MqckQ4qgUCNeZGKzTMMcVz
 2TqWKRcmurv0ffpUIKtLL9SAnCsvVJYqK3Vxy9oIZEp1JM7CCl6kyRl1OEtwAtY0TDaY3+gbGMQ56
 XaESPbY0EvWVD3HutDMlMkv/S0olqmVZSZKfI3fMnDixVDyZ4fUPizXA+cgLmqQiMzDCVIdTZlqTA
 VDm5obdg==;
Received: from [2001:4bb8:188:3dd5:e8d0:68bb:e5be:210a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzwWC-00FjZy-2X; Fri, 19 May 2023 09:35:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Fri, 19 May 2023 11:35:08 +0200
Message-Id: <20230519093521.133226-1-hch@lst.de>
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
 I/O. This is a spinoff from the no-bufferhead kernel project, for whil [...]
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pzwWY-00DDK7-QC
Subject: [f2fs-dev] cleanup the filemap / direct I/O interaction
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
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this series cleans up some of the generic write helper calling
conventions and the page cache writeback / invalidation for
direct I/O.  This is a spinoff from the no-bufferhead kernel
project, for while we'll want to an use iomap based buffered
write path in the block layer.

diffstat:
 block/fops.c            |   18 ----
 fs/ceph/file.c          |    6 -
 fs/direct-io.c          |   10 --
 fs/ext4/file.c          |   12 ---
 fs/f2fs/file.c          |    3 
 fs/fuse/file.c          |   47 ++----------
 fs/gfs2/file.c          |    7 -
 fs/iomap/buffered-io.c  |   12 ++-
 fs/iomap/direct-io.c    |   88 ++++++++--------------
 fs/libfs.c              |   36 +++++++++
 fs/nfs/file.c           |    6 -
 fs/xfs/xfs_file.c       |    7 -
 fs/zonefs/file.c        |    4 -
 include/linux/fs.h      |    7 -
 include/linux/pagemap.h |    4 +
 mm/filemap.c            |  184 +++++++++++++++++++++---------------------------
 16 files changed, 190 insertions(+), 261 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
