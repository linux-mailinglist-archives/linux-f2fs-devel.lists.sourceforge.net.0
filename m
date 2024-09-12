Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B1976C7F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 16:46:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sol5F-0005mK-Jz;
	Thu, 12 Sep 2024 14:46:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sol5D-0005mC-Oy
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/FhE1B8Rka4/N5q5phfNBhV9i5PI+Rqk0TZbmCKbE4=; b=MoUAUYypmec3ZGrFimuP1Qc9bz
 icGO2f9nyq1NNQ955GwSlxlYb1Hoh99UzL2mxWvT0BVoZh21YPyHezEJEXpae4w30mkFZZ4hyTYt0
 E0diL5gxvXWTdyBF6CjA+YypGIw/cSbXhxPHwG2tPMcMRIKEbY2vqHzVxxlIbknOyE+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/FhE1B8Rka4/N5q5phfNBhV9i5PI+Rqk0TZbmCKbE4=; b=CSGz6bWGSifGI+K0anFaOhdljB
 uEOkWsB48sh7GUuhEm2N/PHO23s6KhYc16a5DCGgpKiqfwUI3/pRIWbRGfmSkF3KAjILfAiBHFQwk
 fBYdx4Ydo9rpdTlH46cP91p0ciS0BwU2g5wRei4WoSEx+Kq2AC19tMukBJaIyZxHojSM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sol59-0004JN-U9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0FC15C574C;
 Thu, 12 Sep 2024 14:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1312AC4CEC3;
 Thu, 12 Sep 2024 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726152358;
 bh=hrauWppsc6XR803UtC8++6+LnYlEts6MH5xg+4q+wJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BC/K4OjI32iuDv9vIgIEUHBAEPJq2E8mIRnVf+7h0cSFOb0hc4CNdbeGd8DpGl97v
 3jUXK7sm4Nq7wYqPLm1b6h2ijZBSHBtslByMfKY2YpfSSG9dZ0gSYKjQtPpDjS2It1
 llJaZn8zhayFhRvgGzfCdylwVXvDi1D7dBbyIX9hX92QBm52rU5crXsODDppN59ALA
 oRXTmxlUAt2iBLmF/PcfZMNpUGGVm8iTcULgjSHfXov3SLGPWk/A0NC7e5Qa68O2/o
 n3jBUhy0UJTYoF1IpzAJ9HeWwtTbBWe4E39NG6DdJY7IDUN0GXuefe6EuZ4NYLh6N1
 cJHZfLe4dHk0w==
Date: Thu, 12 Sep 2024 14:45:56 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ZuL-pAo6A0VVBwYG@google.com>
References: <20240911213031.183299-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911213031.183299-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/11,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > We need to migrate data blocks even though it is full to secure space
 > for zoned device file pinning. > > Signed-off-by: D [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
X-Headers-End: 1sol59-0004JN-U9
Subject: Re: [f2fs-dev] [PATCH] f2fs: forcibly migrate to secure space for
 zoned device file pinning
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/11, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need to migrate data blocks even though it is full to secure space
> for zoned device file pinning.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
> ---
>  fs/f2fs/gc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 724bbcb447d3..aaae13493a70 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2010,8 +2010,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
>  			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>  		};
>  
> -		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
> -						dry_run_sections == 0);
> +		do_garbage_collect(sbi, segno, &gc_list, FG_GC, true);

Do you mean this, right?

do_garbage_collect(sbi, segno, &gc_list, FG_GC, true, false);

>  		put_gc_inode(&gc_list);
>  
>  		if (!dry_run && get_valid_blocks(sbi, segno, true))
> -- 
> 2.46.0.598.g6f2099f65c-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
