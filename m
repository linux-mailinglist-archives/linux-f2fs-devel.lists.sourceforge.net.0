Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DE192D60
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 16:50:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH8Ia-0003Go-Rx; Wed, 25 Mar 2020 15:50:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jH8IZ-0003GQ-7m
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2UcWWiTTIdrpwrLpQ0TAgbuts3D4Tox9KUv/SRx5/Y=; b=j+sqj2iKvyVT0/EvHccZpzlrDq
 TsW71WfU8ghW7/H/UbWGAe3sFq70WdlHvpvda0xmxsAvHjU8dgaePXddo9g+nKRhyEIxwToqQXjeL
 x0F677PAY3eQf0LEJRDHzrRuaysNtt8XJQWteB5eZ02SvSwGE4B0BVQo1ZXVvwt5Q+1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U2UcWWiTTIdrpwrLpQ0TAgbuts3D4Tox9KUv/SRx5/Y=; b=jtY1NNL6G1fF2NjNQDpxeiEr0M
 9jAq/dTZrLyKZTkhR7iM4+ywjx+6WnLGhVi3HiC63wTyZkf8h7mPTIExR4wtp9wcd3i1wyz/3JSJu
 j67pNpv3spw5jj+SbY5d5U9Vx5K+b+MMtgsy9I10vfyoHtV45x1FSADURTIUzZTlhlF4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH8IT-006nz2-AY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 15:50:31 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE17620719;
 Wed, 25 Mar 2020 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585151414;
 bh=Qc+lueq98MrFHqfASz6/dsAD2vvazTjCL6wnKN7LNls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LD8m9jlhLcMakKgtin97JBf2XNfXsnSTrsqZMF/LAlhDAdpi/ITpe5K8r242NJPgV
 QT0g5P1o+BQe8/+MzOI7ev3bv9TitGtvSFmdQYLobauqmReoNQ9w7hiuSmTsI9yEeA
 gwEiTsVRCygqBzOgDXJNx2r+hnbyY57pVW+tdEF0=
Date: Wed, 25 Mar 2020 08:50:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200325155014.GB65658@google.com>
References: <20200325091811.60725-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325091811.60725-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jH8IT-006nz2-AY
Subject: Re: [f2fs-dev] [PATCH v2 3/5] f2fs: fix to avoid NULL pointer
 dereference
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

I don't want to rebase old commit at this moment, so applied on top of the tree.

Thanks,

On 03/25, Chao Yu wrote:
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> PC is at f2fs_free_dic+0x60/0x2c8
> LR is at f2fs_decompress_pages+0x3c4/0x3e8
> f2fs_free_dic+0x60/0x2c8
> f2fs_decompress_pages+0x3c4/0x3e8
> __read_end_io+0x78/0x19c
> f2fs_post_read_work+0x6c/0x94
> process_one_work+0x210/0x48c
> worker_thread+0x2e8/0x44c
> kthread+0x110/0x120
> ret_from_fork+0x10/0x18
> 
> In f2fs_free_dic(), we can not use f2fs_put_page(,1) to release dic->tpages[i],
> as the page's mapping is NULL.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - fix to skip release tpages[i] if it is NULL in error path.
>  fs/f2fs/compress.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index ef7dd04312fe..6e10800729b6 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1137,7 +1137,10 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
>  		for (i = 0; i < dic->cluster_size; i++) {
>  			if (dic->rpages[i])
>  				continue;
> -			f2fs_put_page(dic->tpages[i], 1);
> +			if (!dic->tpages[i])
> +				continue;
> +			unlock_page(dic->tpages[i]);
> +			put_page(dic->tpages[i]);
>  		}
>  		kfree(dic->tpages);
>  	}
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
