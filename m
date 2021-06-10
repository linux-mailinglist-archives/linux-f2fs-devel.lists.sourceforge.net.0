Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85F3A27C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jun 2021 11:07:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrGek-00008T-0b; Thu, 10 Jun 2021 09:07:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ming.lei@redhat.com>) id 1lrGeh-000087-NL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 09:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=361/Mv7Fre9yzH+UkaH8Am6n4w1iJ449u+nGkGfSsgU=; b=L7Fl45V7aM6Z/eXHzlv//jvjkQ
 WCwFxyJPo0TyWTUGWzoFERSn5cU/1jaMEAC3T4AhMtRlKv/XfOeho9cFOUGdc7n1fkoy6DhxsCdv8
 Q7U15WBzGHVm7vrA2r77A5l7uQMdmw/qz80RyBwHobzQqhmwAV2PZ8WJoPt/XhFH76zY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=361/Mv7Fre9yzH+UkaH8Am6n4w1iJ449u+nGkGfSsgU=; b=K/j2SJwjsq0QUAkMQ9DBfBhZKz
 IBgIjcnyFOV5vxTSUOtsQQJkHdZJaftcFHur/L0RBdr+h4UsIkJ937pVbt8nXxQ1diAfb/4VUW3FN
 78b5C2U3gVouLzf8t6CqphjaUVDiIsfP4qQzM3i5EHZzc9YqiFAFFDvPaLfwWX28HsMc=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lrGed-0000qn-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 09:07:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=361/Mv7Fre9yzH+UkaH8Am6n4w1iJ449u+nGkGfSsgU=;
 b=Qp8jrJM7UOkeF+RIUG2HEyNjLcfSemPNZcrXOxRP24MW8nOWnFt5bx1ZFyv4uWW4oGukLp
 BePP5U//wshkgc9QL8dlJfu3g0XVG5jkj0ooD3sJsve1axTMVLirbSR0W6/oXEaXqz9yHt
 Zt0YZdsSvSsGAsZ446atOMNhUy/8FGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-5j4c0fCIN22TQ8P_CUs7aw-1; Thu, 10 Jun 2021 05:07:03 -0400
X-MC-Unique: 5j4c0fCIN22TQ8P_CUs7aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD06185060A;
 Thu, 10 Jun 2021 09:06:59 +0000 (UTC)
Received: from T590 (ovpn-13-145.pek2.redhat.com [10.72.13.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0092660917;
 Thu, 10 Jun 2021 09:06:46 +0000 (UTC)
Date: Thu, 10 Jun 2021 17:06:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMHWIcbnLPW5AfiC@T590>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607145236.31852-1-jack@suse.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [216.205.24.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lrGed-0000qn-Lz
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 Hugh Dickins <hughd@google.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 07, 2021 at 04:52:11PM +0200, Jan Kara wrote:
> inode->i_mutex has been replaced with inode->i_rwsem long ago. Fix
> comments still mentioning i_mutex.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Hugh Dickins <hughd@google.com>
> Signed-off-by: Jan Kara <jack@suse.cz>
> ---

...

> diff --git a/mm/rmap.c b/mm/rmap.c
> index 693a610e181d..a35cbbbded0d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -20,9 +20,9 @@
>  /*
>   * Lock ordering in mm:
>   *
> - * inode->i_mutex	(while writing or truncating, not reading or faulting)
> + * inode->i_rwsem	(while writing or truncating, not reading or faulting)
>   *   mm->mmap_lock
> - *     page->flags PG_locked (lock_page)   * (see huegtlbfs below)
> + *     page->flags PG_locked (lock_page)   * (see hugetlbfs below)
>   *       hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share)
>   *         mapping->i_mmap_rwsem
>   *           hugetlb_fault_mutex (hugetlbfs specific page fault mutex)
> @@ -41,7 +41,7 @@
>   *                             in arch-dependent flush_dcache_mmap_lock,
>   *                             within bdi.wb->list_lock in __sync_single_inode)
>   *
> - * anon_vma->rwsem,mapping->i_mutex      (memory_failure, collect_procs_anon)
> + * anon_vma->rwsem,mapping->i_mmap_rwsem   (memory_failure, collect_procs_anon)

This one looks a typo.

-- 
Ming



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
