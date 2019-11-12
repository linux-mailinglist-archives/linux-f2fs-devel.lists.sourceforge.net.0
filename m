Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1768DF856C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 01:35:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUK9F-0006oc-SZ; Tue, 12 Nov 2019 00:35:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUK9D-0006oC-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 00:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LYorxc7dRQ7hYBeGWqLOH+N/l1HqPiV27VM/yUO+fP8=; b=iU9wSBWhhmlYehTXEv4zeiHE77
 +3YEbT/NDwlUT0jXQ86JVXVOxygPxCXwSCJ6gDbfqCl4F19iuboQh7njvTb4kLqJsC1AfT7LB0gZG
 +ze1qFLAenWoeUZiZj9m4U+FTZvmbOIlk7H+hLWQZ/OvLIPidlihnB641wB3dYult04Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LYorxc7dRQ7hYBeGWqLOH+N/l1HqPiV27VM/yUO+fP8=; b=DHFuquo4CM7dXAzVIl95kZzkdg
 AcFyfl9z+1r4SqBLzXdbNn1qege7QLWs6uf/u2ZT0UQ3WYLB75G2NY9XO6c/a7jb6K1np7XVxau4O
 EHnsGBveEuMbjDbEWRmSpqf2Cg2nKP00wjjcKhygQzfh4Ux+rKj7yoruL85utNf+5slo=;
Received: from mga02.intel.com ([134.134.136.20])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUK9C-00CdnW-8I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 00:35:07 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 16:34:58 -0800
X-IronPort-AV: E=Sophos;i="5.68,294,1569308400"; d="scan'208";a="252014011"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 16:34:58 -0800
From: ira.weiny@intel.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 11 Nov 2019 16:34:51 -0800
Message-Id: <20191112003452.4756-2-ira.weiny@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191112003452.4756-1-ira.weiny@intel.com>
References: <20191112003452.4756-1-ira.weiny@intel.com>
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
X-Headers-End: 1iUK9C-00CdnW-8I
Subject: [f2fs-dev] [PATCH 1/2] fs: Clean up mapping variable
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
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Ira Weiny <ira.weiny@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

The mapping variable is not directly used in these functions.  Just
remove the additional variable.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/f2fs/data.c      | 3 +--
 fs/iomap/swapfile.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ba3bcf4c7889..3c7777bfae17 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3146,8 +3146,7 @@ int f2fs_migrate_page(struct address_space *mapping,
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
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
