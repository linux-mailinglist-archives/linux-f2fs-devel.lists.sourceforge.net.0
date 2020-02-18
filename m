Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A5A1636A5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 00:00:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Bqs-0002tf-EZ; Tue, 18 Feb 2020 23:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4Bqr-0002tY-4g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IB7kCRmqWHOCgH5gvEJMi5Ucod9FJFELOexbDWiq5WM=; b=XMIzktPbBiAU2TS7+vgrbHGTHs
 7t96j/oEX2ikwZ0fzpQTmnP6fU3Q6e2GNYL1GQaBWd+FCr4UJW/MC4tthZiP7ZdlLNSKsdgyLVH3o
 FXufJVNE2aki23VTsiW8Lj3Z6IYFqfmIwAeB6FFw8rYJ34Yu56kPkDYDn9Wcw0YVeaVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IB7kCRmqWHOCgH5gvEJMi5Ucod9FJFELOexbDWiq5WM=; b=WF4p6LhXJIYw6GxEcHonry/vQX
 g/6eQCPSwzXq5F8nMWtIj7jEaWZtuZ7N2iwIYA5VEjCMON0nIExzl8fqJhrHQTGl2e+/9KVCCPMV0
 oNjG6ODTPMezkHiBDuZIP4EC53UZaEdTmmMrIVV4NUojKSnymZb/ZH7GtKkq60m/eP2o=;
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Bqp-007lwJ-Ui
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 23:00:25 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4c6c6f0000>; Tue, 18 Feb 2020 14:59:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 15:00:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 15:00:13 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Feb
 2020 23:00:13 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>, <linux-fsdevel@vger.kernel.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-6-willy@infradead.org>
 <7691abe7-d0e9-e091-b158-764fb624c2d7@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <cf7c9f73-ea15-24a5-2b97-388164a581ef@nvidia.com>
Date: Tue, 18 Feb 2020 15:00:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7691abe7-d0e9-e091-b158-764fb624c2d7@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582066800; bh=IB7kCRmqWHOCgH5gvEJMi5Ucod9FJFELOexbDWiq5WM=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=W3IJqlJox7bQX9XTPoXwA3Jm6LhlHKJW+mAhVNPdcUggDXvirw1BsO/uwsxWZ+7uS
 HOOter52f4A4hAaPodlY7f0GW7DAaw2gYdUynWMuU/ILsZ4VQHwSB4sSV1XGIKIA1A
 II9rNVEbC3tSkSbIrmRnLlFSPi3rJAn0dkG/YfARpEmDHSprmsPvxbe3KwU65uSj8y
 C3+FXfpxW4WIejSQ4+P4rtEccN3mioAXj3gOw9uQ19e5wS/+Cgx/Bb4Am7uQzPhoVD
 I7pTDe0JMynA0Ndr5M6yG+B/RUQjl0P9V/TbFUVySKOwDQKwJXGqsxl0tiggBN1WNv
 28HLo+ojFyGyw==
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4Bqp-007lwJ-Ui
Subject: Re: [f2fs-dev] [PATCH v6 04/16] mm: Tweak readahead loop slightly
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
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/18/20 2:57 PM, John Hubbard wrote:
> On 2/17/20 10:45 AM, Matthew Wilcox wrote:
>> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>>
>> Eliminate the page_offset variable which was just confusing;
>> record the start of each consecutive run of pages in the
> 
> 

Darn it, I incorrectly reviewed the N/16 patch, instead of the N/19, for 
this one. I thought I had deleted all those! Let me try again with the
correct patch, sorry!!

thanks,
-- 
John Hubbard
NVIDIA

> OK...presumably for the benefit of a following patch, since it is not 
> actually consumed in this patch.
> 
>> readahead_control, and move the 'kick off a fresh batch' code to
>> the end of the function for easier use in the next patch.
> 
> 
> That last bit was actually done in the previous patch, rather than this
> one, right?
> 
>>
>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> ---
>>  mm/readahead.c | 31 +++++++++++++++++++------------
>>  1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/readahead.c b/mm/readahead.c
>> index 15329309231f..74791b96013f 100644
>> --- a/mm/readahead.c
>> +++ b/mm/readahead.c
>> @@ -154,7 +154,6 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  		unsigned long lookahead_size)
>>  {
>>  	struct inode *inode = mapping->host;
>> -	struct page *page;
>>  	unsigned long end_index;	/* The last page we want to read */
>>  	LIST_HEAD(page_pool);
>>  	int page_idx;
>> @@ -163,6 +162,7 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  	struct readahead_control rac = {
>>  		.mapping = mapping,
>>  		.file = filp,
>> +		._start = offset,
>>  		._nr_pages = 0,
>>  	};
>>  
>> @@ -175,32 +175,39 @@ void __do_page_cache_readahead(struct address_space *mapping,
>>  	 * Preallocate as many pages as we will need.
>>  	 */
>>  	for (page_idx = 0; page_idx < nr_to_read; page_idx++) {
>> -		pgoff_t page_offset = offset + page_idx;
> 
> 
> You know...this ends up incrementing offset each time through the
> loop, so yes, the behavior is the same as when using "offset + page_idx".
> However, now it's a little harder to see that.
> 
> IMHO the page_offset variable is not actually a bad thing, here. I'd rather
> keep it, all other things being equal (and I don't see any other benefits
> here: line count is the same, for example).
> 
> What do you think?
> 
> 
> thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
