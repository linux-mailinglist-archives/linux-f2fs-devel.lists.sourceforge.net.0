Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C378918D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:16:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZf6R-0008SP-U1;
	Fri, 25 Aug 2023 22:16:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qZf6Q-0008SC-Ea
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=; b=jyjBEG3k0kqcXR0uyYxyjDBEYX
 PDJkq/2YaWJ6/lw5wF96I7iE6iEEv8ctQcP7frKINxB0FjfuKd0xW+QLjTdnJ9/qN/ceQdcB58csJ
 UNhGi+SZeSe9MDELyse8rG6uUCJ2L4mb/RYyt3+0/QHGlF5OWi+2cSiqUUURo87b7hWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=; b=fq12Eclt8GP+0uQ2z++AocdRY2
 LMqU5m/99I4J12k9Hn+4tm53oe+zz8TBshIrTXFj13632vcgdC04txPlFtcV0oFCE7sOhiS9qNk2F
 p3jmkJxAHK6Eo2hsnOoMxMW7ztU5DHeeQbRzxM/i9ml70pBNDcHWxfLgOeHbYq6WUggY=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZf6O-00FbCQ-H3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:16:25 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso10269795ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693001779; x=1693606579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
 b=oGxnlMh0S/WiVEBqRgXg0XkOHzHqDpTBvnGnagMxXiK0WZOe1Z4r+2p1ptsCZGDnWB
 pXEktmY/ad0PuwAxCgT0YcHOMRjDsuwyrAXCFtdwEmAj+muyxYQXIE+r39jHMvXhT5B0
 o+SPYmvdCE0AaqEX44rBk89wjuy74zXAp3Vwzk0u1JPoPtSJh1DrCjw1RqWqiFdJpqby
 tMNly65LV0QvaLstk47azhvzcHLQyEtc8q2u/G93EQr7wDi/F72WQh2TPKv7ILrD/tve
 HoezaGEwtih61yu0zT7giO0Mqh1qaOyneAEL9vdEIb12mBB0wZbgWFOwNbvY6RzLwUwH
 OW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001779; x=1693606579;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppeQOWgbWz5gqWZs/rbytV4GhpZ82FSsmBh/giRYIfc=;
 b=eXjbSgrN/RcBxpgEMVQEGEg+S2AQTbEEV4l6nQ1Rzq5aCQJNktjsUF0K8/GpuWrsmu
 fjfyUxCP+X5CcAQiEBfmJStOxHfgQ1C41MdLBOEkoUKtYwzUOaF8IhktrtCJB83R+rpD
 89DlEM4sX3W9OdjCIrqb6RnN0zSg+1Tyd5HUxhx17W29pHVqnf+bYRz3txS3jvnVebS8
 OjieaCMsF0QCh0IqoA0QjdjV6i2tmFMOBKGRNwR70p6YiTHe/iHZU3WfTJdwEVR8ZRFZ
 N8dkqSERQA6MJ54aUYzs/nR6QAiMMz9Ri33HwVDvp30Jvu5qPq9I1qcF+2l0ZLSsiZya
 vhNg==
X-Gm-Message-State: AOJu0YwgA5oz6Hk5tzPYthTFfsav+yyiXMpxCeVNoTHLHOKVxG6lBnWm
 Ob9cXakqaFJI6373GUA0H6oPww==
X-Google-Smtp-Source: AGHT+IEjt82Q7/ukix1Bwi0HcqOCAUCGzooSpz1T14B8KRhD3u7v0lApveU1bnKvxuVgpN4iNhxk8w==
X-Received: by 2002:a17:903:264e:b0:1bd:c338:ae14 with SMTP id
 je14-20020a170903264e00b001bdc338ae14mr16243879plb.12.1693001778913; 
 Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b001c0bf60ba5csm2276046pln.272.2023.08.25.15.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:16:18 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZf6F-006Va3-0j;
 Sat, 26 Aug 2023 08:16:15 +1000
