Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5B1F9F6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 01:43:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUgkM-00050B-01; Wed, 13 Nov 2019 00:42:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iUgkK-0004zw-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 00:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uJL139auD+iQk8xrLX5UrhDM1XkRzoa372VoW4NCK4M=; b=YPWjT8YzMxPEu2zHaN7xCVOmrC
 my/oAPL8lrOaOwXSSlRs2ErOU2mHaCPglQvIdQacuQVwiMV7dMsPvqEegV7OxRVBemYI+CoTcQxhc
 88p/X2kBJxwb2jVjRtIHJtkg2fNBVIFDX1A9KAo2YNpzBu97SSslQ9FB0OOzPVhEnnLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uJL139auD+iQk8xrLX5UrhDM1XkRzoa372VoW4NCK4M=; b=a
 uk0rrsPieup/MaWRqXy2oAwnRzPBjLvItqszM1hhDVUPU+Po/BD9UkQjp62Lw/yGRz//o23uwu4uK
 xdGCyUiJhabQwS2ucyhPfF/ZbB0DBdckge4Z4ocDrya7mDCz/VcAMA3I6GhaXC5DCChDbnAL/IWTZ
 eLQkzhxvWZAmh5Ts=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUgkI-00E5t4-R8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 00:42:56 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 16:42:48 -0800
X-IronPort-AV: E=Sophos;i="5.68,298,1569308400"; d="scan'208";a="198274341"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 16:42:47 -0800
From: ira.weiny@intel.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 12 Nov 2019 16:42:42 -0800
Message-Id: <20191113004244.9981-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUgkI-00E5t4-R8
Subject: [f2fs-dev] [PATCH V2 0/2] Move swap functions out of address space
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

 fs/btrfs/file.c     | 341 ++++++++++++++++++++++++++++++++++++++++++++
 fs/btrfs/inode.c    | 340 -------------------------------------------
 fs/f2fs/data.c      | 123 ----------------
 fs/f2fs/file.c      | 122 ++++++++++++++++
 fs/iomap/swapfile.c |   3 +-
 fs/nfs/file.c       |   4 +-
 fs/xfs/xfs_aops.c   |  13 --
 fs/xfs/xfs_file.c   |  12 ++
 include/linux/fs.h  |  10 +-
 mm/swapfile.c       |  12 +-
 10 files changed, 488 insertions(+), 492 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
