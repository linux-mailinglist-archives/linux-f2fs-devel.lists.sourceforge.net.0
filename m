Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9561B333E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 04:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwWkG1JU7a1otIjJUrcBtybr2Bwp20JF26/WeEXOeGA=; b=B0t60KqB5pn3Svvu8f51DsGdkd
	FGcZgbsxkDux/KEM0ubw4porbzYT/qNvYeGg4Szc/wVO2DIgKSo3id42hYsHIGiOpoMV47jxORY6p
	7NgBh8wm/5zpbJ5t9L+57RD3kLisHJIX4nl5Xfi6nCfX/C4/octO58SWROnXKxWRRfc0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMlc-0001bw-Ri;
	Mon, 25 Aug 2025 02:17:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uqMlb-0001bq-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4UchYf1XCbnreBN5aXDznOPLr94EuSlt+s/iWs3k8Qc=; b=lt/NOb/s0lWBV0gsGBqgpOvPAY
 OHrMXDXsBMkZyA8BaxwtPAT6PDGGrBVfheFaOGYN0wW1OUDKPPvaYGHyX6MvmLDK/whYJ2yGnzzaG
 BttnHnZC3WTiyMPQ+aXDq7s1F1QUBsuFqMpo/YTsVUEiVTtJ2L2C8cfTWnU/a0xbsQrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4UchYf1XCbnreBN5aXDznOPLr94EuSlt+s/iWs3k8Qc=; b=eVWwN7IauaGaVno285DZNgicSG
 daNzDGcHsvNgVI38L4v0oOUFarbNcyufIYQhwNdX23p/POGtpEU6tupqq6UZmfdE1HXONzz2WrpOa
 BJ9ss3I7/ayYQHyteBqI98DBhFSuYt5O+e7z+VtlNGvrzES1XfOX4DaAlQ2o6GJWaBX0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqMla-0003pk-Ur for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E83BE5C58E7;
 Mon, 25 Aug 2025 02:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD631C4CEF4;
 Mon, 25 Aug 2025 02:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756088210;
 bh=gGGAZ+JPhYwwTaiJE7d8qsqUjoBWCoBFSwjG0FlZdwY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ospu5ZmW3GjXXp9OZguLhvSXOSU8+kuN5MzIV4kr+GyBgWAQG5t6ZQtPMrs2Dljzd
 d4dDaib9LOKIPIWOHrQjq00X9FubG54QraUarHHsLZXu48OEdi0CjYscQrvhKu1ft5
 uyd5fWX0q/NEXJFljGjqizzzP1kNXUIflJhIqdB9i1LV3iEFKvmhedVh6YxeWgncu8
 /nOig6dkc0g/T5R+oc4Ye86AmOszNhBy9jYWkVX9McWVpxEUtBm4VF2EJLjwwMmLuA
 JjBjw9JB5/MHSPSAye58YuE1iSRzLvskZqm8zS9Z73Iuy9SFgFCA2TPXBWtxU3SBPz
 q95fqT7etWlaw==
