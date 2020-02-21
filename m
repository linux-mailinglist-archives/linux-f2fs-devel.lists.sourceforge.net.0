Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24317168996
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 22:49:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5GAb-0008PO-FY; Fri, 21 Feb 2020 21:49:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j5GAa-0008PG-7o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 21:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MjU0vaJ+i1WQ4UQpS8eKlaynh2uwVXzGNQNy57Q9C9k=; b=NuIvUjBOokbHK4N9OEzrv+R0oH
 /kJTUoYNhF9v3qBAYdaxunKXcCYALGTVJKybRAXsdi9S+ZkKvN1diIreoG3bN8zQTgnYVrlZSso5c
 ffI/r01wq6bOE6M+Fv4vzgP/VVtBLvmTuRSeWInQ98/0OzBvaNFHjq7YrWBJFQA6Ya80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MjU0vaJ+i1WQ4UQpS8eKlaynh2uwVXzGNQNy57Q9C9k=; b=Zhqrp9Ii3Z/kaUClE+W4KcVpoq
 Ifgs1D/bB/vSI9LuIrR4OGlIp/yrPTSzpy7bvS+XU6Qep5rHrSJ4bMm9xtSN5Jfy3axv8W/J5Mjcz
 21fe9k/+Qxpxy4Z32rI6pmbf8q9c5PAlYX4nkKvPZPoSkC0KncQqR462/OkDnMadJGVQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5GAW-00EVP2-95
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 21:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MjU0vaJ+i1WQ4UQpS8eKlaynh2uwVXzGNQNy57Q9C9k=; b=iCNdT0BZXgtTW3Fw9E7mV20LZ3
 6bABfCOOFRCJ7uEiieuVoc7VQvPYz9c1AqPQS7RqHIO2SPtmECRCJ7fINKg3kWrEwzycOHzoI2EXq
 gb8xBz4Q6YqdlmdYSYmNzPYMGLnkARpEro+4SyAMM0qv/bPjVCXcHHSSe2kepGwYnmLclyWoT72Ri
 xVH+asjJnQ5gia6IN546JKq8u1xVU9xK4MZ7CcV53GDFQceXlwOtV+auqB/eJnS3NjFkIZuYn1p/U
 bzlnG8k5S9m/fPbCpIe+WYxJl419e2ENRT98jQ6jjA5WKiplo70Ono1aN5F+tvL7N8eBzKyaRDymg
 11ulvQcg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5GAH-0001lk-Uz; Fri, 21 Feb 2020 21:48:53 +0000
Date: Fri, 21 Feb 2020 13:48:53 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200221214853.GF24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-2-willy@infradead.org>
 <e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e065679e-222f-7323-9782-0c4471bb9233@nvidia.com>
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
X-Headers-End: 1j5GAW-00EVP2-95
Subject: Re: [f2fs-dev] [PATCH v7 01/24] mm: Move readahead prototypes from
 mm.h
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

On Thu, Feb 20, 2020 at 06:43:31PM -0800, John Hubbard wrote:
> Yes. But I think these files also need a similar change:
> 
>     fs/btrfs/disk-io.c

That gets pagemap.h through ctree.h, so I think it's fine.  It's
already using mapping_set_gfp_mask(), so it already depends on pagemap.h.

>     fs/nfs/super.c

That gets it through linux/nfs_fs.h.

I was reluctant to not add it to blk-core.c because it doesn't seem
necessarily intuitive that the block device core would include pagemap.h.

That said, blkdev.h does include pagemap.h, so maybe I don't need to
include it here.

> ...because they also use VM_READAHEAD_PAGES, and do not directly include
> pagemap.h yet.

> > +#define VM_READAHEAD_PAGES	(SZ_128K / PAGE_SIZE)
> > +
> > +void page_cache_sync_readahead(struct address_space *, struct file_ra_state *,
> > +		struct file *, pgoff_t index, unsigned long req_count);
> 
> Yes, "struct address_space *mapping" is weird, but I don't know if it's
> "misleading", given that it's actually one of the things you have to learn
> right from the beginning, with linux-mm, right? Or is that about to change?
> 
> I'm not asking to restore this to "struct address_space *mapping", but I thought
> it's worth mentioning out loud, especially if you or others are planning on
> changing those names or something. Just curious.

No plans (on my part) to change the name, although I have heard people
grumbling that there's very little need for it to be a separate struct
from inode, except for the benefit of coda, which is not exactly a
filesystem with a lot of users ...

Anyway, no plans to change it.  If there were something _special_ about
it like a theoretical:

void mapping_dedup(struct address_space *canonical,
		struct address_space *victim);

then that's useful information and shouldn't be deleted.  But I don't
think the word 'mapping' there conveys anything useful (other than the
convention is to call a 'struct address_space' a mapping, which you'll
see soon enough once you look at any of the .c files).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
