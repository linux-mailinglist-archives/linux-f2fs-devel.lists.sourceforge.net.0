Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D883C679B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 02:47:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m36Zl-0005f1-Oc; Tue, 13 Jul 2021 00:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m36Zl-0005er-0Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 00:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=487+cz+IK7Kyvgi9cjyx11t6K1U/ohVPWl1cAp/rqTA=; b=R8kd/UibWsj0anUwD8E5tOcBIc
 p3j6qpp4LxAsx8r8zx93X1Ti4J0tGMEK5zLALrEPyXsWpRwEifMjiVz4sHc1F1qKGNJVNSkO9khe3
 5jehJqDF/ER91itIaIn84eXgE8319sFprz9BmP5wtqO3ui51+Iy9sjc42LvZJ/UscD2M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=487+cz+IK7Kyvgi9cjyx11t6K1U/ohVPWl1cAp/rqTA=; b=ADlZOS2wU9sSTUllp0uLeaLI3r
 A2dy4pbp4CyjBm+M/Der9thFQMfxExAOqYWQCgWZ1pEpGS3Cn8l7AArPPb2T7QMWXDJq165uAp3oG
 lE7tFEKy7hkMiajpkPksdyoJKMH/b+RsPTqPP2+T6j9xVgE3Ii7XMX8feV/D8bGxIA/I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m36ZX-0000wL-QL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 00:47:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A083C60FDB;
 Tue, 13 Jul 2021 00:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626137201;
 bh=6bUuDtl3T5ukpb4KgsVCNQhFQQRp/NYEnjIyp76CrDI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RTrcqMpIAK3M4VifUJz1XrGglzqn+jXET/gtby1x5QC4eq63YXZ9TE0mp5tNWwarj
 RyQ5mYymQ+98Fd2NTxd1eGDKSWqcMGr7UbnvMI69Oh53mQxqdX/cSFX8ppp2odDBTS
 gNtM1rlndrkx2r81evSvCSIpKT+gvQFVQzkHzhoKEtMSxRo/ECtK28Q5YDW4WPNr3r
 KpEiD3zNzb+8vWD8Soul+U7d7neyrGJtZo0yyX+hDryuYNIcHVnWuzpHe+1mPSGPfN
 VTneLTyAmzJsB74eCwgB0jaeYisDuEK/W6VOmoJmZ5pD4x2xeR1vvq/V99nMQP3Ue9
 LgtqrqDG7bH7Q==
To: Michal Hocko <mhocko@suse.com>
References: <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org> <YONJpQapR7BRnW/J@google.com>
 <YONTRlrJugeVq6Fj@casper.infradead.org>
 <20210706091211.GR3840@techsingularity.net>
 <85bb893b-0dc4-5f57-23ec-3f84814b7072@kernel.org>
 <20210707095706.GT3840@techsingularity.net>
 <fc0de0c2-a3b6-df91-5b90-524768a85d82@kernel.org>
 <YOvm2faBUjKmZI7Q@dhcp22.suse.cz>
From: Chao Yu <chao@kernel.org>
Message-ID: <ce628979-6f1c-0070-9680-841c87745639@kernel.org>
Date: Tue, 13 Jul 2021 08:46:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOvm2faBUjKmZI7Q@dhcp22.suse.cz>
Content-Language: en-US
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m36ZX-0000wL-QL
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize page->private when using
 for our internal use
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Mel Gorman <mgorman@techsingularity.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/12 14:53, Michal Hocko wrote:
> On Sat 10-07-21 16:11:38, Chao Yu wrote:
>> On 2021/7/7 17:57, Mel Gorman wrote:
>>> I think it would work but it would be preferable to find out why the
>>> tail page has an order set in the first place. I've looked over
>>
>> Agreed.
>>
>>> mm/page_alloc.c and mm/compaction.c a few times and did not spot where
>>> set_private_page(page, 0) is missed when it should be covered by
>>> clear_page_guard or del_page_from_free_list :(
>>
>> I didn't enable CONFIG_DEBUG_PAGEALLOC, so we will expect page private
>> should be cleared by del_page_from_free_list(), but I guess it only clears
>> the buddy's private field rather than original page's, so I added below
>> diff and check the dmesg, it looks stall private value in original page
>> will be left commonly... Let me know if I missed something?
> 
> Page private should be cleared when the page is freed to the allocator.
> Have a look at PAGE_FLAGS_CHECK_AT_FREE.

Quoted from Jaegeuk's comments in [1]

"Hmm, I can see it in 4.14 and 5.10 kernel.

The trace is on:

  30875 [ 1065.118750] c3     87  f2fs_migrate_page+0x354/0x45c
  30876 [ 1065.123872] c3     87  move_to_new_page+0x70/0x30c
  30877 [ 1065.128813] c3     87  migrate_pages+0x3a0/0x964
  30878 [ 1065.133583] c3     87  compact_zone+0x608/0xb04
  30879 [ 1065.138257] c3     87  kcompactd+0x378/0x4ec
  30880 [ 1065.142664] c3     87  kthread+0x11c/0x12c
  30881 [ 1065.146897] c3     87  ret_from_fork+0x10/0x18

  It seems compaction_alloc() gets a free page which doesn't reset the fields?"

https://lore.kernel.org/linux-f2fs-devel/YOvm2faBUjKmZI7Q@dhcp22.suse.cz/T/#m98a4a5e777f5b0e7366b367463efafd2133dd681

So problem here we met is: in f2fs_migrate_page(), newpage may has stall .private
value rather than PG_private flag, which may cause f2fs will treat the page with
wrong private status.

> 
>> ---
>>   mm/page_alloc.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index a06bcfe6f786..1e7031ff548e 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1029,6 +1029,7 @@ static inline void __free_one_page(struct page *page,
>>   	unsigned long combined_pfn;
>>   	unsigned int max_order;
>>   	struct page *buddy;
>> +	struct page *orig_page = page;
>>   	bool to_tail;
>>
>>   	max_order = min_t(unsigned int, MAX_ORDER - 1, pageblock_order);
>> @@ -1097,6 +1098,10 @@ static inline void __free_one_page(struct page *page,
>>
>>   done_merging:
>>   	set_buddy_order(page, order);
>> +	if (orig_page != page) {
>> +		if (WARN_ON_ONCE(orig_page->private))
>> +			pr_info("2order:%x, origpage.private:%x", order, orig_page->private);
>> +	}
> 
> Why is this expected? Buddy allocator uses page private to store order.
> Whether we are merging to the freed page or coalesce it to a different

The order was only set in head page, right? Since it looks __free_one_page() tries
to clear page.private for every buddy with del_page_from_free_list().

If that is true, after done_merging label in __free_one_page, if original page is
a tail page, we may missed to clear its page.private field?

Thanks,

> page is not all that important.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
