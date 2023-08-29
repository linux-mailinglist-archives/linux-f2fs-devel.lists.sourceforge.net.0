Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E878BF59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Aug 2023 09:42:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qatMk-0001Uu-3a;
	Tue, 29 Aug 2023 07:42:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hao.xu@linux.dev>) id 1qatMj-0001Uo-FB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 07:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kzCYK+m1dXoYq1GdX9wRq/xLcjMjzBwHZbogX1zaiXI=; b=OwXOqxrL8dfe7EqL2sdtwmmf/6
 9j22MvFmi7czUWE3ba2qTmNP/HC0IdFEy0u+ZaU2ZidaNCC31Czq7Ub67V9od1mtKipAb7zHYo/3y
 2MjndYh9FGkxeLzm1MP5TsaOg9hlmU1dZyemj5KwXiWs7jjea3ahYClgIdEF/TWOLf1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kzCYK+m1dXoYq1GdX9wRq/xLcjMjzBwHZbogX1zaiXI=; b=mUQdRX0nX5NdmBLil8a656paKG
 kwL7LzkvmCeQxu89dfk6EUTncZZNJCXpGKTM0+Ez8SZB7EznPLd2A3nwnuou1Dfh8hJNpG5xNsJM+
 t1QtnIz5xrgxwSQ9fqBjzR+5M2i+LCI/Pagv2fUE6xa5oaOs/hJcUb+nKKxuQt86IXIo=;
Received: from out-245.mta1.migadu.com ([95.215.58.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qatMb-00048b-1Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Aug 2023 07:42:21 +0000
Message-ID: <ca10040f-b7fa-7c43-1c89-6706d13b2747@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693294923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzCYK+m1dXoYq1GdX9wRq/xLcjMjzBwHZbogX1zaiXI=;
 b=wx9qXfUOb6FlguPiqwy6R82+yQxWta9+fR66YAQ2/1ZdnqJnQPp1kHU4jR8nRlngim3iOe
 HThmnzNEUSaEuQwHiVi+WxF88JyUG2K+H0WcvTm70cW04LSIUXyP6AZ74VPb7aBxP9rojs
 L1LrBvpa76A1LVLwfY5LHU6MjnCVZUs=
Date: Tue, 29 Aug 2023 15:41:43 +0800
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-3-hao.xu@linux.dev>
 <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZOu1xYS6LRmPgEiV@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/23 04:44, Matthew Wilcox wrote: > On Sun, Aug 27,
 2023 at 09:28:26PM +0800, Hao Xu wrote: >> +++ b/fs/xfs/libxfs/xfs_da_btree.c
 >> @@ -2643,16 +2643,32 @@ xfs_da_read_buf( >> struct xfs_buf_ma [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qatMb-00048b-1Y
Subject: Re: [f2fs-dev] [PATCH 02/11] xfs: add NOWAIT semantics for readdir
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/28/23 04:44, Matthew Wilcox wrote:
> On Sun, Aug 27, 2023 at 09:28:26PM +0800, Hao Xu wrote:
>> +++ b/fs/xfs/libxfs/xfs_da_btree.c
>> @@ -2643,16 +2643,32 @@ xfs_da_read_buf(
>>   	struct xfs_buf_map	map, *mapp = &map;
>>   	int			nmap = 1;
>>   	int			error;
>> +	int			buf_flags = 0;
>>   
>>   	*bpp = NULL;
>>   	error = xfs_dabuf_map(dp, bno, flags, whichfork, &mapp, &nmap);
>>   	if (error || !nmap)
>>   		goto out_free;
>>   
>> +	/*
>> +	 * NOWAIT semantics mean we don't wait on the buffer lock nor do we
>> +	 * issue IO for this buffer if it is not already in memory. Caller will
>> +	 * retry. This will return -EAGAIN if the buffer is in memory and cannot
>> +	 * be locked, and no buffer and no error if it isn't in memory.  We
>> +	 * translate both of those into a return state of -EAGAIN and *bpp =
>> +	 * NULL.
>> +	 */
> 
> I would not include this comment.

No strong comment here, since this patch is mostly from Dave, it's
better if Dave can ack this.

> 
>> +	if (flags & XFS_DABUF_NOWAIT)
>> +		buf_flags |= XBF_TRYLOCK | XBF_INCORE;
>>   	error = xfs_trans_read_buf_map(mp, tp, mp->m_ddev_targp, mapp, nmap, 0,
>>   			&bp, ops);
> 
> what tsting did you do with this?  Because you don't actually _use_
> buf_flags anywhere in this patch (presumably they should be the
> sixth argument to xfs_trans_read_buf_map() instead of 0).  So I can only
> conclude that either you didn't test, or your testing was inadequate.
> 


The tests I've done are listed in the cover-letter, this one is missed, 
the tricky place is it's hard to get this kind of mistake since it runs
well without nowait logic...I'll fix it in next version.

>>   	if (error)
>>   		goto out_free;
>> +	if (!bp) {
>> +		ASSERT(flags & XFS_DABUF_NOWAIT);
> 
> I don't think this ASSERT is appropriate.
> 
>> @@ -391,10 +401,17 @@ xfs_dir2_leaf_getdents(
>>   				bp = NULL;
>>   			}
>>   
>> -			if (*lock_mode == 0)
>> -				*lock_mode = xfs_ilock_data_map_shared(dp);
>> +			if (*lock_mode == 0) {
>> +				*lock_mode =
>> +					xfs_ilock_data_map_shared_generic(dp,
>> +					ctx->flags & DIR_CONTEXT_F_NOWAIT);
>> +				if (!*lock_mode) {
>> +					error = -EAGAIN;
>> +					break;
>> +				}
>> +			}
> 
> 'generic' doesn't seem like a great suffix to mean 'takes nowait flag'.
> And this is far too far indented.
> 
> 			xfs_dir2_lock(dp, ctx, lock_mode);
> 
> with:
> 
> STATIC void xfs_dir2_lock(struct xfs_inode *dp, struct dir_context *ctx,
> 		unsigned int lock_mode)
> {
> 	if (*lock_mode)
> 		return;
> 	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
> 		return xfs_ilock_data_map_shared_nowait(dp);
> 	return xfs_ilock_data_map_shared(dp);
> }
> 
> ... which I think you can use elsewhere in this patch (reformat it to
> XFS coding style, of course).  And then you don't need
> xfs_ilock_data_map_shared_generic().
> 

How about rename xfs_ilock_data_map_shared() to 
xfs_ilock_data_map_block() and rename 
xfs_ilock_data_map_shared_generic() to xfs_ilock_data_map_shared()?

STATIC void xfs_ilock_data_map_shared(struct xfs_inode *dp, struct 
dir_context *ctx, unsigned int lock_mode)
{
  	if (*lock_mode)
  		return;
  	if (ctx->flags & DIR_CONTEXT_F_NOWAIT)
  		return xfs_ilock_data_map_shared_nowait(dp);
  	return xfs_ilock_data_map_shared_block(dp);
}




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
