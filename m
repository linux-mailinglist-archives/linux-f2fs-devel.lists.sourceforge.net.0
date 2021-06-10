Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 954993A2989
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jun 2021 12:41:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrI7m-0001VK-An; Thu, 10 Jun 2021 10:41:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lrI7O-0001UP-V8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 10:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e69p7cSpTPxrgycR/WxxaL+1l2Iy0njG9LV0PDer+c4=; b=ggExYkneUOpZ8NnCCsCUCMpAaP
 kCE7Cu9QDUGifGsJ6fxJjHw+hbyAwOlU6jgdx8juY5px7KVrwUk8FA6m/Pppp3+41f1LBWWYB3TWz
 RnzMmUEyYiXmKsVLndlLpEayz8iVyEZRJsYRmdk/9ZXAV36M3mLV6mF5QFUoCitgM+PM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e69p7cSpTPxrgycR/WxxaL+1l2Iy0njG9LV0PDer+c4=; b=VMS5wAgqhO6n9HzppDhlWRZHey
 5+VA8N/k5KiD90m7MjgN0jSfyIulP1sda5Qhswf5xvjcS/AVuRvuYkbLqg9O6JEt15USKZv/XOnDe
 UkaHndNj2L/k1qw+Pm8OCfzvVsIBHtPAiq/49/23/RY7Mql/GZGw+u9zcrADQgKXCtYI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lrI7L-0006iN-Po
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 10:41:01 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BB0721FD47;
 Thu, 10 Jun 2021 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623321648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e69p7cSpTPxrgycR/WxxaL+1l2Iy0njG9LV0PDer+c4=;
 b=WNzicnn9I9Uzi3rhrzU3g34rvVnvDxp/dzgOfJ8QelNeJaO+n3iduUNFK/9KFkm8z8EeQW
 NL1SjEN/b720E7re5xPsC8EubYb6b5KZXIu9/vLgcdL89PUhpyLXDk4QFY4xIwUI5aT9rc
 RHr+TtYt2pnBErVijdh7TG9nIRAFQQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623321648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e69p7cSpTPxrgycR/WxxaL+1l2Iy0njG9LV0PDer+c4=;
 b=ldzR16nIFLY7YSLUeT9j/700yV/caPCby06yFrv/SQbZy/V+JI6iP9FH6mfkFJSIwBuRfv
 KhEDZH21lxejVFDA==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 24988A3B8B;
 Thu, 10 Jun 2021 10:40:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E025A1F2CAB; Thu, 10 Jun 2021 12:40:47 +0200 (CEST)
Date: Thu, 10 Jun 2021 12:40:47 +0200
From: Jan Kara <jack@suse.cz>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210610104047.GA23539@quack2.suse.cz>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-1-jack@suse.cz> <YMHWIcbnLPW5AfiC@T590>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMHWIcbnLPW5AfiC@T590>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lrI7L-0006iN-Po
Subject: Re: [f2fs-dev] [PATCH 01/14] mm: Fix comments mentioning i_mutex
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
Cc: Jan Kara <jack@suse.cz>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 10-06-21 17:06:41, Ming Lei wrote:
> On Mon, Jun 07, 2021 at 04:52:11PM +0200, Jan Kara wrote:
> > inode->i_mutex has been replaced with inode->i_rwsem long ago. Fix
> > comments still mentioning i_mutex.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: Hugh Dickins <hughd@google.com>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> 
> ...
> 
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 693a610e181d..a35cbbbded0d 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -20,9 +20,9 @@
> >  /*
> >   * Lock ordering in mm:
> >   *
> > - * inode->i_mutex	(while writing or truncating, not reading or faulting)
> > + * inode->i_rwsem	(while writing or truncating, not reading or faulting)
> >   *   mm->mmap_lock
> > - *     page->flags PG_locked (lock_page)   * (see huegtlbfs below)
> > + *     page->flags PG_locked (lock_page)   * (see hugetlbfs below)
> >   *       hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
> >   *         mapping->i_mmap_rwsem
> >   *           hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
> > @@ -41,7 +41,7 @@
> >   *                             in arch-dependent flush_dcache_mmap_lock,
> >   *                             within bdi.wb->list_lock in __sync_single_inode)
> >   *
> > - * anon_vma->rwsem,mapping->i_mutex      (memory_failure, collect_procs_anon)
> > + * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs_anon)
> 
> This one looks a typo.

Actually it isn't a typo. Memory failure path doesn't touch inode->i_rwsem
at all. It uses mapping->i_mmap_rwsem in collect_procs_file(). So perhaps
the functions listed there should be updated to (collect_procs_anon(),
collect_procs_file()) but the lock name change is IMO correct.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
