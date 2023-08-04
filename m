Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0095D76F879
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 05:45:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRlkb-00061C-Hh;
	Fri, 04 Aug 2023 03:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qRlka-000616-1S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 03:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rUHOoQxc+ZBS1RX52jnMw60v/RCce5NK4JX5PK0dfao=; b=QXmchnPaHQYCFJsZDZKlu7cVF4
 xf7mvlWVxf2jLB8SipitlCCqPY55L6kQXuMQDMFRh3D3cnSXEkW07uza9Bl6cW9flhnQk65Sfqj6x
 /mE5WB8bVe5xV1IcXD4A5r1h5QvqQS+bH+IL7ZCDdhqEKkXZtmLY1gC7iZ2RW5B4SAEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rUHOoQxc+ZBS1RX52jnMw60v/RCce5NK4JX5PK0dfao=; b=K/tBWSiHKybaU+Y/NRxphy/yYP
 RbWDP3QnVe/62/gu8RG83Rx2ZEbEZ6ZFqVq+fp4OLKxMIODhepk4LOYIkr8lKi9sdchyJH8UWalSo
 CBdctMpY14/7UEXnmfCuRbPGOWg2gYxcR6iqSV5/MSrWHboppohf/4fpwHRvDWHQgQWw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRlkY-00CdX0-1N for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 03:45:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CFC161EF7;
 Fri,  4 Aug 2023 03:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D00C433C8;
 Fri,  4 Aug 2023 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691120707;
 bh=5UWe8d+CZzpNzKcr2HNQxXlUCGWx9CtwP+MiNIa8p7U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d7GgkYCX54fvltblV39RF2PbVBQyZW2/qZzSdrGkbcAq5ZWPapqrMyAR0FUH9VAdv
 46p7VmoiGQAjbY+E2x0+/JoVei9HnJZN/svWWqSvUU7WV02EPIy9TFNfuniXmwdEmY
 9JsYShckAS1ReoEf2Td5uaQ8abZuFs7BY17C40iRVdrVLyYh4RT+AAQ0ltJT5EP6Xa
 +NqwdLnIV7cpyXxcScS6aOpmNcHM9RxC0kKbdVQqo08+IBuWRhhBv99YOU148GFEla
 hY/9houJ2MsN5B3ZR9EM8+V98S1pKVqOuePmkjJv9Rpx4OY3Y3ouPumEXiqioBjvFe
 Mm4/8RwmcSe/g==
Message-ID: <7ad85046-857c-b6e3-3c77-408e5b093ab5@kernel.org>
Date: Fri, 4 Aug 2023 11:45:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20230803142842.29062-1-guochunhai@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230803142842.29062-1-guochunhai@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/3 22:28, Chunhai Guo wrote: > Now f2fs support four
 block allocation modes: lfs, adaptive, > fragment:segment, fragment:block.
 Only lfs mode is allowed with zoned block > device feature. > 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qRlkY-00CdX0-1N
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/3 22:28, Chunhai Guo wrote:
> Now f2fs support four block allocation modes: lfs, adaptive,
> fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
> device feature.
> 

Fixes: 6691d940b0e0 ("f2fs: introduce fragment allocation mode mount option")

Otherwise, it looks good to me.

Thanks,

> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
>   fs/f2fs/super.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 30883beb750a..26add77f9062 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -862,11 +862,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			if (!name)
>   				return -ENOMEM;
>   			if (!strcmp(name, "adaptive")) {
> -				if (f2fs_sb_has_blkzoned(sbi)) {
> -					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
> -					kfree(name);
> -					return -EINVAL;
> -				}
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
>   			} else if (!strcmp(name, "lfs")) {
>   				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
> @@ -1331,6 +1326,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			F2FS_OPTION(sbi).discard_unit =
>   					DISCARD_UNIT_SECTION;
>   		}
> +
> +		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS) {
> +			f2fs_info(sbi, "Only lfs mode is allowed with zoned block device feature");
> +			return -EINVAL;
> +		}
>   #else
>   		f2fs_err(sbi, "Zoned block device support is not enabled");
>   		return -EINVAL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
