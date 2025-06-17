Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55441ADC66C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 11:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8koW9aDQem2M74zZGDFvXGp+kGRvLV/1MrF922Z+Sw=; b=ByQ17yQ7owwCx8GgwXYWGS0geb
	QKP+2FfFHicdvM/+KdbNjIl7lSYVmtWwOS4awzdOumvLNvErfBNldj9VuukUYKxzwbanenqfb8ZUR
	74NzrlcuBTAEdqM9nEFsrF/uFkvVeqY/dVXKxj5j+WR10JUVceT6MUwNU3aph0BLSJ7o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRSeb-0003YG-UY;
	Tue, 17 Jun 2025 09:30:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uRSeb-0003YA-9D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 09:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QT24khYk5DxMmdd3J84psrSLv/TR6XG9zL9aVF2zFJ8=; b=Jjas64E4tgMhLC3nFuqiRsLueY
 hrGFEN8qjjQ5wCbFLhui41IAeJaBVZCoAt5uEK6fCywRyoydZr6pAUesQ1zjNuLamkENbP2lOEPEK
 HO8htXI8itOBY2xnxLXCgKMmAyGoF748dYZDk0Cey6/htw7BLauNVsBI7bnxJq3L+XIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QT24khYk5DxMmdd3J84psrSLv/TR6XG9zL9aVF2zFJ8=; b=kJ1Y6tWrgwz7t6Xw/XKcAJYYP5
 labO+8PRYmo7sKYUQ53SNWE919K6VgokXBdXSQvrGXwovOEs6AGXeGZF4NbkcAWJ/cInBA4R5OJAc
 kegXH3Oh+0C47e5xKGzdk5bBOyjnZ/iMx4D+uPBWQXYWZVRdYYN64vq5GEAmH+w3UJNQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRSea-0001Ij-SA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 09:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4CC35C5E9B;
 Tue, 17 Jun 2025 09:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F636C4CEED;
 Tue, 17 Jun 2025 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750152647;
 bh=RuBj++1/pe3YouI4HYElxKXPKmVAfwO/glPTZFQJIqg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=idk3egZ5D7RzFAAQDUK7wM0d6wOWzgqMB6AcmczQVn9lTChWCwO6gtX6w+cDflfKK
 5P/aCrahSeKH5onrDZaqHDRkWQmsFkBkAcNWR+OMXAPYodRs3W2YOqRijc0a/uSTtG
 FjMvpXKlfcf1fsi0auxg1W8wcEJUQThGqnkaz3xEyuNLjdgUDUaLMaaT1s5znTr+4t
 8Xavpi6a5r13dQbzZABuyP0bzepgaKdTp2MLRzJDZ4+Gq3n0+zrIevG83I4qWQ7M+8
 7gUJ9vsIxGaEeRuYWbzPQ+Ii25fxZ3c+QK7uEG+6yXb4PffCRAOx0pH6SuUubW9vLf
 j5gl/haEAzjqQ==
Message-ID: <e6a2233f-5f32-4e1a-87b3-4ecb935e3997@kernel.org>
Date: Tue, 17 Jun 2025 17:30:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <6ccfdae1-13f7-421d-b7d3-76883c2e7b8b@kernel.org>
 <20250617073643.2361088-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250617073643.2361088-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/17/25 15:36, wangzijie wrote: >> On 6/17/25 11:57,
 wangzijie
 wrote: >>> To prevent non-section-aligned size pinned file generated from
 truncation, >>> add check condition in setattr. >>> >>> Sign [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRSea-0001Ij-SA
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size
 pinned file generation
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/17/25 15:36, wangzijie wrote:
>> On 6/17/25 11:57, wangzijie wrote:
>>> To prevent non-section-aligned size pinned file generated from truncation,
>>> add check condition in setattr.
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>>  fs/f2fs/file.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 6bd3de64f..72f7d1b4a 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>  {
>>>  	struct inode *inode = d_inode(dentry);
>>>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>  	int err;
>>>  
>>>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>> @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>  			!IS_ALIGNED(attr->ia_size,
>>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>>  			return -EINVAL;
>>> +		if (f2fs_is_pinned_file(inode) &&
>>> +			attr->ia_size < i_size_read(inode) &&
>>
>> Do we need to consider attr->ia_size > i_size case?
>>
>> Thanks,
> 
> Hi, Chao
> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned
> files"), when we want to write data to pinned file, we need to use pin+fallocate, 
> and we did CAP_BLKS_PER_SEC roundup align when fallocate pinned file:
> 
> block_t sec_len = roundup(map.m_len, sec_blks);
> 
> Even if we truncate the file to a larger size(maybe larger than sec_len, section
> align or not), and write data to offset beyond sec_len, the write will fail(commit
> 3fdd89b452c2 prevent it). The scattered pin block cannot be generated by this way,
> so I did not consider attr->ia_size > i_size case.
> Do you have some suggestions?

Ah, correct, so what about adding comments here to describe why we don't
need consider attr->ia_size > i_size case?

> 
>>> +			!IS_ALIGNED(attr->ia_size,
>>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>>> +			return -EINVAL;
>>>  	}
>>>  
>>>  	err = setattr_prepare(idmap, dentry, attr);
> 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
