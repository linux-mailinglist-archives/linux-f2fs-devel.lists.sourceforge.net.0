Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AB0FD175
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Nov 2019 00:19:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVOOm-0004Iz-FD; Thu, 14 Nov 2019 23:19:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1iVOOl-0004Io-NG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 23:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=08h0LDb6JQiAw1bR5KtD6mA/cmvGQIoQ/zS+jaLnPPY=; b=ezpFLIIwRF1j18OpMS+7TKMn8y
 YnsmgOZ2UeoIE0fs7ozMkhId4OxUZo/TetXjg/MFXXoaWb6olgaPoTWAnZBwxSaM5bh8krh35dHMa
 VXceJ6Meos97J5Cu1YHGMCr5yffiz3UgbLHxBYODgpil3bJFjx1E2zIJ2E6VVqLkav7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=08h0LDb6JQiAw1bR5KtD6mA/cmvGQIoQ/zS+jaLnPPY=; b=cxd82wzfNdqGeyJorllmpRo23B
 NgB+df0HCX4Pw5CEl2cHeMI8VYRPZMEDfVUpFfDcnVPadky+tinq87h3RmhUzeGAN/NS/SXTubkoQ
 BObxCf02+FSeiukKdkXI99acEyRAavVs5srL/M5WgWD1QCXnLqVXfGpLubNayLUlit+U=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVOOh-003vip-Mw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 23:19:35 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 15:19:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,306,1569308400"; d="scan'208";a="207950534"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 15:19:24 -0800
Date: Thu, 14 Nov 2019 15:19:24 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20191114231924.GA4370@iweiny-DESK2.sc.intel.com>
References: <20191113004244.9981-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113004244.9981-1-ira.weiny@intel.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iVOOh-003vip-Mw
Subject: Re: [f2fs-dev] [PATCH V2 0/2] Move swap functions out of address
 space operations
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
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 12, 2019 at 04:42:42PM -0800, 'Ira Weiny' wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> As suggested by Jan Kara, move swap_[de]activate to file_operations to simplify
> address space operations for coming changes.
> 
> I'm not sure if this should go through Al Viro or Andrew Morton so I'm sending
> it to both of you.  Sorry if this is a problem.  Let me know if there is
> something else I should do.
> 
> Ira Weiny (2):
>   fs: Clean up mapping variable
>   fs: Move swap_[de]activate to file_operations

There should have been an update to the documentation with this.

I have a 3rd patch which I'm sending separately.

Ira

> 
>  fs/btrfs/file.c     | 341 ++++++++++++++++++++++++++++++++++++++++++++
>  fs/btrfs/inode.c    | 340 -------------------------------------------
>  fs/f2fs/data.c      | 123 ----------------
>  fs/f2fs/file.c      | 122 ++++++++++++++++
>  fs/iomap/swapfile.c |   3 +-
>  fs/nfs/file.c       |   4 +-
>  fs/xfs/xfs_aops.c   |  13 --
>  fs/xfs/xfs_file.c   |  12 ++
>  include/linux/fs.h  |  10 +-
>  mm/swapfile.c       |  12 +-
>  10 files changed, 488 insertions(+), 492 deletions(-)
> 
> -- 
> 2.21.0
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
