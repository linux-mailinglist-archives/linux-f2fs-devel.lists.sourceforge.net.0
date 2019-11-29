Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 214AA10D87D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 17:33:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iajCv-0007I3-U8; Fri, 29 Nov 2019 16:33:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iajCv-0007Hu-9v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FL0wPyiUJXpbbn1pdNoiTVpNgBOcD3WRtoie2iBiHb4=; b=K4Ss3Tv8tIzH12PvxTPF5W2FiY
 gaqJJmgcUtDhUY/Z5RgLIkV6rtT4vwY2pNZIecUWh/Vm9zfaVXeZCQedKnahZz6JF3b9sMZHHq4iD
 xG2WV9nSCWh+z/P9FYNSL5E8hDdbu6d/iu7Vfa7/c/2oGNyROnCXHB8AdqGvMdN2hBtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FL0wPyiUJXpbbn1pdNoiTVpNgBOcD3WRtoie2iBiHb4=; b=nWKemNJIAjtmV+a9sFSqbn5AmK
 bwrCIZDPqIXpZX0M89PMvYBENz+iveSoW7wBiQdigg96+4zRONLqw9TI/LfxKUsg7A7XdD7dUhsT4
 j6yXygI4vLOW5+UUsmD2h9YBZvd2Tj5lqWXCaOpUfq+ic6UnfJtUiy1C8fnLmxufh8gs=;
Received: from mga17.intel.com ([192.55.52.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iajCr-00BYAJ-GZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:25 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:09 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="217811674"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:09 -0800
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Nov 2019 08:33:00 -0800
Message-Id: <20191129163300.14749-4-ira.weiny@intel.com>
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
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iajCr-00BYAJ-GZ
Subject: [f2fs-dev] [PATCH V3 3/3] Documentation/fs: Move
 swap_[de]activate() to file_operations
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

Update the documentation for the move of the swap_* functions out of
address_space_operations and into file_operations.

Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: David Sterba <dsterba@suse.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
Changes from V0:
	Add to original series (now V3)
	Add reviews

 Documentation/filesystems/vfs.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index 7d4d09dd5e6d..03a740d7faa4 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -731,8 +731,6 @@ cache in your filesystem.  The following members are defined:
 					      unsigned long);
 		void (*is_dirty_writeback) (struct page *, bool *, bool *);
 		int (*error_remove_page) (struct mapping *mapping, struct page *page);
-		int (*swap_activate)(struct file *);
-		int (*swap_deactivate)(struct file *);
 	};
 
 ``writepage``
@@ -924,16 +922,6 @@ cache in your filesystem.  The following members are defined:
 	Setting this implies you deal with pages going away under you,
 	unless you have them locked or reference counts increased.
 
-``swap_activate``
-	Called when swapon is used on a file to allocate space if
-	necessary and pin the block lookup information in memory.  A
-	return value of zero indicates success, in which case this file
-	can be used to back swapspace.
-
-``swap_deactivate``
-	Called during swapoff on files where swap_activate was
-	successful.
-
 
 The File Object
 ===============
@@ -988,6 +976,8 @@ This describes how the VFS can manipulate an open file.  As of kernel
 					   struct file *file_out, loff_t pos_out,
 					   loff_t len, unsigned int remap_flags);
 		int (*fadvise)(struct file *, loff_t, loff_t, int);
+		int (*swap_activate)(struct file *);
+		int (*swap_deactivate)(struct file *);
 	};
 
 Again, all methods are called without any locks being held, unless
@@ -1108,6 +1098,16 @@ otherwise noted.
 ``fadvise``
 	possibly called by the fadvise64() system call.
 
+``swap_activate``
+	Called when swapon is used on a file to allocate space if
+	necessary and pin the block lookup information in memory.  A
+	return value of zero indicates success, in which case this file
+	can be used to back swapspace.
+
+``swap_deactivate``
+	Called during swapoff on files where swap_activate was
+	successful.
+
 Note that the file operations are implemented by the specific
 filesystem in which the inode resides.  When opening a device node
 (character or block special) most filesystems will call special
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
