Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CADD6878C86
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 02:51:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjrIJ-0000GF-IO;
	Tue, 12 Mar 2024 01:51:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rjrIG-0000G6-D1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Glbkd3TT4MotuckgLaUR/n3NtObJrFPGC/f6XXhf4Vw=; b=f4Ev2zMAQGMpfg5yisrjteoqcZ
 OtUakmqL7U8W1Okl36lROCnYTsli76igCjxYrcq5DSFf9WdX4kX9FuHqPVKUQAFLtImLKUhs6n+en
 X4XenWRcfmpndT3B+Yz97Jp/67FrqdZWXwT8r8zSdwnNYadJYA8lTOXWsf2g4imHNBgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Glbkd3TT4MotuckgLaUR/n3NtObJrFPGC/f6XXhf4Vw=; b=UfGnHyl3LcwG82t/BH+ufzYMy2
 Uli/LC4zT4gjcpLYDoSEdw2ZEm0pTMIjlzoS1US+C9+Ur5SGc+YTUZWHZRT9x3jDdveRSOqDWqfuq
 pXxAD4innt5J94v6BOtmumrVLmzRqLx6UWxOgjNVP+hty8et9r2+d0rTIKtevn67yAzY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjrI4-0002wS-PI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1A33ECE1412;
 Tue, 12 Mar 2024 01:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4002C433F1;
 Tue, 12 Mar 2024 01:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710208246;
 bh=5Vj2yV+2iZB9axYtdEYLw/0P7M4zjDA+EOXF1F8+bj8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gBC17MX9N5hKrFKfv+SDVlZvZk2vy+HU8nJNig+SsIOQVL7pFiDqvb1Qs6t8Q5URP
 Hlo1RL0Mb1wdqFc8fWfFKvMrzwDpSaiKsCnFFR3iFoxTVyrjKSx37AaBO+TGKXV2OI
 PPU0/WOy4nAZTGU0It8k/dTKj0Iv6jUdp6expw+6iN/qgYakVdtnmkpm78IhyFj35K
 WD5QhLWjCAwdLWbwRQ4ffqozgIFInGJv0TxaTqzDx/Uc0g0sSS30siRhOrSfrX/Ar+
 Bu/jkV7ydVjIiQyCffeG+bPcOn60HE5Vin0gahBOfEyDjMgQt8yVE+BEF0so3M9UX1
 60SZl+Cj2FZBQ==
Message-ID: <ed15e402-d888-453a-b0f4-3fcff069e5fd@kernel.org>
Date: Tue, 12 Mar 2024 09:50:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240311235921.1832684-1-daeho43@gmail.com>
 <20240311235921.1832684-2-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240311235921.1832684-2-daeho43@gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/12 7:59, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a case writing without fallocate(), we can't
 guarantee it's allocated > in the conventional area for zoned stro [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1rjrI4-0002wS-PI
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: prevent writing without
 fallocate() for pinned files
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/12 7:59, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a case writing without fallocate(), we can't guarantee it's allocated
> in the conventional area for zoned stroage.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/data.c | 7 +++++++
>   fs/f2fs/file.c | 4 ++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c21b92f18463..5e4c11a719a0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3378,6 +3378,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   		f2fs_map_lock(sbi, flag);
>   		locked = true;
>   	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
> +		if (f2fs_is_pinned_file(inode))
> +			return -EIO;
>   		f2fs_map_lock(sbi, flag);
>   		locked = true;
>   	}
> @@ -3407,6 +3409,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   
>   	if (!f2fs_lookup_read_extent_cache_block(inode, index,
>   						 &dn.data_blkaddr)) {
> +		if (f2fs_is_pinned_file(inode)) {
> +			err = -EIO;
> +			goto out;
> +		}

Daeho,

Do we need to check in DIO path as well?

Thanks,

> +
>   		if (locked) {
>   			err = f2fs_reserve_block(&dn, index);
>   			goto out;
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82277e95c88f..f98730932fc4 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4611,6 +4611,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>   			return ret;
>   	}
>   
> +	/* For pinned files, it should be fallocate()-ed in advance. */
> +	if (f2fs_is_pinned_file(inode))
> +		return 0;
> +
>   	/* Do not preallocate blocks that will be written partially in 4KB. */
>   	map.m_lblk = F2FS_BLK_ALIGN(pos);
>   	map.m_len = F2FS_BYTES_TO_BLK(pos + count);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
