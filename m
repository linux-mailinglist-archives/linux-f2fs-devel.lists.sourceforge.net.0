Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD543BFD5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Oct 2021 04:31:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfYiX-00035F-SM; Wed, 27 Oct 2021 02:31:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mfYiW-000350-1f
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R1zwvZXiM4e6XJM1xJIY/eTVZmBXh3WQwKvD8ogamOE=; b=ie38MP2KDi97LMBMJCqkTbVUIM
 dTqh9wkYjaAaehOu524W/HLxvS3Fb9Mb1XEWFGWiaVFtC76ENYyxo1OZtw2q/cg1EveUZOhFvvYdP
 mZVV5ifQU6vglNM++cIevejqJDSsps/8sgGcAnaMI8GbuSgyGE1Nnm2kuUiL3xZGQ8/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R1zwvZXiM4e6XJM1xJIY/eTVZmBXh3WQwKvD8ogamOE=; b=SPx1DjsdarlrHfvdGC2iHuyttx
 w58FjA+mS4WE3pOajSv35u8JPQzKrJjwuYnBESkQu4JhiHQeYsdUwmYh1E8tQn2dsRVRIlYeqRkwj
 maGoYjtC0FMBOZxkKoHvFz/fJN1/q29BXMC+HCXFSJ78sQfn1JsoWNtxYZ8OH2od+5gQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfYi1-000SnG-C5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Oct 2021 02:31:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 188576103C;
 Wed, 27 Oct 2021 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635301827;
 bh=8jfjUOtLlxe1Xc4nIX3DS+wXCQH4UmC6cRfApye30ew=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lQ88DKTfET9VPgoo7bj4HF9AIg8fkFwu1V9yt58FgYGuGNXJg/Yuv9HngrNE+SbBq
 dc9aQhcCXXDCq4NEsBTx6qvJXvkOsdJ2lwEeQqdBIUdgn/slFkaigH/pZRvqX6aEs2
 mkNUE75+CYcVbviuw9NoGGfD3PTduW5S/2SFoRrJO6b0my4qPI37Ru4Jr1nIAGeem9
 S8PmFraPsy3rmY47cFuormXDVMwIPAvWvDUiYPWAuPG7c1qf3ePR/TQ6Ty5wnBv5uE
 xMK6AaY8EVQgIW9Er7ntE9Nr227wmrojlXe57zIkG2zdpz3J9qlnKP2qiTFxd1AYkh
 r1rwGJOQPVWiQ==
Message-ID: <d5ac2754-85a3-8935-d1f8-829539664ca0@kernel.org>
Date: Wed, 27 Oct 2021 10:30:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Hyeong-Jun Kim <hj514.kim@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CGME20211025140526epcas1p3b4a59df0935297572c6417c841a4c514@epcas1p3.samsung.com>
 <20211025140517.14741-1-hj514.kim@samsung.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211025140517.14741-1-hj514.kim@samsung.com>
X-Headers-End: 1mfYi1-000SnG-C5
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: disallow disabling compress
 on non-empty compressed file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/25 22:05, Hyeong-Jun Kim wrote:
> Compresse file and normal file has differ in i_addr addressing,
> specifically addrs per inode/block. So, we will face data loss, if we
> disable the compression flag on non-empty files. Therefore we should
> disallow not only enabling but disabling the compression flag on
> non-empty files. >

Hi Hyeong-Jun,

I think this makes sense.

But one more case may bypass below condition, could you please take a look
at this case:

touch file
chattr +c file
f2fs_io pinfile set file
fallocate file -o 0 -l 16384 -n
chattr -c file

So it's better to check F2FS_HAS_BLOCKS() as well in the condition?

Fixes: 4c8ff7095bef ("f2fs: support data compression")

Thanks,

> Signed-off-by: Sungjong Seo <sj1557.seo@samsung.com>
> Signed-off-by: Hyeong-Jun Kim <hj514.kim@samsung.com>
> ---
>   fs/f2fs/f2fs.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b8e8f8c716b0..19146c834abd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4177,8 +4177,7 @@ static inline bool f2fs_disable_compressed_file(struct inode *inode)
>   
>   	if (!f2fs_compressed_file(inode))
>   		return true;
> -	if (S_ISREG(inode->i_mode) &&
> -		(get_dirty_pages(inode) || atomic_read(&fi->i_compr_blocks)))
> +	if (S_ISREG(inode->i_mode) && inode->i_size)
>   		return false;
>   
>   	fi->i_flags &= ~F2FS_COMPR_FL;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
