Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD0570F93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jul 2022 03:36:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oB4pE-0004Qb-VS; Tue, 12 Jul 2022 01:36:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oB4pD-0004QV-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 01:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=92ygucdnz9/RyodLaIdgfSjWVyWnDI5/VqYIKiPR9cQ=; b=VVXHOi5p6dqS/GeNzgUUEVPbjO
 RKFmt+AnnyYA5s/tSRZj75Aoelnqxb7gaE0FLsSYGk0YFW0Qds90ktS6J/0AKeNU1Zwt8K6zZltzW
 5RZVsZWnwk0L6i7YQSd7tI3E1wT8ZGhYv3pnrHJ+nnUHqAONeuk769UgRYfcv+gP/DLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=92ygucdnz9/RyodLaIdgfSjWVyWnDI5/VqYIKiPR9cQ=; b=AvPJm1jXWJS9xqTLxe0JnfdTAe
 q5i312HYSpfwsxQDgS57SNicOaJH1vMu2h+ulWVIeUHn7lMdNU1R40iWa0Xknk54L/e5IMNkDBGcu
 /0CQ8BhrGI3zl+SVWbR3On3JLo4N0eL6oX5N6+9wTOAROdAf+AiEUD/QVWWPIZaPtN6o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oB4p7-0004BZ-RI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 01:36:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADE60B8162D;
 Tue, 12 Jul 2022 01:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8663C3411C;
 Tue, 12 Jul 2022 01:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657589777;
 bh=abHCq8B2o5LmiSh6NVX2ViHoKDAMvedKljs2uYyePag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qaDgs4VDWLWaO2CeuIz4TzgPD6Da8R8RL1qnYqUcmYK3NFlvaiUgw7aD83/CeAebW
 ZhQUavLZzC4w8UC7VmZ/trapbEmsdEc0vQoOPLnKPWdOPSN6LJ9R5vsnUIViIoItED
 uv3lSDL8gEv7d9eAaz2wbZfToTVVkfc1svdtnr5DlQa2KdRf4omCDl4OMMAfkhsIm+
 QKBlbhGwxpLj/+b9hoMqVm4VdTXgwoqXWC8VHI8zh02WYOBTp7tsskeuxuJR50ISP4
 ZFE1A3eTxBhhD+q6gYa1zHM03J+tD7SS0Px2M3DUMs82iTdDPwOyIuSVw4hs7C6Amf
 M7A3i/8ZvkUig==
Date: Mon, 11 Jul 2022 18:36:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Liu <chaoliu719@gmail.com>
Message-ID: <YszQD8Pk3YTvPgpn@google.com>
References: <20220707090924.4183376-1-chaoliu719@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707090924.4183376-1-chaoliu719@gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/07,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > Files created by truncate(1) have a size but no blocks, so > they can
 be allowed to enable compression. > > Signed-off-by: Chao Liu [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oB4p7-0004BZ-RI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow compression of files without
 blocks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/07, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> Files created by truncate(1) have a size but no blocks, so
> they can be allowed to enable compression.
> 
> Signed-off-by: Chao Liu <liuchao@coolpad.com>
> ---
> v2:
>  - update commit message: truncate -> truncate(1)
> 
>  fs/f2fs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 0f29af7876a6..f7a82858486a 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1879,7 +1879,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>  		if (iflags & F2FS_COMPR_FL) {
>  			if (!f2fs_may_compress(inode))
>  				return -EINVAL;
> -			if (S_ISREG(inode->i_mode) && inode->i_size)
> +			if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))

What about inline_data case?

>  				return -EINVAL;
> 
>  			set_compress_context(inode);
> --
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
