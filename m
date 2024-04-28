Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C726E8B4957
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 05:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s0v33-0007KK-J2;
	Sun, 28 Apr 2024 03:17:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s0v31-0007KB-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 03:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqRP7ge6tWlHIT3uS8hf73NpEdKtcHLWFvZPaVxJ4pA=; b=nBQkGHhNvy9t6nXUQw8iWbhalj
 xnc0L2doBttuIkLseLe2iB74V2ngGauA0yl+7AocfVGYNHwYWw8uyk1PhmS9v7qy2lNM+1hUspvVM
 gKk7PPfwT60Ldn0wo/m0IzhlQ9Q28NxX2nWoAHJIcVW/wH0yaPokO6NkGJNFAHkuE590=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IqRP7ge6tWlHIT3uS8hf73NpEdKtcHLWFvZPaVxJ4pA=; b=EUwQGctJV7AnkgD0gi4f5+3hpA
 23jGPjLiFu/2xQgCzCdGJLPjFPGGpt3FTcEVvan9ou23KBISzTsi7BVHFjYpxbJqEo0W5rnGMb2fA
 qFfWcVQCSJyylkDXr9r70W+ZNAnbbSbPIzahnVRflr1kVIiTXfGi08oV/rToCg4dRmvQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s0v31-0006tc-7W for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 03:17:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3684D60349;
 Sun, 28 Apr 2024 03:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53A4C4AF17;
 Sun, 28 Apr 2024 03:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714274265;
 bh=Stf6RD+wk0dcrnB98wXmtvpPzh3y/7iTC6dGDf6CG6E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eSE1W0uggxKHMhGrafLiJ1MoFp6jqU0EtHhmTgaE7FD4rgDGhvXvwpgtHYv7X7tv9
 IUyXlgs2qZyH77BpEWVg91SzUXwOMH+0G6jiV5pKwep68UypOG9Y6DaiiKLz6Mkczc
 kma9smBLp1ZgQZvjYGPIXrgitC0pyJTSmmtX+w8nYqWqXEF9r8q8iTzLjvTlhwNUAQ
 3avnbxMudfJ/zwx0/ZETQql4MRxSBH0e9dBBPqGsHAXBLDeBw6UUwMm0qJOCmWdveF
 nIsER7Q+8JoeGWomOi6vvyBFi69Rk0dKnLglCYpQe70Ux/uu/E9KY2+EUcikN9uZuI
 semwXapexl8aA==
Message-ID: <e635105f-829d-457d-a2ff-4672ec7a42fe@kernel.org>
Date: Sun, 28 Apr 2024 11:17:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, Kairui Song <kasong@tencent.com>
References: <20240423170339.54131-1-ryncsn@gmail.com>
 <20240423170339.54131-4-ryncsn@gmail.com>
 <Zig9JCrhky9JieRS@casper.infradead.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zig9JCrhky9JieRS@casper.infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/24 6:58, Matthew Wilcox wrote: > On Wed, Apr 24,
 2024 at 01:03:34AM +0800, Kairui Song wrote: >> @@ -4086,8 +4086,7 @@ void
 f2fs_clear_page_cache_dirty_tag(struct page *page) >> unsigned lon [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s0v31-0006tc-7W
Subject: Re: [f2fs-dev] [PATCH v2 3/8] f2fs: drop usage of page_index
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, Chris Li <chrisl@kernel.org>,
 Neil Brown <neilb@suse.de>, Minchan Kim <minchan@kernel.org>,
 Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Yosry Ahmed <yosryahmed@google.com>,
 linux-mm@kvack.org, Barry Song <v-songbaohua@oppo.com>, "Huang,
 Ying" <ying.huang@intel.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/24 6:58, Matthew Wilcox wrote:
> On Wed, Apr 24, 2024 at 01:03:34AM +0800, Kairui Song wrote:
>> @@ -4086,8 +4086,7 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
>>   	unsigned long flags;
>>   
>>   	xa_lock_irqsave(&mapping->i_pages, flags);
>> -	__xa_clear_mark(&mapping->i_pages, page_index(page),
>> -						PAGECACHE_TAG_DIRTY);
>> +	__xa_clear_mark(&mapping->i_pages, page->index, PAGECACHE_TAG_DIRTY);
>>   	xa_unlock_irqrestore(&mapping->i_pages, flags);
>>   }
> 
> I just sent a patch which is going to conflict with this:
> 
> https://lore.kernel.org/linux-mm/20240423225552.4113447-3-willy@infradead.org/
> 
> Chao Yu, Jaegeuk Kim; what are your plans for converting f2fs to use

Hi Matthew,

I've converted .read_folio and .readahead of f2fs to use folio w/ below patchset,
and let me take a look how to support and enable large folio...

https://lore.kernel.org/linux-f2fs-devel/20240422062417.2421616-1-chao@kernel.org/

Thanks,

> folios?  This is getting quite urgent.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
