Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71A73BEA0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jun 2023 20:55:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qClwk-000867-25;
	Fri, 23 Jun 2023 18:55:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qClwh-000860-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 18:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/htB6XD4b4yWqhRBJPj+RnuIrAo3W0wZE+wqYs6SrEY=; b=ErVVcMzH8yVCGsXkSePVuwCPlm
 ep/73eY7/k/0MMVm7doqFMgA7kH2nY/F9YVkSTTOy45YBVKVMvsvIqXyRDVl+ZtWL1iVk2TKHwN/x
 Rk/B5EZ9llL/M7649zUYWNPnyDTssJPpTbHxsRwYN45JwFc/5iNaRWxqgt7td3wlXL4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/htB6XD4b4yWqhRBJPj+RnuIrAo3W0wZE+wqYs6SrEY=; b=LyfAdWf6UEQe0n/oJQjQyjVEDk
 0DwpyGMwx/ZUl5tkGubjgE39qBAkaXjZKPjL47pusVtyuNEjfBL0UeDLyAQO+GHc0MVDiyQlLN8oz
 +QlCqpbr+yIEhtCEZ6zlEYuppHlGNIpG4bu/1mFQ+oDKf8pFVnd0dfkJWVLVsbwR7E/s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qClwc-00Ccj8-RU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 18:55:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74B166192C;
 Fri, 23 Jun 2023 18:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AB8C433C8;
 Fri, 23 Jun 2023 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687546536;
 bh=VnxQJHaKQsPmcm1OKRvt1nu0tfgMb5k4v2j2VSOguZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1mjN+yDK/HIBcVtmO4krGa3lR7Jd4OuPjTYnE8Pg/qhniSIqSbdcYaUXpKBYThWk
 76uLDZhuBpLggR3JzNqU+i8IAPQQqouac8Z3AeofwMVpeImCUC9zy86pVWiRgDP1F3
 NtZdZVwoMtngP7VElnLK6N5nq11+c3t8ahYsIumIQiCpLRkTToncYeLUcrMf8+2W/b
 Tv8Vq5u4C4nPgsocTwDD27OznbmkOpr2eFEtNbBphJwSmHOe1v2qP4+qWB7y8zOmu5
 2rFc90PF3Fftg4/uX9STN8pFLk6Rtp6eO2kui1nA+36oCEsnY4EAc/2c/hgDajGvY/
 +FyDvcRrXhT3w==
Date: Fri, 23 Jun 2023 11:55:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yunlei He <heyunlei@oppo.com>
Message-ID: <ZJXqpw2Ckluo+20G@google.com>
References: <20230622161647.742012-1-heyunlei@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622161647.742012-1-heyunlei@oppo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/23, Yunlei He wrote: > Mtime and ctime stay old value
 without update after move > file range ioctl. This patch add time update.
 > > Signed-off-by: Yunlei He <heyunlei@oppo.com> > --- > v2: > -up [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qClwc-00Ccj8-RU
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move
 file range method
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

On 06/23, Yunlei He wrote:
> Mtime and ctime stay old value without update after move
> file range ioctl. This patch add time update.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
> ---
> v2:
> -update both src and dst inode
>  fs/f2fs/file.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cb42d8464ad9..e59fc8faa035 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2886,6 +2886,19 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>  		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
>  out_src:
>  	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
> +
> +	if (!ret) {

Applied with minor change like:

	if (ret)
		goto out_unlock;
	...

> +		src->i_mtime = src->i_ctime = current_time(src);
> +		f2fs_mark_inode_dirty_sync(src, false);
> +
> +		if (src != dst) {
> +			dst->i_mtime = dst->i_ctime = current_time(dst);
> +			f2fs_mark_inode_dirty_sync(dst, false);
> +		}
> +
> +		f2fs_update_time(sbi, REQ_TIME);
> +	}
> +
>  out_unlock:
>  	if (src != dst)
>  		inode_unlock(dst);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
