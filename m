Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54A5003DE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Apr 2022 03:55:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neohg-0004If-Vf; Thu, 14 Apr 2022 01:55:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <wu-yan@tcl.com>) id 1neohf-0004IZ-1L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 01:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0zusG1vEfzV5YjgLTsx6Jc+opTCh0awbGk/ws/sOUs=; b=CtCsd+OOw+zs1CkHOkjOivJGbS
 spN34wBil45jF/NvQSwboT2gK3bsDE09wc0FDMNFV9dc0vI9NGGvsvztszBMJzVkO8zcYkqsM/vUQ
 0k+SekILYDfGmlvwINmlFeI7CjXDdCuMER+XHHD+EcI0ksuaI9wt2CXAQbcapsqvdbeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T0zusG1vEfzV5YjgLTsx6Jc+opTCh0awbGk/ws/sOUs=; b=jLbiUJUeQHyigG7Pc3pYucGxFp
 smmJpstSEmi3WmSA0rdJly+cBj9XIJ1qbT9ncVM30oTWTDh2Gf+gFPRjQEBXtgjHL7E3kd7lCLyhb
 j/JunRhZsVTI6u/dkxWm2+5zz+7B/+uOviZh0JM1I3lDGQ4TabFphaIlwz7GA9Irh9Ow=;
Received: from support.corp-email.com ([222.73.234.235])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neohW-0002Ij-4J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 01:55:21 +0000
Received: from ([114.119.32.142])
 by support.corp-email.com ((D)) with ASMTP (SSL) id IVQ00159;
 Thu, 14 Apr 2022 09:54:59 +0800
