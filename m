Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F216A672EE7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 03:19:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIKWq-0001NY-JG;
	Thu, 19 Jan 2023 02:19:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pIKWp-0001NS-Go
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9mxWDXOC/T1ehket/X0YdzBgJffO3uiJFm9dDmdDKso=; b=c/KXTWExmyyEKNfz+rKIJiqhFj
 82x6D6u1KDdaa9HLs/+0iyQeva9PhZ7gRqzeqJWmc8tttAPtLmYKhXJh/AqeMZZAtkXvFSagbTAKj
 Drou/+XzdstxPQU5bluiYMUFVibta4pAuqEZ8Itrz+IVhUed4oH+h3fSAoUvaoCSftk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9mxWDXOC/T1ehket/X0YdzBgJffO3uiJFm9dDmdDKso=; b=SxVYBWK+XTDftlMAhzjuc8Uj7s
 jOMRAfNlHfk+3gFsuiG3xqkid2tn9F5AzKFmYiyjGM85t/AkWKAuoDGtbL1TTgQygQVH4KabbYSyP
 vfhsI53dLEjONFAtFyMVj+Wjmh/rq5xgu78b9X5ibY+Qg+jhaacRWLoOxL+RxQlddf1E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIKWo-0001QT-4I for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 02:19:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C673B81FBF;
 Thu, 19 Jan 2023 02:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BDBC433D2;
 Thu, 19 Jan 2023 02:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674094775;
 bh=PhzcDmkGhRVjGbw8rA/j27ZqHma/HzGuMcD0dVpCosk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VTxbQ24DVjeX5Fmul0D7mGDM2W55q1zjUo2bT+7jfI37A/f2ZbEOUjwzsv7+E+26b
 LVPXxnhD7XXl3FEeZH8YRfV++4A0QxiSEeHhAx57nBHo7uTLYT5T5ccSeMhTFxE1mn
 V4JdmTns0MoZKQpD08PGObKkVeT7ewjDTguV6fBDnx9gnRvLhni9aeQAeirjMQKBfI
 6P0TK53JOx14uMkMKGoLdOgYkx8DminHo0+sfcLTI0t0tQgB5MUtEsuHU2pUIKmEwB
 I/jRwL6EepOXFqKco2LY5Gd0raZzjJmmngw7gZZ82FHUm0DHBf74eJm13WXVoSxLQn
 ZxftEMEQPMc5w==
Date: Wed, 18 Jan 2023 18:19:33 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y8iotYUXzfPZLhj9@google.com>
References: <20230112142213.22784-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112142213.22784-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/12, Yangtao Li wrote: > There are very similar codes
 in release_compress_blocks() and > reserve_compress_blocks() which is used
 for data blocks check. > > This patch introduces a new helper sani [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIKWo-0001QT-4I
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce sanity_check_blocks()
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

On 01/12, Yangtao Li wrote:
> There are very similar codes in release_compress_blocks() and
> reserve_compress_blocks() which is used for data blocks check.
> 
> This patch introduces a new helper sanity_check_blocks()
> to include those common codes, and used it instead for cleanup.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/file.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f5c1b7814954..0d539155379c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3369,11 +3369,9 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
>  	return put_user(blocks, (u64 __user *)arg);
>  }
>  
> -static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
> +static int sanity_check_blocks(struct dnode_of_data *dn, pgoff_t count)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> -	unsigned int released_blocks = 0;
> -	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>  	block_t blkaddr;
>  	int i;
>  
> @@ -3390,6 +3388,21 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  		}
>  	}
>  
> +	return 0;
> +}
> +
> +static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> +	unsigned int released_blocks = 0;
> +	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
> +	block_t blkaddr;
> +	int i, rc;
> +
> +	rc = sanity_check_blocks(dn, count);

        ^
        err

> +	if (rc)
> +		return rc;
> +
>  	while (count) {
>  		int compr_blocks = 0;
>  
> @@ -3539,20 +3552,11 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
>  	unsigned int reserved_blocks = 0;
>  	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
>  	block_t blkaddr;
> -	int i;
> +	int i, rc;
>  
> -	for (i = 0; i < count; i++) {
> -		blkaddr = data_blkaddr(dn->inode, dn->node_page,
> -						dn->ofs_in_node + i);
> -
> -		if (!__is_valid_data_blkaddr(blkaddr))
> -			continue;
> -		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> -					DATA_GENERIC_ENHANCE))) {
> -			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
> -			return -EFSCORRUPTED;
> -		}
> -	}
> +	rc = sanity_check_blocks(dn, count);
> +	if (rc)
> +		return rc;
>  
>  	while (count) {
>  		int compr_blocks = 0;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
