Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA74CFB9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 11:41:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRAnV-0006n4-E9; Mon, 07 Mar 2022 10:41:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRAnR-0006mu-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 10:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D4MYe+dWSZIcccnw6MaAPSpi9m8y587lgijf9I4A42k=; b=T9tomSc1jQjOha0aTfZLW2dVj/
 k6vraeidjQmrL3ocyHQmoxmjH3WAFHH6kW7Ma3LNGLU95TOqjj/lSU2JgdOpEnFEZpN8XLe8sP/4D
 EEgR0zDp9+7NRDEBFqizWwywKWLhM2da7+N7WGkh/10tdwxkvXHbsF190PWN8AiFRKns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D4MYe+dWSZIcccnw6MaAPSpi9m8y587lgijf9I4A42k=; b=Vpo5GSYYMeqoL0Kq0swMUZ1RnL
 Sp9bI1lzOFHrqg4uBgGLxIEVCxYFeMjHt+pcBLV98+C4NfcqviCXBnT2yM0Q3Tl1PdY/W4rIBgRaq
 8+IJS/jwKm+o05qlwkynhWuhNUgLgeRircD8IYy9lpJfHUVJBPuOAD5yxjQq6XsJ5Ezg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRAnM-0004RC-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 10:40:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42B2361274;
 Mon,  7 Mar 2022 10:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056CFC340E9;
 Mon,  7 Mar 2022 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646649642;
 bh=83P5/IGbkGKBk/yf2Uuabi1vmtSgCqxn89ZV9oVF7gI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e3D23fRZMmJZ1IizVjAUwvRTHQQmcLPzR4GPi58ZO6CSYhVmz5Xwk372wSG39hhW3
 5JyujcC0irdAHT7qCTpGT8JBktla0+sHStyUE04ZAfj4GDaDizXxkhYsAcbxfuPi8c
 WQKkCxiosPYQSEihD6cY0IMpBRkcLT/rYqsVOJWQIYOo4RvIyr6NXoLMHoLfPZd+lP
 VtrUaxTFWwcd56Tj1U+AKCJSXnGl3Vh03XkPPvcmNWV8TLtNPzAujvtLRiweeEdHtU
 WnqTrs0KiqDcXR7XxQ93dYSIJeMLWJc8YS4JEVs78/oYbkM5y0059I4aVvXM+moeEO
 CtJ2zfTqW7o+A==
Message-ID: <0833a084-f31d-2815-40cf-c8e173feec02@kernel.org>
Date: Mon, 7 Mar 2022 18:40:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jia Yang <jiayang5@huawei.com>, jaegeuk@kernel.org
References: <20220307081227.1353957-1-jiayang5@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220307081227.1353957-1-jiayang5@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/7 16:12, Jia Yang via Linux-f2fs-devel wrote: >
 F2FS_FITS_IN_INODE only cares the type of f2fs inode, so there > is no need
 to read node page of f2fs inode. > > Signed-off-by: Jia Yang <jiay [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRAnM-0004RC-Oc
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove unnecessary read for
 F2FS_FITS_IN_INODE
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

On 2022/3/7 16:12, Jia Yang via Linux-f2fs-devel wrote:
> F2FS_FITS_IN_INODE only cares the type of f2fs inode, so there
> is no need to read node page of f2fs inode.
> 
> Signed-off-by: Jia Yang <jiayang5@huawei.com>
> ---
>   fs/f2fs/file.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..4b93fbec2ec0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2999,7 +2999,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
>   {
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct page *ipage;
> +	struct f2fs_inode *ri;

struct f2fs_inode *ri = NULL;

(offsetof(typeof(*(f2fs_inode)), field) +
sizeof((f2fs_inode)->field)

A little bit worry about using a NULL pointer here, due to not sure the result of
offsetof() and sizeof() will always be calculated at compiling time for all kind of
compilers, can we guarantee that?

>   	kprojid_t kprojid;
>   	int err;
>   
> @@ -3023,17 +3023,11 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
>   	if (IS_NOQUOTA(inode))
>   		return err;
>   
> -	ipage = f2fs_get_node_page(sbi, inode->i_ino);
> -	if (IS_ERR(ipage))
> -		return PTR_ERR(ipage);
>   
> -	if (!F2FS_FITS_IN_INODE(F2FS_INODE(ipage), fi->i_extra_isize,
> -								i_projid)) {
> +	if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid)) {
>   		err = -EOVERFLOW;
> -		f2fs_put_page(ipage, 1);
>   		return err;

return -EOVERFLOW;

Thanks,

>   	}
> -	f2fs_put_page(ipage, 1);
>   
>   	err = f2fs_dquot_initialize(inode);
>   	if (err)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
