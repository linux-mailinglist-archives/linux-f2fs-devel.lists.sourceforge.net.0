Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC1A498CA5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jan 2022 20:26:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nC4yb-0003yV-Dg; Mon, 24 Jan 2022 19:26:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nC4yZ-0003yP-Gx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jan 2022 19:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xbpit+XHrq+LsqQcFgMTK0y1PuJJaB815iBx6ru8WQQ=; b=YBILzA17lZRsfGSsj/ta6M8Q0A
 YU+A+EDeFwW6jBH4SqfaNTXuDDqiO/DWH7CbidxMJe83oFqgtRrrtbhe3OWc2jHGfZ8BSRuMZmkbE
 rhNCFJZxlYNWpAuOCZb39Y2ys7Q5Uesxamdoih6tOqrrTBqL0/zYdeRqWosbX/U+jnaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xbpit+XHrq+LsqQcFgMTK0y1PuJJaB815iBx6ru8WQQ=; b=ML/63p5rY1tE0e2d90k5FlYeYY
 KIgzXjfTe4zAXD3lND1CsP+8MDKxd5WY0F/UGVV76JuR4D1tdX+aPLPQGY9Jx/Fgv9VhEDJ13vHNq
 WxhmPIsuoUd0z/KDX33EzRcRPS9H3ib3tpF7Y6G1ZQblkpKcoOJerfDsOVK56EJ52f/g=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nC4yT-0000AU-Um
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jan 2022 19:26:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCBD2B81215;
 Mon, 24 Jan 2022 19:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814B1C340E5;
 Mon, 24 Jan 2022 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643052345;
 bh=cGzIZ1MKIizkECbK+Lu6MG2AB+TsAwI9HGRrv3av30U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XBIgUtI+EvImF0ZnkknOIa1odOeHkZxvWOe9sjHFCoHERQmLMXF/wGmAWuDjID+ss
 Br5A1DegoEO2p5tr1Pg0srwkXqnN7ZSQmHI/tl12j0Gwelrj+qcAHfw7A3i61XQesw
 RvBj2vThha7fuNGTOWz2XB6/L7MM8OXPyQk3P4CiXrX+BM9WG8HfRxs4NvGJA8qWxP
 6l2pzQBnavjC+BDfIVLFeracw1J7y2+aEnL9shzPuaNVXmCYAtAIGVPTr10L9yWeLq
 wzDK7/K4K+1YhHOmojtBEuWaCCApSU2rVq8hmeL9ZzjOhAhCH1G38Qnh5bEtHwI9F/
 ArMjIYa1c0ULg==
Date: Mon, 24 Jan 2022 19:25:44 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Harry Austen <harryausten@hotmail.co.uk>
Message-ID: <Ye79OLCFLR3H+GnY@gmail.com>
References: <AM6PR10MB2838873D61CE1C0DB91EEDB9FA5C9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM6PR10MB2838873D61CE1C0DB91EEDB9FA5C9@AM6PR10MB2838.EURPRD10.PROD.OUTLOOK.COM>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 22, 2022 at 12:59:03PM +0000, Harry Austen wrote:
 > FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file attribute >
 (e.g. FS_NOCOW_FL) is not supported, rather than silently ignorin [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nC4yT-0000AU-Um
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix fileattr_set unsupported attribute
 handling
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jan 22, 2022 at 12:59:03PM +0000, Harry Austen wrote:
> FS_IOC_SETFLAGS ioctl should return EOPNOTSUPP if the file attribute
> (e.g. FS_NOCOW_FL) is not supported, rather than silently ignoring it
> and returning success.
> 
> Fixes: 9b1bb01c8ae7 (f2fs: convert to fileattr)
> Signed-off-by: Harry Austen <harryausten@hotmail.co.uk>
> ---
>  fs/f2fs/file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 92ec2699bc85..061bf35c2582 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3085,9 +3085,8 @@ int f2fs_fileattr_set(struct user_namespace *mnt_userns,
>  		return -EIO;
>  	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
>  		return -ENOSPC;
> -	if (fsflags & ~F2FS_GETTABLE_FS_FL)
> +	if (fsflags & ~F2FS_SETTABLE_FS_FL)
>  		return -EOPNOTSUPP;
> -	fsflags &= F2FS_SETTABLE_FS_FL;
>  	if (!fa->flags_valid)
>  		mask &= FS_COMMON_FL;

This is intentional, and matches what ext4 does; see the comment in the ext4
implementation of this:

        /*
         * chattr(1) grabs flags via GETFLAGS, modifies the result and
         * passes that to SETFLAGS. So we cannot easily make SETFLAGS
         * more restrictive than just silently masking off visible but
         * not settable flags as we always did.
         */

Also, even if this patch was correct, the Fixes tag is wrong.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
