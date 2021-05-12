Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230737BFDA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 16:22:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgpks-0005U6-Cd; Wed, 12 May 2021 14:22:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1lgpkq-0005Tz-7v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 14:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eOaFDmaOsRB5SZmY7GZQyJP9EcneAu4wq/VqoZMJKA0=; b=bVYaco51X00oC5U3Fb6L5kQdmC
 J+/G8esRfknGQk80J4FVAEPB7U5eyLq5Nn23wMf0f06JuT9wLDw1xVcU4ioUNwP93qiKEpjI1i9ln
 Cs+Q2Gfr2XEhuqmsdzAqrN26WulW9N/OQGaKvG/SCkfbF4u5uYmbTBih3e8N3vQZNy9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eOaFDmaOsRB5SZmY7GZQyJP9EcneAu4wq/VqoZMJKA0=; b=eKNePrwi/hXdw/H+SiFezix3SX
 ZlYKyIkbePdLj/sgl993WaxT/FPZMofYgsbZeLVoVB4VvRBotfG7/4PZZsgwhQIacpJFQffqzUcDI
 pwAvI0G25r/CmuAF960ofPUY0hzO8EyvMH3lVO5O3kJPm+IN6ci9yluAvWkT/aVK7Ygg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgpki-0004Ui-UN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 14:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eOaFDmaOsRB5SZmY7GZQyJP9EcneAu4wq/VqoZMJKA0=; b=D/FBYaSYWv6OzEkl4olo0BI6C6
 6lwhaao1EEhwuC156MsK3O83RGoowreU8YQfQB3NMNjdeqNmm5y7zT1ognf2xw2tI+5pQvseSWoTe
 jKliduCU0fYTsRdguXHmSopDmUb4S9WFch0Bdz8N0ws+hdznCsYBY4CQulUwmCi/PszXrTlqmY9qd
 7k/qshhU7B+zlB5i0nHn6R28xKI1JV12MkWNr55RMoRVAK3D/eYP/s31H+VF4jzQ05gupekLTW5Ko
 cnXx9fDn8iqGiGckS69vPlSDt6KEM8tPqYc7fF4hwIOF84lMoLJ3N+/YU7f15TMU6uaPJ3XyWf6Ip
 /tBDqokQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lgpjA-008M00-96; Wed, 12 May 2021 14:21:01 +0000
Date: Wed, 12 May 2021 15:20:44 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YJvkPEAdVhM9JsbN@casper.infradead.org>
References: <20210512101639.22278-1-jack@suse.cz>
 <20210512134631.4053-3-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512134631.4053-3-jack@suse.cz>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lgpki-0004Ui-UN
Subject: Re: [f2fs-dev] [PATCH 03/11] mm: Protect operations adding pages to
 page cache with invalidate_lock
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
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 12, 2021 at 03:46:11PM +0200, Jan Kara wrote:

> diff --git a/mm/truncate.c b/mm/truncate.c
> index 57a618c4a0d6..93bde2741e0e 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -415,7 +415,7 @@ EXPORT_SYMBOL(truncate_inode_pages_range);
>   * @mapping: mapping to truncate
>   * @lstart: offset from which to truncate
>   *
> - * Called under (and serialised by) inode->i_rwsem.
> + * Called under (and serialised by) inode->i_rwsem and inode->i_mapping_rwsem.

mapping->invalidate_lock, surely?  And could we ask lockdep to assert
this for us instead of just a comment?

>   *
>   * Note: When this function returns, there can be a page in the process of
>   * deletion (inside __delete_from_page_cache()) in the specified range.  Thus
> -- 
> 2.26.2
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
