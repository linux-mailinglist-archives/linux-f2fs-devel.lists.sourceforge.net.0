Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316A163B1F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:24:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4Fyn-0005bx-HC; Wed, 19 Feb 2020 03:24:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jhubbard@nvidia.com>) id 1j4Fym-0005br-OX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlagFYC7xJwJLLO9AWUODeIShplyyORjVfFAOxTHQbA=; b=Qa+lyCLnDoRgqYd2KQ3tMPOg7S
 FhTRx2S9c4XimQ8HTa8jp5p+U16J4mOYSsLYKnztYWL2nvijCTtGiPYk10WTx4/ub6GGby6VZWWgI
 YwqEYieEPEKaeVmLpsUHjN7BWZZ/vw1J5x6PDD7xXRbj82qn7tX8cWLJSu0G66Vrlsv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZlagFYC7xJwJLLO9AWUODeIShplyyORjVfFAOxTHQbA=; b=ESqV1CmqOwTCdlewfgcY9ev5KJ
 bgCcmvrqJPakeBgOeGbmo/adyE8JacZMIq8HJnUnMtKV6iGZ69t7o4Lq8jU6QceljMDFYI4p0+Qd6
 DvI4Hb3aeiEFrZ1taOLQECU6dUo5ccGHNEaj5dEemoUsATSA3DGn/xwDQVIONGLNVHpU=;
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4Fyl-007WfQ-Ls
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:24:52 +0000
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4caa370000>; Tue, 18 Feb 2020 19:23:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 18 Feb 2020 19:24:46 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 18 Feb 2020 19:24:46 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Feb
 2020 03:24:45 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
 <20200217184613.19668-12-willy@infradead.org>
 <e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
 <20200219010209.GI24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ecd11199-4f0d-a59b-6172-feea0cb5fd29@nvidia.com>
Date: Tue, 18 Feb 2020 19:24:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219010209.GI24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582082615; bh=ZlagFYC7xJwJLLO9AWUODeIShplyyORjVfFAOxTHQbA=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=UT3JHa9GumLgpABiUIYS6tLJDf3T0qe2BkLDiRHe+ga+cBFPusc4s18OsMU/jLBlX
 E0NSDh7Wn3KmDNpXg+BOI8lgzx9nuhlOISv7Q+A953Wjg9k/Zip3jhxQxFwxXrhrTe
 mlzaTkOvirZ1Dkj3aIXO2/ZqisJThErxhVI/lGBx6uo30YWSEpJjJbA16XPG9BlUce
 E3OEkzQk82BcTRY/VG+SWUggGD+iAn6jEAnm7mW6H40rjA32wi90YTYCvMNdy0ZikV
 ycz4GiE2GTViYC1vPo+1mK6ZrNv30Kr16tydwj5IHm3yOemZstl28tkGDlc3/UIRIS
 mLk08n5euWN9Q==
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
X-Headers-End: 1j4Fyl-007WfQ-Ls
Subject: Re: [f2fs-dev] [PATCH v6 07/19] mm: Put readahead pages in cache
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

On 2/18/20 5:02 PM, Matthew Wilcox wrote:
> On Tue, Feb 18, 2020 at 04:01:43PM -0800, John Hubbard wrote:
>> How about this instead? It uses the "for" loop fully and more naturally,
>> and is easier to read. And it does the same thing:
>>
>> static inline struct page *readahead_page(struct readahead_control *rac)
>> {
>> 	struct page *page;
>>
>> 	if (!rac->_nr_pages)
>> 		return NULL;
>>
>> 	page = xa_load(&rac->mapping->i_pages, rac->_start);
>> 	VM_BUG_ON_PAGE(!PageLocked(page), page);
>> 	rac->_batch_count = hpage_nr_pages(page);
>>
>> 	return page;
>> }
>>
>> static inline struct page *readahead_next(struct readahead_control *rac)
>> {
>> 	rac->_nr_pages -= rac->_batch_count;
>> 	rac->_start += rac->_batch_count;
>>
>> 	return readahead_page(rac);
>> }
>>
>> #define readahead_for_each(rac, page)			\
>> 	for (page = readahead_page(rac); page != NULL;	\
>> 	     page = readahead_page(rac))
> 
> I'm assuming you mean 'page = readahead_next(rac)' on that second line.
> 
> If you keep reading all the way to the penultimate patch, it won't work
> for iomap ... at least not in the same way.
> 

OK, so after an initial look at patch 18's ("iomap: Convert from readpages to
readahead") use of readahead_page() and readahead_next(), I'm not sure what 
I'm missing. Seems like it would work...?

thanks,
-- 
John Hubbard
NVIDIA



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