Message-ID: <862f9f1e-1deb-48e6-b31b-96e9a8398544@kernel.org>
Date: Mon, 25 Aug 2025 10:16:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jiucheng.xu@amlogic.com, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250821-dev-v1-1-17895dcd6de5@amlogic.com>
Content-Language: en-US
In-Reply-To: <20250821-dev-v1-1-17895dcd6de5@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/21/25 10:40, Jiucheng Xu via B4 Relay wrote: > From:
 Tao Zeng <tao.zeng@amlogic.com> > > Always do checkpoint is a heavy behavior
 for compressed file. > But for contiguous writing of a file, chec [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uqMla-0003pk-Ur
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip checkpoint for compressed file
 write
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>, Tuan Zhang <tuan.zhang@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Tao Zeng <tao.zeng@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/21/25 10:40, Jiucheng Xu via B4 Relay wrote:
> From: Tao Zeng <tao.zeng@amlogic.com>
> 
> Always do checkpoint is a heavy behavior for compressed file.
> But for contiguous writing of a file, checkpoint need to be
> skipped to help improve performance.
> 
> Tested with iozone for always do check point on compressed data,
> results are:
> 
> File stride size set to 17 * record size.
>                                                   random  random
>     KB  reclen   write rewrite    read    reread    read   write
> 102400       4    1314   35488   234231  1683793 1212394   35334
> 102400       8    2387   54133   244584  1871789 1644952   52478
> 102400      16    5060    7059   298052  1901792 1894929    6600
> 102400      32    9315   13118   424723  1825565 1924235   12041
> 102400      64   17028   22258   491181  1844443 1968247   22115
> 102400     128   30551   38008   445192  1796615 1917466   38527
> 102400     256   46944   55006   509625  1630910 1715586   56201
> 102400     512   63355   70432   434639  1406089 1487569   72718
> 102400    1024   83036   86742   447141  1420505 1503320   88913
> 102400    2048   98577  101971   450287  1434918 1522294  106374
> 102400    4096  113300  116994   451286  1435321 1527404  119579
> 102400    8192  132532  133044   488503  1458688 1540595  141167
> 102400   16384  143246  143857   489376  1469878 1556530  151362
> 
> We can see that writing speed of small pieces of data(less than 16KB) is
> very slow.
> 
> With this change, iozone data are on the same hardware:
>                                                   random  random
>     KB  reclen   write rewrite    read    reread    read   write
> 102400       4   14658   34796   232797  1985764 1219513   34509
> 102400       8   25980   53695   233218  2419198 1788989   51927
> 102400      16   49556   50325   266754  2780871 2256746   50593
> 102400      32   79947   80783   393452  2755413 2467949   77681
> 102400      64  104866  105830   531853  2816504 2596812  106223
> 102400     128  142097  142034   651876  2885805 2728473  143296
> 102400     256  146972  144822   535727  2542080 2450922  157390
> 102400     512  126591  152480   571581  2055442 2052839  156512
> 102400    1024  135164  143667   654547  2052594 2045214  130488
> 102400    2048  127587  124889   491258  2058457 2059454  141273
> 102400    4096  124280  123959   660713  2067394 2056889  131967
> 102400    8192  138240  136233   509709  2102040 2090773  149215
> 102400   16384  146524  145333   576519  2118162 2096482  158704
> 
> We can see that speed of write with small pieces of data increased a lot.
> 
> Signed-off-by: Tao Zeng <tao.zeng@amlogic.com>
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c | 18 ++++++++++++++----
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d6a49de1b7e919eda12354c074b8b253b2a9ea3f..2f820d531cdb32c0fc050aca05ffd3d00395a618 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1531,6 +1531,7 @@ enum compress_algorithm_type {
>  
>  enum compress_flag {
>  	COMPRESS_CHKSUM,
> +	COMPRESS_SKIP_WRITE_CP,
>  	COMPRESS_MAX_FLAG,
>  };
>  
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 42faaed6a02da01f2bd117a5c55e1761beaffde6..3561b407f45e7aa97c7dcf911d4dddbc01ec2ca4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -212,7 +212,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
>  
>  	if (!S_ISREG(inode->i_mode))
>  		cp_reason = CP_NON_REGULAR;
> -	else if (f2fs_compressed_file(inode))
> +	else if (f2fs_compressed_file(inode) &&
> +		 !(F2FS_I(inode)->i_compress_flag &
> +			 BIT(COMPRESS_SKIP_WRITE_CP)))
>  		cp_reason = CP_COMPRESSED;

IIRC, we can not avoid checkpoint for fsync on compressed file w/ this way,
since we haven't supported compressed file recovery yet.

You can check this w/ the way as below:

write -> fsync -> shutdown -> recovery -> check data&meta

Thanks,

>  	else if (inode->i_nlink != 1)
>  		cp_reason = CP_HARDLINK;
> @@ -5234,6 +5236,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
>  			f2fs_buffered_write_iter(iocb, from);
>  
> +		/* skip checkpoint for normal write compress file */
> +		if (f2fs_compressed_file(inode))
> +			F2FS_I(inode)->i_compress_flag |=
> +				BIT(COMPRESS_SKIP_WRITE_CP);
> +
>  		trace_f2fs_datawrite_end(inode, orig_pos, ret);
>  	}
>  
> @@ -5250,14 +5257,17 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	}
>  
>  	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
> +
> +	if (ret > 0 && may_need_sync)
> +		ret = generic_write_sync(iocb, ret);
> +
> +	if (f2fs_compressed_file(inode))
> +		F2FS_I(inode)->i_compress_flag &= ~BIT(COMPRESS_SKIP_WRITE_CP);
>  out_unlock:
>  	inode_unlock(inode);
>  out:
>  	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
>  
> -	if (ret > 0 && may_need_sync)
> -		ret = generic_write_sync(iocb, ret);
> -
>  	/* If buffered IO was forced, flush and drop the data from
>  	 * the page cache to preserve O_DIRECT semantics
>  	 */
> 
> ---
> base-commit: 3ea4ad0a1df0bcbfd5ccdcea56d57ca4678ae2a8
> change-id: 20250820-dev-31b792e8e1fb
> 
> Best regards,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
