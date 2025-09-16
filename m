Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903AB58E95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 08:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doqw4lgcSfZBl7IIjSHqsbwApfhRAbEeV7W710Ysasg=; b=OEuKDq2lg/syfaJghEQFiUV+CX
	n+vZqZ7WrUEnr3axZ6yYtSCm8GQG4sgAxsqW/+ChyQKVEX5Rkrxp2ltklzDxs9/8QNaDd6R8zK7rW
	07mTgKcjMPOwynHPWf+8fZpfsPj9jxu9B4D+NGtfIDMsrk2PZ3Vp5iI35eSJCl54RCxc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyPSf-0002qr-5A;
	Tue, 16 Sep 2025 06:46:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uyPSd-0002qj-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 06:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vossqSEMCOWwoL0QHfJZTKuwM9m1G8Y9mJxaDrhVrgA=; b=RkKb8FONfFEpnACIyJK5mZKSij
 c/49GSwQgIyrnkPk9bqCZiVVoXkgPEYGpol4xE7ANZjSS8l8Rej/qXDxzllq0C+GXjCFf+Nw0+sQb
 eYq5X+sWt0+cUuzXiGh0CKoCmKOeN/44qCqvNRHNO1deqnpCHQWr/s0wvxclgyP8LaRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vossqSEMCOWwoL0QHfJZTKuwM9m1G8Y9mJxaDrhVrgA=; b=ck/nFQuMiqOUdgD1dg7bpzEL9r
 o1hVn2jCHyzi0xGsfk27blvizea3+mKuH2P4LUHsd2nZDDXhoL9vAAlPfUq+kuok6lVXKOq0iXwLT
 EPtMU2EL8acu7kZaGYjGYbvM0lCZD4mwnon0GSYxdB/qBCEb2YkfdisqHkRC8qb3zIm8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyPSd-0008Qn-51 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 06:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C4C6944486;
 Tue, 16 Sep 2025 06:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16336C4CEEB;
 Tue, 16 Sep 2025 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758005197;
 bh=UyM89QNHpSkF9EPdMvI0ufnD9cqqHBkKnIr4Bp93Jls=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MnjHAgWHPS7HptB1RfjVSZIclIB093kS0ElAzTzDMc/EYx4FMTRlwipSOo+BDwFDQ
 9JaGDVv5hD3Xyrd17dsEhFpASZYAtK0K0VvpvF08RZSyqlyAZzHGjTp2+Ora+3eeet
 DR02tnIhboy18qriLoMpcwhrEftELgG/jgoArTBlLvU1TuqWfSi+JvqZowNf018mCI
 zjaQGcpSRn/F3d7uFyY4i70NHPVrhiEDs8N45FXWVLepXEWs6fdSalNjng8GClmAtC
 AU8SPUTO4Otx3SR69mbOKJCsS17w9tsQCy4YQQw3YqjGAj3pIk/c8CfNOTrgcCKqO+
 l4cMG1RJk9onA==
Message-ID: <f6b74555-f10c-4a8e-8caa-1797a3d7a7cf@kernel.org>
Date: Tue, 16 Sep 2025 14:46:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <aMjJwkQ3wQ0uNJXX@google.com>
 <20250916052224.223500-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250916052224.223500-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/16/25 13:22, wangzijie wrote: >> On 09/15, wangzijie
 wrote: >>> When we get wrong extent info data, and look up extent_node in
 rb tree, >>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). A [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyPSd-0008Qn-51
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/16/25 13:22, wangzijie wrote:
>> On 09/15, wangzijie wrote:
>>> When we get wrong extent info data, and look up extent_node in rb tree,
>>> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
>>> return NULL.
>>
>> This is the exact buggy case which we should fix the original one. Have
>> you seen this error? In that case, can we consider writing some kernel
>> message and handle the error properly?
> 
> Hi Jaegeuk,
> The original one is the bug I mentioned in the first patch of this patch set
> ("f2fs: fix zero-sized extent for precache extents"). 

Zijie,

Did you suffer this problem in product? right?

> 
> When we use a wrong extent_info(zero-sized) to do update, and there exists a
> extent_node which has same fofs as the wrong one, we will skip "invalidate all extent
> nodes in range [fofs, fofs + len - 1]"(en->ei.fofs = end = tei->fofs + tei->len = tei->fofs),
> which cause the infinite loop in __insert_extent_tree().
> 
> So we can add f2fs_bug_on() when there occurs zero-sized extent
> in f2fs_update_read_extent_cache_range(), and give up this zero-sized
> extent update to handle other unknown buggy cases. Do you think this will be better?
> 
> And do we need to solve this infinite loop?

IMO, it's worth to end such loop if there is any corrupted extent in rbtree to
avoid kernel hang, no matter it is caused by software bug or hardware flaw
potentially.

Thanks,

> 
> 
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>>  fs/f2fs/extent_cache.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>>> index 199c1e7a8..6ed6f3d1d 100644
>>> --- a/fs/f2fs/extent_cache.c
>>> +++ b/fs/f2fs/extent_cache.c
>>> @@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>>>  			leftmost = false;
>>>  		} else {
>>>  			f2fs_bug_on(sbi, 1);
>>> +			return NULL;
>>>  		}
>>>  	}
>>>  
>>> -- 
>>> 2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
