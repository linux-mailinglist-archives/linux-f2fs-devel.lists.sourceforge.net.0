Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2870163A8A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 03:52:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4FT0-0002EQ-Lu; Wed, 19 Feb 2020 02:52:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j4FSz-0002Ds-DA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3JapKoMnLJuqC3WRLqvP9qwWgQh2Qim4UA8E1/gqB8o=; b=KvkZKUydlPTpy5E1CMZanVLwbX
 GA9i54aDekw+uskl3nA22Aoe1yb5+P+KpsevInlHTDZyeu2nEZnFOCkHzg9V/mF+GCyA1ohE7XcT+
 lc5bt5OsdoPF9/IKVmanNO6ymCcm3EU32HsaZn/BnfuQsSKBQP92+ue3l8Xv/M9hRAZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3JapKoMnLJuqC3WRLqvP9qwWgQh2Qim4UA8E1/gqB8o=; b=XdN85xdUacWafyZl5gXxqxs2Uk
 wjFsKDHOJ5LvqZ3f6lWfPvfUHHIFk/ce0jU3WF80w7YDxIeKprZwKr2VlttIG07CAjMaYm7kize2r
 uNttS/eZWeTEwiC84Dv/Zgc0hezk2YnU1egRWljkMd3fr4hY9CXFKDLvBWco75yn3WxQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4FSy-00H9GR-Bw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 02:52:01 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4967207FD;
 Wed, 19 Feb 2020 02:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582080714;
 bh=/yXdGWmYsKqPX70bTTNAr64nklyYO6iG2lgGEie9/Nc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XR9V1FR5JQ/VnRmYbFVz1VJC0jUNv0LCv0L90Zs0t1FInM2sK6BPB89oh2nVAnsjz
 1j8gWFCFmU3WBZ3o9K+XChjUjepAn00v8laLChhyc8WbUiZBkikuMGO+kbtxc8yiWM
 DcYckPYwAfceieD0lL4raxeXnD9eOSbbAd3roLCk=
Date: Tue, 18 Feb 2020 18:51:54 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200219025154.GB96609@google.com>
References: <20200218102136.32150-1-yuchao0@huawei.com>
 <20200218102136.32150-3-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218102136.32150-3-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4FSy-00H9GR-Bw
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: avoid unneeded barrier in
 do_checkpoint()
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

On 02/18, Chao Yu wrote:
> We don't need to wait all dirty page submitting IO twice,
> remove unneeded wait step.

What happens if checkpoint and other meta writs are reordered?

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/checkpoint.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 751815cb4c2b..9c88fb3d255a 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1384,8 +1384,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  	/* Flush all the NAT/SIT pages */
>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
> -	/* Wait for all dirty meta pages to be submitted for IO */
> -	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
>  
>  	/*
>  	 * modify checkpoint
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
