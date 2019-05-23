Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F5027DE5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 15:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTnba-0003aH-HI; Thu, 23 May 2019 13:17:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hTnbZ-0003a2-OR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 13:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AF7a5ZtlgdJruvE/xR2cEHXQdGB8M88wXKO8pfXhyvU=; b=bikz2I1GOanHLg2fL/JlL2CAOm
 dc+XH7m7e04Iq7JyylOZRUzDjFoo1WxyXz9u3X3av51KYs4nLc1uy7OpRxs7TuiM9p74uQCPMlZep
 YicceXO+JZ0DOwpjTzTMnEsoAqWnecKZeLR0HZi84R2GhDhiQANdFI8go51rh3x9BVBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AF7a5ZtlgdJruvE/xR2cEHXQdGB8M88wXKO8pfXhyvU=; b=ECW3toyGbgdM7PwIsS9exhKOeh
 Wk4ul7cEwCJAXMevCSWPWz0t49ZXtF4RSwPBBKIUNDC9gGWUxloviNJuOWCfCFCHu/5ix+J830RPC
 Asq/jaVT5Ac9YrMSdAJaWQ+mJ8CkezRtrCGAf2K8iLCgbii9pJeTzLPmy6/5DURJxLYU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTnbY-009B2x-IZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 13:17:57 +0000
Received: from [192.168.0.101] (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 868DD2075B;
 Thu, 23 May 2019 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558617470;
 bh=QzLR9zKzuUVe41ed3CRRrcG2QPpg2Y8M+WRioHn45M8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=zckNYzzXHUDDRnhqURRK9fAY/jYl+qGGa8r92VtFHnC6sj5UAjhlvArQFPgsZu/Uw
 ulm4Wm9CdTfUB+EmTy8eXAhr7ep5ZdWQXVwa0Jf1TGRAgSlfJufuEGy3igjclkEMOo
 b6FEJVwkeZIGPf8M049PDt0veZ5Biq9LYFCU4bZw=
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190521180625.10562-1-jaegeuk@kernel.org>
 <8e9a4cac-c81b-11ce-0a5a-c6f5caf716c4@kernel.org>
 <20190522174448.GA81051@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <1f370d69-cb4e-5526-cc87-e67100d91294@kernel.org>
Date: Thu, 23 May 2019 21:17:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190522174448.GA81051@jaegeuk-macbookpro.roam.corp.google.com>
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
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hTnbY-009B2x-IZ
Subject: Re: [f2fs-dev] [PATCH 1/2] Revert "f2fs: don't clear
 CP_QUOTA_NEED_FSCK_FLAG"
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

On 2019-5-23 1:44, Jaegeuk Kim wrote:
> On 05/22, Chao Yu wrote:
>> On 2019-5-22 2:06, Jaegeuk Kim wrote:
>>> This reverts commit fb40d618b03978b7cc5820697894461f4a2af98b.
>>>
>>> The original patch introduced # of fsck triggers.
>>
>> How about pointing out the old issue has been fixed with below patch:
>>
>> f2fs-tools: fix to check total valid block count before block allocation
>>
>> Otherwise, user should keep kernel commit "f2fs: don't clear
>> CP_QUOTA_NEED_FSCK_FLAG".
> 
> Actually, that didn't fix my testing issue, but I found we were not using
> error control for quota_sysfile. Now I've seen no issue with the below patch.

Alright.

> 
> From e1b7de7050fd87b7c20e033b062b1cc6505679d3 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Mon, 20 May 2019 16:17:56 -0700
> Subject: [PATCH] f2fs: link f2fs quota ops for sysfile
> 
> This patch reverts:
> commit fb40d618b039 ("f2fs: don't clear CP_QUOTA_NEED_FSCK_FLAG").
> 
> We were missing error handlers used in f2fs quota ops.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Good catch!

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> ---
>  fs/f2fs/checkpoint.c | 6 ++----
>  fs/f2fs/super.c      | 5 +----
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index d0539ddad6e2..89825261d474 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1317,10 +1317,8 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
>  		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> -	/*
> -	 * TODO: we count on fsck.f2fs to clear this flag until we figure out
> -	 * missing cases which clear it incorrectly.
> -	 */
> +	else
> +		__clear_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
>  
>  	if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR))
>  		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 856f9081c599..34f2adf191ed 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3169,10 +3169,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  #ifdef CONFIG_QUOTA
>  	sb->dq_op = &f2fs_quota_operations;
> -	if (f2fs_sb_has_quota_ino(sbi))
> -		sb->s_qcop = &dquot_quotactl_sysfile_ops;
> -	else
> -		sb->s_qcop = &f2fs_quotactl_ops;
> +	sb->s_qcop = &f2fs_quotactl_ops;
>  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
>  
>  	if (f2fs_sb_has_quota_ino(sbi)) {
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
