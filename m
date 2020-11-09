Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 417032AC1A2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Nov 2020 18:00:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcAXA-0005CO-Rd; Mon, 09 Nov 2020 17:00:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kcAXA-0005CB-9K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 17:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ZRTqep3fhPklzKsBTlIFP1q0Lon3rJufcANaDCf5J8=; b=NLLJ1DFxMdX/nv7Lndh00ajz+2
 zYhFWJHVufUG2p8A3ksA+ksJRPYDTNTykrKOa88rKowQlZepggQLMZrPw2W2KEK4bEzMbMfckq2SY
 Oi6C4if27ZN35HJG118BpjNt8Gz4D+PUrOtt94jVATmvyzIXVifuMDsThd9Ok9Tn07v4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ZRTqep3fhPklzKsBTlIFP1q0Lon3rJufcANaDCf5J8=; b=JMuMXJBw4iFEcH7vd76MT7PzVo
 cDk5Q5GNZcBoTxnkZ64UXU2z8t54EdTCLB6trFUEY80KwOcvWzFv5v2dpHSH0CQQ8UeAmdvDkHVK5
 gzTxmDiwLBBYXeH1WARZcoUKFf2NNSB+ravLs03VCQCofN+x6FmBytFDgBl3dQhJs2vY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcAX4-005pgG-HN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Nov 2020 17:00:48 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0B2E20809;
 Mon,  9 Nov 2020 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604941237;
 bh=bjONPyQjSWqtb8RSe2JNSEdnNR0aM/RcazfxhnrBinQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0z0S+1luyaFGtlhYEbEKUj2Bc+EyUgvnD4ecLtS5bxK1+MuXnD5zHW1+fjMwzfDV
 nFwT+nWYmkN34j7h564nR7JJrCABZH03vpLOazzrDiGHx7ZSbwK7EvRPiqWB0WpquL
 czPXQyBfs8NSkQR5cN99AR7K1lPS+yNt0ClbEFTQ=
Date: Mon, 9 Nov 2020 09:00:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20201109170035.GA2129970@google.com>
References: <20201109165914.2118360-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109165914.2118360-1-jaegeuk@kernel.org>
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
X-Headers-End: 1kcAX4-005pgG-HN
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid unneeded data copy in
 f2fs_ioc_move_range()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sorry, please ignore this.

On 11/09, Jaegeuk Kim wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> Fields in struct f2fs_move_range won't change in f2fs_ioc_move_range(),
> let's avoid copying this structure's data to userspace.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 52417a2e3f4f..22ae8ae0072f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2898,12 +2898,6 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
>  					range.pos_out, range.len);
>  
>  	mnt_drop_write_file(filp);
> -	if (err)
> -		goto err_out;
> -
> -	if (copy_to_user((struct f2fs_move_range __user *)arg,
> -						&range, sizeof(range)))
> -		err = -EFAULT;
>  err_out:
>  	fdput(dst);
>  	return err;
> -- 
> 2.29.2.222.g5d2a92d10f8-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
