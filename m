Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B46C732F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 23:37:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfTYo-0003VN-0u;
	Thu, 23 Mar 2023 22:37:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pfTYm-0003VH-60
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 22:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R1k9YQT43lcgufXCTR632QpF41Ly5YKo6apBIyfHfQ8=; b=KAPYcLx/qeT4MSHl6J8bSWVOkz
 8wIrQG1VtVbC4hGgUXP26+tdu5h+G6PmpOiXD6JG7DjnBeVEoCw7DLDPR1Y2WubqTVhbsf4mvSYAW
 FMiERj7EpYpIxXnrPdoxv+WOMx3q3u1VNKeO03v7TJzfezS6VL/qrzj5isOwvDWZLgEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R1k9YQT43lcgufXCTR632QpF41Ly5YKo6apBIyfHfQ8=; b=iLEvCXPXCR391fljFuzMS5dogg
 qLaGrp5zfvdewiUOwnaUbMsvKciJJTXC1v2FoN2nyfazd+HOwvogpXAZyKnW5Yt1Buj0BxRsLBTA0
 nMDc1HJlwBRHNYhbv39EyB+86uFp+MWi0Py3PxG5lsJ/PC1B0unrpkJQ4AVotgvOZrpc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfTYm-00054J-00 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 22:37:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3AC628A1;
 Thu, 23 Mar 2023 22:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA471C4339B;
 Thu, 23 Mar 2023 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679611041;
 bh=e+h2mUJYZuNyVdV99tfY2YFd4SgSC26RuV1oY/psovU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h6GWOthwrssi8xkFClxadiP4fsPn5GIG7nQamIY8sYfhhsWtohT49zxN6MgRzoMQe
 EnUxpHaQd1zFig97QJDRow9It5swMIU5mburl17t/gEtQuJdG82Nxq7bKEWKOQrGnQ
 j5wT0jtgEPG7JK/Qy5VuM8WrBoralmvcUeZM2y54QElvSmr32PJadazV3ncgH4Fsmq
 Ee4NduAs4qZuH01wlre5VO9BBKqJJuzm2rqjSLiuCyra0JyLWvRysMI26iwmofjH+/
 dhTFurYdG4canFngXpu9AOGI9yqbm5Qzr967AHwa2X7uKGrO8xidyIbexWGuB1C2N4
 fhm/EsVNNpUwA==
Date: Thu, 23 Mar 2023 15:37:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Hans Holmberg <hans.holmberg@wdc.com>
Message-ID: <ZBzUoJ9sydeS4TpI@google.com>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220122004.26555-1-hans.holmberg@wdc.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/20, Hans Holmberg wrote: > In some cases,
 e.g. for zoned
 block devices, direct writes are > forced into buffered writes that will
 populate the page cache > and be written out just like buffered [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfTYm-00054J-00
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics
 when buffering is forced
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
Cc: damien.lemoal@wdc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/20, Hans Holmberg wrote:
> In some cases, e.g. for zoned block devices, direct writes are
> forced into buffered writes that will populate the page cache
> and be written out just like buffered io.
> 
> Direct reads, on the other hand, is supported for the zoned
> block device case. This has the effect that applications
> built for direct io will fill up the page cache with data
> that will never be read, and that is a waste of resources.
> 
> If we agree that this is a problem, how do we fix it?
> 
> A) Supporting proper direct writes for zoned block devices would
> be the best, but it is currently not supported (probably for
> a good but non-obvious reason). Would it be feasible to
> implement proper direct IO?
> 
> B) Avoid the cost of keeping unwanted data by syncing and throwing
> out the cached pages for buffered O_DIRECT writes before completion.
> 
> This patch implements B) by reusing the code for how partial
> block writes are flushed out on the "normal" direct write path.
> 
> Note that this changes the performance characteristics of f2fs
> quite a bit.
> 
> Direct IO performance for zoned block devices is lower for
> small writes after this patch, but this should be expected
> with direct IO and in line with how f2fs behaves on top of
> conventional block devices.
> 
> Another open question is if the flushing should be done for
> all cases where buffered writes are forced.
> 
> Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
> ---
>  fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ecbc8c135b49..4e57c37bce35 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4513,6 +4513,19 @@ static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
>  	.end_io = f2fs_dio_write_end_io,
>  };
>  
> +static void f2fs_flush_buffered_write(struct address_space *mapping,
> +				      loff_t start_pos, loff_t end_pos)
> +{
> +	int ret;
> +
> +	ret = filemap_write_and_wait_range(mapping, start_pos, end_pos);
> +	if (ret < 0)
> +		return;
> +	invalidate_mapping_pages(mapping,
> +				 start_pos >> PAGE_SHIFT,
> +				 end_pos >> PAGE_SHIFT);
> +}
> +
>  static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  				   bool *may_need_sync)
>  {
> @@ -4612,14 +4625,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  
>  			ret += ret2;
>  
> -			ret2 = filemap_write_and_wait_range(file->f_mapping,
> -							    bufio_start_pos,
> -							    bufio_end_pos);
> -			if (ret2 < 0)
> -				goto out;
> -			invalidate_mapping_pages(file->f_mapping,
> -						 bufio_start_pos >> PAGE_SHIFT,
> -						 bufio_end_pos >> PAGE_SHIFT);
> +			f2fs_flush_buffered_write(file->f_mapping,
> +						  bufio_start_pos,
> +						  bufio_end_pos);
>  		}
>  	} else {
>  		/* iomap_dio_rw() already handled the generic_write_sync(). */
> @@ -4717,8 +4725,22 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	inode_unlock(inode);
>  out:
>  	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
> +
>  	if (ret > 0 && may_need_sync)
>  		ret = generic_write_sync(iocb, ret);
> +
> +	/* If buffered IO was forced, flush and drop the data from
> +	 * the page cache to preserve O_DIRECT semantics
> +	 */
> +	if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT)) {
> +		struct file *file = iocb->ki_filp;
> +		loff_t end_pos = orig_pos + ret - 1;
> +
> +		f2fs_flush_buffered_write(file->f_mapping,
> +					  orig_pos,
> +					  end_pos);

I applied a minor change:

        /* If buffered IO was forced, flush and drop the data from
         * the page cache to preserve O_DIRECT semantics
         */
-       if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT)) {
-               struct file *file = iocb->ki_filp;
-               loff_t end_pos = orig_pos + ret - 1;
-
-               f2fs_flush_buffered_write(file->f_mapping,
+       if (ret > 0 && !dio && (iocb->ki_flags & IOCB_DIRECT))
+               f2fs_flush_buffered_write(iocb->ki_filp->f_mapping,
                                          orig_pos,
-                                         end_pos);
-       }
+                                         orig_pos + ret - 1);

        return ret;
 }


> +	}
> +
>  	return ret;
>  }
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
