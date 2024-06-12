Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CB9049B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 05:39:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHEpw-0002As-Kv;
	Wed, 12 Jun 2024 03:39:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sHEpv-0002Al-GT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 03:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2CoR1DDK3ZimBSP8ifTTWHN0PN36feltteGRJ2oH6A=; b=Q5jYs8FbJ7z8VLzwm3Fu/I8p3l
 sSLIoE31W+OFf/+sfFrgVu7X1Wr/LqBYNKilHLTnvCEYKCQNYi+fi2bioaD07OvySoZxPZcj5AqnR
 HkgruVzvyUwuJN48/CBBp5hcJgrPEg8GVc6bCUIgHPrAh5us/pqKJBGtX66KJPYPLkNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W2CoR1DDK3ZimBSP8ifTTWHN0PN36feltteGRJ2oH6A=; b=mL6Iq5cOEeVcJWLk0xxxm35VAz
 5vNFXl8k+vxasdPSuR1w9b4o8h7HI0RrONN/jTdQRv1dGj0YCdd/hnsoj8azq2zoOnYzfcAesufjO
 SA1q3xzKsTwyp+B//d+0wjVDxlOlOZ9RgYWckmYBQqMTlZnSxKhfVDSPWAYbQ8X7Htvk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHEpu-0004g8-RR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Jun 2024 03:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55938CE1F22;
 Wed, 12 Jun 2024 03:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD64C2BD10;
 Wed, 12 Jun 2024 03:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718163573;
 bh=rcGTD1NatArwiA0ZaZbZWpjBQNKwW0dWWPYaKK68C9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ItJOrarJ6UePkisoSxV5WrMfDHj+OxxwDL1bsCm/ovyOEQzdY+dGpZZ1zW8i3LSsG
 lsr5xHWPLC+y7UMjGtnFZjnMv6xb3jk5KZidGVSRcnF6p9uVr+75+iUXwQK9uqAj8S
 MU/LHJzFRh3oQ6WZL4BHyeX/K6NN4pMDyyJiLjyjO7tR5O5BuNdjMvMg3fSBKxuGN+
 vIdqqxYp4gzrsg2dJzxmJGpzsjVq8+U2x/RxGPZnoqIjhjex/Di59QKO3CfkhtuUDF
 j2UV7JsWGLB3jxZVEeQgHdgK1xsMeZ+03a7KmNvbY7KFhesn5bmONachK402SdqLgT
 9169DUfwann7A==
Message-ID: <dfdf7dac-90e2-4ee7-8258-ffca0c777d9e@kernel.org>
Date: Wed, 12 Jun 2024 11:39:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
 <20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240612022012epcms2p77300b5130d18b0397c9fc2877704949d@epcms2p7>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/12 10:20, Daejun Park wrote: > syzbot reported a
 bug in f2fs_vm_page_mkwrite() which checks for > f2fs_has_inline_data(inode).
 > The bug was caused by f2fs_convert_inline_inode() not returni [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHEpu-0004g8-RR
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix convert inline inode on readonly
 mode
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/12 10:20, Daejun Park wrote:
> syzbot reported a bug in f2fs_vm_page_mkwrite() which checks for
> f2fs_has_inline_data(inode).
> The bug was caused by f2fs_convert_inline_inode() not returning an
> error when called on a read-only filesystem, but returning with the
> inline attribute as set.
> This patch fixes the problem by ensuring that f2fs_convert_inline_inode()
> returns -EROFS on readonly.
> 
> Fixes: ec2ddf499402 ("f2fs: don't allow any writes on readonly mount")
> Reported-by: syzbot+f195123a45ad487ca66c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f195123a45ad487ca66c
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>

Hi Daejun,

I guess below patch has fixed this issue, so we need to tag the report
as duplicated?

https://lore.kernel.org/linux-f2fs-devel/20240603010745.2246488-1-chao@kernel.org/T/#u

Thanks,

> ---
>   fs/f2fs/inline.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 7638d0d7b7ee..ae1d8f2d82c9 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -203,10 +203,12 @@ int f2fs_convert_inline_inode(struct inode *inode)
>          struct page *ipage, *page;
>          int err = 0;
> 
> -       if (!f2fs_has_inline_data(inode) ||
> -                       f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
> +       if (!f2fs_has_inline_data(inode))
>                  return 0;
> 
> +       if (unlikely(f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb)))
> +               return -EROFS;
> +
>          err = f2fs_dquot_initialize(inode);
>          if (err)
>                  return err;
> --
> 2.25.1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
