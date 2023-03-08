Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C20E16AFC6A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Mar 2023 02:31:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pZieQ-0001QO-7Z;
	Wed, 08 Mar 2023 01:31:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pZieN-0001QI-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 01:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uw8w5vZO8NRkDcMsgwTnWgz3zbfmTClk2lSHJkkLhDw=; b=Rc66+QOpYILJRKuMOwhd71M8EI
 NysNJHV4+XqxfMs6Xn4pyo4Adr7/3pHrVHSEajKEPE8b/+t0HaQ/yc6917RX6q+PfAvfWHznxFaa1
 S3S9iMDHLAkxYQJYwlzuitdRCBKKXhii/VG77XGEXDZDuWb/WZO6qYh4/rQ4mDQFKOcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uw8w5vZO8NRkDcMsgwTnWgz3zbfmTClk2lSHJkkLhDw=; b=OGTbHIR8ezT2KmdeWRbA3bJwJu
 rNU1si8yBX741PR8OVYr7nlNJLDtceDtrMjwDqc7Eafl4/s4Fkua3CHRHAtxR0ZNbbMxv8woRJw3m
 p5KlWwSbA+lPm/FLtZY/aohGnr4GnIc45uy0agG0x44YMFHnn8qM4LKt1TQuBjLprXJg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pZieL-000IlU-2i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Mar 2023 01:31:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F410615FA;
 Wed,  8 Mar 2023 01:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BD5C433EF;
 Wed,  8 Mar 2023 01:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678239078;
 bh=I10H3LCRynxbID+LAh2eXQNF43+fQKoY+xvwLhKFR5c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jCpFjJZtSzM3h3ToioEEQGRsNEC4NWiKXflrV6Y49nzZzn8WGmoxZ//hXVssshpz2
 9iCXUnVA8TPWU77K5VIGmZGbnllwlc0m2BeppetfkmyHWzV5s9zv5Dv/YEG7Mpq+Lw
 JbT7xO+J2Z0z2toKR+/NHy9UYV9D1xRIs+DFLDAleXAaBn48cmRIYlsomH4yAPC00Z
 voc5n3dNe3Ac2ndx2TW++F+PYyTBrx0rw+CUOOTlz6uNGvUNFm0YFkSmn9cYRQS6l3
 gXtkjdgHPS+9TBCu//G5e8TsVDbslJKFuuVTginj+y9SEnUnEiGLOtICNWiHTqA4v8
 HmviJLVjWhCgw==
Message-ID: <db33ea53-c4e9-42f5-3101-88f806263f76@kernel.org>
Date: Wed, 8 Mar 2023 09:31:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230307151408.58490-1-chao@kernel.org>
 <ZAdzwt+DZ0emPd30@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZAdzwt+DZ0emPd30@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/8 1:26, Jaegeuk Kim wrote: > Cc'ed stable. Thanks.
 Oh, thanks for adding the missed tag! Jaegeuk. Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pZieL-000IlU-2i
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix unaligned field offset in 32-bits
 platform
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
Cc: Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/8 1:26, Jaegeuk Kim wrote:
> Cc'ed stable. Thanks.

Oh, thanks for adding the missed tag! Jaegeuk.

Thanks,

> 
> On 03/07, Chao Yu wrote:
>> F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
>> ------------[ cut here ]------------
>> kernel BUG at fs/f2fs/gc.c:602!
>> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>> PC is at get_victim_by_default+0x13c0/0x1498
>> LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
>> ....
>> [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
>> [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
>> [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
>> [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>>
>> The reason is there is __packed attribute in struct rb_entry, but there
>> is no __packed attribute in struct victim_entry, so wrong offset of key
>> field will be parsed in struct rb_entry in f2fs_check_rb_tree_consistence,
>> it describes memory layouts of struct rb_entry and struct victim_entry in
>> 32-bits platform as below:
>>
>> struct rb_entry {
>>     [0] struct rb_node rb_node;
>>         union {
>>             struct {...};
>>    [12]     unsigned long long key;
>>         } __packed;
>> }
>> size of struct rb_entry: 20
>>
>> struct victim_entry {
>>     [0] struct rb_node rb_node;
>>         union {
>>             struct {...};
>>    [16]     struct victim_info vi;
>>         };
>>    [32] struct list_head list;
>> }
>> size of struct victim_entry: 40
>>
>> This patch tries to add __packed attribute in below structure:
>> - discard_info, discard_cmd
>> - extent_info, extent_node
>> - victim_info, victim_entry
>> in order to fix this unaligned field offset issue in 32-bits platform.
>>
>> Fixes: 004b68621897 ("f2fs: use rb-tree to track pending discard commands")
>> Fixes: 13054c548a1c ("f2fs: introduce infra macro and data structure of rb-tree extent cache")
>> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h | 6 +++---
>>   fs/f2fs/gc.h   | 4 ++--
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index b0ab2062038a..17fa7572ceed 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -349,7 +349,7 @@ struct discard_info {
>>   	block_t lstart;			/* logical start address */
>>   	block_t len;			/* length */
>>   	block_t start;			/* actual start address in dev */
>> -};
>> +} __packed;
>>   
>>   struct discard_cmd {
>>   	struct rb_node rb_node;		/* rb node located in rb-tree */
>> @@ -361,7 +361,7 @@ struct discard_cmd {
>>   		};
>>   		struct discard_info di;	/* discard info */
>>   
>> -	};
>> +	} __packed;
>>   	struct list_head list;		/* command list */
>>   	struct completion wait;		/* compleation */
>>   	struct block_device *bdev;	/* bdev */
>> @@ -660,7 +660,7 @@ struct extent_info {
>>   			unsigned long long last_blocks;
>>   		};
>>   	};
>> -};
>> +} __packed;
>>   
>>   struct extent_node {
>>   	struct rb_node rb_node;		/* rb node located in rb-tree */
>> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
>> index 15bd1d680f67..304937d9a084 100644
>> --- a/fs/f2fs/gc.h
>> +++ b/fs/f2fs/gc.h
>> @@ -58,7 +58,7 @@ struct gc_inode_list {
>>   struct victim_info {
>>   	unsigned long long mtime;	/* mtime of section */
>>   	unsigned int segno;		/* section No. */
>> -};
>> +} __packed;
>>   
>>   struct victim_entry {
>>   	struct rb_node rb_node;		/* rb node located in rb-tree */
>> @@ -68,7 +68,7 @@ struct victim_entry {
>>   			unsigned int segno;		/* segment No. */
>>   		};
>>   		struct victim_info vi;	/* victim info */
>> -	};
>> +	} __packed;
>>   	struct list_head list;
>>   };
>>   
>> -- 
>> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
