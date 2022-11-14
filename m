Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181E628C51
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 23:49:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouiGf-00082w-1w;
	Mon, 14 Nov 2022 22:49:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ouiGd-00082q-LU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cBLc+7M1eky+zMCqXPMcU8rHmJHhUz1Ten725GUy+uU=; b=iDy9vZg+KQ0aFwOxg9oSbHjA4u
 zuERcp2r+aYRXjx1C9UVbbyw2Z3upLN0j0oMLLoUW3RRxDYCHfQ7MqrZPFEqD7RaKcyJ+yNLKcsSP
 k3rd2stzpsLFJT/MbdWt9hMakfSqi2BFDHtBiqNtpi1TntJKL3z0I3DFsGyvFjmbM0mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cBLc+7M1eky+zMCqXPMcU8rHmJHhUz1Ten725GUy+uU=; b=L6H9Rzjuw737Df0CJAeZVsL/Aq
 Ay4m7QQeZRWRh4fCYOLHEFiiIPssYUnHuIhdooGsGYiwqjOa4s3SyViI+W+z55gs+JvjT1N00DOtI
 2McZltKXynKrWD/v1bgdb9LHgaYnD8wNhqBPJylQCdYBRjyrjr2k4C+jpdhvz+A5ukaI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouiGd-008MNU-0Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:49:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4E13B815AE;
 Mon, 14 Nov 2022 22:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3746DC433C1;
 Mon, 14 Nov 2022 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668466159;
 bh=NUbobJY+jZAYI21ip8NyjBvUaJMuLs3oukj+yekIM1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Deqfpor/mvS8DHCUD46/1r7FOV8/ZrVbcLDz1CK2AdntkhEOWmtCNBrEZb6UMsM1+
 yTI4RyduIkMiHSrbh/9/pSRSUo8wkaqeMXh0q0bwBVHGPfRQXgyU3giet8LnwWnjdP
 Hgsw0upseB/DqjvrV3EIhOALCWGUAcIO0TiPYGGyD5fEZBaS9ZKM+vjbbKvWlHrT3n
 mz3lOoIi2zRy82GVoBJ/iBI4Hl5JcVV+E2vJtZnlQT0twlF2MGEX01vveVmN5YyGNF
 Q6UGuLZy8MKyuc+KLB78Hn05saCLsa8ZdE31UjkIuA5EeKLBZ6Lnii4XsiN6+ZBtDn
 tOwASrZTkixdA==
Date: Mon, 14 Nov 2022 14:49:17 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y3LF7SjCLKaz7OWi@google.com>
References: <20221111161349.60689-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111161349.60689-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/12, Yangtao Li wrote: > Complaint from Matthew Wilcox
 in another similar place: > > "submit? You don't submit anything at the
 'submit'
 label. > it should be called 'skip' or something. But I thi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouiGd-008MNU-0Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove submit label in
 __submit_discard_cmd()
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

On 11/12, Yangtao Li wrote:
> Complaint from Matthew Wilcox in another similar place:
> 
> 	"submit?  You don't submit anything at the 'submit' label.
> 	it should be called 'skip' or something.  But I think this
> 	is just badly written and you don't need a goto at all."
> 
> Let's remove submit label for readability.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/segment.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 3654c30e0517..0a72e787c585 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1144,13 +1144,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>  		if (time_to_inject(sbi, FAULT_DISCARD)) {
>  			f2fs_show_injection_info(sbi, FAULT_DISCARD);
>  			err = -EIO;
> -			goto submit;
> -		}
> -		err = __blkdev_issue_discard(bdev,
> +		} else
> +			err = __blkdev_issue_discard(bdev,
>  					SECTOR_FROM_BLOCK(start),
>  					SECTOR_FROM_BLOCK(len),
>  					GFP_NOFS, &bio);

Thanks. I added {} to meet the coding style.

> -submit:
>  		if (err) {
>  			spin_lock_irqsave(&dc->lock, flags);
>  			if (dc->state == D_PARTIAL)
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
