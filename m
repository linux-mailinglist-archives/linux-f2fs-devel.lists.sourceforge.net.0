Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D40A95114A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 02:59:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se2Lq-00016L-8I;
	Wed, 14 Aug 2024 00:58:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1se2Lo-00016F-Kl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VVqP4QqcIKpqwSFGAWIFK+oKPMtwbNb4VuxFCNmwmOM=; b=HfTSnoOpCHAM6h5UsgZCC3qwa6
 FxM5RHOfRj3sXwNjLDyKNPSdnmO+kGu7a0BtqgYzlHM0hOzDb5HKor0uT++Trjr4QQe53KG6lEhQj
 PCS7VS284BpJJ+IDsqPfaf9oExCutjKibJqgLzm4v0xCxUO/tBFRANeMpFv9c8+Y7Aas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VVqP4QqcIKpqwSFGAWIFK+oKPMtwbNb4VuxFCNmwmOM=; b=Lfd/JcyHUaUpZpvjapLHYnXzRW
 eCed2X0NMG/2HSg1Ukb0h+eClqgJYYRvvBc9kFgrJwcguZ+fpMuUKCBpcuRb6Ehc3Fj9X3QOQL8aH
 JrIQlEnPAIf1fnXoopAo2xy8wTqgUuKYuytdJTXvbSrOcv5RgROEXLPImT7iU5+k21lc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se2Ln-0007zr-T2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 00:58:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89D25617B9;
 Wed, 14 Aug 2024 00:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11257C32782;
 Wed, 14 Aug 2024 00:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723597125;
 bh=KDEpbRprnacmNiAaCY2Q/eGuX74con43zqyU2XmoaqU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nGRdqHEPP2gIRpXuDo02vpuXhEjZdSpSa3Gultwoz00NcSZeFELzt0wh/m75W/FE6
 fRaQczG38xhHK93SlvbIHx+sQOWYUEEB4LxDpfw2gK1yAc1H1HHSjTKzYQr6p9VOlX
 1QrV+9LLaoPImpEZ2HkvMPoOK4Pcj1W4VDx50ETusUcj8OIFTzvMSIRognjPA3nZ+x
 2mZqvsyBV5yGkJcMG1Cm5irS/prjjnbBkt+GTmgTD5AsJ1zFQpnXNZUoNujISh75uc
 a8g9c89Zj02DCnmX4+8n2B5XAi9X2O83HJ35Lefp1gON07G500loE99QJl4qqMsyy2
 +cPkY0dKo2TVA==
Message-ID: <b94a0805-0c20-4309-98f6-85a4e0b5a7f2@kernel.org>
Date: Wed, 14 Aug 2024 08:58:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
 <ZrvdD6EVJAik1b5w@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZrvdD6EVJAik1b5w@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/14 6:24, Jaegeuk Kim wrote: > Could you please test
 this series? I hit kernel hang along with refcount warning Oops, I've did
 fstest before sending this patchset, however I missed to cover w/ compression
 testcase..., so, too rush to push the patchset, sorry. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1se2Ln-0007zr-T2
Subject: Re: [f2fs-dev] [PATCH 1/9] f2fs: convert
 f2fs_compress_ctx_add_page() to use folio
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/14 6:24, Jaegeuk Kim wrote:
> Could you please test this series? I hit kernel hang along with refcount warning

Oops, I've did fstest before sending this patchset, however I missed to
cover w/ compression testcase..., so, too rush to push the patchset, sorry.

Will check and fix it soon.

Thanks,

> in f2fs_put_dic, when running fsstress. You can reproduce it quickly.
> 
> On 08/13, Chao Yu wrote:
>> onvert to use folio, so that we can get rid of 'page->index' to
>> prepare for removal of 'index' field in structure page [1].
>>
>> [1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
>>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/compress.c | 14 +++++++-------
>>   fs/f2fs/data.c     |  4 ++--
>>   fs/f2fs/f2fs.h     |  2 +-
>>   3 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 990b93689b46..eb5cd1457ffc 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -160,17 +160,17 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>>   		cc->cluster_idx = NULL_CLUSTER;
>>   }
>>   
>> -void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
>> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio)
>>   {
>>   	unsigned int cluster_ofs;
>>   
>> -	if (!f2fs_cluster_can_merge_page(cc, page->index))
>> +	if (!f2fs_cluster_can_merge_page(cc, folio->index))
>>   		f2fs_bug_on(F2FS_I_SB(cc->inode), 1);
>>   
>> -	cluster_ofs = offset_in_cluster(cc, page->index);
>> -	cc->rpages[cluster_ofs] = page;
>> +	cluster_ofs = offset_in_cluster(cc, folio->index);
>> +	cc->rpages[cluster_ofs] = folio_page(folio, 0);
>>   	cc->nr_rpages++;
>> -	cc->cluster_idx = cluster_idx(cc, page->index);
>> +	cc->cluster_idx = cluster_idx(cc, folio->index);
>>   }
>>   
>>   #ifdef CONFIG_F2FS_FS_LZO
>> @@ -1093,7 +1093,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   		if (PageUptodate(page))
>>   			f2fs_put_page(page, 1);
>>   		else
>> -			f2fs_compress_ctx_add_page(cc, page);
>> +			f2fs_compress_ctx_add_page(cc, page_folio(page));
>>   	}
>>   
>>   	if (!f2fs_cluster_is_empty(cc)) {
>> @@ -1123,7 +1123,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>   		}
>>   
>>   		f2fs_wait_on_page_writeback(page, DATA, true, true);
>> -		f2fs_compress_ctx_add_page(cc, page);
>> +		f2fs_compress_ctx_add_page(cc, page_folio(page));
>>   
>>   		if (!PageUptodate(page)) {
>>   release_and_retry:
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index e9570f4e0f21..100b6526717f 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2429,7 +2429,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
>>   		if (ret)
>>   			goto set_error_page;
>>   
>> -		f2fs_compress_ctx_add_page(&cc, &folio->page);
>> +		f2fs_compress_ctx_add_page(&cc, folio);
>>   
>>   		goto next_page;
>>   read_single_page:
>> @@ -3161,7 +3161,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>>   			if (f2fs_compressed_file(inode)) {
>>   				folio_get(folio);
>> -				f2fs_compress_ctx_add_page(&cc, &folio->page);
>> +				f2fs_compress_ctx_add_page(&cc, folio);
>>   				continue;
>>   			}
>>   #endif
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 51fd5063a69c..df436dd3aac1 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4322,7 +4322,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
>>   bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
>>   				int index, int nr_pages, bool uptodate);
>>   bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
>> -void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
>> +void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct folio *folio);
>>   int f2fs_write_multi_pages(struct compress_ctx *cc,
>>   						int *submitted,
>>   						struct writeback_control *wbc,
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
