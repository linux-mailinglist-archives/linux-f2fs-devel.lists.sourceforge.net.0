Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A1A9E2D8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Apr 2025 13:49:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u90VS-0000WL-63;
	Sun, 27 Apr 2025 11:49:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u90VR-0000WD-Ad
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 11:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EkDlokDBaPkbqgq38Dm2RsQBVijt9FnAieVrRvk422o=; b=BnMqCDonPsgdhXCWfAfzVEjksX
 TtQk04h6RmweiU8o58/j3+ntq02N44z490A51wAUweBH91mAwd+1pbtnk4tsoKaSQ/ZgeUGpGIepz
 zqTPqDYpkTRfOzItUVW5hITnjyOQrlQp++Hd6e61eACdsKFXMYasMQ1N8nCMlC6EKCPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EkDlokDBaPkbqgq38Dm2RsQBVijt9FnAieVrRvk422o=; b=MrZDtGYbJl/6YKYHvwUaax8vrR
 ILqT7BU8BbYkSEqD0l+8aJm+sv/5hn0+2ivpTdNyZUMdFebWlUlNlgGGV8gc/LXMeSpzwZ+n97cmM
 Z7g3ecj2DSIDmdk7FXPNlAN/jkPJcvnDqpjD2SHUIP5P4Vl61FLuVbfE5ilxmPG4ILJM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u90VC-0001A7-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Apr 2025 11:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CA135C58C6;
 Sun, 27 Apr 2025 11:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D95C4CEE3;
 Sun, 27 Apr 2025 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745754523;
 bh=OvGde1Swh705ink4HP0nxpIMxwWrfqmB1zSemMhkr6E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=A6ACuA/qW3qjPkWDYVK9YcmSatrlKe+yGFI/5fa+SaAOeCDHxnzUTACtaS+IewDAk
 OufflcENlBi3Oj8eao0RHhZGn3s4UCMbgipoYjPpy/+L+u467033ld+Tzh6+gcqkuJ
 +ljQ0el28raKkr+GtKNelWwij/j5qxGltPZdDp182fdViQEbzEerfgYFGVEhCM0EMz
 pulQB7jbDfpX176W70WcgYXkxgv5TSGBdAePScdTu7LAWHQViNRMTr3dsYHlIrRrcH
 PmO+N3S0cj7shLlQ/BgsUfMEen3sOJQAyrF8dZlC+Tf/jshflmnUEz2DPKgkbADhZK
 qG5ncoHtxVZlQ==
Message-ID: <7502d697-bd46-4656-b862-259dc0dc3349@kernel.org>
Date: Sun, 27 Apr 2025 19:48:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250331201256.1057782-1-willy@infradead.org>
 <20250331201256.1057782-20-willy@infradead.org>
 <dafb53c1-4b39-4c49-a482-d7e24f593d1a@kernel.org>
Content-Language: en-US
In-Reply-To: <dafb53c1-4b39-4c49-a482-d7e24f593d1a@kernel.org>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/27/25 19:17, Chao Yu wrote: > On 4/1/25 04:10, Matthew
 Wilcox (Oracle) wrote: >> Remove a call to find_get_page(). Saves two hidden
 calls to >> compound_head(). Change f2fs_folio_put() to check f [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u90VC-0001A7-4Z
Subject: Re: [f2fs-dev] [PATCH 019/153] f2fs: Use a folio in
 f2fs_ra_meta_pages_cond()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/27/25 19:17, Chao Yu wrote:
> On 4/1/25 04:10, Matthew Wilcox (Oracle) wrote:
>> Remove a call to find_get_page().  Saves two hidden calls to
>> compound_head().  Change f2fs_folio_put() to check for IS_ERR_OR_NULL
>> to handle the case where we got an error pointer back from
>> filemap_get_folio().
>>
>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> ---
>>  fs/f2fs/checkpoint.c | 8 ++++----
>>  fs/f2fs/f2fs.h       | 2 +-
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 1a5fbecd9356..30e68de82f73 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -325,16 +325,16 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
>>  void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
>>  							unsigned int ra_blocks)
>>  {
>> -	struct page *page;
>> +	struct folio *folio;
>>  	bool readahead = false;
>>  
>>  	if (ra_blocks == RECOVERY_MIN_RA_BLOCKS)
>>  		return;
>>  
>> -	page = find_get_page(META_MAPPING(sbi), index);
>> -	if (!page || !PageUptodate(page))
>> +	folio = filemap_get_folio(META_MAPPING(sbi), index);
>> +	if (IS_ERR(folio) || !folio_test_uptodate(folio))
>>  		readahead = true;
>> -	f2fs_put_page(page, 0);
>> +	f2fs_folio_put(folio, 0);
> 
> if (IS_ERR(folio))
> 	folio = NULL;

Oh, I missed that f2fs_folio_put() can handle error and NULL folio,
please ignore this.

> 
> if (!folio || !folio_test_uptodate(folio))
> 	readahead = true;
> 
> f2fs_folio_put(folio, false);

Only need to clean up the argument.

Thanks,

> 
> Thanks,
> 
>>  
>>  	if (readahead)
>>  		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 3d2be01f9363..f05185ed1c75 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2871,7 +2871,7 @@ static inline struct page *f2fs_pagecache_get_page(
>>  
>>  static inline void f2fs_folio_put(struct folio *folio, bool unlock)
>>  {
>> -	if (!folio)
>> +	if (IS_ERR_OR_NULL(folio))
>>  		return;
>>  
>>  	if (unlock) {
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
