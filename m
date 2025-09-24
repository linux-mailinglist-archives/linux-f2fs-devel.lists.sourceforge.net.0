Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36507B98122
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 04:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9B0HBfYOiWGtAP4UCgam0CmqnmW/DDVtSM679XKBH3c=; b=Bjz4XbrIHmx5QUZnGEadCEBSIR
	nvF3pldLa+49oCRdueekaZA6ctzeLX8/XvkeY9rbNHX/Q9ShlGoQ1MX9Y3oFaMAivd7hN4NSOuQuV
	q7CiZ+fyXu1cRx7H0rUCq7bEbPZISM4HHBrBbWrTN+WLmTypjBygSX8uhWROZuwuErlY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1FCF-0007Lk-T3;
	Wed, 24 Sep 2025 02:25:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v1FCF-0007Le-1v
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 02:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpjtW5K902mHMOfvIbbVz8verSEONaxcS1Jzs1ww+us=; b=Hm8iauMak//LU7HYZKpWWarBqk
 Z+YhgpJOdV8xf/ZBJnrp5WFHA5ceI8O1N9VvmxVfhJbUwyd2qAvx+fJeY9v6B7/UrSw14PVOoGfI0
 Cfo9tEb2UyuzE/wX3exq+PI1zqEqXyOq80iBngiaHD0d8sJCX/Gsx11T4PNXQnG1DrVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PpjtW5K902mHMOfvIbbVz8verSEONaxcS1Jzs1ww+us=; b=AOydVAVK8JC/YnzwrQIJULlqO3
 PO6XabIFCvXAs9cA83ZWVrktQjVDBEcU3vofwvx8tLerPlbx/Dxz3w6MDszr+aw27gFuisGxSncRk
 yBiOTSZYRTUtqu/pPbTK+27LqrauxSiPgndZ2KYVwA7q7p8+abrO9TBoL6wiKYpwOrOE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1FCE-0004vB-A5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 02:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E6A760007;
 Wed, 24 Sep 2025 02:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E558CC4CEF5;
 Wed, 24 Sep 2025 02:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758680719;
 bh=Ln/q0WgbJA38unhz8cFgC5U6hSD4aGeQda8ZrKmuzH8=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=uhfoSCNWzxXXWv0GEfEn61U/MyXQc4Urx4z13p9XSJBaOmGSfsfCDqdiTQnmON8gg
 +IZwxzzaDz64Ae4Ja0E3A9oPTSfRDklnRaV0iubx4W6ulgiFZ6QifynAaDsMYHdBjH
 nNxmCe5afriAXAMgZDmy4Jrk5ip8Ck+8dZ3S3x1O26ABvtPOwsC0rRn/7ih1vBmvNB
 bNcB9dAkzIu89W1AXEDxpvfQ6Ls7kQBJiuREjKCvbFdfo8wE6qked4iAGGmdSq7jlg
 sK/qeJ/VDcpEwXdlayB4/qilHIkkNHQwvzGGOZMvDfZGy/Hh6Nf753btWjl03obhtw
 Jxn3wz27yxXfA==
Message-ID: <d6609f12-78c2-4a42-b4fd-689b310ec615@kernel.org>
Date: Wed, 24 Sep 2025 10:25:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jiucheng.xu@amlogic.com, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250918-origin-dev-v1-1-8d9877df9e77@amlogic.com>
Content-Language: en-US
In-Reply-To: <20250918-origin-dev-v1-1-8d9877df9e77@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/18/25 11:32, Jiucheng Xu via B4 Relay wrote: > From:
 Jiucheng Xu <jiucheng.xu@amlogic.com> > > On 32-bit architectures,
 when GFP_NOFS
 is used, the file cache for write > operations cannot be allo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1FCE-0004vB-A5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use mapping->gfp_mask to get file
 cache for writing
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
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/18/25 11:32, Jiucheng Xu via B4 Relay wrote:
> From: Jiucheng Xu <jiucheng.xu@amlogic.com>
> 
> On 32-bit architectures, when GFP_NOFS is used, the file cache for write
> operations cannot be allocated from the highmem and CMA.

Hi,

Have you suffered any problem w/o this patch? Can you please describe more
details about it?

> 
> Since mapping->gfp_mask is set to GFP_HIGHUSER_MOVABLE during inode

GFP_HIGHUSER_MOVABLE includes __GFP_FS, we should avoid using __GFP_FS here.
f2fs_write_begin() uses GFP_NOFS like the most of other filesystem to avoid
potential deadlock, as __filemap_get_folio(, .. |__GFP_FS | ..) may run into
memory reclaim to call ->writeback in where we may suffer deadlock potentially.

Thanks,

> allocation, using mapping_gfp_mask(mapping) as the GFP flag of getting file
> cache for writing is more efficient for 32-bit architectures.
> > Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  fs/f2fs/data.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7961e0ddfca3aaa332b7dbd4985ae7766551834f..9fbc41f9accb2626da22754f1a424da4805ca823 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3587,7 +3587,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>  	 * Will wait that below with our IO control.
>  	 */
>  	folio = __filemap_get_folio(mapping, index,
> -				FGP_LOCK | FGP_WRITE | FGP_CREAT, GFP_NOFS);
> +				FGP_LOCK | FGP_WRITE | FGP_CREAT,
> +				mapping_gfp_mask(mapping));
>  	if (IS_ERR(folio)) {
>  		err = PTR_ERR(folio);
>  		goto fail;
> 
> ---
> base-commit: c872b6279cd26762339ff02513e2a3f16149a6f1
> change-id: 20250910-origin-dev-8a5ff6bee1f2
> 
> Best regards,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
