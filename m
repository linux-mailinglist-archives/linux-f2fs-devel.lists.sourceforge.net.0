Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B649F097
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 02:34:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDGA4-0008Ja-Jb; Fri, 28 Jan 2022 01:34:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nDGA3-0008JU-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/5Pws0QPBSAkWs4DXMZwEniy7T6HvoJHEut3Nbsq2I=; b=CYmtbx6tR35v6hH/e+/iFLFqTh
 /YWrKhadzcM/7/WjNpqSuL2D8zh50EFyOUq0sFTN0p8f04raB3tZLFgX4FvFocpDG8SNtBWvDFHZl
 g1DX1LdU5pJn3MOXA3vso48A5Ytz0y215Liprs7gBqr24kas/+dbwtaslJQw6Jo6Pfks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L/5Pws0QPBSAkWs4DXMZwEniy7T6HvoJHEut3Nbsq2I=; b=LYzCY3c8ym4N8oI9knAB8Ir4Db
 uDCnJmSQyUu8XxXWZSqe66vxdQ6hWp4zHk1VZZaPFXdjDYcA2cCLzuneoKS8qcP/42IzPKYDzU1EY
 298Sh4H4wwQzMeNYn5kTirZkhb2i4o5i8YD3sb0Uab9xfNKma0FLob1CTuPaact0n/M8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDGA1-00HQVA-B6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:34:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9335961D9F;
 Fri, 28 Jan 2022 01:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A24C340E4;
 Fri, 28 Jan 2022 01:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643333674;
 bh=syJ8YNq0jFqssCN+Fpn6CejIFER0XxHyJW+5cZh7qQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r4MmK2L91UnUY3Ju+lob6pGYrfuC4tFQze7/UdZcwtg0my1bI0HYZ/EGzcR2/0eYh
 5qWQkXkz6GQ99yyiTKsnnZ4hM95RpS6f7bdJAM5P56admAP3hc/ZCtXKNCnRVkrgES
 v2zuReXf7omP1BD/F2BPe0mg+8tbNoZzsZhdyhFKiYcIFiKTzLCcaIL+zbZB+jgKI2
 HaKelY2L0Vg6ndyDgX/aggsEHmYplzWVSHFk3KYEO4hj0B99GHfDlJ8bPCc2gICQtz
 XRdKz8lPe2Sew/3rSqRIVIUhmZZ9ob0Va5c0yw/atKn6Dw4IaoROTNoyJVls08WLFV
 3jQ5xdJOfRU/w==
Date: Thu, 27 Jan 2022 17:34:31 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: NeilBrown <neilb@suse.de>
Message-ID: <YfNIJxirDBO/pcQQ@google.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
 <164325158956.29787.7016948342209980097.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164325158956.29787.7016948342209980097.stgit@noble.brown>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/27, NeilBrown wrote: > f2fs_write_single_data_page()
 can return -EAGAIN if it cannot get > the cp_rwsem lock - it holds a page
 lock and so cannot wait for it. > > Some code which calls f2fs_writ [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDGA1-00HQVA-B6
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: change retry waiting for
 f2fs_write_single_data_page()
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/27, NeilBrown wrote:
> f2fs_write_single_data_page() can return -EAGAIN if it cannot get
> the cp_rwsem lock - it holds a page lock and so cannot wait for it.
> 
> Some code which calls f2fs_write_single_data_page() use
> congestion_wait() and then tries again.  congestion_wait() doesn't do
> anything useful as congestion is no longer tracked.  So this is just a
> simple sleep.
> 
> A better approach is it wait until the cp_rwsem lock can be taken - then
> try again.  There is certainly no point trying again *before* the lock
> can be taken.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  fs/f2fs/compress.c |    6 +++---
>  fs/f2fs/data.c     |    9 ++++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d0c3aeba5945..58ff7f4b296c 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1505,9 +1505,9 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  				if (IS_NOQUOTA(cc->inode))
>  					return 0;
>  				ret = 0;
> -				cond_resched();
> -				congestion_wait(BLK_RW_ASYNC,
> -						DEFAULT_IO_TIMEOUT);
> +				/* Wait until we can get the lock, then try again. */
> +				f2fs_lock_op(F2FS_I_SB(cc->inode));
> +				f2fs_unlock_op(F2FS_I_SB(cc->inode));

Since checkpoint uses down_write(cp_rwsem), I'm not sure the write path is safe
and needs to wait for checkpoint. Can we just do io_schedule_timeout()?

>  				goto retry_write;
>  			}
>  			return ret;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8c417864c66a..1d2341163e2c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3047,9 +3047,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  				} else if (ret == -EAGAIN) {
>  					ret = 0;
>  					if (wbc->sync_mode == WB_SYNC_ALL) {
> -						cond_resched();
> -						congestion_wait(BLK_RW_ASYNC,
> -							DEFAULT_IO_TIMEOUT);
> +						/* Wait until we can get the
> +						 * lock, then try again.
> +						 */
> +						f2fs_lock_op(F2FS_I_SB(mapping->host));
> +						f2fs_unlock_op(F2FS_I_SB(mapping->host));
> +
>  						goto retry_write;
>  					}
>  					goto next;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
