Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 953DD256B46
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Aug 2020 05:40:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCECM-0008Qn-DO; Sun, 30 Aug 2020 03:40:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kCECH-0008QX-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KGgo3l0oprwFZsL+AyfzGxyEYAvOyv8HhaQ0iLoLdXY=; b=akvlG9y9G4yYIXlZz8Sgp7Jggk
 s71OxNFVx6fqY3UEGfr7BzhXOaxKY4ZW2nnEzdKeAKACwsGh3Exrpw8mmflwn7uOWBxNOPb1ymNSW
 X7Hmt8LuWpjHit4O2qtoMUNQgjypc9PBv5slaGoF2jELEypC73UCy2a2c363YQ2yU2+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KGgo3l0oprwFZsL+AyfzGxyEYAvOyv8HhaQ0iLoLdXY=; b=ZFJIFk5GVuqStK+kq6ZbZ+Dw2F
 U3MAJ8cIamxgGPNhtQ1nLyDQMOn8fqVrV8i5ULJhwjA+hP2x2Ss5zQkKOMLjLOIUPiCYHe7Fwl34C
 54SFhgKT4cTM0FCoQgwv6xyGxmkh3lucd8AwD77sptzzwTTqZAIBnb+y0QYlBNzuuboY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kCECG-0054vn-65
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 03:40:01 +0000
Received: from [192.168.0.108] (unknown [49.65.245.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D315A2076D;
 Sun, 30 Aug 2020 03:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598758787;
 bh=KoGZsxVqGODP7b8MIqZjUyq90/fxSEGocljWKhTtsNw=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=e7YIS2twPjpLxsBAQ10weLdydXJMTDqA7IueQCdclhJgQLjGmqoQeQDok18cpjW+N
 0ySSDdszGKDp2BNhgkHgtliTroTB00xhxU+DZw+stEtTTLcmlXMvyiLnLu48u3OiHf
 uH7xkiQfOk0qICF0RYtQ+FFMgeWAca4XJ3CWIrb4=
To: Dan Robertson <dan@dlrobertson.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200830003520.6542-1-dan@dlrobertson.com>
 <20200830003520.6542-2-dan@dlrobertson.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7e444bc8-dec1-baf1-f56f-6e7d73f35e5e@kernel.org>
Date: Sun, 30 Aug 2020 11:39:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200830003520.6542-2-dan@dlrobertson.com>
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dlrobertson.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.8 NICE_REPLY_A           Looks like a legit reply (A)
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kCECG-0054vn-65
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: check output position in move
 range ioctl
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

On 2020-8-30 8:35, Dan Robertson wrote:
> When the move range ioctl is used, check the output position and ensure
> that it is a non-negative value. Without this check f2fs_get_dnode_of_data
> may hit a memmory bug.
>
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>  fs/f2fs/file.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8a422400e824..650ae0dc7cdf 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2783,6 +2783,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
>  	if (IS_ENCRYPTED(src) || IS_ENCRYPTED(dst))
>  		return -EOPNOTSUPP;
>
> +	if (pos_out < 0)

if (pos_out < 0 || pos_in < 0)

> +		return -EINVAL;
> +
>  	if (src == dst) {
>  		if (pos_in == pos_out)
>  			return 0;
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
