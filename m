Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0147196C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 10:15:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwKwx-0006Hd-0h; Sun, 12 Dec 2021 09:15:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mwKwu-0006HX-HP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HgAiB9G9sqR7Ltc7ikhydbkv5MWf6UASHljtuglqmZo=; b=KNMP8TsjHaXdKLGTpkwtQo1f1A
 mpxnYwi8TpbdCJfljJ31RfGaE8zukOC50SnusR49fL/4Yp29A07xUHxRHokJcerlBvvfpixJZ3IAG
 7vdqjjzFYcNCi+uQVAq3nzN35T4zSafvipz+FJR0u/U6vv/2jI//1eruSfIIRELmxqno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HgAiB9G9sqR7Ltc7ikhydbkv5MWf6UASHljtuglqmZo=; b=U/t+zSCV+05qbYAvHlfORTqBpx
 Ov0B2frkF/1fOaiSHMWoAiJebBmBL7MicpDJ/kaWswzPHhs86NhPDDSNVyCk4mJHl+aK8peWHN8eP
 GyDkomHYzOM3LycsX1LyJEtmDU1j4hA9ZZM4FQtgfbmjCBlyxCu1FA3LsR7QoSVPNTV8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwKwp-0003of-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 09:15:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75A2DB80B90;
 Sun, 12 Dec 2021 09:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7660C341C6;
 Sun, 12 Dec 2021 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639300504;
 bh=vLxxgiN0imWkT8KfiHgu08g5fJXl0/viq5uHLPUJ5SM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QFlQM4qMyz1cklOPUeW6tPx2tCzGaG/5zH6dwDEWR1a3ZnitKeiHEdoPR/k3GdIx9
 xtJi28g109rkIDdCZDJGr4mmqgu+wjV5D9GBplCyehOPPQSys8pYWZNj5R+MKzk8/2
 rhzvoIbjz4BO4NdtudZ+ImeZZiEPInspxOaP8sfxdH1oJl63oOBOpKiaTVpXovCbvz
 iRb1Gr+1k+Ijdx+ayKvQIbaIaB056wQDuOl2LmsXn3zGNRKJ0hUtQKrJ55uoaN4LTM
 QrN7Axv7z9NnW7VojO2VCZprEh/n4//KuVXdT8GwCtZtFIgsi38pRYWPw8N4+hWUHS
 hMUCc4bV9qcHA==
Message-ID: <51598d4d-0136-4a41-6b06-fbd7221ffd0e@kernel.org>
Date: Sun, 12 Dec 2021 17:15:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Matthew Wilcox <willy@infradead.org>
References: <0000000000005f297e05d24f05f6@google.com>
 <20211206175631.5d0c3caefa96f0479f0fc2e8@linux-foundation.org>
 <Ya7jYRDwQqftGLtW@casper.infradead.org> <Ya/Ueh7MWyvV2zdg@google.com>
 <Ya/ZaxznaTmrIvdO@casper.infradead.org> <Ya/bviwnMPsSnOcy@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Ya/bviwnMPsSnOcy@google.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/8 6:10, Jaegeuk Kim wrote: > On 12/07, Matthew
 Wilcox wrote: >> On Tue, Dec 07, 2021 at 01:39:06PM -0800, Jaegeuk Kim wrote:
 >>> On 12/07, Matthew Wilcox wrote: >>>>>> Call Trace: >>>>>> <T [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwKwp-0003of-Qg
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in folio_mark_dirty
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
Cc: syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/8 6:10, Jaegeuk Kim wrote:
> On 12/07, Matthew Wilcox wrote:
>> On Tue, Dec 07, 2021 at 01:39:06PM -0800, Jaegeuk Kim wrote:
>>> On 12/07, Matthew Wilcox wrote:
>>>>>> Call Trace:
>>>>>>   <TASK>
>>>>>>   folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639
>>>>
>>>>          if (likely(mapping)) {
>>>> ...
>>>>                  if (folio_test_reclaim(folio))
>>>>                          folio_clear_reclaim(folio);
>>>>                  return mapping->a_ops->set_page_dirty(&folio->page);
>>>>
>>>> how do we get to a NULL ->set_page_dirty for a metadata page's
>>>> mapping->a_ops?  This is definitely an f2fs expert question.
>>>
>>> I can't find anything in f2fs, since that page was got by f2fs_grab_meta_page
>>> along with grab_cache_page() that we never unlocked it.
>>>
>>>    40 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
>>>    41 {
>>>    42         struct address_space *mapping = META_MAPPING(sbi);
>>>    43         struct page *page;
>>>    44 repeat:
>>>    45         page = f2fs_grab_cache_page(mapping, index, false);
>>>
>>>                      -> grab_cache_page(mapping, index);
>>>
>>>    46         if (!page) {
>>>    47                 cond_resched();
>>>    48                 goto repeat;
>>>    49         }
>>>    50         f2fs_wait_on_page_writeback(page, META, true, true);
>>>    51         if (!PageUptodate(page))
>>>    52                 SetPageUptodate(page);
>>>    53         return page;
>>>    54 }
>>>
>>>
>>> Suspecting something in folio wrt folio_mapping()?
>>>
>>>   81 bool set_page_dirty(struct page *page)
>>>   82 {
>>>   83         return folio_mark_dirty(page_folio(page));
>>>   84 }
>>
>> ... huh?  How could folio_mapping() be getting this wrong?
> 
> Dunno.
> 
>> page_folio() does the same thing as compound_head() -- as far as I know
>> you don't use compound pages for f2fs metadata, so this basically just
>> casts the page to a struct folio.
>>
>> folio_mapping() is just like the old page_mapping() (see commit
>> 2f52578f9c64).  Unless you've done something like set the swapcache
>> bit on your metadata page, it's just going to return folio->mapping
>> (ie the same as page->mapping).
> 
> Hmm, I've never seen this call stack before, so simply started to suspect
> folio.

I'm afraid this is a f2fs bug... :(

folio wasn't merged at the first report time (5.14-rc2).

https://syzkaller.appspot.com/bug?extid=07ff38c9c93ca170de07

I doubt the direct reason of panic may be the same as the one of bug
reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=215231

However, I still can't figure out why meta_inode's a_ops will change
to f2fs_meta_aops.

Thanks,

> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
