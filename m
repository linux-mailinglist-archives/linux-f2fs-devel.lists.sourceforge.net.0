Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD4166E67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 05:19:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4zn4-0002FQ-5l; Fri, 21 Feb 2020 04:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4zn3-0002FJ-6a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CIGWblNjMnlEw9Q0Ky7Ta6pH9+iEVsHlBGm1uvPtL0Q=; b=W7HiqGYHFIXw9wGW10Mt2Dw1tc
 W3gVno06w4pjik5oEZrwnQOwDgAlcDXM4ky7wmXr1PdTXIBqsf4P73+SafVgYDwnd/+2q3kg89Sl4
 xNaoxqN1Eu9SchYC4JnehJM+6yYFk2k6kAnO/SNkCTp3A7gtz4F4JjLf/90tsYC5tThM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CIGWblNjMnlEw9Q0Ky7Ta6pH9+iEVsHlBGm1uvPtL0Q=; b=DnXryGnMd7oYaWeisVRqfzD1mv
 vvADyJuS9678sBejVuUu9ioTrOxpTqymelxvBSRIrdKBsjfJpn1cxPpr2uaLd1ULFQfYDN/JNjMwu
 aeFVSdJIoe65EePQfuQqZQvyK7kPXRbwQX5jnmzU+hOWv/gy+RjoRQ1iAq0woLklUoHA=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4zn0-00CTek-5x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 04:19:49 +0000
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4f5a130002>; Thu, 20 Feb 2020 20:18:27 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Feb 2020 20:19:40 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 20:19:40 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Feb
 2020 04:19:40 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
 <20200219210103.32400-10-willy@infradead.org>
 <5691442b-56c7-7b0d-d91b-275be52abb42@nvidia.com>
 <20200221034304.GC24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7abd9e60-bcc0-7474-4535-51ec9fe3be5b@nvidia.com>
Date: Thu, 20 Feb 2020 20:19:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221034304.GC24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582258708; bh=CIGWblNjMnlEw9Q0Ky7Ta6pH9+iEVsHlBGm1uvPtL0Q=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QAZjj+re8Z5ndHhIjF2VRFDwaG0bhNkGpOaYeLkouTf94ecI4+6g17dWTyJz7DL72
 DctTTxvPN0tXj5OC1WBEfadH1p8SB7eh3lcLcu68j446CCrhtSL4uR0Ltn3Ly1Ig7V
 9MIOKaIVmarYhCtpPLNHIDlI6cqfZH9evydC7gODPs5UoOiEpsjkrPxuEgCRzigRaN
 SKdOa1l/36LLcF3uNxgMwfxno4JatXC+uZhTd8X1u4qKRd8jQXDWHdmWtD/0ORHM/U
 0tqKAMS7F93WqoI7rh3y7hGnfNIA0Tu4RSaZfJORHjEA0JGLSwgia/FzEoVLZSuAOv
 zBHfNLpt7rBpQ==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4zn0-00CTek-5x
