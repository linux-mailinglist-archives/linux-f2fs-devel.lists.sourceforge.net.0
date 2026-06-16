Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VlZoKLO7MGoAWwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:57:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BA68B939
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="g+UV0/vB";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="gTzmmpk/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=fBXJ9vTU;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=jodbkhOj;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGYI55N8fEs/JiQ0TdeNiQ5PQDxy86ylNbOrxPSi3qM=; b=g+UV0/vBb7MJbwHiBjK65ENp8H
	Ou7ZlHaqKv5Cb5NCUhv4W4kt8/b7PLn9llXVl2JATjEY6x5hWoDMJEpKvOaYIJGe+hJA0nN9rcPCA
	8l+iFTnB0b9pO9s/tTfK3wBjAviRHxaQTQagzQvVoOhM+ywYGSaZVvYeQ8h5yLd8xyg8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZJzp-00051H-6P;
	Tue, 16 Jun 2026 02:57:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZJzn-000518-M6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ZDZZpROillU6DUf3d2dmtLCzqaB21Rf9D/4gTDJIjs=; b=gTzmmpk/JphQbBOQukWl5uYpba
 BUl+HcHVezKeQX4vlekj0otwQuH1ES+uBuTLd/l56NuuCRkgeT94KJK4PskDf+8ZD+Tug7uFpXysD
 CXRomwaCJIplT9M1jJyLLSAlCzhbjQ8hZ3/nGHT8XCjD+Wa9+9H2wPDPdqiNw4xKNBW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ZDZZpROillU6DUf3d2dmtLCzqaB21Rf9D/4gTDJIjs=; b=fBXJ9vTUNegnObwkfpyH/A8WvG
 vNnBlbBN9JwM9eW1fYyv5ZJzjDwFOhd3uTyZ6+N3eXMT+ItCXkxSA2Cg5hCIjGV55/d9qUKUV1vkH
 2Ibizmu5lXCky8cg/Cd/uHGZgk8IfhxrbU4p/o5dSCrnPcCuILZBcfFTrEPhLlVdaB1M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZJzm-000137-26 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:57:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C3A3A6008A;
 Tue, 16 Jun 2026 02:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1176B1F000E9;
 Tue, 16 Jun 2026 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578660;
 bh=/ZDZZpROillU6DUf3d2dmtLCzqaB21Rf9D/4gTDJIjs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=jodbkhOjsc3O8KowEXEYljS8wbPjKC2uhbyOMrVNFpjvA5GLb0fa0zEKUmsHk/k7H
 EB7gMPxsAkKHOPlv0h0EsZKPPfKpaHNNPQ3QKFjWSs9v0FgdmulDHtkU/yjVgFyzs8
 fxnEyQE7YoYwotqEe3qSbIlNzo5rOE/ZfODWo58uFT6aNRdgRmO59Q/oaD+gVxcwLp
 CHH7+U8OLrroKgICFZhbFh/peubM5bdZOuNl81fOdyEDeUIxnjNmAUgrK70wxr+nK4
 kQCrupYvWzAU3hhYKzAggB0r3CMjb95Lz0xHM1sP8A24iPvGemWa7ERDfHSSb6HlCb
 397xpTWt4nhxA==
Message-ID: <a7fdef18-af16-43d2-b6a3-291c4e260f8f@kernel.org>
Date: Tue, 16 Jun 2026 10:57:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260608090939.2190185-1-zhaoyang.huang@unisoc.com>
 <f3948889-4ac3-422b-8dcf-fd3a7c27b304@kernel.org>
 <ajAYaEWFnZwDF1Ty@google.com>
