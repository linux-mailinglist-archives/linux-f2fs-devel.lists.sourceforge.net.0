Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E7D10D87B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 17:33:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iajCq-0005xH-91; Fri, 29 Nov 2019 16:33:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iajCo-0005x9-9U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+y5cqIj0Y6ZfXtMqzmMZ/zQBzJjWyes+H3IYzvQLgU=; b=dHD1lfxzNo3bIwfCEsD9FINbJq
 Et/bc5T2sSDiFBpBxtGPwJXMZE32K8jDR+M9Ns3tdZZleVH6MW+ZAK0B3b0L7j3mAZbZjdmjAGaO9
 Z1pSLPNvqkfWf6FzILGXQNKhl5+5cpkZ5JAEvWbDVCgkJcwyMgQtIJZ91Shh+vJhUdZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9+y5cqIj0Y6ZfXtMqzmMZ/zQBzJjWyes+H3IYzvQLgU=; b=OvFlHZc68WmZFlc4oqYfiEchax
 vn3DLPHdewkT1E3zcokT1HkcMsxK8i8Xip1+2KNsctKZvMd3TbpU3XxPvFH0gseYbxtdlVtSLVPb/
 Tms4hY0T2io6XqsZOXXdaewvBNqCYs2GD4U9fYWkaIEY5f3CQu/j416oahT/Cb7lRgrw=;
Received: from mga05.intel.com ([192.55.52.43])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iajCk-00HQrt-1Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:17 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="261567546"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:07 -0800
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Nov 2019 08:32:58 -0800
Message-Id: <20191129163300.14749-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191129163300.14749-1-ira.weiny@intel.com>
References: <20191129163300.14749-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iajCk-00HQrt-1Q
Subject: [f2fs-dev] [PATCH V3 1/3] fs: Clean up mapping variable
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Ira Weiny <ira.weiny@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

The mapping variable is not directly used in these functions.  Just
remove the additional variable.

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V2:
	updated Reviews

 fs/f2fs/data.c      | 3 +--
 fs/iomap/swapfile.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a034cd0ce021..9067c7e68992 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3147,8 +3147,7 @@ int f2fs_migrate_page(struct address_space *mapping,
 /* Copied from generic_swapfile_activate() to check any holes */
 static int check_swap_activate(struct file *swap_file, unsigned int max)
 {
-	struct address_space *mapping = swap_file->f_mapping;
-	struct inode *inode = mapping->host;
+	struct inode *inode = swap_file->f_mapping->host;
 	unsigned blocks_per_page;
 	unsigned long page_no;
 	unsigned blkbits;
diff --git a/fs/iomap/swapfile.c b/fs/iomap/swapfile.c
index a648dbf6991e..80571add0180 100644
--- a/fs/iomap/swapfile.c
+++ b/fs/iomap/swapfile.c
@@ -140,8 +140,7 @@ int iomap_swapfile_activate(struct swap_info_struct *sis,
 		.sis = sis,
 		.lowest_ppage = (sector_t)-1ULL,
 	};
-	struct address_space *mapping = swap_file->f_mapping;
-	struct inode *inode = mapping->host;
+	struct inode *inode = swap_file->f_mapping->host;
 	loff_t pos = 0;
 	loff_t len = ALIGN_DOWN(i_size_read(inode), PAGE_SIZE);
 	loff_t ret;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
