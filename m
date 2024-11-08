Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C423A9C197E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 10:47:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9La8-0002zd-7j;
	Fri, 08 Nov 2024 09:47:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9La7-0002zX-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTZd2riYcTluLcbKzK8e3Y4zGBDS43XaC/4hv8Iye+0=; b=j6fxfYmaHnfm6Tw+r4aDgzxXA2
 nPaF+AxDS0s9jJHpM0NTDJPJhQT252Y1pxY5REieIzBjPcC+vK6QcFHzogn6GubkQb90q2FD961Kk
 D2/qAWJ3008frpJ/9ZDTbkhNUnx/LjK6Uq0lh5l5qlWtKYXwfeGeD20RorGTFrvpOeFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lTZd2riYcTluLcbKzK8e3Y4zGBDS43XaC/4hv8Iye+0=; b=mzrUfEeeRFpH7TN7eOxeUV21sT
 5H+nn9UEwxL9zyvPLOTJw8uIQEg0cXDToRoHpo76/edLlJJZ0DxeMrlqScbIqydp5ZgKAfVCU5M5a
 N/Z7mo+F/MAFLu6nqt0wcNO5QEN4+fZnEJug7ewZOk5uhWLNv+gQpEK3sCGatnEUdaNA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9La5-0004Rp-Vr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 09:47:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 86D81A45253;
 Fri,  8 Nov 2024 09:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C13C4CECD;
 Fri,  8 Nov 2024 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731059219;
 bh=gftxDemJKqLJb4mPXXdNi/TfrkvP+Tbn9Ob+u48LGdg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=KKXPLmlBGCfy1R0l/7mT7SkOr71BSLUeo7+zKNEUxKi8NkXAFa5KpOdZYZFvPOLml
 PQ3/cFBFJ5ZllbyLnHzk0lb9YueYLDkKyO0lO0WoP3wirO1hj1qIEfq49OaQvVSxfm
 L6FMmrsEPB4nzBLwS9IDgGoVDn+0GR/yssRro1NELONKB82oN0KrxHKwBQwC1kIKA1
 DboLEOeUE6egG5QljdrXnsCtRTrd/OiTXPYA56+2VGo5Uk84DQ6lrWvi6W6oCdjlRr
 5Lh+7TOm6r9yXJUso1CVWpU8fsqlCCrg38oTKXS3LeKMHCetR90LOgkO+BBlV186vL
 az2Oir+syI2hg==
Message-ID: <a1471ca1-e119-4106-8965-cd954c373a62@kernel.org>
Date: Fri, 8 Nov 2024 17:46:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Yang <danielyangkang@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20241106025858.495458-1-danielyangkang@gmail.com>
Content-Language: en-US
In-Reply-To: <20241106025858.495458-1-danielyangkang@gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/6 10:58,
 Daniel Yang wrote: > strcpy is deprecated.
 Kernel docs recommend replacing strcpy with > strscpy. The function strcpy()
 return value isn't used so there > shouldn't be an issue rep [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9La5-0004Rp-Vr
Subject: Re: [f2fs-dev] [PATCH] parse_options(): replace deprecated strcpy
 with strscpy
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/6 10:58, Daniel Yang wrote:
> strcpy is deprecated. Kernel docs recommend replacing strcpy with
> strscpy. The function strcpy() return value isn't used so there
> shouldn't be an issue replacing with the safer alternative strscpy.

It's better to add "f2fs: " prefix for commit title.

> 
> Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
> ---
>   fs/f2fs/super.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 87ab5696b..ee8861b95 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1158,7 +1158,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   				break;
>   			}
>   
> -			strcpy(ext[ext_cnt], name);
> +			strscpy(ext[ext_cnt], name);

Needs to handle return value of strscpy()?

>   			F2FS_OPTION(sbi).compress_ext_cnt++;
>   			kfree(name);
>   			break;
> @@ -1187,7 +1187,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   				break;
>   			}
>   
> -			strcpy(noext[noext_cnt], name);
> +			strscpy(noext[noext_cnt], name);

Ditto,

Thanks,

>   			F2FS_OPTION(sbi).nocompress_ext_cnt++;
>   			kfree(name);
>   			break;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
