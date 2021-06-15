Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C43A73FF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 04:32:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsyrq-0001Lu-EK; Tue, 15 Jun 2021 02:31:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1lsyro-0001Lm-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 02:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3m5z8ECjh7mo9O+T78MwHfMpKZXisXpafs3zK+JayKg=; b=YJ7E3R0SWdvJXY5y+8ftCLUjrL
 TdkAf37W7nEtLUbG6EVQHejX5es7wrHCkOhlhRTNXgVqhB6C2+ntPBuHIcTtRXm7wlFkgPSLQstgc
 EDtfgkwHUNwMGLcEuugPXilLz9VPkhM/g/7pzGhdZk3q7iDL81tgHGfjzTEFev90tSnw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3m5z8ECjh7mo9O+T78MwHfMpKZXisXpafs3zK+JayKg=; b=botWfNhlp3YFFRNbAy79BOyjnV
 44pOxMeZFPM1YR6PoXG7ATm1CpF9vxtzCExqIz0EuiBUHpKoCtSgWLCMw71onflxmXoLT+9OVRnTl
 zls1dbBhYM8r7T6IzRocjiCU+nsPoVQeYng3sjly3AXmSUli1j0bCnS2Tu9gDEEadw60=;
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lsyrf-0005cl-TR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 02:31:54 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0UcTI8my_1623724295; 
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0UcTI8my_1623724295) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 15 Jun 2021 10:31:36 +0800
Date: Tue, 15 Jun 2021 10:31:34 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Wang Xiaojun <wangxiaojun11@huawei.com>
Message-ID: <YMgRBshqToatVwzP@B-P7TQMD6M-0146.local>
References: <20210615013509.4130329-1-wangxiaojun11@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615013509.4130329-1-wangxiaojun11@huawei.com>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.124.30.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
X-Headers-End: 1lsyrf-0005cl-TR
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace ERANGE with ENAMETOOLONG in
 file name length check
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 15, 2021 at 09:35:09AM +0800, Wang Xiaojun wrote:
> ERANGE indicates that the math result is not representative. Here,
> ENAMETOOLONG is used to replace ERANGE.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

I don't think ENAMETOOLONG is a valid return code for {g,s}etxattr.
https://man7.org/linux/man-pages/man2/getxattr.2.html
https://man7.org/linux/man-pages/man2/setxattr.2.html
instead of ERANGE.

please also see ext4 / xfs implementations.

Thanks,
Gao Xiang


> ---
>  fs/f2fs/xattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> index c8f34decbf8e..eb827c10e970 100644
> --- a/fs/f2fs/xattr.c
> +++ b/fs/f2fs/xattr.c
> @@ -529,7 +529,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>  
>  	len = strlen(name);
>  	if (len > F2FS_NAME_LEN)
> -		return -ERANGE;
> +		return -ENAMETOOLONG;
>  
>  	down_read(&F2FS_I(inode)->i_xattr_sem);
>  	error = lookup_all_xattrs(inode, ipage, index, len, name,
> @@ -646,7 +646,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>  	len = strlen(name);
>  
>  	if (len > F2FS_NAME_LEN)
> -		return -ERANGE;
> +		return -ENAMETOOLONG;
>  
>  	if (size > MAX_VALUE_LEN(inode))
>  		return -E2BIG;
> -- 
> 2.25.4
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
