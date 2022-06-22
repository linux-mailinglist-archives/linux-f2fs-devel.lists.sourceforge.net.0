Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C467554B8C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 15:42:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o40cq-0004uR-9L; Wed, 22 Jun 2022 13:42:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o40cp-0004uH-4X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 13:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3q7fDIGosytsqOI3LNO+J+BBGFiVzuSsaJ3oroUF/s=; b=kXI1H7aSOK5BC+mUSvDJdLDbWg
 sXJSor6RnJg/l85lLKpvheVz7rQhaKN5jbunELi83b2Q7hfndk9oW5imEZJmCbOwlSYjRXux9piXM
 sCwVgweGGo82o+I29qjRhFLPS/IaLYY3apzZG4WP4cUE/5NUCy95COu0IHZPyDZB+wGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3q7fDIGosytsqOI3LNO+J+BBGFiVzuSsaJ3oroUF/s=; b=VirhRIkdDADn0euy3raeeqvw3r
 zXTFju2wVyj8SkG3EpdicT/9oTboNOsiwoPpZexX+Vxo399ONhdPxqLN4P4GAIqpK2wX6z3+NlMWe
 KQE37hZxfOzoNmJR+LZCjfLnt+9sKpY81nQcF//99L7G1CUh2zU5b/z6GLJ5LLIKIIsc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o40cn-00ALnm-29
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 13:42:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D330361B22;
 Wed, 22 Jun 2022 13:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9ACCC34114;
 Wed, 22 Jun 2022 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655905338;
 bh=FrB/4+7tsuZuC4Tew+ANJVJUtZpsL5HmpOFNjm1p794=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lKZdQZDJCzfpBdnTwsIbWvsQyyR1yhVCFqy3qnfwXHOlGJ9Mh/zIbQZ+y6AJP8y45
 /Fg0rGwtm0zcL5QDzKZqogVbv7ObMkXckcVYUcW9/HaLUJwJVxZiTWmvzw3pCwaH9e
 XC1QIu8tbMNsKddKrjKCiZPbExW5v4SiQMzA2XJV8BYGuVtAbOLYT/rSzsdBuHakHn
 XeY39+QW+iNc7dcUszkDtWdMAWYO4JK0eSZagjwOMWBgI5pAhWI6Yfn8xi0xomZNaN
 fc+EptDQmnGdXEAfU9cXoCA549VEpvsVW6jteaGA3bT5u8kTEGH9qqfuIu42NPPEi+
 04QopMK1lnOMw==
Message-ID: <0771b00b-e781-cd29-896a-4b6ebc948c2e@kernel.org>
Date: Wed, 22 Jun 2022 21:42:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220621064833.1079383-1-chaoliu719@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220621064833.1079383-1-chaoliu719@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/21 14:48,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > If the inode has the compress flag, it will fail to use > 'chattr -c
 +m' to remove its compress flag and tag no compress [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o40cn-00ALnm-29
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to remove F2FS_COMPR_FL and tag
 F2FS_NOCOMP_FL at the same time
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/21 14:48, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> If the inode has the compress flag, it will fail to use
> 'chattr -c +m' to remove its compress flag and tag no compress flag.
> However, the same command will be successful when executed again,
> as shown below:
> 
>    $ touch foo.txt
>    $ chattr +c foo.txt
>    $ chattr -c +m foo.txt
>    chattr: Invalid argument while setting flags on foo.txt
>    $ chattr -c +m foo.txt
>    $ f2fs_io getflags foo.txt
>    get a flag on foo.txt ret=0, flags=nocompression,inline_data
> 
> Fix this by removing some checks in f2fs_setflags_common()
> that do not affect the original logic. I go through all the
> possible scenarios, and the results are as follows. Bold is
> the only thing that has changed.
> 
> +---------------+-----------+-----------+----------+
> |               |            file flags            |
> + command       +-----------+-----------+----------+
> |               | no flag   | compr     | nocompr  |
> +---------------+-----------+-----------+----------+
> | chattr +c     | compr     | compr     | -EINVAL  |
> | chattr -c     | no flag   | no flag   | nocompr  |
> | chattr +m     | nocompr   | -EINVAL   | nocompr  |
> | chattr -m     | no flag   | compr     | no flag  |
> | chattr +c +m  | -EINVAL   | -EINVAL   | -EINVAL  |
> | chattr +c -m  | compr     | compr     | compr    |
> | chattr -c +m  | nocompr   | *nocompr* | nocompr  |
> | chattr -c -m  | no flag   | no flag   | no flag  |
> +---------------+-----------+-----------+----------+
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Liu <liuchao@coolpad.com>
> ---
> 
> This patch depends on the the patch
> "f2fs: allow compression of files without blocks" sent earlier this day.
> 
>   fs/f2fs/file.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index daaa0dfd2d2e..0c3ae5993b7a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1873,10 +1873,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>   		if (masked_flags & F2FS_COMPR_FL) {
>   			if (!f2fs_disable_compressed_file(inode))
>   				return -EINVAL;
> -		}
> -		if (iflags & F2FS_NOCOMP_FL)
> -			return -EINVAL;
> -		if (iflags & F2FS_COMPR_FL) {
> +		} else {
>   			if (!f2fs_may_compress(inode))
>   				return -EINVAL;
>   			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
> @@ -1885,10 +1882,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>   			set_compress_context(inode);
>   		}
>   	}
> -	if ((iflags ^ masked_flags) & F2FS_NOCOMP_FL) {
> -		if (masked_flags & F2FS_COMPR_FL)
> -			return -EINVAL;
> -	}

Without above check condition, can we return -EINVAL for the case:

chattr +c on file w/ nocompr flag

|               | no flag   | compr     | nocompr  |
+---------------+-----------+-----------+----------+
| chattr +c     | compr     | compr     | *-EINVAL*  |

Thanks,

> 
>   	fi->i_flags = iflags | (fi->i_flags & ~mask);
>   	f2fs_bug_on(F2FS_I_SB(inode), (fi->i_flags & F2FS_COMPR_FL) &&
> --
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
