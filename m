Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BC54E885
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 19:17:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1t7P-0004EZ-KJ; Thu, 16 Jun 2022 17:17:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o1t7O-0004ES-4Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 17:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVdQwcUY0JDQ8cBcdIfuE++4LvonwdvjtJqLWdGizvg=; b=fV8RJmdeDvuXF3pFz14raVwtWn
 jAIFV61rR82m2VSB9zEFypc1nkctxEIccjUfLLOlxWWWMP72Bwn8bdjokbf5+tlTapw9aBKnwJf4d
 VKFQbvuPByPth40F4Y9dVr5gxOWhmoHDCoQZzU1IG0Q8JNDWOeQRRvXaALZl3RGVZAvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVdQwcUY0JDQ8cBcdIfuE++4LvonwdvjtJqLWdGizvg=; b=miupSFOr3YIwgY3K9rHIr1dySJ
 OGr9u89ydOTFKjsuVD1WF3aH4F8tLijLcSVReSyLUTfPTz22lnoTlMLCauEQx6J6nWBdw50TKrN4K
 qTtoo1/mDUS0YHSSrywplYTkiId8dYuEcpP14NnnBou31uSrM1mK/6JMnXrUp4zxzWno=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1t7M-004LjR-1m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 17:17:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A342E61741;
 Thu, 16 Jun 2022 17:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21ECC3411A;
 Thu, 16 Jun 2022 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655399830;
 bh=/j2wNePK1Xela/ahc9maWQOf8Boi5z4O1qLLoB/erZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qtP4Rd/DGftGcqRvB2uDXrBhekVnUPl079+2ntnFvoUP/+KvxJHsknQ/CRao6qD2L
 Q309nF51FH9ewXFUIllr6jGPXfj85E1HJJWYLEuajdI38uRTgFT/bFACRTIFPhBdsn
 Ip/RcPhN+kjp23Z+4X1rAYxUdKcJjejncCfzKsqs4GILiXvI7TXX3nDzTKWnLedbGb
 f/3W+OV6QFPd1cYzAYztHl8LGP2mekOR/IEdRtRMSYvYNMRpQu/T9GtBu5KGxNzqYa
 cXcYTaMRaFKlAAutDMnn7cEPdP4hoOPmFqvteVE3Q4tW0bYhUNOEcnxljrwRxMpL4I
 tGDQNGWGgTCSw==
Date: Thu, 16 Jun 2022 10:17:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Dylan Chang <y.w.zhang14@gmail.com>
Message-ID: <YqtllO83cEw1jb+Q@google.com>
References: <20220616035806.1663-1-dylan.chang@oneplus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616035806.1663-1-dylan.chang@oneplus.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/16, Dylan Chang wrote: > fibmap: Fix file too large
 causing file_pos overflow > > fibmap show file_pos with incorrectly value
 when passing a large file. > > Before: > > file info [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1t7M-004LjR-1m
Subject: Re: [f2fs-dev] [PATCH] Fix file too large causing overflow
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
Cc: Dylan Chang <dylan.chang@oneplus.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/16, Dylan Chang wrote:
> fibmap: Fix file too large causing file_pos overflow
> 
> fibmap show file_pos with incorrectly value when passing a large file.
> 
> Before:
> 
> ----------------file info-------------------
> /data/media/0/data1 :
> --------------------------------------------
> dev       [254:18]
> ino       [0x    4db1 : 19889]
> mode      [0x    81b0 : 33200]
> nlink     [0x       1 : 1]
> uid       [0x    280e : 10254]
> gid       [0x     3ff : 1023]
> size      [0x1b3dca314 : 7312548628]
> blksize   [0x    1000 : 4096]
> blocks    [0x  da2530 : 14296368]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>        0     3197602     3198463         862
>  3530752     3197509     3197509           1
>  3534848     3197557     3197578          22
>  3624960     3198464     3396701      198238
> 815607808     3396703     3632480      235778
> 1781354496     3632482     3652095       19614
> 1861693440     3396702     3396702           1
> 1861697536     3632481     3632481           1
> 1861701632     1514948     1514948           1
> 1861705728     1518774     1518774           1
> 1861709824     2543104     2543125          22
> ...
> 1862111232     2457813     2457813           1
> 1862115328     3652096     3878168      226073
> -1506856960     3878170     4133725      255556
> -460099584     1510048     1510052           5
> 
> Patched:
> ----------------file info-------------------
> /data/media/0/data1 :
> --------------------------------------------
> dev       [254:18]
> ino       [0x    4db1 : 19889]
> mode      [0x    81b0 : 33200]
> nlink     [0x       1 : 1]
> uid       [0x    280e : 10254]
> gid       [0x     3ff : 1023]
> size      [0x1b3dca314 : 7312548628]
> blksize   [0x    1000 : 4096]
> blocks    [0x  da2530 : 14296368]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>        0     3197602     3198463         862
>  3530752     3197509     3197509           1
>  3534848     3197557     3197578          22
>  3624960     3198464     3396701      198238
> 815607808     3396703     3632480      235778
> 1781354496     3632482     3652095       19614
> 1861693440     3396702     3396702           1
> 1861697536     3632481     3632481           1
> 1861701632     1514948     1514948           1
> 1861705728     1518774     1518774           1
> 1861709824     2543104     2543125          22
> ...
> 1862111232     2457813     2457813           1
> 1862115328     3652096     3878168      226073
> 2788110336     3878170     4133725      255556
> 3834867712     1510048     1510052           5
> 
> Change-Id: Ic2486e25ea03114d4dbf3651650c6a2399db0714
> Signed-off-by: Dylan Chang <dylan.chang@oneplus.com>
> ---
>  tools/fibmap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/fibmap.c b/tools/fibmap.c
> index 3238f29..3217600 100644
> --- a/tools/fibmap.c
> +++ b/tools/fibmap.c
> @@ -47,7 +47,7 @@
>  #endif
>  
>  struct file_ext {
> -	__u32 f_pos;
> +	__u64 f_pos;
>  	__u32 start_blk;
>  	__u32 end_blk;
>  	__u32 blk_count;
> @@ -56,9 +56,9 @@ struct file_ext {
>  void print_ext(struct file_ext *ext)
>  {
>  	if (ext->end_blk == 0)
> -		printf("%8d    %8d    %8d    %8d\n", ext->f_pos, 0, 0, ext->blk_count);
> +		printf("%8llu    %8lu    %8lu    %8lu\n", ext->f_pos, 0, 0, ext->blk_count);

I had to fix unrelated changes from %8d to %8lu. Please check it

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=74f81f441ce24dd47cfe68e6fb336e0142bf4217


>  	else
> -		printf("%8d    %8d    %8d    %8d\n", ext->f_pos, ext->start_blk,
> +		printf("%8llu    %8lu    %8lu    %8lu\n", ext->f_pos, ext->start_blk,
>  					ext->end_blk, ext->blk_count);
>  }
>  
> @@ -209,7 +209,7 @@ int main(int argc, char *argv[])
>  			ext.blk_count++;
>  		} else {
>  			print_ext(&ext);
> -			ext.f_pos = i * st.st_blksize;
> +			ext.f_pos = (__u64)i * st.st_blksize;
>  			ext.start_blk = blknum;
>  			ext.end_blk = blknum;
>  			ext.blk_count = 1;
> -- 
> 2.17.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
