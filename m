Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C07637C367
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 17:19:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgqeT-0007mU-MD; Wed, 12 May 2021 15:19:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jlayton@kernel.org>) id 1lgqeR-0007mE-UY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 15:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iY4wgvfRa06L3ZtNsPYW0mfJyyrHCRhlvETBZgFI+/k=; b=Q1aDlqE1S+gUcZRcdvxqwNSBKw
 zGgeq96xzcoTx/Eu1dCEgYSEXhDIn7/6PjgEIKxFI7aq1A34IklNYcx7T/uaLxksgzSoqJqF9DVfA
 78zJVrR+feOFDm8W1HT5ZIe0oDhSR5clFKVgsoY9PLkcORk+4rumaqTa5cEbWce6My88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iY4wgvfRa06L3ZtNsPYW0mfJyyrHCRhlvETBZgFI+/k=; b=I7FYjMxiCb9uFIecPC7bqyERXb
 MBsTpsIUYxMQBRuCwhgVWizMYdopswWBCelG+4AiwzTo3mq3gKW0GlYmyGtm96hIf8fZkBXm4vItF
 wPE5MICmCu8krFhkMurrP+tlWDDdhcIlWKQBLBFe7tTKTVJS3Kd0wfICmXVJ+l4Mg694=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgqeN-005az3-OU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 15:19:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FE946199C;
 Wed, 12 May 2021 15:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620832786;
 bh=T6Lawv7Kod9ZP9zSPqwbupin2WcFezRDjXSRCBkOee4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=RzoUHhzFYiv2mtULMxmuDjagPgzgmkXMANmRZzUsOFxZe0EJoOdJoI3UeoFiOgeLS
 ZyA4AxCMiJhrZA/Fiju1k5YBKiFqLSd9zFJtLQACa78I5W1/6MkA8ZnX0EzN5LKkyF
 SJNsE13kpG0/OVLi7EdkVnW6rECToZBiP5iqhnvpFcE9ZXjTvFiD1aTtp3gOHHUGfM
 fMXm3oeOLg7xhFSqSKUwpvfbZQOt2+gfmyDcCcL5Hr2CdCCFrzzcCHc1yY4SOzKPzC
 rYL6CqUJiyBelQ3xfS/7gnKKMEptiDJdQ4f1xx072iW3pINIo74zk93ewlLedh1V5h
 p+g3aZCSUx3CQ==
Message-ID: <bc8f0ab096e1a7d8ba29655247de7b2c2abfd5f1.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, Ilya Dryomov
 <idryomov@gmail.com>
Date: Wed, 12 May 2021 11:19:42 -0400
In-Reply-To: <20210512134631.4053-10-jack@suse.cz>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-10-jack@suse.cz>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgqeN-005az3-OU
Subject: Re: [f2fs-dev] [PATCH 10/11] ceph: Fix race between hole punch and
 page fault
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>, "Darrick J.
 Wong" <darrick.wong@oracle.com>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2021-05-12 at 15:46 +0200, Jan Kara wrote:
> Ceph has a following race between hole punching and page fault:
> 
> CPU1                                  CPU2
> ceph_fallocate()
>   ...
>   ceph_zero_pagecache_range()
>                                       ceph_filemap_fault()
>                                         faults in page in the range being
>                                         punched
>   ceph_zero_objects()
> 
> And now we have a page in punched range with invalid data. Fix the
> problem by using mapping->invalidate_lock similarly to other
> filesystems. Note that using invalidate_lock also fixes a similar race
> wrt ->readpage().
> 
> CC: Jeff Layton <jlayton@kernel.org>
> CC: ceph-devel@vger.kernel.org
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/ceph/addr.c | 9 ++++++---
>  fs/ceph/file.c | 2 ++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index c1570fada3d8..6d868faf97b5 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1401,9 +1401,11 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
>  		ret = VM_FAULT_SIGBUS;
>  	} else {
>  		struct address_space *mapping = inode->i_mapping;
> -		struct page *page = find_or_create_page(mapping, 0,
> -						mapping_gfp_constraint(mapping,
> -						~__GFP_FS));
> +		struct page *page;
> +
> +		down_read(&mapping->invalidate_lock);
> +		page = find_or_create_page(mapping, 0,
> +				mapping_gfp_constraint(mapping, ~__GFP_FS));
>  		if (!page) {
>  			ret = VM_FAULT_OOM;
>  			goto out_inline;
> @@ -1424,6 +1426,7 @@ static vm_fault_t ceph_filemap_fault(struct vm_fault *vmf)
>  		vmf->page = page;
>  		ret = VM_FAULT_MAJOR | VM_FAULT_LOCKED;
>  out_inline:
> +		up_read(&mapping->invalidate_lock);
>  		dout("filemap_fault %p %llu read inline data ret %x\n",
>  		     inode, off, ret);
>  	}
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index 77fc037d5beb..91693d8b458e 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -2083,6 +2083,7 @@ static long ceph_fallocate(struct file *file, int mode,
>  	if (ret < 0)
>  		goto unlock;
>  
> +	down_write(&inode->i_mapping->invalidate_lock);
>  	ceph_zero_pagecache_range(inode, offset, length);
>  	ret = ceph_zero_objects(inode, offset, length);
>  
> @@ -2095,6 +2096,7 @@ static long ceph_fallocate(struct file *file, int mode,
>  		if (dirty)
>  			__mark_inode_dirty(inode, dirty);
>  	}
> +	up_write(&inode->i_mapping->invalidate_lock);
>  
>  	ceph_put_cap_refs(ci, got);
>  unlock:

Assuming the basic concept is sound, then this looks reasonable. 

Reviewed-by: Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
