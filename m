Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A81603D2705
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 17:48:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6aw6-000648-UW; Thu, 22 Jul 2021 15:48:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6aw5-00063l-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 15:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7aiucSsHrATGQKmdK3sDhgIQ6PKRH/Ay4ZO/kHsiOw0=; b=fJC3mx8L8A6rBAQcO0738AXWIT
 arf6htZW8nQ46CRWDMqHE4bSWjbv5e5+9YhTxgnWgLJg99/dUvbkkbwH2LzOfmXItFNaIanVsH/rG
 hLp23p3y29ebxRtKcha1w04zFrQPfVWDQpkTMila7/FGqNuv812km+T/gshOFd0b+V5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7aiucSsHrATGQKmdK3sDhgIQ6PKRH/Ay4ZO/kHsiOw0=; b=YEOROf9BQskAnMllQnMmGCfdWO
 OT09f1USm5q13rTzmWBNlK6HJW5N/g3i0R37xbX07Q/hGfnTvYBObk0FAw1jIuDZwIj/ORTFrdogA
 Ru0vYRempHe/fhglTWwNGbxOUpXClJE58+GdOvtmYmNK/I/B/A59oGu3rjZRD6BJFXwI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6avz-0007B6-GU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 15:48:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11B2C6100C;
 Thu, 22 Jul 2021 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626968897;
 bh=N+3UNY0ChTG0TW/Nyen5kYeSAGbhTDlwNe+vE04QuI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFH7KnaLSaq2l29PXug7JJ0ITGeHdZZ5IKs2bteKA9f4e/67EU+ZjBs8qt1+ujZrw
 hDGFmUdfO5pl0/RRCzmlhmx1Rm2b+94y5+LhF1k0Z/0C6H+gV3tyx7RFCwG1dAN9qF
 yNf1LE29kWBqCSGBC+mU22Q19c+BoOazDGE2yyL3TVM4kVjWUf3VyuIbpNnGtiN4ai
 m99x5SQewexWx5ZM+jG9Gp5a6y0ID3CywvTn4mMKyxxx9XRPNm6wanSnzQ4UOYufIU
 DTisWBGhJZcejO3uf5fkoAOn071VB+7U9Zj6W+auGLgDMPZx+es+M5CaQ8bBfm3zgl
 tNjTQFZPGKSBA==
Date: Thu, 22 Jul 2021 08:48:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YPmTP5EixgTp1Wze@gmail.com>
References: <20210722131617.749204-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722131617.749204-1-chao@kernel.org>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6avz-0007B6-GU
Subject: Re: [f2fs-dev] [PATCH] f2fs: simplify accounting inflight directIO
 request
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Chao Yu <chao.yu@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 09:16:17PM +0800, Chao Yu wrote:
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index ba120d55e9b1..d0a1ca6ae38e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1720,6 +1720,9 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
>  		map_bh(bh, inode->i_sb, map.m_pblk);
>  		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
>  		bh->b_size = blks_to_bytes(inode, map.m_len);
> +
> +		if (flag == F2FS_GET_BLOCK_DIO)
> +			bh->b_private = (void *)may_write;

Why is this hunk needed?

> +static int f2fs_dio_end_io(struct kiocb *iocb, loff_t offset,
> +					ssize_t bytes, void *private)
>  {
> -	struct f2fs_private_dio *dio = bio->bi_private;
> -
> -	dec_page_count(F2FS_I_SB(dio->inode),
> -			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> -
> -	bio->bi_private = dio->orig_private;
> -	bio->bi_end_io = dio->orig_end_io;
> -
> -	kfree(dio);
> +	struct inode *inode = file_inode(iocb->ki_filp);
> +	bool may_write = private;
>  
> -	bio_endio(bio);
> +	dec_dio_req_count(F2FS_I_SB(inode), may_write ? WRITE : READ);
> +	return 0;
>  }
>  
>  static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
>  							loff_t file_offset)
>  {
> -	struct f2fs_private_dio *dio;
> -	bool write = (bio_op(bio) == REQ_OP_WRITE);
> -
> -	dio = f2fs_kzalloc(F2FS_I_SB(inode),
> -			sizeof(struct f2fs_private_dio), GFP_NOFS);
> -	if (!dio)
> -		goto out;
> -
> -	dio->inode = inode;
> -	dio->orig_end_io = bio->bi_end_io;
> -	dio->orig_private = bio->bi_private;
> -	dio->write = write;
> -
> -	bio->bi_end_io = f2fs_dio_end_io;
> -	bio->bi_private = dio;
> -
> -	inc_page_count(F2FS_I_SB(inode),
> -			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
> +	inc_dio_req_count(F2FS_I_SB(inode),
> +			op_is_write(bio_op(bio)) ? WRITE : READ);
>  
>  	submit_bio(bio);
> -	return;
> -out:
> -	bio->bi_status = BLK_STS_IOERR;
> -	bio_endio(bio);
>  }

The inc and dec here aren't correctly paired, since f2fs_dio_submit_bio() is
called once per bio whereas f2fs_dio_end_io() is called when the entire direct
I/O request (which may have consisted of multiple bios) has completed.

The correct way to do this would be to do the inc before calling
__blockdev_direct_IO(), and do the dec in end_io or if __blockdev_direct_IO()
returned without actually issuing any I/O.

But I think you shouldn't bother with this part of the change before we switch
to iomap, as it will then need to be changed again anyway.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
