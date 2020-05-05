Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A71C4BAD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 03:59:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVmrR-0000vs-Tv; Tue, 05 May 2020 01:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jVmrQ-0000vf-7J
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 01:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P4eZuSKS/gpOfwRyyhs6YTZJsi6xKqfDJB9cew3v04M=; b=SapdTNzfSWRuf/Tz5q6NKc2DOS
 F8Kj1E6DU3/C9VVJzsqiOcMgUP5Xb2qSjFPU7khJodLYdT/GT56THtX7JTc1VWnvAa+3/9EzzB57n
 l5hP36IAPLQm1i8U8k7Mib++mLjDgv9jks8iyo4d+eVZ87odqcBfxOZy7IIqZhCMbCcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P4eZuSKS/gpOfwRyyhs6YTZJsi6xKqfDJB9cew3v04M=; b=DKnSYZhHMDrtzdU0C1iL2Yw+Yh
 KGJfdxznetw26O5vnKuatcqoVYE0YlnIJdVsRI48nzw8eGjLf1CzBSOYd8gSfnTKWic0274RCICx3
 cxXVUenNBPwbG9oCyjskNkQcsQ6bEff3C2gFTQUbrC3pLIy4PcmyuawTNe9o5SO5vzDo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVmrP-007gTN-1j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 01:59:04 +0000
Received: from [192.168.0.107] (unknown [58.213.210.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D3B6206C0;
 Tue,  5 May 2020 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588643935;
 bh=cQnMVodPsVGu6kr4A3A0f+mhcJdPPyK20x6xr8YdlKA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dG8o5twjxu0FpycuHeWowUTohcKzI5WM+H72CCEoKadH1XQZfel6wVQxdhy6X2R8Y
 ekyXRTXOflT3PsZD8JZFhkPQ2ngLg2/36/IRzhi0oS1QS5qfDOF0Z7wjb6ILZfXBRF
 TMbyxz0Xq51NDuPqVisI7RSOD+oRf4tBz2Fv7dDs=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200504143538.159967-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <b18c4be5-b56d-6b6e-3f99-d2fe05d330eb@kernel.org>
Date: Tue, 5 May 2020 09:58:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200504143538.159967-1-jaegeuk@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jVmrP-007gTN-1j
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant check in
 f2fs_force_buffered_io
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-5-4 22:35, Jaegeuk Kim wrote:
> From: Daeho Jeong <daehojeong@google.com>
>
> We already checked whether the file is compressed or not in
> f2fs_post_read_required(). So removed f2fs_compressed_file()
> in f2fs_force_buffered_io().

Agreed, since I have sent similar patch before:

https://lkml.org/lkml/2020/3/24/1819

Just want to know what's the change of backport concern now.

Thanks,

>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/f2fs.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 6b7b963641696..01a00fc808361 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4064,8 +4064,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  		return true;
>  	if (f2fs_is_multi_device(sbi))
>  		return true;
> -	if (f2fs_compressed_file(inode))
> -		return true;
>  	/*
>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>  	 * all IOs can be serialized by log-structured write.
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
