Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E415A536B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 19:43:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSin4-0007mq-SI;
	Mon, 29 Aug 2022 17:43:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oSin3-0007mj-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hVRyfTirpYxfGUIRfDPUg3N2h8ebpPIjEfmYSPqpEi8=; b=Ly3FZ8Y5dJGUkndD7FGvw48Qyb
 29H+iFpPACxkDejfhyuk6A73yd8Zwb1htKR319ihsDtL6txfD3YWf9AmUJ+kesuMBcgZwTkSphtKu
 GhiOEQrGbLCLD0O84oSD90PpyJKBpt2GAFLhYafKhSnrIYGXsScZ7l01/t6TmLwKGH5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hVRyfTirpYxfGUIRfDPUg3N2h8ebpPIjEfmYSPqpEi8=; b=Jd9c4GJhjpNJE1QVo9THlAAzBp
 OmpfAOAm/hmkZ3hNwU3VefvyX9LkjxW4RcDtFCGQAEf4G76YAd1IbRezrNiGqhx9AWsHtH4aaaPe9
 LX2cxkzb2IUq3QpoXOaRqXef7jbqVjPgLpHooI48PAMCzqZqjLIe2oVJfLyEGD1OYnbo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSin2-006eEd-RN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AF326130C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Aug 2022 17:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9874AC433C1;
 Mon, 29 Aug 2022 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661794986;
 bh=cxPPEBu+h0eaOoH6XNEDFwMgVRSEBxa1GviI21BIVfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C7UlN/rxD1A07hajY7oNwvf4lBdkN65KxQB1PgDkV11i2ewgJZBMX2GpgYHrDAsTy
 Oln4C1jZ/ElA2r8VlroJ3K03byLr/6Am5E58SrcKgBrWqbzl70Gns18A6A38kusjJv
 6TxtKkFiWv2KEifYCjR7FYeB3c+69CN7AwLymixPQ/MDrVmUKfE7Aij5o89rj+NRG9
 Si3LhZdBnIymBkFvxm/nm/0b6yK3L+URLZaYy/jBTOo8RtodYDoOC3yFMeWb11eTac
 wu3UH/FJDlPjhCmTOCt/B8QvlZq5enC/ZWKX/3pvfn9OVCww54CR/COe0N8aRbvF/P
 LI7nY9FXequHw==
Date: Mon, 29 Aug 2022 10:43:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ywz6qH51lzdYy717@google.com>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-8-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/26,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > Add support for STATX_DIOALIGN to f2fs, so that direct I/O alignment
 > restrictions are exposed to userspace in a generic w [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oSin2-006eEd-RN
Subject: Re: [f2fs-dev] [PATCH v5 7/8] f2fs: support STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/26, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add support for STATX_DIOALIGN to f2fs, so that direct I/O alignment
> restrictions are exposed to userspace in a generic way.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/file.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8e11311db21060..79177050732803 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -847,6 +847,24 @@ int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
>  		stat->btime.tv_nsec = fi->i_crtime.tv_nsec;
>  	}
>  
> +	/*
> +	 * Return the DIO alignment restrictions if requested.  We only return
> +	 * this information when requested, since on encrypted files it might
> +	 * take a fair bit of work to get if the file wasn't opened recently.
> +	 *
> +	 * f2fs sometimes supports DIO reads but not DIO writes.  STATX_DIOALIGN
> +	 * cannot represent that, so in that case we report no DIO support.
> +	 */
> +	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
> +		unsigned int bsize = i_blocksize(inode);
> +
> +		stat->result_mask |= STATX_DIOALIGN;
> +		if (!f2fs_force_buffered_io(inode, WRITE)) {
> +			stat->dio_mem_align = bsize;
> +			stat->dio_offset_align = bsize;
> +		}
> +	}
> +
>  	flags = fi->i_flags;
>  	if (flags & F2FS_COMPR_FL)
>  		stat->attributes |= STATX_ATTR_COMPRESSED;
> -- 
> 2.37.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
