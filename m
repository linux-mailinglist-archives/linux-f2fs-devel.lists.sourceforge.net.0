Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF973163A18
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 03:23:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4F1H-0006Ty-3h; Wed, 19 Feb 2020 02:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4F1F-0006Ta-AV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AmBYu3mpTxz55oEbZdrXdPhOFuVVUVpBKAkDMjhC+bk=; b=MXoYEBiTWh13aQIi7Z2jBr1CA/
 AMRsLl+bvSNo/AfM/yNUQsZQ0LdQJEYbC9LP5unzxUKV+iOk8BhJ9QOi7vSiYAOw1muhSGPHMlJ0B
 xjf8mWRR8/aE12q0W7dSH+6+hiMQUY5amovGgYxX5OTkO5cjqVHe/CUguPOGShL3Aqtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AmBYu3mpTxz55oEbZdrXdPhOFuVVUVpBKAkDMjhC+bk=; b=EieaeMPmVkZXg6LexxE7IB2pR9
 He20eyaPVkzMriwoAqY9XTfNIZjADms4GpAv0Et7DaB56XztYf5uJuMaCMLCybTcCN0D/eNgx03Ve
 nE8S+N7rPyrmK2ZailrC+mwtV9bQee1rypxw25yvPiw7aoGVd+DwmA87tMq9vz1IPSaQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4F1D-007VU6-AN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AmBYu3mpTxz55oEbZdrXdPhOFuVVUVpBKAkDMjhC+bk=; b=ZnvNzleUFxBP7YT/XJ7y0Rz/bu
 VkddBEMMXKNPUEPIHNmeV0img3eiMCgmTDLWhnmF0LgRkhumSClEFtJ8h9QNQ1gTWJ7cQ7oYl5y2T
 LQq1+MXm3VWWly+rUeCiBOlqF7kPYFOalIjZFbqYzu76qbt0PLrQYATKJKLlxP1jWBvgL8vVEl1oK
 PZK3QLY1XvI1RwzN3cfFLeaib3/PQmj6eNOnYQSQu+wNZ3jLp3NgdPPwpBmDQq/4dju6xWjfr9B1l
 Je53RqtXvIb3d5xbLSBBBArNi+TgTTRpln+YO9xoRn4KQfP+zLPQhoOJyXxsL0Z4nCcXJHdASLsqc
 D4fDP3AQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4F0v-0003R5-2P; Wed, 19 Feb 2020 02:23:01 +0000
Date: Tue, 18 Feb 2020 18:23:00 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200219022300.GJ24185@bombadil.infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-16-willy@infradead.org>
 <1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1263603d-f446-c447-2eac-697d105fa76c@nvidia.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4F1D-007VU6-AN
Subject: Re: [f2fs-dev] [PATCH v6 09/19] mm: Add page_cache_readahead_limit
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 18, 2020 at 05:32:31PM -0800, John Hubbard wrote:
> > +			page_cache_readahead_limit(inode->i_mapping, NULL,
> > +					index, LONG_MAX, num_ra_pages, 0);
> 
> 
> LONG_MAX seems bold at first, but then again I can't think of anything smaller 
> that makes any sense, and the previous code didn't have a limit either...OK.

Probably worth looking at Dave's review of this and what we've just
negotiated on the other subthread ... LONG_MAX is gone.

> I also wondered about the NULL file parameter, and wonder if we're stripping out
> information that is needed for authentication, given that that's what the newly
> written kerneldoc says the "file" arg is for. But it seems that if we're this 
> deep in the fs code's read routines, file system authentication has long since 
> been addressed.

The authentication is for network filesystems.  Local filesystems
generally don't use the 'file' parameter, and since we're going to be
calling back into the filesystem's own readahead routine, we know it's
not needed.

> Any actually I don't yet (still working through the patches) see any authentication,
> so maybe that parameter will turn out to be unnecessary.
> 
> Anyway, It's nice to see this factored out into a single routine.

I'm kind of thinking about pushing the rac in the other direction too,
so page_cache_readahead_unlimited(rac, nr_to_read, lookahead_size).

> > +/**
> > + * page_cache_readahead_limit - Start readahead beyond a file's i_size.
> 
> 
> Maybe: 
> 
>     "Start readahead to a caller-specified end point" ?
> 
> (It's only *potentially* beyond files's i_size.)

My current tree has:
 * page_cache_readahead_exceed - Start unchecked readahead.


> > + * @mapping: File address space.
> > + * @file: This instance of the open file; used for authentication.
> > + * @offset: First page index to read.
> > + * @end_index: The maximum page index to read.
> > + * @nr_to_read: The number of pages to read.
> 
> 
> How about:
> 
>     "The number of pages to read, as long as end_index is not exceeded."

API change makes this irrelevant ;-)

> > + * @lookahead_size: Where to start the next readahead.
> 
> Pre-existing, but...it's hard to understand how a size is "where to start".
> Should we rename this arg?

It should probably be lookahead_count.

> > + *
> > + * This function is for filesystems to call when they want to start
> > + * readahead potentially beyond a file's stated i_size.  If you want
> > + * to start readahead on a normal file, you probably want to call
> > + * page_cache_async_readahead() or page_cache_sync_readahead() instead.
> > + *
> > + * Context: File is referenced by caller.  Mutexes may be held by caller.
> > + * May sleep, but will not reenter filesystem to reclaim memory.
> 
> In fact, can we say "must not reenter filesystem"? 

I think it depends which side of the API you're looking at which wording
you prefer ;-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
