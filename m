Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38C8AB56C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Apr 2024 21:10:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rxtd4-0007FA-Kq;
	Fri, 19 Apr 2024 19:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rxtd3-0007Eq-2o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 19:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vzys6kQkfpy2bgo4TM16CNO26rHuswY5Glt2BCGhAIY=; b=F/0lTZP9Sx2hhpTLJrBihLW5ie
 AOOjr0XEvIJfnY6/ukINKJh7rDsoLFiBPfbAcPv5S2JEDI5wL4N2I+8rhnTZIwiU+8tDjzgZePO5o
 DRjNWAKaRNjNHojr7rWsqiDYSesB/D0Uk8j1qRQLEHi+3SC5tIsqFXNnxeI0NdvYekMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vzys6kQkfpy2bgo4TM16CNO26rHuswY5Glt2BCGhAIY=; b=bJ/3RJtdFMZUtfk5Ft0bEJigJQ
 WbRKf+vM+XdxC3i4VhrhMhJpOZOMmK7cgOAx1zr96aCRkNjeLbalbzA8NByFYfwnevAy+8sHUwa3c
 fZMg9YRZ9cG0TciMy9XYnpYVGELXP2uVejTb7nS2MScZxYdFxR7teCIwN6fnHdCVK48s=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rxtd1-000665-OP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Apr 2024 19:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5E3F3CE1AF2;
 Fri, 19 Apr 2024 17:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699EDC072AA;
 Fri, 19 Apr 2024 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713549189;
 bh=P2h7NW9QjUk3cE2jlrJqRMYAHHbhKGmJ+CTFhzN817A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gaZYhUEnU3VfSParrHl6KKiepB3fFueoOM2hwOqHE5yedqk7QNk6qsad/mih2kHer
 qpT7SlQloK3U3PZynESBbDoPC87KTIRgWj8RwFzeKDSYR1TjDaXt+5zQSR7VjKLhcf
 te90Bace9VO/WlK1qD18cdy5YrN8E/Xfg2bxC8GFGxIFYl3dklI8j0nZuLFMEri/1u
 6GhvolJ+B7D3eVi4KMzuyl9HOAq5Gk3/jRX8ddtOlCX41TSEU4vnrZ4Ojt4/FxeBP0
 jamxV1WsCFd1xI4p1FTgPX4s+EEaqUxESlnNcALK0HAgzFP8zL3/1qt33XzmOWHdxl
 QymKuu3UkBPuA==
Date: Fri, 19 Apr 2024 17:53:07 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZiKvg81HxG088cwm@google.com>
References: <20240418033334.861570-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418033334.861570-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, Chao, If you don't mind, can I merge this into my
 patch. Ok? On 04/18, Chao Yu wrote: > f2fs has its own write_hint policy,
 let's assign write hint for > direct write bio. > > Cc: Hyunchul Lee
 <cheol.lee@lge.com>
 > Signed-off-by: Chao Yu <chao@kernel.org> > --- [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rxtd1-000665-OP
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign write hint in direct write IO
 path
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
Cc: Hyunchul Lee <cheol.lee@lge.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, Chao,

If you don't mind, can I merge this into my patch. Ok?

On 04/18, Chao Yu wrote:
> f2fs has its own write_hint policy, let's assign write hint for
> direct write bio.
> 
> Cc: Hyunchul Lee <cheol.lee@lge.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/f2fs.h    |  1 +
>  fs/f2fs/file.c    | 15 ++++++++++++++-
>  fs/f2fs/segment.c | 17 +++++++++++------
>  3 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b3b878acc86b..3f7196122574 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3722,6 +3722,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>  			block_t old_addr, block_t new_addr,
>  			unsigned char version, bool recover_curseg,
>  			bool recover_newaddr);
> +int f2fs_get_segment_temp(int seg_type);
>  int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>  			block_t old_blkaddr, block_t *new_blkaddr,
>  			struct f2fs_summary *sum, int type,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ac1ae85f3cc3..d382f8bc2fbe 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4685,8 +4685,21 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
>  	return 0;
>  }
>  
> +static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
> +					struct bio *bio, loff_t file_offset)
> +{
> +	struct inode *inode = iter->inode;
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	int seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> +	enum temp_type temp = f2fs_get_segment_temp(seg_type);
> +
> +	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
> +	submit_bio(bio);
> +}
> +
>  static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
> -	.end_io = f2fs_dio_write_end_io,
> +	.end_io		= f2fs_dio_write_end_io,
> +	.submit_io	= f2fs_dio_write_submit_io,
>  };
>  
>  static void f2fs_flush_buffered_write(struct address_space *mapping,
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index daa94669f7ee..2206199e8099 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3502,6 +3502,15 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  	}
>  }
>  
> +int f2fs_get_segment_temp(int seg_type)
> +{
> +	if (IS_HOT(seg_type))
> +		return HOT;
> +	else if (IS_WARM(seg_type))
> +		return WARM;
> +	return COLD;
> +}
> +
>  static int __get_segment_type(struct f2fs_io_info *fio)
>  {
>  	int type = 0;
> @@ -3520,12 +3529,8 @@ static int __get_segment_type(struct f2fs_io_info *fio)
>  		f2fs_bug_on(fio->sbi, true);
>  	}
>  
> -	if (IS_HOT(type))
> -		fio->temp = HOT;
> -	else if (IS_WARM(type))
> -		fio->temp = WARM;
> -	else
> -		fio->temp = COLD;
> +	fio->temp = f2fs_get_segment_temp(type);
> +
>  	return type;
>  }
>  
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
