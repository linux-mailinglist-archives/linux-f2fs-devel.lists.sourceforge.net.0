Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27B7237F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 08:44:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6QQG-0002mc-Co;
	Tue, 06 Jun 2023 06:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q6QQE-0002mW-4u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PYF//qMxjWzr8gdQn1EitkTXlZodMKRMwnVxfb9k2Jg=; b=crpY9Aw8jk5ls9b1j3zYi7oD2L
 TYaBeT4m+V5/R0CHyY/qmXsmSBOdHVOBEG/ZqTQ04shWnzCLMKu9bBVzus7OBmoG6xLqJLCzPtmzm
 OZJvWh5e2bm00OS6n8WtmVLYbXR1coRJ6xKzAkJ+fItm1IU9c0g59h1c9h4eANt5TppY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PYF//qMxjWzr8gdQn1EitkTXlZodMKRMwnVxfb9k2Jg=; b=BQR77cgHvkRgU8MSyYCWtJUKyH
 jWalG2dh7TlIib9cM/NSLSS8zlB7X2oOp3fI1VHTO7YQMQHTVfiU3Ep6VNLFP9+YaiVXsL6800Pxx
 Oo/t4UgUc9VFpx9IZ4dgEL/K/s569x4Q2atrSW1w0DxL3Yr45Cd7aUWAE6ASZxXUfyDg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6QQ8-000282-9I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 06:44:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEFEB61176;
 Tue,  6 Jun 2023 06:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDFCC433A4;
 Tue,  6 Jun 2023 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686033830;
 bh=iuTfu26glfb8E1WFTPHNw0lExwnuCUbJYgkCjPpeHcA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FDPka2ENBwIPSxTnzOoEx1HTMgEMn5YtVGOMtTaTohqpcM4Qh/uaBlq1HEHQZHY5k
 91M/IXd+qG59sNGGOXi/TgXD04zKRk2QJdX3d8Cp2fTqg4NgjC2L1Y9WQYOwBB6ZaU
 1ZruUwmdAanKJOA1jh+GPWePUT2hA5QMuO+XiAKWGMlBCSuzdndHqATN3NIqtHoFzY
 eN45H6BFFzkt7WwEcyJeqnZjYLH5uz+G8SmdZfCurjOVyaKF28a1gJFAyXBVcle7BY
 LIDIo/YQd77HCQjw5k7uRn9QTUPKc5jsSd32R2n7gkRVtVxwfQoYCpyc1kmfys4il9
 8ILd7eMDiDfTA==
Message-ID: <e8e4758f-5895-acd7-27d2-4b72b69722b3@kernel.org>
Date: Tue, 6 Jun 2023 14:43:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230531144006.7307-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230531144006.7307-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/31 22:40, Yangtao Li wrote: > This adds the async
 buffered write support to f2fs, > the following is the relevant test data.
 Yangtao, Could you please provide detailed test command? 
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
X-Headers-End: 1q6QQ8-000282-9I
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable nowait async buffered writes
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
Cc: linux-kernel@vger.kernel.org, Lu Hongfei <luhongfei@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/5/31 22:40, Yangtao Li wrote:
> This adds the async buffered write support to f2fs,
> the following is the relevant test data.

Yangtao,

Could you please provide detailed test command?

Thanks,

> 
> iodepth      | 1    | 2    | 4    | 8    | 16   |
> before(M/s)  | 1012 | 1133 | 894  | 981  | 866  |
> after(M/s)   | 1488 | 1896 | 2081 | 2188 | 2207 |
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/file.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 23c68ee946e5..4faf2c04e325 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -546,7 +546,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>   	if (err)
>   		return err;
>   
> -	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
> +	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC;
>   
>   	return dquot_file_open(inode, filp);
>   }
> @@ -4515,9 +4515,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>   	struct inode *inode = file_inode(file);
>   	ssize_t ret;
>   
> -	if (iocb->ki_flags & IOCB_NOWAIT)
> -		return -EOPNOTSUPP;
> -
>   	current->backing_dev_info = inode_to_bdi(inode);
>   	ret = generic_perform_write(iocb, from);
>   	current->backing_dev_info = NULL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
