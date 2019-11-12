Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06564F85D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Nov 2019 02:02:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUKZ9-00060J-00; Tue, 12 Nov 2019 01:01:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1iUKZ7-00060A-7V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 01:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AGvQXBKfT9SNw/s8tPLKHZiFM8WAR8h/hrmDSL6fNe4=; b=ivk7XBYc8ymzNeEN7jP8Pc/pEQ
 yyLN6fBIfHrwW2gboo+iwGzsD6jSGnWer9HG38rw/F36FBn4pb9god06O2G1NQ0ljg64sHqDdcJ5D
 JU2P+3tZiO/2pYgwv9sfyrGs7gtncbubgZPAboOdQekSES7/9U2k6gnKarmp8oeQT+BU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AGvQXBKfT9SNw/s8tPLKHZiFM8WAR8h/hrmDSL6fNe4=; b=QfRqfyUWstndfAOsTLSlrIObQy
 uQhO9VSaCCdc1mEiCmLiRYQfl+xZZ6RA6Nn5uwtoPO6QLw+jUGvS9NlWbHIW2+MRznSdWcI7d76n8
 Ft35sQLA1l/LP17bUsB21EVGZjZvm3VILEGXOSc8MuMEY3eTlPWSNYjOAqHJb5xKqSBA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUKZ6-00CebG-1A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Nov 2019 01:01:53 +0000
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D337121872;
 Tue, 12 Nov 2019 00:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573519401;
 bh=2ydOdcJmPK7SfwcXHI6Om5OCHngakPJ/DYZhOTWW10o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SOzp8l2jF+hnRTMM8q4NciR40xpr2wA8IEZXzXLtzty1uJCCAHC48frwRoMrmhIgj
 /7KlrVHe8GSSQzkgLciyKV6Wjc2QrBzyUz7KSoNvmSZmxLcVP9FF5gG3lBZZ8iYeIs
 16TeSWpaFSFmQYkdL5nMvM/M08VwG7jCggvpqX5s=
Date: Mon, 11 Nov 2019 16:43:20 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: ira.weiny@intel.com
Message-Id: <20191111164320.80f814161469055b14f27045@linux-foundation.org>
In-Reply-To: <20191112003452.4756-3-ira.weiny@intel.com>
References: <20191112003452.4756-1-ira.weiny@intel.com>
 <20191112003452.4756-3-ira.weiny@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUKZ6-00CebG-1A
Subject: Re: [f2fs-dev] [PATCH 2/2] fs: Move swap_[de]activate to
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
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, Josef Bacik <josef@toxicpanda.com>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 11 Nov 2019 16:34:52 -0800 ira.weiny@intel.com wrote:

> From: Ira Weiny <ira.weiny@intel.com>
> 
> swap_activate() and swap_deactivate() have nothing to do with
> address spaces.  We want to eventually make the address space operations
> dynamic to switch inode flags on the fly.

What does this mean?

>  So to simplify this code as
> well as properly track these operations we move these functions to the
> file_operations vector.
> 
> This has been tested with XFS but not NFS, f2fs, or btrfs.
> 
> Also note f2fs and xfs have simple moves of their functions to
> facilitate compilation.  No functional changes are contained within
> those functions.
>
> ...
>
> --- a/fs/btrfs/inode.c
> +++ b/fs/btrfs/inode.c
> @@ -11002,6 +11002,8 @@ static const struct file_operations btrfs_dir_file_operations = {
>  #endif
>  	.release        = btrfs_release_file,
>  	.fsync		= btrfs_sync_file,
> +	.swap_activate	= btrfs_swap_activate,
> +	.swap_deactivate = btrfs_swap_deactivate,
>  };

Shouldn't this be btrfs_file_operations?




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
