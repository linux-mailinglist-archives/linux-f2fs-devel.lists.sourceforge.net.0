Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF2C10D87A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2019 17:33:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iajCm-00046X-DZ; Fri, 29 Nov 2019 16:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iajCk-00046I-UQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fqt55INM/owVrDhn5wTYf1F/LyXZSf1Q5OWFfIKcE4=; b=VEffN0uiFzc0RpshCdLzG7fxmu
 b1ZhSmPFLFXx1EOSpDhNK4mBEkWLWn0rf6xFEg1ifUy6/Ag8UFzDyRXYNh0elIYT+hAtQ5l7uN2bm
 77v/enaUZY/Ro0Cb76sozW03/dZAWAR+C6dGXhIWyCQEdBCcq72mDjg1oXyqVdO6XWMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/fqt55INM/owVrDhn5wTYf1F/LyXZSf1Q5OWFfIKcE4=; b=e
 HTP2ZTIXirLBoRDHL0EYSVd9yXGcRFY+f7MZVVP084MugBUJlhWQApsIDmDE83YSs9KaohFMCEDAL
 1vW1aewTEpurBeBxwLzTqARF78Oc6i5UqT3bXnGHlFu1XBW+WIp7TffM9txZQ6qVyj+u/DzWC5jj2
 ZsR+9QCY+rKA1Zkc=;
Received: from mga06.intel.com ([134.134.136.31])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iajCi-00HQrr-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Nov 2019 16:33:14 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:06 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="234751020"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 08:33:05 -0800
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 29 Nov 2019 08:32:57 -0800
Message-Id: <20191129163300.14749-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iajCi-00HQrr-HZ
Subject: [f2fs-dev] [PATCH V3 0/3] Move swap functions out of address space
 operations
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
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Ira Weiny <ira.weiny@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

As suggested by Jan Kara, move swap_[de]activate to file_operations to simplify
address space operations for coming changes.

For this version (V3):
	1) updated to the latest linux-next
	2) added documentation patch to the series
	3) add reviews/acks
	4) fixed up a slight conflict in btrfs pointed out by David

Ira Weiny (3):
  fs: Clean up mapping variable
  fs: Move swap_[de]activate to file_operations
  Documentation/fs: Move swap_[de]activate() to file_operations

 Documentation/filesystems/vfs.rst |  24 +--
 fs/btrfs/file.c                   | 341 ++++++++++++++++++++++++++++++
 fs/btrfs/inode.c                  | 340 -----------------------------
 fs/f2fs/data.c                    | 123 -----------
 fs/f2fs/file.c                    | 122 +++++++++++
 fs/iomap/swapfile.c               |   3 +-
 fs/nfs/file.c                     |   4 +-
 fs/xfs/xfs_aops.c                 |  13 --
 fs/xfs/xfs_file.c                 |  12 ++
 include/linux/fs.h                |  10 +-
 mm/swapfile.c                     |  12 +-
 11 files changed, 500 insertions(+), 504 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