Content-Language: en-US
In-Reply-To: <ajAYaEWFnZwDF1Ty@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 23:21, Jaegeuk Kim wrote: > On 06/12,
 Chao Yu wrote: >> On 6/8/26 17:09,
 zhaoyang.huang wrote: >>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
 >>> >>> This reverts commit 9609dd704725a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZJzm-000137-26
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove non-uptodate folio from
 the page cache in move_data_block"
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
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Zhaoyang Huang <huangzhaoyang@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, steve.kang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:zhaoyang.huang@unisoc.com,m:huangzhaoyang@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:steve.kang@unisoc.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[unisoc.com,gmail.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE2BA68B939

On 6/15/26 23:21, Jaegeuk Kim wrote:
> On 06/12, Chao Yu wrote:
>> On 6/8/26 17:09, zhaoyang.huang wrote:
>>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>>>
>>> This reverts commit 9609dd704725a40cd63d915f2ab6c44248a44598.
>>>
>>> The kernel panics are keeping to be reported especially when the f2fs
>>> partition get almost full. By investigation, we find that the reason is
>>> one f2fs page got freed to buddy without being deleted from LRU and the
>>> root cause is the race happened in [2] which is enrolled by this commit.
>>>
>>> There are 3 race processes in this scenario, please find below for their
>>> main activities.
>>>
>>> The changed code in move_data_block() lets the GC path evict the tail-end
>>> folio from the page cache through folio_end_dropbehind().  Once
>>> folio_unmap_invalidate() removes the folio from mapping->i_pages, the
>>> page-cache references for all pages in the folio are dropped.  The folio
>>> is then kept alive only by temporary external references, which allows a
>>> later split to operate on a folio whose subpages are no longer protected
>>> by page-cache references.
>>>
>>> After the page-cache references are gone, split_folio_to_order() can
>>> split the big folio into individual pages and put the resulting subpages
>>> back on the LRU.  For tail pages beyond EOF, split removes them from the
>>> page cache and drops their page-cache references.  A tail page can then
>>> remain on the LRU with PG_lru set while holding only the split caller's
>>> temporary reference.  When free_folio_and_swap_cache() drops that final
>>> reference, the page enters the final folio_put() release path.
>>>
>>> In parallel, folio_isolate_lru() can observe the same tail page with a
>>> non-zero refcount and PG_lru set.  It clears PG_lru before taking its own
>>> reference.  If this races with the final folio_put() from the split path,
>>> __folio_put() sees PG_lru already cleared and skips lruvec_del_folio().
>>> The page is then freed back to the allocator while its lru links are
>>> still present in the LRU list.  A later LRU operation on a neighboring
>>> page detects the stale link and reports list corruption.
>>>
>>> [1]
>>> [   22.486082] list_del corruption. next->prev should be fffffffec10e0ac8, but was dead000000000122. (next=fffffffec10e0a88)
>>> [   22.486130] ------------[ cut here ]------------
>>> [   22.486134] kernel BUG at lib/list_debug.c:67!
>>> [   22.486141] Internal error: Oops - BUG: 00000000f2000800 [#1]  SMP
>>> [   22.488502] Tainted: [W]=WARN, [O]=OOT_MODULE
>>> [   22.488506] Hardware name: Spreadtrum UMS9230 1H10 SoC (DT)
>>> [   22.488511] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> [   22.488517] pc : __list_del_entry_valid_or_report+0x14c/0x154
>>> [   22.488531] lr : __list_del_entry_valid_or_report+0x14c/0x154
>>> [   22.488539] sp : ffffffc08006b830
>>> [   22.488542] x29: ffffffc08006b868 x28: 0000000000003020 x27: 0000000000000000
>>> [   22.488553] x26: 0000000000000000 x25: 0000000000000004 x24: fffffffec10e0ac0
>>> [   22.488564] x23: 00000000000000e8 x22: 0000000000000024 x21: dead000000000122
>>> [   22.488574] x20: fffffffec10e0a88 x19: fffffffec10e0ac8 x18: ffffffc080061060
>>> [   22.488585] x17: 20747562202c3863 x16: 6130653031636566 x15: 0000000000000058
>>> [   22.488595] x14: 0000000000000004 x13: ffffff80f91e0000 x12: 0000000000000003
>>> [   22.488605] x11: 0000000000000003 x10: 0000000000000001 x9 : ffe85721f0e25f00
>>> [   22.488615] x8 : ffe85721f0e25f00 x7 : 0000000000000000 x6 : 6c65645f7473696c
>>> [   22.488625] x5 : ffffffed39b23026 x4 : 0000000000000000 x3 : 0000000000000010
>>> [   22.488636] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 000000000000006d
>>> [   22.488647] Call trace:
>>> [   22.488651]  __list_del_entry_valid_or_report+0x14c/0x154 (P)
>>> [   22.488661]  __folio_put+0x2bc/0x434
>>> [   22.488670]  folio_put+0x28/0x58
>>> [   22.488678]  do_garbage_collect+0x1a34/0x2584
>>> [   22.488689]  f2fs_gc+0x230/0x9b4
>>> [   22.488697]  f2fs_fallocate+0xb90/0xdf4
>>> [   22.488706]  vfs_fallocate+0x1b4/0x2bc
>>> [   22.488716]  __arm64_sys_fallocate+0x44/0x78
>>> [   22.488725]  invoke_syscall+0x58/0xe4
>>> [   22.488732]  do_el0_svc+0x48/0xdc
>>> [   22.488739]  el0_svc+0x3c/0x98
>>> [   22.488747]  el0t_64_sync_handler+0x20/0x130
>>> [   22.488754]  el0t_64_sync+0x1c4/0x1c8
>>>
>>> [2]
>>> CPU0 (f2fs GC)              CPU1 (split_folio_to_order)          CPU2 (folio_isolate_lru)
>>>
>>> F: pagecache refs = n
>>> F: extra refs = GC + split
>>> F: PG_lru set
>>> move_data_block()
>>> folio = f2fs_grab_cache_folio(F)
>>> ...
>>> __folio_set_dropbehind(F)
>>> folio_unlock(F)
>>> folio_end_dropbehind(F)
>>>    folio_unmap_invalidate(F)
>>>      __filemap_remove_folio(F)
>>>      folio_put_refs(F, n)
>>> folio_put(F)
>>>                              split_folio_to_order(F)
>>>                                folio_ref_freeze(F, 1)
>>>                                ...
>>>                                lru_add_split_folio(T)
>>>                                  list_add_tail(&T->lru, &F->lru)
>>>                                  folio_set_lru(T)
>>>                                __filemap_remove_folio(T)
>>>                                folio_put_refs(T, 1)
>>>                                /* T refcount == 1, PageLRU set */
>>>                                                                    folio_isolate_lru(T)
>>>                                                                      folio_test_clear_lru(T)
>>>                              free_folio_and_swap_cache(T)
>>>                                folio_put(T)
>>>                                  /* refcount: 1 -> 0 */
>>>                                  __folio_put(T)
>>>                                    __page_cache_release(T)
>>>                                      folio_test_lru(T) == false
>>>                                      /* skip lruvec_del_folio(T) */
>>>                                    free_frozen_pages(T)
>>>                                                                    folio_get(T)
>>>                                                                    lruvec_del_folio(T)
>>> later:
>>>    list_del(adjacent->lru)
>>>      next == &T->lru
>>>      next->prev == LIST_POISON / PCP freelist
>>>      BUG
>>>
>>
>> Missing Fixes and Cc: stable lines.
> 
> Applied with them.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>>
>>> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>>
>> I suspect this is a bug of MM, we can revert this first, and reapply after we
>> fix this iusse in MM.
>>
>> Thanks,
>>
>>> ---
>>>   fs/f2fs/gc.c | 6 +-----
>>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index ba93010924c0..3084e05e22f2 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1468,11 +1468,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>>   put_out:
>>>   	f2fs_put_dnode(&dn);
>>>   out:
>>> -	if (!folio_test_uptodate(folio))
>>> -		__folio_set_dropbehind(folio);
>>> -	folio_unlock(folio);
>>> -	folio_end_dropbehind(folio);
>>> -	folio_put(folio);
>>> +	f2fs_folio_put(folio, true);
>>>   	return err;
>>>   }
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
