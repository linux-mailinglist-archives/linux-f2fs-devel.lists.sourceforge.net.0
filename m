Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9550788B89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Aug 2023 16:21:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZXgh-0005G6-Lg;
	Fri, 25 Aug 2023 14:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qZXgd-0005G0-69
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rIMc/jDCj9ILMqoJd0dO659w/9cB73A1MIGl7MCNQc0=; b=HnM0n5L6Zzx3H3IDo97NTokC66
 KHTRzZ1eDCw+xVqf97tBtF5hftdhhdAmtnQi0C2YOyPgzzoxSQ7lZe23QKn7C4YKNG0zCk7blGuxi
 uiBWMTqYrPGHG/mkeiYbyRS1eWpJ3+YAdOZ2dLDJtIAKJyRWJ5VJyZWHYmDbiYl3k27w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rIMc/jDCj9ILMqoJd0dO659w/9cB73A1MIGl7MCNQc0=; b=Aizyk2WmRndrdxOan8TqSSGY/C
 j68k+UWoCTdsNLL85E3N2zuAa++x5B2pChFF2UL56B4NO8jPxZ2Ib3F2vFW2v54j03lRr4j216Q7T
 dynxyQkPU6mr3m+lC7xLJ7mJEcUECVhpRVR8CyVlHn4V7IQmMwyY1LTWaDvrrUO5i/o0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qZXgZ-00FIrr-Px for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 14:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rIMc/jDCj9ILMqoJd0dO659w/9cB73A1MIGl7MCNQc0=; b=oBoPRF9uQlcnzO+kvA9HXiHIxh
 1BCZOYk+GNL3b9Hbl9e0kK321R7GUMuXBq5CnzZVygX8jax4dLYLnGd1XSzW1m9qVXov6cTXOpVyv
 sv5l1EBw3uu95Jxon5Sw3wlu1qTTRFkBQCTr+N8L/Prb1jdIi5jstgZjfRsnuOwWr9LDfkxjeCY5c
 UoI4nSwH2jPxj2QMMHZp0Wkb5xy7QvRuP3ObBs4CYLKVGqr6YBri4brVlX/zJEjbKcNGc0kRvuWzw
 6Da7DA+BObM8TzfQI+r1SxtKCOrEiJNsg27vpqxgEagx4gi10g2HUFqfKuMQw4f6GgzpXJkYlNle8
 RUhWro7w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qZXfd-00HYsg-Qa; Fri, 25 Aug 2023 14:20:17 +0000
Date: Fri, 25 Aug 2023 15:20:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOi4oV7Ho3y0106O@casper.infradead.org>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-13-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-13-hao.xu@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:14PM +0800, Hao Xu wrote: >
 +++ b/fs/xfs/xfs_iops.c > @@ -1037,6 +1037,8 @@ xfs_vn_update_time( > int
 log_flags = XFS_ILOG_TIMESTAMP; > struct xfs_trans *tp; > int error; [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qZXgZ-00FIrr-Px
Subject: Re: [f2fs-dev] [PATCH 12/29] xfs: enforce GFP_NOIO implicitly
 during nowait time update
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 25, 2023 at 09:54:14PM +0800, Hao Xu wrote:
> +++ b/fs/xfs/xfs_iops.c
> @@ -1037,6 +1037,8 @@ xfs_vn_update_time(
>  	int			log_flags = XFS_ILOG_TIMESTAMP;
>  	struct xfs_trans	*tp;
>  	int			error;
> +	int			old_pflags;
> +	bool			nowait = flags & S_NOWAIT;
>  
>  	trace_xfs_update_time(ip);
>  
> @@ -1049,13 +1051,18 @@ xfs_vn_update_time(
>  		log_flags |= XFS_ILOG_CORE;
>  	}
>  
> +	if (nowait)
> +		old_pflags = memalloc_noio_save();
> +
>  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);

This is an abuse of the memalloc_noio_save() interface.  You shouldn't
be setting it around individual allocations; it's the part of the kernel
which decides "I can't afford to do I/O" that should be setting it.
In this case, it should probably be set by io_uring, way way way up at
the top.

But Jens didn't actually answer my question about that:

https://lore.kernel.org/all/ZMhZh2EYPMH1wIXX@casper.infradead.org/



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
