Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D0F8567
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 01:35:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUK9C-0001VV-Tk; Tue, 12 Nov 2019 00:35:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUK9B-0001VG-7w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 00:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5m8Bauhp5QooBzi/e/tcuTnNFkqVvZpaWM6BlYcPL3c=; b=VGgcmv/gM/yfuWtSk80b58IBfW
 VZVw9SeDQ4dZe6ajq3b20qNyfkqtjrT92hH89PXCwOHoemu9xKRmcBfBTw0ZEgUsVPhgVJwCKGnyK
 d/YjyPQ8u1Z1zCzlS8JbLjrCh/d4ixFk7C6MfNIFytq7xfhKHGsGmqOYSWnPitCKJId0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5m8Bauhp5QooBzi/e/tcuTnNFkqVvZpaWM6BlYcPL3c=; b=i
 DaC63VqgIcOVxrc4PXEKStt/cZYCrC1r8vjthMWp/WVfEot7YtRva9qenoje0M0MUVJe4W9/4wmty
 T2ML7Db4aHR5GRjBXNJyJZDJlk3e9E9PnwUdpFTj7n/RrAmLFs7JRwGU3k7osyoRc/kMkmlxUqBsC
 nNhwdba+BBhGLy9A=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUK99-00CkrI-9n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 00:35:05 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 16:34:56 -0800
X-IronPort-AV: E=Sophos;i="5.68,294,1569308400"; d="scan'208";a="229127871"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 16:34:56 -0800
From: ira.weiny@intel.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 11 Nov 2019 16:34:50 -0800
Message-Id: <20191112003452.4756-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.20.1
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
X-Headers-End: 1iUK99-00CkrI-9n
Subject: [f2fs-dev] [PATCH 0/2] Move swap functions out of address space
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
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Ira Weiny <ira.weiny@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

As suggested by Jan Kara, move swap_[de]activate to file_operations to simplify
address space operations for coming changes.

I'm not sure if this should go through Al Viro or Andrew Morton so I'm sending
it to both of you.  Sorry if this is a problem.  Let me know if there is
something else I should do.

Ira Weiny (2):
  fs: Clean up mapping variable
  fs: Move swap_[de]activate to file_operations

 fs/btrfs/inode.c    |   4 +-
 fs/f2fs/data.c      | 123 --------------------------------------------
 fs/f2fs/file.c      | 122 +++++++++++++++++++++++++++++++++++++++++++
 fs/iomap/swapfile.c |   3 +-
 fs/nfs/file.c       |   4 +-
 fs/xfs/xfs_aops.c   |  13 -----
 fs/xfs/xfs_file.c   |  12 +++++
 include/linux/fs.h  |  10 ++--
 mm/swapfile.c       |  12 ++---
 9 files changed, 149 insertions(+), 154 deletions(-)

-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
