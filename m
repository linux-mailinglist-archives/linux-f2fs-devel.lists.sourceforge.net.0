Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F704FB3AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 16:25:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUuWR-0004bw-PC; Wed, 13 Nov 2019 15:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>) id 1iUuWQ-0004bp-W9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 15:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DwCmMvHq7M7Q9dJLkPH27Y7MJUmTVB6KJ+HTScspDIs=; b=C/nUhxkeOcWKJQ0tYJWIufiMCC
 /82IKEAc4hwtCc4STCBN1J+/vzDOxVAdTioMfLMugZHXBTuepTfmw1QetHUJxBehmzwoQ6rLGw7SN
 pqHjtDlg+WlnzfopI2N++UAaqgLztaxgUtA7j2+psc1O3uLew9+eGpLFiTJLDUMvtAO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DwCmMvHq7M7Q9dJLkPH27Y7MJUmTVB6KJ+HTScspDIs=; b=d2R9WovNl31PlrJsIIRpjBs4oF
 u5D1oVPmyxZyTeq4oZOoh5uLO9veIeMkvh0nbcxPpcub8I5Bs9O965gG2UQYvovG+iYCkU7kDMmE/
 vZPiuvHAC61MvzU1vpTwOXXV0Slj5v/GCaX0v54a0uo2iC1n3GorF4J8RB6mLBxu7fvE=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUuWO-00FG14-Pb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 15:25:30 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A799B483;
 Wed, 13 Nov 2019 15:25:21 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 966E7DA7E8; Wed, 13 Nov 2019 16:25:22 +0100 (CET)
Date: Wed, 13 Nov 2019 16:25:22 +0100
From: David Sterba <dsterba@suse.cz>
To: ira.weiny@intel.com
Message-ID: <20191113152522.GF3001@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, ira.weiny@intel.com,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, Dave Chinner <david@fromorbit.com>,
 Jan Kara <jack@suse.cz>
References: <20191113004244.9981-1-ira.weiny@intel.com>
 <20191113004244.9981-3-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113004244.9981-3-ira.weiny@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iUuWO-00FG14-Pb
Subject: Re: [f2fs-dev] [PATCH V2 2/2] fs: Move swap_[de]activate to
 file_operations
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
Reply-To: dsterba@suse.cz
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 12, 2019 at 04:42:44PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> swap_activate() and swap_deactivate() have nothing to do with address
> spaces.  We want to be able to change the address space operations on
> the fly to allow changing inode flags dynamically.
> 
> Switching address space operations can be difficult to do reliably.[1]
> Therefore, to simplify switching address space operations we reduce the
> number of functions in those operations by moving swap_activate() and
> swap_deactivate() out of the address space operations.
> 
> No functionality is changed with this patch.
> 
> This has been tested with XFS but not NFS, f2fs, or btrfs.
> 
> Also note we move some functions to facilitate compilation.  But there
> are no functional changes are contained within those diffs.
> 
> [1] https://lkml.org/lkml/2019/11/11/572
> 
> Cc: Dave Chinner <david@fromorbit.com>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V0:
> 	Update cover letter.
> 	fix btrfs as per Andrew's comments
> 	change xfs_iomap_swapfile_activate() to xfs_file_swap_activate()
> 
> Changes from V1:
> 	Update recipients list
> 
> 
>  fs/btrfs/file.c    | 341 +++++++++++++++++++++++++++++++++++++++++++++
>  fs/btrfs/inode.c   | 340 --------------------------------------------

For the btrfs part

Acked-by: David Sterba <dsterba@suse.com>

There's going to be a minor conflict with current 5.5 queue, the
resolution is simple rename of btrfs_block_group_cache to btrfs_block_group.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
