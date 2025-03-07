Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100EA5702E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 19:11:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqcAK-0000FW-5P;
	Fri, 07 Mar 2025 18:11:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tqcAI-0000FQ-MT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8r8Blkk7pG4sIZHgV/OCmTZC+u9Yu+ENFeahze9iWlY=; b=KXj0sEURDyvteLKKxnxxxDKpKe
 jt82zYxqIUCy2CgdwN3c4aytiw9W/vKEU9v7LZPigzVTBw1/VJGqjntMlaiYOF2BsTeMCQhQ7kliQ
 OINcp5IqfVRGOFFa+Z6+gTvzSGHZpi3t1xohVfsZdFoOQDkao5c5piRpSJQLoCi9PV6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8r8Blkk7pG4sIZHgV/OCmTZC+u9Yu+ENFeahze9iWlY=; b=aHFzR0bBFiUTbrVbiT+OZNP3gd
 E04/3ggelnEByqJh/i4HZsyr2hcHgXfrosimmYLskGmEAjhcKp2mMPDQZpk8/MCvWoTNGKqd5rPsK
 VYXvaCf4h4xaSV2natNQ24hXJPD5ftL+h6a4FDWviNe1+fEsI5VQh/Pmi1nVxGZNwYEo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqcA7-0002wX-G0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4CAE5A45016
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 18:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050F0C4CED1;
 Fri,  7 Mar 2025 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741371056;
 bh=rsgVaSryA23Jr0XcgqAG14znT/gNWQguaNRK/HSoM2s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T9gXcsQOqAUv0v+GnpZPswM8n+wx71RcC1ayl5S0P9swqsa2dmugS1PmbYweL+ENF
 IqyaWbyaJgYODB/e036Uip4rIRqumTBAkRE0MZ/tdxv0xlNWQ6UWsoHblmhtkXwaVc
 0arlCZ4U0YhCWf1Rmi+/sPjkhx8jWvR+oLdiTkVSwbMYY4Uj1BJD1CEQE9E11CmHUO
 stOOJTgaZy7XgxYN3AsacueoPilGGS+iOG1VGgg1twImsU97d2CGJgcGifGaXZdXR7
 bMzcDGyF7lfm8IaXiWADKcaOPP/SAbLUc3GJquree7eOCSBhPuhwgl4m7/noYlAM9E
 Ru2G/bTkmU/pQ==
Date: Fri, 7 Mar 2025 18:10:54 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8s2rmqauwCGJb9v@google.com>
References: <20250307031838.19164-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250307031838.19164-1-chao@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I meant let's support it conservatively if someone needs to
 enable in other platform. On 03/07, Chao Yu wrote: > Let's disable nat_bits
 by default. > > Signed-off-by: Chao Yu <chao@kernel.org> > --- >
 fs/f2fs/node.c
 | 3 +++ > 1 file changed, 3 insertions(+) > > diff --git a/fs/f2fs/nod [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqcA7-0002wX-G0
Subject: Re: [f2fs-dev] [PATCH] f2fs: disalbe nat_bits by default
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I meant let's support it conservatively if someone needs to enable
in other platform.

On 03/07, Chao Yu wrote:
> Let's disable nat_bits by default.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/node.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 56873c41436e..3148d9e44e7f 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -3286,6 +3286,9 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>  	if (!nm_i->nat_bitmap)
>  		return -ENOMEM;
>  
> +	/* disable nat_bits feature by default */
> +	disable_nat_bits(sbi, true);
> +
>  	err = __get_nat_bitmaps(sbi);
>  	if (err)
>  		return err;
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