Received: from [172.16.35.4] (172.16.35.4) by GCY-MBS-28.TCL.com (10.136.3.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 14 Apr
 2022 09:54:59 +0800
Message-ID: <39c4ded0-09c0-3e38-85cb-5535099b177d@tcl.com>
Date: Thu, 14 Apr 2022 09:54:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <660530eb62e71fb6520d3596704162e5@sslemail.net>
 <YlcBxSA5qYN4z1ia@google.com>
From: Wu Yan <wu-yan@tcl.com>
In-Reply-To: <YlcBxSA5qYN4z1ia@google.com>
X-Originating-IP: [172.16.35.4]
X-ClientProxiedBy: GCY-EXS-21.TCL.com (10.74.128.61) To GCY-MBS-28.TCL.com
 (10.136.3.28)
tUid: 2022414095459fee587205794eb62e0e39d5e16303e5f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 01:00, Jaegeuk Kim wrote: > On 04/13, Rokudo Yan
 wrote: >> There is a potential deadlock in gc thread may happen >> under
 low memory as below: >> >> gc_thread_func >> -f2fs_gc >> -do_garbag [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [222.73.234.235 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [222.73.234.235 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1neohW-0002Ij-4J
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid deadlock in gc thread under low
 memory
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
Cc: tang.ding@tcl.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/14/22 01:00, Jaegeuk Kim wrote:
> On 04/13, Rokudo Yan wrote:
>> There is a potential deadlock in gc thread may happen
>> under low memory as below:
>>
>> gc_thread_func
>>   -f2fs_gc
>>    -do_garbage_collect
>>     -gc_data_segment
>>      -move_data_block
>>       -set_page_writeback(fio.encrypted_page);
>>       -f2fs_submit_page_write
>> as f2fs_submit_page_write try to do io merge when possible, so the
>> encrypted_page is marked PG_writeback but may not submit to block
>> layer immediately, if system enter low memory when gc thread try
>> to move next data block, it may do direct reclaim and enter fs layer
>> as below:
>>     -move_data_block
>>      -f2fs_grab_cache_page(index=?, for_write=false)
>>       -grab_cache_page
>>        -find_or_create_page
>>         -pagecache_get_page
>>          -__page_cache_alloc --  __GFP_FS is set
>>           -alloc_pages_node
>>            -__alloc_pages
>>             -__alloc_pages_slowpath
>>              -__alloc_pages_direct_reclaim
>>               -__perform_reclaim
>>                -try_to_free_pages
>>                 -do_try_to_free_pages
>>                  -shrink_zones
>>                   -mem_cgroup_soft_limit_reclaim
>>                    -mem_cgroup_soft_reclaim
>>                     -mem_cgroup_shrink_node
>>                      -shrink_node_memcg
>>                       -shrink_list
>>                        -shrink_inactive_list
>>                         -shrink_page_list
>>                          -wait_on_page_writeback -- the page is marked
>>                         writeback during previous move_data_block call
>>
>> the gc thread wait for the encrypted_page writeback complete,
>> but as gc thread held sbi->gc_lock, the writeback & sync thread
>> may blocked waiting for sbi->gc_lock, so the bio contain the
>> encrypted_page may nerver submit to block layer and complete the
>> writeback, which cause deadlock. To avoid this deadlock condition,
>> we mark the gc thread with PF_MEMALLOC_NOFS flag, then it will nerver
>> enter fs layer when try to alloc cache page during move_data_block.
>>
>> Signed-off-by: Rokudo Yan <wu-yan@tcl.com>
>> ---
>>   fs/f2fs/gc.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index e020804f7b07..cc71f77b98c8 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -38,6 +38,12 @@ static int gc_thread_func(void *data)
>>   
>>   	wait_ms = gc_th->min_sleep_time;
>>   
>> +	/*
>> +	 * Make sure that no allocations from gc thread will ever
>> +	 * recurse to the fs layer to avoid deadlock as it will
>> +	 * hold sbi->gc_lock during garbage collection
>> +	 */
>> +	memalloc_nofs_save();
> 
> I think this cannot cover all the f2fs_gc() call cases. Can we just avoid by:
> 
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1233,7 +1233,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>                                  CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
> 
>          /* do not read out */
> -       page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> +       page = f2fs_grab_cache_page(inode->i_mapping, bidx, true);
>          if (!page)
>                  return -ENOMEM;
> 
> Thanks,
> 
>>   	set_freezable();
>>   	do {
>>   		bool sync_mode, foreground = false;
>> -- 
>> 2.25.1

Hi, Jaegeuk

I'm not sure if any other case may trigger the issue, but the stack 
traces I have caught so far are all the same as below:

f2fs_gc-253:12  D 226966.808196 572 302561 150976 0x1200840 0x0 572 
237207473347056
<ffffff889d88668c> __switch_to+0x134/0x150
<ffffff889e764b6c> __schedule+0xd5c/0x1100
<ffffff889e76554c> io_schedule+0x90/0xc0
<ffffff889d9fb880> wait_on_page_bit+0x194/0x208
<ffffff889da167b4> shrink_page_list+0x62c/0xe74
<ffffff889da1d354> shrink_inactive_list+0x2c0/0x698
<ffffff889da181f4> shrink_node_memcg+0x3dc/0x97c
<ffffff889da17d44> mem_cgroup_shrink_node+0x144/0x218
<ffffff889da6610c> mem_cgroup_soft_limit_reclaim+0x188/0x47c
<ffffff889da17a40> do_try_to_free_pages+0x204/0x3a0
<ffffff889da176c8> try_to_free_pages+0x35c/0x4d0
<ffffff889da05d60> __alloc_pages_nodemask+0x7a4/0x10d0
<ffffff889d9fc82c> pagecache_get_page+0x184/0x2ec
<ffffff889dbf8860> do_garbage_collect+0xfe0/0x2828
<ffffff889dbf7434> f2fs_gc+0x4a0/0x8ec
<ffffff889dbf6bf4> gc_thread_func+0x240/0x4d4
<ffffff889d8de9b0> kthread+0x17c/0x18c
<ffffff889d88567c> ret_from_fork+0x10/0x18

Thanks
yanwu


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
