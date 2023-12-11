Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF880DDFF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Dec 2023 23:09:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCoST-0000Zf-LV;
	Mon, 11 Dec 2023 22:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rCoSS-0000ZT-Ca
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lR/kHrVxxwerJc4qdtqz651mTxbMyDNBs9XegadSoD4=; b=ZQQCIB++g4kCrK+lLNYUtlhpme
 lF4r//OpOmXMHth/Hx/EQQGlOUi8GQMmy+HbIB6z2RCtxXPddehtKVpnAsUv1gxBwZd1BYWhKKCSf
 nf8q2qtRU3KEOBez/EGshGebXR5Ti5ImafX154nAf07jRCqpHAD//3yxFVP3hjFr48wQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lR/kHrVxxwerJc4qdtqz651mTxbMyDNBs9XegadSoD4=; b=gCBH1ndF/I4ObWj5WPibCuSPPB
 PVyjGT9EmhPUQoA9/ODJmtc36yI9ryKk/mqC6G9ZE5BBRPwiYaoVbdmad5pLDYr1AVY2nLxv3bbXW
 wG4dsFSDuEELVYoY/jwRQ9qTcLvkj5ubS3axyn/c7CEQ16+zwqSBwYCdUsC72nsyVOnk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCoSO-0005mB-C1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:09:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 47486B810B5;
 Mon, 11 Dec 2023 22:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5B2C433C9;
 Mon, 11 Dec 2023 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702332523;
 bh=iDewZAyJOxIOJgkget2tmiP/MAlk2VhzGLtGrH05aaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3Z4OEv/bQCRGBikvcKo6n6zysKC22iBZJFAOV4Q5sUkus013tBJ2R7dpS9Ujl4uO
 DvNriuKSqj1YuhXUgGY6Jtt4HeNFcgNHmQwwpgVZIsj5Fq3bd2zHsv70PMaXpD18SW
 wbKRGGr4gxZwGDqGGevLKqD7qrWRAY8b1k5RAu9DemcVqULnc4P886MT9SIZJmICuf
 dqFPoIo0vzPFnXk5nyP7RYEZERK7yfNacfklZVIv0sj26HA8Fc11Or9XmCxWvlZCTk
 6VEytIPHy3NkTea2rTsJlLy6R16JcyNBu8QYzplFVlo5aXqJLNKtVLvrO1a1WQk51R
 KkNf8E+5eMVag==
Date: Mon, 11 Dec 2023 14:08:41 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZXeIabjxfk8tN10r@google.com>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-4-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231210113547.3412782-4-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/10, Chao Yu wrote: > In f2fs_preallocate_blocks(), if
 it is partial write in 4KB, it's not > necessary to call f2fs_map_blocks()
 and set FI_PREALLOCATED_ALL flag. > > Cc: Eric Biggers <ebiggers@ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCoSO-0005mB-C1
Subject: Re: [f2fs-dev] [PATCH 4/6] f2fs: don't set FI_PREALLOCATED_ALL for
 partial write
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/10, Chao Yu wrote:
> In f2fs_preallocate_blocks(), if it is partial write in 4KB, it's not
> necessary to call f2fs_map_blocks() and set FI_PREALLOCATED_ALL flag.
> 
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/file.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5c2f99ada6be..1a3c29a9a6a0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4561,13 +4561,14 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>  			return ret;
>  	}
>  
> -	/* Do not preallocate blocks that will be written partially in 4KB. */
>  	map.m_lblk = F2FS_BLK_ALIGN(pos);
>  	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> -	if (map.m_len > map.m_lblk)
> -		map.m_len -= map.m_lblk;
> -	else

		return 0;

We just need the above?

> -		map.m_len = 0;
> +
> +	/* Do not preallocate blocks that will be written partially in 4KB. */
> +	if (map.m_len <= map.m_lblk)
> +		return 0;
> +
> +	map.m_len -= map.m_lblk;
>  	map.m_may_create = true;
>  	if (dio) {
>  		map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
