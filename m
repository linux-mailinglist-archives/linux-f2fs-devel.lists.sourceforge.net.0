Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F45A01E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 18:00:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgtI3-0000V5-O8; Fri, 28 Jun 2019 15:59:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hgtI3-0000Uz-0G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 15:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ae+wjn//tDSFbQRTH4L+ejww2HFe/JEkBMbq92udtz8=; b=fnCe19br1OLedrSZPDfQ2hMS4a
 rcIswcRi7JY88zyUIvFFBc8oP8MA2xx/TluqfmL+p03d0Knaw04e0qBB2oOtgi0wU3hnFlMPACxtj
 +6bc3qS9GV25yFNn2MGrybWhIzgM4uIXqF382pg0qJVp3fFuuAyR19rtCdZKvIry3u5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ae+wjn//tDSFbQRTH4L+ejww2HFe/JEkBMbq92udtz8=; b=PkN9DMbvwX6z8lkBvysdYlkHzR
 PEN7x355NRUzRrio19fqJhKU2fQ6eVWPygVQgn97HXrITN03Mj9faVBwcdkYi7Q0CyIW3wpsj8iSf
 ihGS5KE1y+eKunVtnKDmFhADHlYh+WCI7iwD1jsYXTlSNSXguCaGrl4Uw77DsivqCW9s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgtIB-000wpy-Dl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 16:00:06 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D871D20828;
 Fri, 28 Jun 2019 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561737596;
 bh=SlP82znV2OC7MdqO29KK1B36hJIqNFdblP/sjEhF12w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dvEtN3iN2/OmgCD7y14qVBt9dGQwwnPg4NW0dqXv/w/HwM9UwkHzlpJUnDlRorJ7l
 Ny/1sWFpfpUwFKU6A/bLJVqlMassrzrcyBXXhE8q8zpn1fi0OY4yPKCEqqg8W3A4TL
 sqCnIrxI0arf5dsrM27rrSVoiAUiUYqgzol3e0sg=
Date: Fri, 28 Jun 2019 08:59:56 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190628155956.GB27114@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190628104007.2721479-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628104007.2721479-1-arnd@arndb.de>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arndb.de]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hgtIB-000wpy-Dl
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 Wang Shilong <wangshilong1991@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Arnd,

If you don't mind, can I integrate this into the original patch in the queue?

Thanks,

On 06/28, Arnd Bergmann wrote:
> Not all architectures support get_user() with a 64-bit argument:
> 
> ERROR: "__get_user_bad" [fs/f2fs/f2fs.ko] undefined!
> 
> Use copy_from_user() here, this will always work.
> 
> Fixes: d2ae7494d043 ("f2fs: ioctl for removing a range from F2FS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/f2fs/file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 998affe31419..465853029b8e 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3066,7 +3066,8 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
>  	if (f2fs_readonly(sbi->sb))
>  		return -EROFS;
>  
> -	if (get_user(block_count, (__u64 __user *)arg))
> +	if (copy_from_user(&block_count, (void __user *)arg,
> +			   sizeof(block_count)))
>  		return -EFAULT;
>  
>  	ret = f2fs_resize_fs(sbi, block_count);
> -- 
> 2.20.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
