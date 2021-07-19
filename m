Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC93CCF56
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 10:24:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5OZ8-0002kN-5T; Mon, 19 Jul 2021 08:23:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m5OZ6-0002k8-C8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPlMasGYo4lGw0lOkAqZc40GZj6GYdL8PF1G2kuHIIE=; b=hJpCenEKQa5Px8CQGgliHn2F/4
 VBJdc7JiONBr+4dbXMJyvu5CmVZqpH7woUOrBtPDw9kPTJAImoV9anyTVH2W2mMd8zXUNOJssNI7g
 mAgef6Ed9Tk3Ww/pM3K5r+lWuV9mmdbrRhD9wYj7jT6hYc2SdPKjEy2GOInJkAkrnlko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NPlMasGYo4lGw0lOkAqZc40GZj6GYdL8PF1G2kuHIIE=; b=KJo4oR3L+Js/wMPa0eX5fLUmh3
 IOElwqxnDa9H6Eh90pkTnmBaYuXhxSmeD3H3CfmC1Rc/Sz4xaefJiYpMdj2IjongKsv2OCy8xwJVb
 TOP2bLxB2QzbNDHQjJz0bJAj5gjpuBC+dZytO77r94rX/hvauGPTor0jxWl2AA4YhEUQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5OYx-0002Ql-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:23:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 678D16100C;
 Mon, 19 Jul 2021 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626683018;
 bh=psjqFkgBEdDqYXlksaHaln38UuS8wGxXvJHwZlCLzbU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=p9uWOVEbJZ81vMLz3GvXjxBZCrKXPWO3uk5YbvM3O7HaOlEMLAzLVvG6Z72vUtpk6
 Pf0qRZLW1vaoHR1jSMwKPP0P6S+/HFoIoF9a4W1tuD3VsiLDe6n2aNp8P1MlH1kKji
 zfnJQ/Yzg0UK7+QPUovRTSmPQsmRcthEUFgoTo20de4WGjtfpyHuJGrhUp3By2Uiqo
 wB3qMBalTYOoypDkDz72Bluv+u0A2VWcgnxC+Hp4vD2Xe/15NxHndeCUL4CEMPfDdT
 0RuXvb+s/GsQulNJ6EdU5CKufX/1jwqOq32nsZGCao9zLfR1IQxey8Nk+hfWfeEhtr
 8FDTUWDIychOQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210714231850.2567509-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <ae44f40d-4727-92af-9f0b-ffb8540da872@kernel.org>
Date: Mon, 19 Jul 2021 16:23:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210714231850.2567509-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5OYx-0002Ql-Tk
Subject: Re: [f2fs-dev] [PATCH] f2fs: let's keep writing IOs on SBI_NEED_FSCK
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
Cc: stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/15 7:18, Jaegeuk Kim wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered, so it
> is not fully critical to stop any IO writes. So, let's allow to write data
> instead of reporting EIO forever given SBI_NEED_FSCK.

Well, it looks we need to check why there is SBI_NEED_FSCK flag.

If this patch breaks something, how about forcing OPU if SBI_NEED_FSCK
was set?

> 
> Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
> Cc: <stable@kernel.org> # v5.13+
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/segment.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 15cc89eef28d..f9b7fb785e1d 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3563,7 +3563,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>   		goto drop_bio;
>   	}
>   
> -	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) || f2fs_cp_error(sbi)) {
> +	if (f2fs_cp_error(sbi)) {
>   		err = -EIO;
>   		goto drop_bio;
>   	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
