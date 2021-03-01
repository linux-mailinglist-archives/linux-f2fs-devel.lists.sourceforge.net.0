Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A8328C2D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Mar 2021 19:48:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGnal-0005T9-5d; Mon, 01 Mar 2021 18:48:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lGnRK-00055R-KG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 18:38:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t3Bb2V/QRl+D0vNvhiYyjF3vrWv1E+3VCQl1YE0KyV4=; b=VvP/abJZupDFs9k8jRitLVeyay
 89cle6P95IXrIvA50rjAtXSjtcoUfsQd729EKWWxPZC+mQYHMr+HAjxRBrL8yWZ0lobYxJpCN784I
 x1oxrTMc8gNuJiBp64dfJulKXMMSntVaEyIdM650bKWWZVMiKN9XjYOOD9DQON5U3Oc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t3Bb2V/QRl+D0vNvhiYyjF3vrWv1E+3VCQl1YE0KyV4=; b=V5o65uHpgtaa5gDbnt4eGWz3UX
 sM1D8T6FY0l+Ut11uxo2tgQCaF0pa1IivoV9w/GA96yzCgYxxdJEsY3CYtP2uH32XimErr/wU7rqI
 VOfSbb2M9wg005rNzGvWa+mVbTCW+Z8pj/E7qe/T4qwR8HjjVOAzx5Q2Y91J/fjPpaaI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGnR6-00080Z-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Mar 2021 18:38:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34E4F600CD;
 Mon,  1 Mar 2021 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614623903;
 bh=Usbgf4w4CPwBJdAjaGObAuklNlbhEtgzWAuSXxvNqgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obsfa9+0yM6DvT1kTXIRM5rKh8CcWoX43yimFP0IlRq+LyKkYiL9M2JNgTaLjLEVZ
 18y0rhqlPVg/1DtvJyf7EeKE9rE/saw4DKvNu80w4Cj/waJDGWApp/dWutCttmlgKs
 cdSZzZ/YGQ4EdXE/wz/d8CdZXMaULJOENUaaJop5DpThBiP2W8FZdSXOgzPM6QOlHR
 O5ICtni2GaGBT+1awZKJhx2MNMR1fFkS0fh07vcTPykC8B3pTjqnqiwZqzHNHKxTCm
 j5IUx+9Q6IgQhoEnPghrM2w1fAjKlNpN5uTXUoYWvMW0YfwaiiMsTcGTwkLyQJIXFX
 bf4J9BEDlBTGQ==
Date: Mon, 1 Mar 2021 10:38:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Yunlei He <heyunlei@hihonor.com>
Message-ID: <YD00nfInJqE/UlxM@gmail.com>
References: <20210301141506.6410-1-heyunlei@hihonor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301141506.6410-1-heyunlei@hihonor.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGnR6-00080Z-Sz
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fsverity: Truncate cache pages if
 set verity failed
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Mar 01, 2021 at 10:15:06PM +0800, Yunlei He wrote:
> If file enable verity failed, should truncate anything wrote
> past i_size, including cache pages.

The commit message and title need to be updated to properly describe the change.
They were okay for v1, but v2 makes additional changes.

> 
> Fixes: 95ae251fe828 ("f2fs: add fs-verity support")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Yunlei He <heyunlei@hihonor.com>
> ---
>  fs/f2fs/verity.c | 47 +++++++++++++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
> index 054ec852b5ea..3aa851affc46 100644
> --- a/fs/f2fs/verity.c
> +++ b/fs/f2fs/verity.c
> @@ -158,33 +158,36 @@ static int f2fs_end_enable_verity(struct file *filp, const void *desc,
>  		.size = cpu_to_le32(desc_size),
>  		.pos = cpu_to_le64(desc_pos),
>  	};
> -	int err = 0;
> +	int err;
>  
> -	if (desc != NULL) {
> -		/* Succeeded; write the verity descriptor. */
> -		err = pagecache_write(inode, desc, desc_size, desc_pos);
> +	clear_inode_flag(inode, FI_VERITY_IN_PROGRESS);
> +	if (!desc)
> +		return 0;

This isn't correct.  If desc == NULL (indicating that enabling verity failed),
it's still necessary to truncate the stuff past i_size.

>  
> -		/* Write all pages before clearing FI_VERITY_IN_PROGRESS. */
> -		if (!err)
> -			err = filemap_write_and_wait(inode->i_mapping);

As the comment above (which you deleted) says, all pages need to be written
before clearing FI_VERITY_IN_PROGRESS.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
