Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0272C837
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 16:24:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8iSl-00054T-C1;
	Mon, 12 Jun 2023 14:24:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8iSj-00054N-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kW8uey/xp0eGxvK/6N16Sn8FYmDkQAw++OHXUiK84wI=; b=WsWb4ElP/aYa0zqQZHiFkKNkh+
 9FwnjRiUWd8w5K/lVcqwFoINgOkAZwhFfEnOquQfOSSihlwVaxg6TJoqolWwyzrDxNxNPZP1IbS1k
 vfyK5bLGgVDRlTGP7s1+6CI/N3xOJyfXAK8kWG+tL/ZUEwys55qPEwrcaqKsJSmYwyrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kW8uey/xp0eGxvK/6N16Sn8FYmDkQAw++OHXUiK84wI=; b=jTd0xyeZMc3WWuyvCvWA9geSQb
 DVT+tutA8UQNZOct0eTrXwnifG7P3ICd8CEyXJuPCJZ/XI+tQNpI2y5cgX5SxYUJBTMoEI2jyqQWR
 X+Nc7ZwQvGWNgZvV4is90RV8W99xRrOCA//XQ5QC9ULZJH5L8GRpkEn7dTuR6AE2pFTo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8iSf-0003hK-5p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:24:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C329D615E0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 14:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6656BC433EF;
 Mon, 12 Jun 2023 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686579835;
 bh=ru8p5cn4S9smhGWMCMzJZMSU8wN0AsEFLROWReLGgxo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Zi10AnLsRmaE0mjSsNlAG/fSkLrflx62UQ/GzGd9nU7h/uA79ZGYUdUYMLq424JvQ
 wZX4JYP4GJCiTXF31768h3v4WcuYwEaEL3alc0q9ZNMI6Uh5Zc7Sg88IHjioBN7eL/
 7JgQcAZncEbZ2JtZWLq2a6fio1j1hgSYG13d3GJWiol+U8G98Y4A9d/BqLZp8wwfJc
 YW7i10sRtp9FkwptmMjfyXEGdjEbpbCsSAsPFwznbPRm9X6iKZbC1YyVAr+btAW+n8
 EZzWpu8rkYLrj7vU6+AbmbGUy/ZgPPKjZmdpYjrWDmW1gYH2eASiADT2rGz7V2jPnU
 tpR+KfJ0thnCg==
Message-ID: <85ff67e0-c6c6-e693-bcba-6e36a3dd2ea4@kernel.org>
Date: Mon, 12 Jun 2023 22:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230607162954.2651657-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230607162954.2651657-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/8 0:29, Jaegeuk Kim wrote: > ZSTD does not support
 compress_level=0. IIUC, it looks the range is [0, ZSTD_MAX_CLEVEL], 0 equals
 to default (ZSTD_CLEVEL_DEFAULT). zstd_compress.c 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8iSf-0003hK-5p
Subject: Re: [f2fs-dev] [PATCH] f2fs: set zstd default compression level to 3
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

On 2023/6/8 0:29, Jaegeuk Kim wrote:
> ZSTD does not support compress_level=0.

IIUC, it looks the range is [0, ZSTD_MAX_CLEVEL], 0 equals to default
(ZSTD_CLEVEL_DEFAULT).

zstd_compress.c

     /* row */
     if (compressionLevel == 0) row = ZSTD_CLEVEL_DEFAULT;   /* 0 == default */
     else if (compressionLevel < 0) row = 0;   /* entry 0 is baseline for fast mode */
     else if (compressionLevel > ZSTD_MAX_CLEVEL) row = ZSTD_MAX_CLEVEL;
     else row = compressionLevel;

Thanks,

> 
> The commit d7ffafc99c42 ("f2fs: add sanity compress level check for compressed file")
> revealed the issue.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/super.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8fd23caa1ed9..1fb8d4f27a40 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -627,7 +627,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>   	int len = 4;
>   
>   	if (strlen(str) == len) {
> -		F2FS_OPTION(sbi).compress_level = 0;
> +		F2FS_OPTION(sbi).compress_level = 3;
>   		return 0;
>   	}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
