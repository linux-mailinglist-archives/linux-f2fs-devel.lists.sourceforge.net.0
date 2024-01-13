Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 075AF82C8D9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 02:40:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOT0F-0004Kc-3u;
	Sat, 13 Jan 2024 01:40:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rOT0C-0004Jr-Uf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iISXWxb37TnwZxT3Vv/RKVzuqVoF+SgUPqnnMZofuPY=; b=hM8BNB2GKdgkp/E1+aeAV+CVj8
 Kqzp//gNoWz+RebzU7biMhnyu4Yo1mxCzHy14EXVqlGbM9qjv/YQiC8kI5ji9X29ZNxMmKz7AbSNo
 yCW+Zkm0ebDzyhXHpQniD7TDZIVWRZDv6YTUWIM1VWFB1y6/cWu/UDxt2O1JcywENgxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iISXWxb37TnwZxT3Vv/RKVzuqVoF+SgUPqnnMZofuPY=; b=VtyumZkYpAJa/oRbFxuda67wAQ
 wD8QaF2o0kD9YTjzGratR+5yPA51rEoZIqOIriWP7srWvVfLdK1LJyGatL5H1aIq4rcWSxpIr2TVQ
 bUD638rTOAvKFob8z1pTw/DpWhPqWEZa7xa6D1yCwoM6xF0MPylRjlbHCKhxzuBezSrs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOT0B-0007b1-Cx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 01:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A4330B822AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jan 2024 01:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA4AC433F1;
 Sat, 13 Jan 2024 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705109988;
 bh=pzmGx/Cqn9yoKWW1PX3E2wDCNFvPFHwZ66zWLOpzMMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KC+e+NqhvI7SWl9nfNtjScBcJoQKv3cTdJpYGp/GVQ4wf+NA1IhaNcQlVFk9jtUeO
 bPJ80Poq8zwahqWg/TjhdKkOlnpDrh/8WTfiM8K0L/mcfy1VTeJ/TFpquWzkzE5yaT
 EYkmPiz48dmUhdAbuCeDSfXTtbalVr3UTwKfSyB0CM7Zv+QGhizshSoww5ooDWc/Go
 OI7cjSAUlC+kb0RYowCNDhBJc5zgiLxgtkDBMZNyphg/GHXub0XXrMhYjNH0kOucC7
 TRS6DwbanrQ5cKBJ3ZCANyEz6kCxs+f/BPAsrEJugudMk9J1Rnm9aWLMs04ePTg6sd
 bza1i4GrXJ4cQ==
Date: Fri, 12 Jan 2024 17:39:46 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZaHp4to18RtGShWS@google.com>
References: <20240111064208.2969599-1-chao@kernel.org>
 <20240111064208.2969599-2-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111064208.2969599-2-chao@kernel.org>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Cleaned up a bit: --- a/fs/f2fs/compress.c +++
 b/fs/f2fs/compress.c
 @@ -1443,13 +1443,14 @@ void f2fs_compress_write_end_io(struct bio *bio,
 struct page *page) } static int f2fs_write_raw_pages(struct compress_ctx *cc, 
 - int *submitted, + int *submitted_p, struct writeback_control *wbc, enum
 iostat_type io_type) { struct address_space *mapping = cc->inode->i_ [...]
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOT0B-0007b1-Cx
Subject: Re: [f2fs-dev] [PATCH v4 2/6] f2fs: compress: fix to cover normal
 cluster write with cp_rwsem
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

Cleaned up a bit:

--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1443,13 +1443,14 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 }

 static int f2fs_write_raw_pages(struct compress_ctx *cc,
-                                       int *submitted,
+                                       int *submitted_p,
                                        struct writeback_control *wbc,
                                        enum iostat_type io_type)
 {
        struct address_space *mapping = cc->inode->i_mapping;
        struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
-       int _submitted, compr_blocks, ret = 0, i;
+       int submitted, compr_blocks, i;
+       int ret = 0;

        compr_blocks = f2fs_compressed_blocks(cc);

@@ -1492,7 +1493,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
                if (!clear_page_dirty_for_io(cc->rpages[i]))
                        goto continue_unlock;

-               ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
+               ret = f2fs_write_single_data_page(cc->rpages[i], &submitted,
                                                NULL, NULL, wbc, io_type,
                                                compr_blocks, false);
                if (ret) {
@@ -1514,7 +1515,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
                        goto out;
                }

-               *submitted += _submitted;
+               *submitted_p += submitted;
        }

 out:

On 01/11, Chao Yu wrote:
> When we overwrite compressed cluster w/ normal cluster, we should
> not unlock cp_rwsem during f2fs_write_raw_pages(), otherwise data
> will be corrupted if partial blocks were persisted before CP & SPOR,
> due to cluster metadata wasn't updated atomically.
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/compress.c | 20 ++++++++++++++------
>  fs/f2fs/data.c     |  3 ++-
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 9940b7886e5d..bf4cfab67aec 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1448,7 +1448,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  					enum iostat_type io_type)
>  {
>  	struct address_space *mapping = cc->inode->i_mapping;
> -	int _submitted, compr_blocks, ret, i;
> +	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
> +	int _submitted, compr_blocks, ret = 0, i;
>  
>  	compr_blocks = f2fs_compressed_blocks(cc);
>  
> @@ -1463,6 +1464,10 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  	if (compr_blocks < 0)
>  		return compr_blocks;
>  
> +	/* overwrite compressed cluster w/ normal cluster */
> +	if (compr_blocks > 0)
> +		f2fs_lock_op(sbi);
> +
>  	for (i = 0; i < cc->cluster_size; i++) {
>  		if (!cc->rpages[i])
>  			continue;
> @@ -1495,26 +1500,29 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  				unlock_page(cc->rpages[i]);
>  				ret = 0;
>  			} else if (ret == -EAGAIN) {
> +				ret = 0;
>  				/*
>  				 * for quota file, just redirty left pages to
>  				 * avoid deadlock caused by cluster update race
>  				 * from foreground operation.
>  				 */
>  				if (IS_NOQUOTA(cc->inode))
> -					return 0;
> -				ret = 0;
> +					goto out;
>  				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>  				goto retry_write;
>  			}
> -			return ret;
> +			goto out;
>  		}
>  
>  		*submitted += _submitted;
>  	}
>  
> -	f2fs_balance_fs(F2FS_M_SB(mapping), true);
> +out:
> +	if (compr_blocks > 0)
> +		f2fs_unlock_op(sbi);
>  
> -	return 0;
> +	f2fs_balance_fs(sbi, true);
> +	return ret;
>  }
>  
>  int f2fs_write_multi_pages(struct compress_ctx *cc,
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 81f9e2cc49e2..b171a9980f6a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2839,7 +2839,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  		.encrypted_page = NULL,
>  		.submitted = 0,
>  		.compr_blocks = compr_blocks,
> -		.need_lock = LOCK_RETRY,
> +		.need_lock = compr_blocks ? LOCK_DONE : LOCK_RETRY,
>  		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
>  		.io_type = io_type,
>  		.io_wbc = wbc,
> @@ -2920,6 +2920,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
>  	if (err == -EAGAIN) {
>  		err = f2fs_do_write_data_page(&fio);
>  		if (err == -EAGAIN) {
> +			f2fs_bug_on(sbi, compr_blocks);
>  			fio.need_lock = LOCK_REQ;
>  			err = f2fs_do_write_data_page(&fio);
>  		}
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
