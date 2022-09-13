Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3005B664B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 05:50:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXwwb-0003Ff-OH;
	Tue, 13 Sep 2022 03:50:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oXwwZ-0003FS-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x5WQfvoNNlchQfQxCFg2E8QuDqSgBjJeIcRKf0Ny6jw=; b=I99po2q1TXZoW6BcEPIzEdglPJ
 B2+0MZfGreKGvnukRv41/gp14T+RIgYkFGhldQpJXVswOe2YrUQ6e0hYYqi0E2j3wUOntBYNDelDZ
 D77haefshqpCiwTPYWYtUzZeJTKoNyKIWIRJAkv/52H85irudeXfo2+Lxu4ODdsUKYpU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x5WQfvoNNlchQfQxCFg2E8QuDqSgBjJeIcRKf0Ny6jw=; b=VxjFlXsmnCuX2EvjYmDG2gDuo5
 OkFj6hRasWfgLSh8DATc/4vgG3YQVQ/MQCoko/GeC8nzE8KiKR6kSwetXLMHwUz+5rgZ105Y5zXhw
 EbsciEm6dVoh8TMi8xg/KpA97SU/FoyxCWFiuhfq87hQgP6Bxou1+u5xlRo4qY8ZQKq4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXwwY-0006C0-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:50:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACE42612BC;
 Tue, 13 Sep 2022 03:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5D8C433C1;
 Tue, 13 Sep 2022 03:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663041028;
 bh=HbqhcEaQEOTRdUdMFenH/uXXbcFTdaJPq814UilF8DQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O6QoJ5LvQwy29Luha2xRh/o5ev9VYPmocDj7yXaSB73T4vOZMsU3i9XJx09CLsQVn
 SlxZfmEuHVliIoAqursc/p5Fl8VP4KDJXLOaCXX2Arj+JC0fC9iR5szePS3DngqVu8
 nph+QhVyuBVOCkGZx5tLtif8/dtZJ7diAiT8/Niyr7Kx7wKcH5CVSVwDOUED/0/GuZ
 466aiaeJGNquLxE1h3GPF4f/JPokNw+4F6O4kwUkZwXlGookz7NwSCmRoCwoIsmeb7
 iDPfB2phn2zKHN3JqvRUwICBScMW0Zzkdsp0jiw6qLOnkIlfM5sOj60ORuIxN1ztcp
 4m9+SuGTqbewQ==
Message-ID: <0cf48a6c-79ff-ef04-b630-a76faaca34c6@kernel.org>
Date: Tue, 13 Sep 2022 11:50:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: zhangqilong <zhangqilong3@huawei.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20220913030529.3944-1-zhangqilong3@huawei.com>
 <293a41a4-7c7d-aac8-0bc2-15d47b7bd538@kernel.org>
 <4430326a24364b6aa92332c1393509f4@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <4430326a24364b6aa92332c1393509f4@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/13 11:41, zhangqilong wrote: >> On 2022/9/13 11:05,
 Zhang Qilong wrote: >>> If we do not truncate source page cache, user can
 still see the >>> previous source data after being moved. We fix [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXwwY-0006C0-U7
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0ggLW5leHRdIGYyZnM6IGFk?=
 =?utf-8?q?ding_truncate_page_cache_after_being_moved?=
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/13 11:41, zhangqilong wrote:
>> On 2022/9/13 11:05, Zhang Qilong wrote:
>>> If we do not truncate source page cache, user can still see the
>>> previous source data after being moved. We fix it by adding truncating
>>> after __exchange_data_block.
>>>
>>> Fixes:4dd6f977fc778 ("f2fs: support an ioctl to move a range of data
>>> blocks")
>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>>> ---
>>>    fs/f2fs/file.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
>>> 771f1f7f3690..e3ff648aa496 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -2789,6 +2789,10 @@ static int f2fs_move_file_range(struct file
>> *file_in, loff_t pos_in,
>>>    	}
>>>    	f2fs_unlock_op(sbi);
>>>
>>> +	filemap_invalidate_lock(src->i_mapping);
>>
>> invalidate lock should cover __exchange_data_block()?
>>
>>> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
>>
>> truncate_pagecache_range() should be called before
>> __exchange_data_block()?
> 
> I have tried it, but it do not work. So I move the truncate operation to the back of
> __exchange_data_block that it works well. I don't know much enough, what do you
> think of this issue.

Can you describe details about the testcase?

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>> +	filemap_invalidate_unlock(src->i_mapping);
>>> +
>>>    	if (src != dst)
>>>    		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
>>>    out_src:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
