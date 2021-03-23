Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07D3457EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Mar 2021 07:44:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOalq-0003Uc-HU; Tue, 23 Mar 2021 06:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lOalp-0003UW-Pq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 06:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7nu1K4MT3wGXLy7DZ43MSBFKzg1KQj/b4Hr69+9iSMM=; b=ZbjXQ0vcZP8TgjMWKMbNrfSul4
 RmFJi8ZDHUInRhIRBAoyzbN/N28ah4oownOlzCxzQPZJW8yvt7mhV5wiecu1vJmMZAyCIjz36uJ+R
 00sgrah/fpndEdSmqf0zCJGqyW5OhHU5L9NzcqTxbMEYsEEmwn7mVF7mqUth13OXn6Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7nu1K4MT3wGXLy7DZ43MSBFKzg1KQj/b4Hr69+9iSMM=; b=TvS6inO8r1LSEb2dOCfHVEpeCc
 qyJqrzs5JKJ6G1TnH0i1SoNHz2sRGUvcOOjbtfdz5JKWOmsV8HYk9ZQ8HUclugpoQ5j4HNiislQPA
 gEOAISE9GBh3z2QulILdqRhl5hV02i6ETTmjlTGUJBHettZAjD/CZVwmFKUwn8hzptAA=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOala-00HXd4-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Mar 2021 06:44:05 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F4MFs022sznV7F;
 Tue, 23 Mar 2021 14:41:05 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 23 Mar
 2021 14:43:29 +0800
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
References: <20210322114730.71103-1-yuchao0@huawei.com>
 <CAFcO6XMak8GSRqQbZ3nPdGvV_eM6DL0+P0z1X2y0G9hkrccaCg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <beff8953-d91a-c677-f50a-3aba27c15dde@huawei.com>
Date: Tue, 23 Mar 2021 14:43:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFcO6XMak8GSRqQbZ3nPdGvV_eM6DL0+P0z1X2y0G9hkrccaCg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lOala-00HXd4-Qv
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-bounds memory
 access
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
Cc: jaegeuk@kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi butt3rflyh4ck,

On 2021/3/23 13:48, butt3rflyh4ck wrote:
> Hi, I have tested the patch on 5.12.0-rc4+, it seems to fix the problem.

Thanks for helping to test this patch.

Thanks,

> 
> Regards,
>   butt3rflyh4ck.
> 
> 
> On Mon, Mar 22, 2021 at 7:47 PM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> butt3rflyh4ck <butterflyhuangxx@gmail.com> reported a bug found by
>> syzkaller fuzzer with custom modifications in 5.12.0-rc3+ [1]:
>>
>>   dump_stack+0xfa/0x151 lib/dump_stack.c:120
>>   print_address_description.constprop.0.cold+0x82/0x32c mm/kasan/report.c:232
>>   __kasan_report mm/kasan/report.c:399 [inline]
>>   kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
>>   f2fs_test_bit fs/f2fs/f2fs.h:2572 [inline]
>>   current_nat_addr fs/f2fs/node.h:213 [inline]
>>   get_next_nat_page fs/f2fs/node.c:123 [inline]
>>   __flush_nat_entry_set fs/f2fs/node.c:2888 [inline]
>>   f2fs_flush_nat_entries+0x258e/0x2960 fs/f2fs/node.c:2991
>>   f2fs_write_checkpoint+0x1372/0x6a70 fs/f2fs/checkpoint.c:1640
>>   f2fs_issue_checkpoint+0x149/0x410 fs/f2fs/checkpoint.c:1807
>>   f2fs_sync_fs+0x20f/0x420 fs/f2fs/super.c:1454
>>   __sync_filesystem fs/sync.c:39 [inline]
>>   sync_filesystem fs/sync.c:67 [inline]
>>   sync_filesystem+0x1b5/0x260 fs/sync.c:48
>>   generic_shutdown_super+0x70/0x370 fs/super.c:448
>>   kill_block_super+0x97/0xf0 fs/super.c:1394
>>
>> The root cause is, if nat entry in checkpoint journal area is corrupted,
>> e.g. nid of journalled nat entry exceeds max nid value, during checkpoint,
>> once it tries to flush nat journal to NAT area, get_next_nat_page() may
>> access out-of-bounds memory on nat_bitmap due to it uses wrong nid value
>> as bitmap offset.
>>
>> [1] https://lore.kernel.org/lkml/CAFcO6XOMWdr8pObek6eN6-fs58KG9doRFadgJj-FnF-1x43s2g@mail.gmail.com/T/#u
>>
>> Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/node.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index caf43970510e..8311b2367c7c 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2790,6 +2790,9 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>                  struct f2fs_nat_entry raw_ne;
>>                  nid_t nid = le32_to_cpu(nid_in_journal(journal, i));
>>
>> +               if (f2fs_check_nid_range(sbi, nid))
>> +                       continue;
>> +
>>                  raw_ne = nat_in_journal(journal, i);
>>
>>                  ne = __lookup_nat_cache(nm_i, nid);
>> --
>> 2.29.2
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
