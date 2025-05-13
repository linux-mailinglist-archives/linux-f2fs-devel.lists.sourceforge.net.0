Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61638AB49A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 04:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djnXi8M1IcWEJGrWi++O7yKDqOey7ds3Ej1SHmuisVc=; b=XKEhtgQnDtD1F0OUIzE5A31Hda
	VU17zSswTMOKD8cCFiGZ+Tm4PDafepLUVC2iSmGrLWbOqcVtZVdL5xUlvz3zJf26yj6sRUourXfcw
	Pknzl9USTTyAuWDzNH9lX0A6GUMC306grE0tvFraepiWP0xUZ/WGfSthbfuoXiWB2SOE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEfdk-0002MA-3R;
	Tue, 13 May 2025 02:45:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEfdj-0002M4-GH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G+Ccb6ZRDA6UIWyzC3PAPGDUY8jfow3qJQ/+yqhsC7g=; b=YgI+ftt1QXdDD+lFa4G+locwTz
 3N/k225/4CezKf6oc5iyL+w0QF0zo6/qdBK4m1oorcR0SySEB4vfxdU1cg19k/cARYiALSccIAs+u
 lsMOeuL6nF5z5rrMqAC/EvP4vZ1Ag0dIt9cOITEXfNvkIEbGLeAxinkYd9iQW+xYVMEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G+Ccb6ZRDA6UIWyzC3PAPGDUY8jfow3qJQ/+yqhsC7g=; b=ajXHHw57kV9CQTfEGnb7lTXY+S
 Fir85OaMOGAHdOxdniqpoPEdEPhY+t+nxpwEpV32IPjZR/C7Ij0+GnK13gFa+d1dHxqPA+85qwIvi
 pVVc6oTXhKUeCvwidmdAQZkLyzkv1DDjWV1FKgfWoRiW+gaVXaaVqPpgwJIvq6jno/Bw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEfdj-0000hL-0O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 02:45:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 484E35C53DE;
 Tue, 13 May 2025 02:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593CCC4CEE7;
 Tue, 13 May 2025 02:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747104296;
 bh=ZFGIyXGw5+qmgsPzz6aL54r77OiRi4cTKJhtA4ObtoA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=JyuD4GNN0s1sVLGX/wrJ9d85HO97sl7TDj+Bt3bjdv3qyUzSFPEOe362EyGYzh2Pw
 ixj1B+WjimwEmtFpfuiAFyb9XlRafRof9bq6jD1u44kQ8nlCuvipFxi6fR+hYh7pRH
 e2jfoPQwv7zs7uIpfE4NufVj6j5v7BhDYBkok7WgYH2WsS8hHkBKDONSGGpGSFdccQ
 xqTlgIgpDR42eW9RJQTqiFlETVQ6Opn/6sGGfQZvRfC418WI2aRpqKhyFoPZf1isKS
 djWuQSsTcDy83taRLCzXL8RlEMtuEK3glapxcsB/AxOhSjQgxHVfY6vV2ajLDGjm/k
 hMv97v8/hFqxg==
Message-ID: <2a6bb772-901a-4054-80fa-7ff7cb118944@kernel.org>
Date: Tue, 13 May 2025 10:44:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, g@google.com
References: <20250512115442.2640895-1-chao@kernel.org>
 <aCITHczkYs49uBSc@google.com>
Content-Language: en-US
In-Reply-To: <aCITHczkYs49uBSc@google.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/25 23:26, Jaegeuk Kim wrote: > On 05/12,
 Chao Yu wrote:
 >> Add f2fs_bug_on() to check whether memory preallocation will fail or >>
 not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL). > > Ar [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEfdj-0000hL-0O
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add f2fs_bug_on() to detect
 potential bug
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/12/25 23:26, Jaegeuk Kim wrote:
> On 05/12, Chao Yu wrote:
>> Add f2fs_bug_on() to check whether memory preallocation will fail or
>> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).
> 
> Are we getting a bug?

No, I'm worried about potential issue from add_free_nid() can cause
node footer corruption issue, so I want to use f2fs_bug_on() to check
whether there is caused by any bug from MM from now on.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/checkpoint.c | 4 +++-
>>  fs/f2fs/node.c       | 7 +++++--
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index e7907858eb70..3f223bade520 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>>  {
>>  	struct inode_management *im = &sbi->im[type];
>>  	struct ino_entry *e = NULL, *new = NULL;
>> +	int ret;
>>  
>>  	if (type == FLUSH_INO) {
>>  		rcu_read_lock();
>> @@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>>  		new = f2fs_kmem_cache_alloc(ino_entry_slab,
>>  						GFP_NOFS, true, NULL);
>>  
>> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	f2fs_bug_on(sbi, ret);
>>  
>>  	spin_lock(&im->ino_lock);
>>  	e = radix_tree_lookup(&im->ino_root, ino);
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 3f6b8037d25f..88d3032236cb 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>  	struct free_nid *i, *e;
>>  	struct nat_entry *ne;
>> -	int err = -EINVAL;
>> +	int err;
>>  	bool ret = false;
>>  
>>  	/* 0 nid should not be used */
>> @@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>>  	i->nid = nid;
>>  	i->state = FREE_NID;
>>  
>> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	f2fs_bug_on(sbi, err);
>> +
>> +	err = -EINVAL;
>>  
>>  	spin_lock(&nm_i->nid_list_lock);
>>  
>> -- 
>> 2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
