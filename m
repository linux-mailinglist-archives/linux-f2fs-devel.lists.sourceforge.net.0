Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1972C7FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 16:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8iNK-0002rg-Ru;
	Mon, 12 Jun 2023 14:18:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q8iNH-0002rR-6q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VrZ4GNFnC3sgYd3sMRUahYToCKoEXjYbz/m7skd0Wrs=; b=l/S8QFIrD/1h5JEnO/lwNVKn2s
 hRdk+fOTd4tXXseX5rsxJRkmkEz0Md3kAgPkC8+jPoSaS2v/OBO/yzlIpN5k8uyXm5/Bp7RDUkS9h
 Wfc+/3zzCYg8UHDU5CfbHqdEn0NxIwLTBSiEV7pUxqdBGGLv6O8tGPigjoFIExxfuesE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VrZ4GNFnC3sgYd3sMRUahYToCKoEXjYbz/m7skd0Wrs=; b=fcL4uul3mzX02t9OLv53Ncztgn
 /mEuATu+nwuBpKm4WOrR0Ei3zGssrKe6fS5lbcKWYJ1Il+KPJSOM2GHwOIx/4CSvDAebD7B9+kiYj
 z8LQbLAwB52layu3WC6VaoYwXsGKKLR6kZV2d8p63DAGyYxCxsCwlXlZ+9rMFvHpZ1/k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8iNG-0003Vl-H2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:18:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20D68629BE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jun 2023 14:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B960FC4339B;
 Mon, 12 Jun 2023 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686579500;
 bh=ilN1/jTNe0GA6pB/SlZ9PiNSr53z2qsAMGgSkLjTC2w=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=sDMPNCtc0puIdJWz86xkxsdXNL19AE4EeVwLS/TyXZOr2t4P2/4Im0P2qECC30mDP
 tm4DDNx3P33+vPFwlWlJLludG8YoYq+00Yyj4s87yhihKig8YEA/HtXbG9oH0VsoJb
 x6qV1O1I4eblUs1+Qes/NOqAysPeciTTpYs7kXxryqySCwqITm22QDxY48FQshiOGS
 22PpbsfSiQGZotypAGtQgNuSbVKMFohjb4UY+veEVG7/bqkNuEaP90dBbqyjKhVxZ6
 UGzm2a+zLdaVNRPxloxjtB2aaADN3DKtoXD1rM/VkIBHJoZIIlBKuMmGIUzbxr+bWI
 i/HmVoQEQWMXg==
Message-ID: <7af0f599-2314-56af-2813-5e63754134e1@kernel.org>
Date: Mon, 12 Jun 2023 22:18:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230606203645.3926651-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230606203645.3926651-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/7 4:36, Jaegeuk Kim wrote: > Let's compress tmp
 files for the given extension list. Could you please check below commit? IIRC, 
 it was introduce to avoid compressing file which has unpredictable tmp file,
 e.g. foo.sox. 
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
X-Headers-End: 1q8iNG-0003Vl-H2
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress tmp files given extension
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

On 2023/6/7 4:36, Jaegeuk Kim wrote:
> Let's compress tmp files for the given extension list.

Could you please check below commit? IIRC, it was introduce to avoid compressing
file which has unpredictable tmp file, e.g. foo.sox.

Could you please describe the case you encounter?

commit 4a67d9b07ac8dce7f1034e0d887f2f4ee00fe118
Author: Chao Yu <chao@kernel.org>
Date:   Tue May 18 17:54:58 2021 +0800

     f2fs: compress: fix to disallow temp extension

     This patch restricts to configure compress extension as format of:

      [filename + '.' + extension]

     rather than:

      [filename + '.' + extension + (optional: '.' + temp extension)]

     in order to avoid to enable compression incorrectly:

     1. compress_extension=so
     2. touch file.soa
     3. touch file.so.tmp

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/namei.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index 3e35eb7dbb8f..cdc94c8e60f7 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -161,7 +161,7 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>   
>   	/* Compress wanting extension. */
>   	for (i = 0; i < ext_cnt; i++) {
> -		if (is_extension_exist(name, ext[i], false)) {
> +		if (is_extension_exist(name, ext[i], true)) {
>   			set_compress_context(inode);
>   			return;
>   		}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