Date: Sat, 26 Aug 2023 08:16:15 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkoL8nuXJDVZM1H@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-26-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-26-hao.xu@linux.dev>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:27PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > support nowait for xfs_buf_item_init()
 and error out -EAGAIN to > _xfs_trans_bjoin() when it would bloc [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.182 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.182 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qZf6O-00FbCQ-H3
Subject: Re: [f2fs-dev] [PATCH 25/29] xfs: support nowait for
 xfs_buf_item_init()
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
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

On Fri, Aug 25, 2023 at 09:54:27PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> support nowait for xfs_buf_item_init() and error out -EAGAIN to
> _xfs_trans_bjoin() when it would block.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_buf_item.c         |  9 +++++++--
>  fs/xfs/xfs_buf_item.h         |  2 +-
>  fs/xfs/xfs_buf_item_recover.c |  2 +-
>  fs/xfs/xfs_trans_buf.c        | 16 +++++++++++++---
>  4 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
> index 023d4e0385dd..b1e63137d65b 100644
> --- a/fs/xfs/xfs_buf_item.c
> +++ b/fs/xfs/xfs_buf_item.c
> @@ -827,7 +827,8 @@ xfs_buf_item_free_format(
>  int
>  xfs_buf_item_init(
>  	struct xfs_buf	*bp,
> -	struct xfs_mount *mp)
> +	struct xfs_mount *mp,
> +	bool   nowait)
>  {
>  	struct xfs_buf_log_item	*bip = bp->b_log_item;
>  	int			chunks;
> @@ -847,7 +848,11 @@ xfs_buf_item_init(
>  		return 0;
>  	}
>  
> -	bip = kmem_cache_zalloc(xfs_buf_item_cache, GFP_KERNEL | __GFP_NOFAIL);
> +	bip = kmem_cache_zalloc(xfs_buf_item_cache,
> +				GFP_KERNEL | (nowait ? 0 : __GFP_NOFAIL));
> +	if (!bip)
> +		return -EAGAIN;
> +
>  	xfs_log_item_init(mp, &bip->bli_item, XFS_LI_BUF, &xfs_buf_item_ops);
>  	bip->bli_buf = bp;

I see filesystem shutdowns....

> diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
> index 016371f58f26..a1e4f2e8629a 100644
> --- a/fs/xfs/xfs_trans_buf.c
> +++ b/fs/xfs/xfs_trans_buf.c
> @@ -57,13 +57,14 @@ xfs_trans_buf_item_match(
>   * If the buffer does not yet have a buf log item associated with it,
>   * then allocate one for it.  Then add the buf item to the transaction.
>   */
> -STATIC void
> +STATIC int
>  _xfs_trans_bjoin(
>  	struct xfs_trans	*tp,
>  	struct xfs_buf		*bp,
>  	int			reset_recur)
>  {
>  	struct xfs_buf_log_item	*bip;
> +	int ret;
>  
>  	ASSERT(bp->b_transp == NULL);
>  
> @@ -72,7 +73,11 @@ _xfs_trans_bjoin(
>  	 * it doesn't have one yet, then allocate one and initialize it.
>  	 * The checks to see if one is there are in xfs_buf_item_init().
>  	 */
> -	xfs_buf_item_init(bp, tp->t_mountp);
> +	ret = xfs_buf_item_init(bp, tp->t_mountp,
> +				tp->t_flags & XFS_TRANS_NOWAIT);
> +	if (ret < 0)
> +		return ret;
> +
>  	bip = bp->b_log_item;
>  	ASSERT(!(bip->bli_flags & XFS_BLI_STALE));
>  	ASSERT(!(bip->__bli_format.blf_flags & XFS_BLF_CANCEL));
> @@ -92,6 +97,7 @@ _xfs_trans_bjoin(
>  	xfs_trans_add_item(tp, &bip->bli_item);
>  	bp->b_transp = tp;
>  
> +	return 0;
>  }
>  
>  void
> @@ -309,7 +315,11 @@ xfs_trans_read_buf_map(
>  	}
>  
>  	if (tp) {
> -		_xfs_trans_bjoin(tp, bp, 1);
> +		error = _xfs_trans_bjoin(tp, bp, 1);
> +		if (error) {
> +			xfs_buf_relse(bp);
> +			return error;
> +		}
>  		trace_xfs_trans_read_buf(bp->b_log_item);

So what happens at the callers when we have a dirty transaction and
joining a buffer fails with -EAGAIN?

Apart from the fact this may well propagate -EAGAIN up to userspace,
cancelling a dirty transaction at this point will result in a
filesystem shutdown....

Indeed, this can happen in the "simple" timestamp update case that
this "nowait" semantic is being aimed at. We log the inode in the
timestamp update, which dirties the log item and registers a
precommit operation to be run. We commit the
transaction, which then runs xfs_inode_item_precommit() and that
may need to attach the inode to the inode cluster buffer. This
results in:

xfs_inode_item_precommit
  xfs_imap_to_bp
    xfs_trans_read_buf_map
      _xfs_trans_bjoin
        xfs_buf_item_init(XFS_TRANS_NOWAIT)
	  kmem_cache_zalloc(GFP_NOFS)
	  <memory allocation fails>
      gets -EAGAIN error
    propagates -EAGAIN
  fails due to -EAGAIN

And now xfs_trans_commit() fails with a dirty transaction and the
filesystem shuts down.

IOWs, XFS_TRANS_NOWAIT as it stands is fundamentally broken. Once we
dirty an item in a transaction, we *cannot* back out of the
transaction. We *must block* in every place that could fail -
locking, memory allocation and/or IO - until the transaction
completes because we cannot undo the changes we've already made to
the dirty items in the transaction....

It's even worse than that - once we have committed intents, the
whole chain of intent processing must be run to completionr. Hence
we can't tolerate backing out of that defered processing chain half
way through because we might have to block.

Until we can roll back partial dirty transactions and partially
completed defered intent chains at any random point of completion,
XFS_TRANS_NOWAIT will not work.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
