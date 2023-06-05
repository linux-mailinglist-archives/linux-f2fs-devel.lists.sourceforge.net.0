Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E86721D16
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 06:21:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q61j4-00030F-Q6;
	Mon, 05 Jun 2023 04:21:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q61j3-000309-4t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 04:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FtkqlXlkBIEzr4e/absV4yJL2WN4qd4ekeNIHLMH6/k=; b=S3Q0iUEZymSbBR7vPNRbMlqi3t
 wrOhj1R5gJaN860gyrLSSn8lB4jmUES9BOepID8If4ToaPJTPqBU5egaHLDFwmDDJ968dgH3VWB5E
 y5pOISeADGH+RqMAqvRA+aOFid+X5A6QzZV6UH4ddEHseOElIihxxBagXjbwug3YU8TU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FtkqlXlkBIEzr4e/absV4yJL2WN4qd4ekeNIHLMH6/k=; b=bN/tV9B6MAarcrnHZ/AZdiBHsl
 1cNq8wqpDNfv2xHN+2scTEc+GM93KHPVLrGONzQVDzIAHlujPggJ/yQ2f7N0ZZXAdtPc/3YBjSL/K
 QKN0PLuFqWK2aiO28ggc7GfwNtUxVZdOmICLPml7us165uS/nTSfflJaDZjdBKAcSrdM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q61j3-00BO2g-0u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 04:21:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B69A61086;
 Mon,  5 Jun 2023 04:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65616C433EF;
 Mon,  5 Jun 2023 04:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685938903;
 bh=AANI7NOgq57lJSj5I983odmkVOmutWQGc7FiMQeMDEA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XNh2DjfIq+k5aDe4s9q4+aTgdKRbZzpuf9/uCGTcTfYmVcR3CLOD+ct9PhhbY8AzA
 03sWTF2JcDkfY48Gq8rZWF88nRprn7Skrg4ghOkfqA6q0PU1tpp3j3fHzwsPr8y/Kr
 gd1UpJu7NWXr1feni4G2bPsMos9H3A/0hs3vCOCOngskorTLdaIlrsmqRkY90GPGdb
 2AGPvqbtWqYJf+mEJkC1vhnS38Yq5lDXKE4Q0SMur+yd+5Qtwbbr9c9oC3f3W5VTeR
 03DH/zxBEw9AC4Nm3UuoZgWF+6GdQjpiSIJRegvXefS8nXfCvqzD810mT8j8IY+cm4
 QtCNIX4iopgdA==
Message-ID: <fb0d23b6-9fcb-b390-be72-781af015646e@kernel.org>
Date: Mon, 5 Jun 2023 12:21:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
References: <20230602102451.602105-1-korotkov.maxim.s@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230602102451.602105-1-korotkov.maxim.s@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/2 18:24, Maxim Korotkov wrote: > In error handling
 cases, the function exited without releasing memory > > Signed-off-by: Maxim
 Korotkov <korotkov.maxim.s@gmail.com> > --- > changelog: fixed [...] 
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
X-Headers-End: 1q61j3-00BO2g-0u
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: fix memleak in f2fs_create()
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

On 2023/6/2 18:24, Maxim Korotkov wrote:
> In error handling cases, the function exited without releasing memory
> 
> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
> ---
> changelog: fixed code review remarks
>   fsck/dir.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/dir.c b/fsck/dir.c
> index 4a3eb6e..29c89de 100644
> --- a/fsck/dir.c
> +++ b/fsck/dir.c
> @@ -704,7 +704,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>   	ret = convert_inline_dentry(sbi, parent, ni.blk_addr);
>   	if (ret) {
>   		MSG(0, "Convert inline dentry for pino=%x failed.\n", de->pino);
> -		return -1;
> +		ret = -1;
> +		goto free_parent_dir;
>   	}
>   
>   	ret = f2fs_find_entry(sbi, parent, de);
> @@ -713,6 +714,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>   					de->name, de->pino, ret);
>   		if (de->file_type == F2FS_FT_REG_FILE)
>   			de->ino = 0;
> +		ret = 0;
>   		goto free_parent_dir;
>   	}
>   
> @@ -728,7 +730,8 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>   		if (hardlink_ni.blk_addr == NULL_ADDR) {
>   			MSG(1, "No original inode for hard link to_ino=%x\n",
>   				found_hardlink->to_ino);
> -			return -1;
> +			ret = -1;
> +			goto free_child_dir;
>   		}
>   
>   		/* Use previously-recorded inode */
> @@ -750,6 +753,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
>   	if (ret) {
>   		MSG(0, "Skip the existing \"%s\" pino=%x ERR=%d\n",
>   					de->name, de->pino, ret);
> +		ret = 0;
>   		goto free_child_dir;
>   	}
>   
> @@ -804,7 +808,7 @@ free_child_dir:
>   	free(child);
>   free_parent_dir:
>   	free(parent);
> -	return 0;
> +	return ret;	

Oh, unneeded indent in the end of sentence.

Thanks,

>   }
>   
>   int f2fs_mkdir(struct f2fs_sb_info *sbi, struct dentry *de)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
