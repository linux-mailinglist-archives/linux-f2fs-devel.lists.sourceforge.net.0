Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6659BC683
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 08:04:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8Dc7-0002FS-LH;
	Tue, 05 Nov 2024 07:04:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t8Dc6-0002FG-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 07:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r+3b+74j+ir1hEXwJo9yYUQgNvBmgc7fQn8arR3sff4=; b=Ne/7PipunpY4IfaoMmhVJXxBHN
 0s3VPcxpZxYsNPgl7KIMbcg/MIY+2YITrXLocJdo490ex/rPRSrYcDszanalLz2wugsQ8ChjPLrQY
 u8ITbudRpXeoz8Au2T/PGxJjBnkGUTty5nBDkV/a4LR5MJqxTEQZClri93RVVti2YiA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r+3b+74j+ir1hEXwJo9yYUQgNvBmgc7fQn8arR3sff4=; b=Vjyby506QvIPQE9K21Hp1RMQeV
 W2wbyNhGKY+QrF0vzKo+I/c3j5hrwaIs4Po2afqYBNPWB86c+IlqN7OM669lEU4NuTRp1GsjuZ+T4
 XFiF7VrS0lZ+e9ro0L+jtQspIS9hxgQJb22niXsFyc6pLPHIh4iykXUqMYmL27SP7rhs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8Dc5-0000MJ-TX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 07:04:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4FE35C56AF;
 Tue,  5 Nov 2024 07:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFABC4CECF;
 Tue,  5 Nov 2024 07:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730790264;
 bh=bbE301m90ULv29UrCtK4FKya/NA2/RTIhNtW40SMa7M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=K9b1sj5h6ECF4jsJwNY+ic/mV0j84+esX6RTfeJuUGyVKSTHqzwpxK17fhxTS43Td
 1tmtdvByWPwGhatX3OWvtW2S16Qqx3yqrg8g6FrQ7Hj58vWd5v0IWebGhWG+0L6U30
 OQWcLp662hDzkhwjuW8YzHH4rXbkBGBM2guXXMP7r0ruAdiWQ/AeULM3PCbbZ02Z7P
 puK9DSPFIfSCRP1CkfomtiM5DbxGGnJmelhd6qqBlTIJ0Pz2swhYODZL7S/0tNbydm
 q+8QBHcOMjhZWQJD6HX9w8ssJD7XgJG/ErbU/jGbDxBpPJVuUWD+3vEydhZ6HPlz1t
 Pfy0rbaRo3fMg==
Message-ID: <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
Date: Tue, 5 Nov 2024 15:04:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/4 9:56, Zhiguo Niu wrote: > If user give a file
 size as "length" parameter for fiemap > operations,
 but if this size is non-block
 size aligned, > it will show 2 segments fiemap results even [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t8Dc5-0000MJ-TX
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
 for fiemap
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/4 9:56, Zhiguo Niu wrote:
> If user give a file size as "length" parameter for fiemap
> operations, but if this size is non-block size aligned,
> it will show 2 segments fiemap results even this whole file
> is contiguous on disk, such as the following results:
> 
>   ./f2fs_io fiemap 0 19034 ylog/analyzer.py
> Fiemap: offset = 0 len = 19034
>          logical addr.    physical addr.   length           flags
> 0       0000000000000000 0000000020baa000 0000000000004000 00001000
> 1       0000000000004000 0000000020bae000 0000000000001000 00001001
> 
> after this patch:
> ./f2fs_io fiemap 0 19034 ylog/analyzer.py
> Fiemap: offset = 0 len = 19034
>      logical addr.    physical addr.   length           flags
> 0    0000000000000000 00000000315f3000 0000000000005000 00001001
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> V2: correct commit msg according to Chao's questions
> f2fs_io has been modified for testing, the length for fiemap is
> real file size, not block number
> ---
>   fs/f2fs/data.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 306b86b0..9fc229d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1966,8 +1966,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>   			goto out;
>   	}
>   
> -	if (bytes_to_blks(inode, len) == 0)
> -		len = blks_to_bytes(inode, 1);
> +	if (len & (blks_to_bytes(inode, 1) - 1))
> +		len = round_up(len, blks_to_bytes(inode, 1));

How do you think of getting rid of above alignment for len?

>   
>   	start_blk = bytes_to_blks(inode, start);
>   	last_blk = bytes_to_blks(inode, start + len - 1);

And round up end position w/:

last_blk = bytes_to_blks(inode, round_up(start + len - 1, F2FS_BLKSIZE));

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
