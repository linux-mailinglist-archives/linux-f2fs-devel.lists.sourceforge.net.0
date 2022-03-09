Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBA4D2CE2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 11:14:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRtKQ-0003JB-6H; Wed, 09 Mar 2022 10:13:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRtKP-0003Iz-GR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 10:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXwMB6SauJ1slUgRI7y/Ncaz03mJsG3LsyuTrMIrC94=; b=Efmuo5XcTX3uX7ecp5uhktpV6j
 AvTFbSaAH2ixsgeGOl+kJoInnnX9LIyf8ZbWXX4e9goqPLXrSTWPELHJMaFkNngO516a7wR88/IsH
 sX72ui3S7WApsy9oaTMc6dE1eP8mFyf7/8oj9jIfWcpuO2CJ2Epc/cgDpd6bHH9X039g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SXwMB6SauJ1slUgRI7y/Ncaz03mJsG3LsyuTrMIrC94=; b=E00BBNKqdl2XslEV4ymaEBO/wm
 uCi/vJ8IVObZhV2gEKWKe4yGNyor5x0JgNLDuDAheadC8q17Nx9GzTB80B1J3P7cCkDE7FTGkJTn2
 cYwI4VJ7h6RVPpPAIiAJZsbtYWnXURoWk+iZrWqjf2G5qKuh25maIJpqBIpPhIisGcb8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRtKM-00050b-To
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 10:13:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B473B81EC8;
 Wed,  9 Mar 2022 10:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73099C340E8;
 Wed,  9 Mar 2022 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646820822;
 bh=pMOc+xiKximFCs2WIg3yA/FxAFnnRzTYYaMWhI7o4vk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jJo+MgmY37krgEYoGV94tEFpSCIDXXnmEteg1CzUUrrOLQ/rZvRYA9uS9I8LVESAP
 6bipwp3X9ap8SG2kpvYFuY1D+QoL368+FwYQNC01wg8+GS99OE51pEYknrJVLoJBR2
 PQDtasWq0fBJzp/xVGpyuvO8dNMIvR4PSwUnoW9I9+pv8ZaQ8IYoq+lprm4YOaaU/n
 UcIrPFN/OLWnoH3TIw+nmYvdvjp20qJjMVUyBhSXQh90l/m7qmEOAxweAQXGVtw4Z/
 P4vbsDEolDhKXPZMyUVjitTz4UWFQJIHsDMJBq6OZKbLp9GFWfARW/aKCNnIctsTWv
 56A8WwZ5eIiaw==
Message-ID: <8a203109-309d-9843-a797-aef3036d4bfb@kernel.org>
Date: Wed, 9 Mar 2022 18:13:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jia Yang <jiayang5@huawei.com>, jaegeuk@kernel.org
References: <20220309092759.1800236-1-jiayang5@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220309092759.1800236-1-jiayang5@huawei.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/9 17:27, Jia Yang via Linux-f2fs-devel wrote: >
 F2FS_FITS_IN_INODE only cares the type of f2fs inode, so there > is no need
 to read node page of f2fs inode. > > Signed-off-by: Jia Yang <jiay [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRtKM-00050b-To
Subject: Re: [f2fs-dev] [PATCH -next v2] f2fs: remove unnecessary read for
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

On 2022/3/9 17:27, Jia Yang via Linux-f2fs-devel wrote:
> F2FS_FITS_IN_INODE only cares the type of f2fs inode, so there
> is no need to read node page of f2fs inode.
> 
> Signed-off-by: Jia Yang <jiayang5@huawei.com>
> ---
> v2:
> - initialize ri with NULL
> ---
>   fs/f2fs/file.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..a8d9104d293c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -812,7 +812,7 @@ int f2fs_getattr(struct user_namespace *mnt_userns, const struct path *path,
>   {
>   	struct inode *inode = d_inode(path->dentry);
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	struct f2fs_inode *ri;
> +	struct f2fs_inode *ri = NULL;
>   	unsigned int flags;
>   
>   	if (f2fs_has_extra_attr(inode) &&
> @@ -2999,7 +2999,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
>   {
>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct page *ipage;
> +	struct f2fs_inode *ri = NULL;
>   	kprojid_t kprojid;
>   	int err;
>   
> @@ -3023,17 +3023,10 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
>   	if (IS_NOQUOTA(inode))
>   		return err;
>   
> -	ipage = f2fs_get_node_page(sbi, inode->i_ino);
> -	if (IS_ERR(ipage))
> -		return PTR_ERR(ipage);
>   
> -	if (!F2FS_FITS_IN_INODE(F2FS_INODE(ipage), fi->i_extra_isize,
> -								i_projid)) {
> -		err = -EOVERFLOW;
> -		f2fs_put_page(ipage, 1);
> -		return err;
> +	if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid)) {
> +		return -EOVERFLOW;
>   	}

checkpatch.pl triggers a warning as below:

WARNING: braces {} are not necessary for single statement blocks

Thanks,

> -	f2fs_put_page(ipage, 1);
>   
>   	err = f2fs_dquot_initialize(inode);
>   	if (err)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
