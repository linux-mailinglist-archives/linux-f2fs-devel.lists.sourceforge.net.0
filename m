Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB373B9524
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jul 2021 19:02:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lz04p-0006fO-C1; Thu, 01 Jul 2021 17:02:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lz04n-0006ew-IJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=atnSjam/z0HEe4ny3zyVbKCGGmKcEl2ilyVf74doMEU=; b=eFyVuhlu2R4Oy1IP7n+SHvCVe8
 HiFer98F7O9SI6Rqis7ZSMfTFZaQgiUIn4788iriEaOKySKQUxz9M61GN/zZJvzoyBy+ifcE63IiW
 Al6bF8T6mGIBNlTCSaqkHumoqIqGUneqa02tYgpcBovx8szqKEe7TdeqG4TwiLDEUVWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=atnSjam/z0HEe4ny3zyVbKCGGmKcEl2ilyVf74doMEU=; b=Ul31bHNbTnf3Gl/FsIsAfGikjQ
 O5JeX0TMEDxd3gbRgn0zkB13K3T974I9WFEHvaLnfW0RqkbB+kPVoaTRpCjmLWnvGawfge7CxOil5
 cVW420gU8GL0OBPC4vd20v/BVWWXaTFnvR5E1OKUl4/Vj1eR18CKGeVPW7VzkiWFnbCA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lz04g-006GWi-9b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Jul 2021 17:02:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C75426128E;
 Thu,  1 Jul 2021 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625158916;
 bh=cQlZL/YW/KaKhrPGumJPTDn97km+p0xacBGTiHivZW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C+NTcf38/9fsJdODbA/LOjIzrcRoqKFI7oWjYIpTqGaljPse/Z2/CSmYIVn/uucBt
 ZLtSh/2olwxx3ymZ7rtv1qBzTLJ1NcawtCBZ7KpIcR8HkSS23E/QhqlbL0CozlMn4g
 6H2nXtoDNGSn7JHT/fPkTtbdsejhMGuSRr1QB5wEvEUqSciZkigo41APF/uNGlOJMN
 vsSHT68BQP8oAc8I2tEBxtki1CLrColGYYc+jHlvo5M+AMDXnxscyS+sqbJW1ZhAHq
 xwEHg+e7kSSjlVG9kAYRWggnzZu57nxoI16Baiq4EPsURHlAb3DnJgPG614YYdJh7X
 X14/RuSbVSYlA==
Date: Thu, 1 Jul 2021 10:01:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <YN31AyWCu4QhSCaa@google.com>
References: <20210628130550.39696-1-changfengnan@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628130550.39696-1-changfengnan@vivo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lz04g-006GWi-9b
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: allow write compress
 released file after truncate to zero
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/28, Fengnan Chang wrote:
> We should allow write compress released file after truncate to zero.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  fs/f2fs/file.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6afd4562335f..b91ae8f751c5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -730,9 +730,13 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
>  	 * for compressed file, only support cluster size
>  	 * aligned truncation.
>  	 */
> -	if (f2fs_compressed_file(inode))
> +	if (f2fs_compressed_file(inode)) {
>  		free_from = round_up(from,
>  				F2FS_I(inode)->i_cluster_size << PAGE_SHIFT);
> +		if (!free_from)
> +			clear_inode_flag(inode, FI_COMPRESS_RELEASED);

We can do after truncating all the blocks successfully?

> +	}
> +
>  #endif
>  
>  	err = f2fs_do_truncate_blocks(inode, free_from, lock);
> -- 
> 2.29.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
