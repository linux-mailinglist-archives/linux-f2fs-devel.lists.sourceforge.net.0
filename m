Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D32AAD79A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pR//ZxWcbQ5YGFdDLiu5XcZwYfgKnujCLTpzolXL+U=; b=FFNwI1N9qm6WLCSdl9uTn2D27X
	zpm+1bmpXWcAb43wmgfmNcZGCkYg2TlClsZ4XmcaRtopC/+EAebTMPxW+uaeQtT5DFUf7MYpRQKe8
	J4zGlymm/VBDt7C6vi4fWoCULj3aXEgq0ljRVeDiuFf34CNE4kFrgYNciA3KmUhq4mw0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZ55-0005C6-2Q;
	Wed, 07 May 2025 07:20:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCZ4v-0005Br-1v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4CsLneG6vhKGLGnIGsr253fIbt0jSD8qS4uCM80fE5M=; b=LP2LOr8EJojWPGzILAgPdkMWng
 JLfxoinB9Dw5B8q2YD5xF/OB1Ljw/4kvo2DXG+BurCV+XOslkGiwoI2rOqnpg7pci14nQIKjfQiiv
 +xySxgXO4MBZdXiswPqs9nWjWNdv7JZW4/7sZ4WTZjJ1gc92j3hViSjqW6rfPhfd8FIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CsLneG6vhKGLGnIGsr253fIbt0jSD8qS4uCM80fE5M=; b=UG3M96PGzbZIPHxLX4Wl6TsdXf
 j5kTnrNQA1pPsZYSi7iHrCna4de9S8NCTk1iy9Y42vAPAHwF4kUkqTiA1GwliuzJNFGkIys31IuoZ
 KdyqbQw4L6nEyhvButXrBOOHAVieadbdI53dOH+FjP1V0nw9ziKtXqu5ol1jbEWZNf4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCZ4f-0002Q4-5k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80A255C588D;
 Wed,  7 May 2025 07:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEFCC4CEE7;
 Wed,  7 May 2025 07:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746602402;
 bh=vwuudw/R1dLfo9sArQaDbUrhxRWphnXFmv5qQLkzTz8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TcfYAZTeLavqZSxb1K/iAE8gfjzqSp9MqKO5qa9QoIGkVtcWFauBdbqODFHH64A0R
 +Ebx9WttBHPDc9kI8xPyiZa2G73NZ0Mo6Flid4T/z5TMJdEP60EcbiC+M7Rk4hqI6q
 0ktk3COIIMGsgBAyahO0Ki0xgVkMXVZmJulAESJOAHLSIVMAsXaXTvmoX9VIKMzupc
 9t0abcRZy9mj3gPBu25NxeYNeR0h3q2f3selIqxSpplhHZMVlBAO7mMSXED7r2liCx
 c25uHw2SEFaxE49v40pYGwVc926VIMFdL8mtfbwQ6Djb0BQgboe7rUZHaYJC7n38jr
 KpiMr9Gv32FSg==
Message-ID: <8460a749-951c-44d8-a5fa-699eb7f902ca@kernel.org>
Date: Wed, 7 May 2025 15:19:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
 <20250505092613.3451524-4-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250505092613.3451524-4-hch@lst.de>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/5/25 17:26, Christoph Hellwig wrote: > Always assign
 ret where the error happens, and jump to out instead > of multiple loop exit
 conditions to prepare for changes in the > __write_node_folio cal [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCZ4f-0002Q4-5k
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: simplify return value handling in
 f2fs_fsync_node_pages
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/5/25 17:26, Christoph Hellwig wrote:
> Always assign ret where the error happens, and jump to out instead
> of multiple loop exit conditions to prepare for changes in the
> __write_node_folio calling convention.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/node.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index ec74eb9982a5..b9d9519c3da4 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1882,17 +1882,17 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  			if (!folio_clear_dirty_for_io(folio))
>  				goto continue_unlock;
>  
> -			ret = __write_node_folio(folio, atomic &&
> +			if (__write_node_folio(folio, atomic &&
>  						folio == last_folio,
>  						&submitted, wbc, true,
> -						FS_NODE_IO, seq_id);
> -			if (ret) {
> +						FS_NODE_IO, seq_id)) {
>  				folio_unlock(folio);
>  				f2fs_folio_put(last_folio, false);
> -				break;
> -			} else if (submitted) {
> -				nwritten++;
> +				ret = -EIO;
> +				goto out;

It missed to call folio_batch_release() here?

Thanks,

>  			}
> +			if (submitted)
> +				nwritten++;
>  
>  			if (folio == last_folio) {
>  				f2fs_folio_put(folio, false);
> @@ -1903,10 +1903,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  		folio_batch_release(&fbatch);
>  		cond_resched();
>  
> -		if (ret || marked)
> +		if (marked)
>  			break;
>  	}
> -	if (!ret && atomic && !marked) {
> +	if (atomic && !marked) {
>  		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>  			   ino, last_folio->index);
>  		folio_lock(last_folio);
> @@ -1918,7 +1918,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  out:
>  	if (nwritten)
>  		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
> -	return ret ? -EIO : 0;
> +	return ret;
>  }
>  
>  static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
