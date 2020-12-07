Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C549F2D16B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 17:49:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmJho-0008Ba-7L; Mon, 07 Dec 2020 16:49:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmJhm-0008BS-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 16:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qXa5ZOw8xqCFE2vRP/2tp7syFpAyv9I3kLfHW1IXtSI=; b=Au0N1wCesfMFOuQVKubgCWBSg7
 DHNiu+7peyDATp8rYTzZIjewTAkNHOQ5VSe25NuRDrkFt5U7MAIdYIS9nMGdmmKDaNc16LpRv+PEQ
 RI77Lj6UqdaZ8riHXT0RvcbVDMVzQ8YXZuW7SuEsLdy8/Ct7qN9V/GZyQ623pyXDr6Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qXa5ZOw8xqCFE2vRP/2tp7syFpAyv9I3kLfHW1IXtSI=; b=NwdF0NG5/BQssv5wnShFqlb20C
 WhaZnpBlmw5irN0jjc/UdFNlKR4276V1mpLg1wKewiEhcqd8G73BxW5GTRAO+WXjnWcS4tPbKFOc0
 /Od0WWc1P06VBQayJw0TKmDdsXr0BrgWIkZ1BbsjnWGoYjGc8YBucJSftsM3JoLTyZLg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmJhk-005ZBU-UF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 16:49:42 +0000
Date: Mon, 7 Dec 2020 08:49:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607359768;
 bh=uIjII2MKattvVKkvnVCwZt9I27Zt2jusLVR5YHFX0X4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=hxh79lJvzD+dFrXac4R3Sl0Y5iK7crMpYCwiIkfII9jnTZpyhgPrG9XRbz/FnnqvC
 kZSXURjyUcb2ybB2VO453NjTDs98nlJAXAjeVgFYV8SrzF+03a1xYmHPTMCL50kqUU
 B+XMHu+XKFwyiN8gkYRrGc8vHzuaL3cNU4DMlucPr7u2/Xxu1BuztNvgsLR7aVPnIV
 lqG2wdLa+nrHG+XC/2IOv/bcrtU4xsWx+ZslHvKQecTGH33+y9UNLFFKYZAeP9DGqx
 uVw1i8Wa5nJjSlTvTXjzdUcteltEZtCTZ6djC7fzJWPlG2iGx+wfsXad4DeK5qYKej
 IufXYzkAUtBPw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <X85dFjmqLmo/RsQn@google.com>
References: <20201207120114.25642-1-jack.qiu@huawei.com>
 <20201207120114.25642-3-jack.qiu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207120114.25642-3-jack.qiu@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmJhk-005ZBU-UF
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: inline: remove redundant
 FI_DATA_EXIST set
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

On 12/07, Jack Qiu wrote:
> FI_DATA_EXIST has been set in recover_inline_flags, no need set in
> f2fs_recover_inline_data again. Just remove it.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
>  fs/f2fs/inline.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 0399531efcd3..0a8f7eefca7d 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -286,7 +286,6 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
>  		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> 
>  		set_inode_flag(inode, FI_INLINE_DATA);
> -		set_inode_flag(inode, FI_DATA_EXIST);

Wait, recover_inline_flags() sets this based on on-disk flag, but this tries to
recover it back.

> 
>  		set_page_dirty(ipage);
>  		f2fs_put_page(ipage, 1);
> --
> 2.17.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
