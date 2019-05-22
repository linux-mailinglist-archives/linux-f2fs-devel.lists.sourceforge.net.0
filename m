Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50218263E7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 14:33:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTQQe-0000qR-TB; Wed, 22 May 2019 12:33:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hTQQd-0000qJ-8t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tIymDYDU3QN59haYyeN5lQkZ7eppFRaweDzC5o10/Jc=; b=m8lxiZhx7DcItYXsdS0dS1AfCn
 pyVgvZUYEZz6SzDtvNLPNHySe4S6BJQxvLOU6aBsfRX7SuQGmfO9jaqCEUBGce9JupCQEpiocvxYv
 zAJsKqDkDne9/rxaZYGyg2wjN9CkjS1+1VdyxftsUp70NvdKYNvMQF6CwoYkLY1+QObE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tIymDYDU3QN59haYyeN5lQkZ7eppFRaweDzC5o10/Jc=; b=YeSLCKiaknK4Y8OgUrmXYtva0G
 hmum2QqPC6hEjyvsJF5h7ywsP4sUViw8ylFiHTVZy10Doz61MdrTETOaMk5b+wz1urPxBhkZl6Hxe
 4xIOpzlrE8EzcRnDLRNy4ie0gOAbyHpvmX+5SR852Pg1INk4rvbGhBJ/NM1b/Pme7B6g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTQQc-00H2Xq-4g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:33:07 +0000
Received: from [192.168.0.101] (unknown [49.77.233.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7A992173C;
 Wed, 22 May 2019 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558528380;
 bh=7Zt5mFnKGpFUyLLmEh/OXRYTSOMLrj8rJD3n8swXUfc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=yzHOC2O3R3OLQEJrB35Gcz5qtnVVlhR47yFsPcd3k7fR5yL45kUjGxl3MHQS5iDXH
 uloVw3UG3yfi3Lw/d+McYNFtiWcmoXaPQFfxIuTAD9dPF94q7UstM+gMvJLO3qrzCM
 BGx6VhaB0BJap+z14TJDaTUAdAhanwaS8DjKZMaM=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190521180625.10562-1-jaegeuk@kernel.org>
 <20190521180625.10562-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <add17fa8-f381-844b-abf2-17182a00232a@kernel.org>
Date: Wed, 22 May 2019 20:32:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190521180625.10562-2-jaegeuk@kernel.org>
Content-Language: en-US
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
X-Headers-End: 1hTQQc-00H2Xq-4g
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: allow ssr block allocation during
 checkpoint=disable period
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

On 2019-5-22 2:06, Jaegeuk Kim wrote:
> This patch allows to use ssr during checkpoint is disabled.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/gc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 963fb4571fd9..1e029da26053 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -387,7 +387,8 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>  			goto next;
>  		/* Don't touch checkpointed data */
>  		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
> -					get_ckpt_valid_blocks(sbi, segno)))
> +					get_ckpt_valid_blocks(sbi, segno) &&
> +					p.alloc_mode != SSR))

p.alloc_mode == LFS will be more straightforward. :)

Anyway,

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>  			goto next;
>  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>  			goto next;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
