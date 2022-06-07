Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 653EB540D0A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jun 2022 20:45:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyeD5-0008Sv-S5; Tue, 07 Jun 2022 18:45:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nyeD4-0008So-07
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 18:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3uN4nq0XbuOsrHFZ2pB0DdREMuk/8aKWYq5d+ame1zI=; b=gme8qffrL2KObjJgzdrPetFYJX
 nVTKWPlUqkDVdakK/s5DzO9Sxjxy1B5r/d90vMbqFoZDrRBVMr1bSXsD1dGmIliNjZMAti1WWaVvM
 aXHQgstC0utdruUXPXU/N8fSlCqgcwOSGTXb0YhkHyNZ7JBRNc+4ETL+Q9W+upj/w7j0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3uN4nq0XbuOsrHFZ2pB0DdREMuk/8aKWYq5d+ame1zI=; b=heyNJPq5OfqP4iVcJ0CwN2GaNU
 mDYFYkz1rm0qV0a4hPpRvnWnbQKu9dm9dknNfU2DQhwbSdrOJ1Mh1g6vWoOQDjUq9WT+YW8bbcUC+
 wiWcZkeKeUUfhzahXGuc4CbpOy3zF2pSSB9D4b5Om8n1ftr27u3hpXyXbdq0bAx58QSE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyeCy-0003fS-IV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jun 2022 18:45:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D9F2B82018;
 Tue,  7 Jun 2022 18:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5185CC34115;
 Tue,  7 Jun 2022 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654627525;
 bh=s4cfQxIymbuV8O9xJVAYNYX/52W1gB3xBALuAIc0AW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RQqPs5KzS0iVUtoc10uCD6y0w3Btli34PXho1v4rV2oHNCXamTSupgGsMFa+1EjdV
 sCsIsWD5lBlqsOBwbqn+3aDghfUSADLF3JQq8XCBcuiQYfeVREja6l8QHZNFRcAW2m
 yTWSeQ9Xua8Q75FOX6tTLR7/i4F2FOFaB69opo7VrCvvHvl+lpMPxgOdE9ZjbqTb9V
 Ax8Pq0kfX1WKd5+OS8AhlP+1tAlmPUpSAHG1viObpY02o23LR6Fh0yiT1SVECqenaN
 6MkKykLPcj9ed+UNL8ykeQN/DDv2pxQ462vi7y/XuLWscXqZe7+4cDt6/aXrb5mQTI
 2oybl4A6MUIjg==
Date: Tue, 7 Jun 2022 11:45:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <fengnanchang@gmail.com>
Message-ID: <Yp+cwxXag2ZPbvb8@google.com>
References: <20220511071419.100386-1-fengnanchang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511071419.100386-1-fengnanchang@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/11, Fengnan Chang wrote: > When decompressed failed,
 f2fs_prepare_compress_overwrite will enter > endless loop, may casue hungtask.
 > > [ 14.088665] F2FS-fs (nvme0n1): lz4 decompress failed, ret [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nyeCy-0003fS-IV
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix hungtask when decompressed fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/11, Fengnan Chang wrote:
> When decompressed failed, f2fs_prepare_compress_overwrite will enter
> endless loop, may casue hungtask.
> 
> [   14.088665] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155
> [   14.089851] F2FS-fs (nvme0n1): lz4 decompress failed, ret:-4155
> 
> Signed-off-by: Fengnan Chang <fengnanchang@gmail.com>
> ---
>  fs/f2fs/compress.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 12a56f9e1572..6a65443fd9b3 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1060,7 +1060,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  	sector_t last_block_in_bio;
>  	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
>  	pgoff_t start_idx = start_idx_of_cluster(cc);
> -	int i, ret;
> +	int i, ret, retry_count = 3;
>  
>  retry:
>  	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
> @@ -1120,7 +1120,12 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  			f2fs_put_rpages(cc);
>  			f2fs_unlock_rpages(cc, i + 1);
>  			f2fs_destroy_compress_ctx(cc, true);
> -			goto retry;

Do we need to return EIO right away?
			if (!page)
				goto retry;
			ret = -EIO;
			goto out;

> +			if (retry_count--)
> +				goto retry;
> +			else {
> +				ret = -EIO;
> +				goto out;
> +			}
>  		}
>  	}
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