Subject: Re: [f2fs-dev] [PATCH v7 09/24] mm: Put readahead pages in cache
 earlier
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/20/20 7:43 PM, Matthew Wilcox wrote:
> On Thu, Feb 20, 2020 at 07:19:58PM -0800, John Hubbard wrote:
>>> +static inline struct page *readahead_page(struct readahead_control *rac)
>>> +{
>>> +	struct page *page;
>>> +
>>> +	BUG_ON(rac->_batch_count > rac->_nr_pages);
>>> +	rac->_nr_pages -= rac->_batch_count;
>>> +	rac->_index += rac->_batch_count;
>>> +	rac->_batch_count = 0;
>>
>>
>> Is it intentional, to set rac->_batch_count twice (here, and below)? The
>> only reason I can see is if a caller needs to use ->_batch_count in the
>> "return NULL" case, which doesn't seem to come up...
> 
> Ah, but it does.  Not in this patch, but the next one ...
> 
> +       if (aops->readahead) {
> +               aops->readahead(rac);
> +               /* Clean up the remaining pages */
> +               while ((page = readahead_page(rac))) {
> +                       unlock_page(page);
> +                       put_page(page);
> +               }
> 
> In the normal case, the ->readahead method will consume all the pages,
> and we need readahead_page() to do nothing if it is called again.
> 
>>> +	if (!rac->_nr_pages)
>>> +		return NULL;
> 
> ... admittedly I could do:
> 
> 	if (!rac->_nr_pages) {
> 		rac->_batch_count = 0;
> 		return NULL;
> 	}
> 
> which might be less confusing.


Yes, that would be a nice bit of polish if you end up doing another revision for other
reasons.


> 
>>> @@ -130,23 +129,23 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
>>>  				readahead_count(rac));
>>>  		/* Clean up the remaining pages */
>>>  		put_pages_list(pages);
>>> -		goto out;
>>> -	}
>>> -
>>> -	for (page_idx = 0; page_idx < readahead_count(rac); page_idx++) {
>>> -		struct page *page = lru_to_page(pages);
>>> -		list_del(&page->lru);
>>> -		if (!add_to_page_cache_lru(page, rac->mapping, page->index,
>>> -				gfp))
>>> +		rac->_index += rac->_nr_pages;
>>> +		rac->_nr_pages = 0;
>>> +	} else {
>>> +		while ((page = readahead_page(rac))) {
>>>  			aops->readpage(rac->file, page);
>>> -		put_page(page);
>>> +			put_page(page);
>>> +		}
>>>  	}
>>>  
>>> -out:
>>>  	blk_finish_plug(&plug);
>>>  
>>>  	BUG_ON(!list_empty(pages));
>>> -	rac->_nr_pages = 0;
>>> +	BUG_ON(readahead_count(rac));
>>> +
>>> +out:
>>> +	/* If we were called due to a conflicting page, skip over it */
>>
>> Tiny documentation nit: What if we were *not* called due to a conflicting page? 
>> (And what is a "conflicting page", in this context, btw?) The next line unconditionally 
>> moves the index ahead, so the "if" part of the comment really confuses me.
> 
> By the end of the series, read_pages() is called in three places:
> 
> 1.              if (page && !xa_is_value(page)) {
>                         read_pages(&rac, &page_pool);
> 
> 2.              } else if (add_to_page_cache_lru(page, mapping, index + i,
>                                         gfp_mask) < 0) {
>                         put_page(page);
>                         read_pages(&rac, &page_pool);
> 
> 3.      read_pages(&rac, &page_pool);
> 
> In the first two cases, there's an existing page in the page cache
> (which conflicts with this readahead operation), and so we need to
> advance index.  In the third case, we're exiting the function, so it
> does no harm to advance index one further.


OK, I see. As you know, I tend toward maybe over-documenting, but what about
adding just a *few* hints to help new readers, like this approximately (maybe
it should be pared down):


diff --git a/mm/readahead.c b/mm/readahead.c
index 9fb5f77dcf69..0dd5b09c376e 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -114,6 +114,10 @@ int read_cache_pages(struct address_space *mapping, struct list_head *pages,
 
 EXPORT_SYMBOL(read_cache_pages);
 
+/*
+ * Read pages into the page cache, OR skip over a page if it is already in the
+ * page cache.
+ */
 static void read_pages(struct readahead_control *rac, struct list_head *pages)
 {
        const struct address_space_operations *aops = rac->mapping->a_ops;
@@ -152,7 +156,11 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages)
        BUG_ON(readahead_count(rac));
 
 out:
-       /* If we were called due to a conflicting page, skip over it */
+       /*
+        * This routine might have been called in order to skip over a page
+        * that is already in the page cache. And for other cases, the index is
+        * ignored by the caller. So just increment unconditionally:
+        */
        rac->_index++;
 }


?

> 
>>> +		} else if (add_to_page_cache_lru(page, mapping, index + i,
>>> +					gfp_mask) < 0) {
>>
>> I still think you'll want to compare against !=0, rather than < 0, here.
> 
> I tend to prefer < 0 when checking for an error value in case the function
> decides to start using positive numbers to mean something.  I don't think
> it's a particularly important preference though (after all, returning 1
> might mean "failed, but for this weird reason rather than an errno").
> 
>>> +			put_page(page);
>>> +			read_pages(&rac, &page_pool);
>>
>> Doing a read_pages() in the error case is because...actually, I'm not sure yet.
>> Why do we do this? Effectively it's a retry?
> 
> Same as the reason we call read_pages() if we found a page in the page
> cache earlier -- we're sending down a set of pages which are consecutive
> in the file's address space, and now we have to skip one.  At least one ;-)
> 

Got it. Finally. :)


thanks,
-- 
John Hubbard
NVIDIA


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
