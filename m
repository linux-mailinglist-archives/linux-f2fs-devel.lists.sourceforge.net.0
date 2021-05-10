Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EE37930C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 17:51:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg8Bl-0002Du-6d; Mon, 10 May 2021 15:51:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg8Bj-0002DH-7F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mnjCA5eLwd1s5fesT+HYostkZsGOIO57PdWpvPufB04=; b=XoLxHn/rVeTKAffPjqpJ/C35Gg
 bvyWW3loWTlCfCFR+R2tqvIY7b9SZN7ObhGK0oezG7uB9vh85x/1trUCBC5okQtyWM5PNsD6vwN/5
 3wbUAarmTIgWESn1De+z+yzU1bULWRygcV3R8jEPVjLCwzJB9yRvMvgPqQ9gK0AjeWIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mnjCA5eLwd1s5fesT+HYostkZsGOIO57PdWpvPufB04=; b=XvSPVZPvPGrdJh1ty/DcXjyCTH
 cQVK9qlQvoBxWIdZdqHbZPiSTFIfClurKwKYXa0+rpOY1lBpobEEZjh+MuJfjakrycygTfGuW1IeN
 lNo4DXGlSelvU7L1jOYxoF3E+L7ba9ZJeiKLCSreWSF1nRg1SecjfdmerC+MYx+h/wDk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg8Bb-002LE2-Rk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:51:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A7B61400;
 Mon, 10 May 2021 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620661866;
 bh=hkkN+e6e7hZtW2JQW0aa8RC0nE8vCe5rD2p3FvXk50E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nblvgp3EbIdEG81sFNJ3PTuF5B+s+jMhc6DEgWFY5O6jJeNNFHTvl+Y2H2vS6KrsW
 LVtHaM86EL7RCZwQPUGfhTUGDMkOXUTzMX+vgAcqZ6zDHK8FZ2rCtrliI3HOq0ruN5
 cCNYPHJgvUINKEeOeJ5j02qtjmFuH+eXAxf6wNfCsWFIVsIv8jyU1XEwa7CLPOGXrH
 aBCN8gvWGdzZTKIxSTEbLGajPFV6i5D9J6qx4rw/rd4YRFifdrdtvu9dI6p9OUoPhI
 Bjw+2afV1Nb1NqMfw4fCchF+qtVu9yXjvpKObIZEpBuBlDk0HIfPpotsJgLPkHbRd/
 HRsoEHMI+fj7g==
Date: Mon, 10 May 2021 08:51:04 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJlWaOSZNLkdGNnQ@google.com>
References: <20210510093032.35466-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510093032.35466-1-yuchao0@huawei.com>
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
X-Headers-End: 1lg8Bb-002LE2-Rk
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: compress: fix to call
 f2fs_put_dnode() paired with f2fs_get_block()
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

On 05/10, Chao Yu wrote:
> f2fs_get_block() and f2fs_put_dnode() should be called as a pair,
> add missing f2fs_put_dnode() in prepare_compress_overwrite().
> 
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index c208563eac28..d5cb0ba9a0e1 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1088,6 +1088,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>  
>  		for (i = cc->cluster_size - 1; i > 0; i--) {
>  			ret = f2fs_get_block(&dn, start_idx + i);
> +			f2fs_put_dnode(&dn);

f2fs_reserve_block()
 -> need_put = true;
  -> f2fs_put_dnode();

>  			if (ret) {
>  				i = cc->cluster_size;
>  				break;
> -- 
> 2.29.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
