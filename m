Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B55372D6C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 May 2021 17:56:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ldxPX-0007jJ-Em; Tue, 04 May 2021 15:56:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1ldxPV-0007j7-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 May 2021 15:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qU4pCq/rMYt75F9yz64CzAKLNLIH+T0Q1CLl+UwXz5Y=; b=l66QgMnuVk8mthwN+g6QH3+Vea
 Jcb47e8DtrjJBaCupcRVzB0PW4hJMxSeSKj5pzGzIi5xlAuP3eRnw4lMAJdD+lcy+dH4hECkAZfCj
 qSeJOKOA/zahCcK/sNnq/X19DhtaeU+ZGCeqmjOwtVoHVksTxFUenkG8Ld9STRX/Jhlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qU4pCq/rMYt75F9yz64CzAKLNLIH+T0Q1CLl+UwXz5Y=; b=DnjLiMaLZxVgu3vV0j9xyvXyfr
 Ei27U47Yjh8X5N8eRLtytYWzQyhufuGywsbLla0DwC60q4w1aPO7s3R1bfHbMM3U8qHhcWu0HU3YE
 MAntTFE/veyzIx9XJNq73rWNjfbUoD3729lrtmyHksNP2wpSsGnkuY2kRlf6mdzfiEpQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ldxPN-0005jx-PY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 May 2021 15:56:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84136610FC;
 Tue,  4 May 2021 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620143780;
 bh=NK9m8tiVx6odPyaA3BKfmydWZs7t+vIqZIMo/gaC7iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ER0OirxyugSEnUH663gYuGCAPBlGv9cPfjvYbJ7xmBdqQX6AOhlmVF+fnfl1SaSSo
 /8+JcznzBUDXd2d4CvdaAN/43tN3p9HJVscnf9tWmTE6F8tWcsducJTdj8ooZo034q
 jjg7he716H74q67BBwk+99/gCRRJv9V2WS2rdAo7ct8YF2te6K+ndBo23DY1adYaqC
 Lz5CGUb/mp8wJG056YL+tI868JKQIgwI4btAEqSTSTRrxmOmWh+DCQZacHtVvAmvcl
 B/LvGlP9ww3UVfggp2/Q/5+PDBdnbhtS9bJhBszgYK7Lha77Hr2Xks011d65VOEfxb
 ZuvQcdnKWnVgQ==
Date: Tue, 4 May 2021 08:56:18 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <YJFuov0gQT+ZzNOM@google.com>
References: <20210428024927.645-1-changfengnan@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428024927.645-1-changfengnan@vivo.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ldxPN-0005jx-PY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: avoid unnecessary check
 in f2fs_prepare_compress_overwrite
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

On 04/28, Fengnan Chang wrote:
> when write compressed file with O_TRUNC, there will be a lot of
> unnecessary check valid blocks in f2fs_prepare_compress_overwrite,
> especially when written in page size, remove it.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>  fs/f2fs/data.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index cf935474ffba..4cfc0472bc2d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3270,6 +3270,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct page *page = NULL;
>  	pgoff_t index = ((unsigned long long) pos) >> PAGE_SHIFT;
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	pgoff_t end = (i_size_read(inode) + PAGE_SIZE - 1) >> PAGE_SHIFT;

Need to move this below?

> +#endif
>  	bool need_balance = false, drop_atomic = false;
>  	block_t blkaddr = NULL_ADDR;
>  	int err = 0;
> @@ -3306,6 +3309,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
> 
>  		*fsdata = NULL;
> 
> +		if (index >= end)
> +			goto repeat;
> +
>  		ret = f2fs_prepare_compress_overwrite(inode, pagep,
>  							index, fsdata);
>  		if (ret < 0) {
> -- 
> 2.29.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
