Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 051903BC166
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 18:09:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0RA6-0005q1-Ll; Mon, 05 Jul 2021 16:09:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m0RA5-0005pu-AU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 16:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2/4R5P0pXUI4QXDx6GrXX+hPWKtzisdpWQ7lNNBZk8=; b=OIppDsOT/7GKgXUpd8tdKMJVyc
 uhHD/M0CFUnzI4pr84ufoOsBEF2BVUcqkvqDydGjQtDI5XEUQ+Kq8IeWXOflpYQtZsFqlY+eY3buC
 BUqRu2I7SJ8PLWhgoqRkwoBcwKs7DXhG0a9jbkvIFQ2283myMP8i2KJuf1UsY0Q7uD74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w2/4R5P0pXUI4QXDx6GrXX+hPWKtzisdpWQ7lNNBZk8=; b=nDdU2OMs6IJAtX2vtVC8OU41Ye
 15vDh5/Py1rj9HOG5/E/1Oy9L/R9uGWeWrWWQ/npcmzeMh6vy2NazjIAMUyggdtpc4/ex9W1qyztT
 8Ns5QQoh6wiKffp+TjEpisECBGt9G+Rg+iYQ8sV6mbAv7eK4tGbgWRDL1/4ifm+tL4ao=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0R9y-00BCNy-PW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 16:09:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62D73613AB;
 Mon,  5 Jul 2021 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625501361;
 bh=2XzMBDCWTuZKTJpPDkKpokzuPVPOTBI/2bclffIorx4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=u7D924a+RJH1J56edLLyj9U6oNbUsWpUHVDhsrgfQpJGWcXCcn7WbgahQeBWXD1bz
 PCrSCeCTpGQkJZo3ZkfMiDVRRhV+nIhnT2wC1wo/IfLfyfRPV9VOBo9TIoH3Xm9URD
 QXGL2qKbavinIC1Iik8uGys28/D8IEroD2tuTox4ZPCAPA32skpiohwQJgzXidUYAW
 ryZr0JjzJHbzibg4KUyv8t/U9wtjtKwhY2RhJD3ACP5Fa3NHiIKtX2cQp0IqOYk/CF
 momhsPDmeAgGI8YuLyeiHrsvpInbnw7lFVfCxk6tifSHxpSEc9ELsJykzl72cCpWba
 xYTjLdDVji5Gw==
To: Matthew Wilcox <willy@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210705052216.831989-1-jaegeuk@kernel.org>
 <c32642d6-6de2-eb2d-5771-c7cefa62fab5@kernel.org>
 <YOLJW0IgCagMk2tF@google.com>
 <e2fdf628-f25c-7495-cfd1-952899f7ff9a@kernel.org>
 <YOLxZAnaKSwBIlK9@casper.infradead.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <5ab8d01a-8fac-60b2-9c2c-a32c5a81b394@kernel.org>
Date: Tue, 6 Jul 2021 00:09:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOLxZAnaKSwBIlK9@casper.infradead.org>
Content-Language: en-US
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0R9y-00BCNy-PW
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/5 19:47, Matthew Wilcox wrote:
> On Mon, Jul 05, 2021 at 07:33:35PM +0800, Chao Yu wrote:
>> On 2021/7/5 16:56, Jaegeuk Kim wrote:
>>> On 07/05, Chao Yu wrote:
>>>> On 2021/7/5 13:22, Jaegeuk Kim wrote:
>>>>> We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
>>>>> operations.
>>>>
>>>> Oops, I didn't get the point, shouldn't .private be zero after page was
>>>> just allocated by filesystem? What's the case we will encounter stall
>>>> private data left in page?
>>>
>>> I'm seeing f2fs_migrate_page() has the newpage with some value without Private
>>> flag. That causes a kernel panic later due to wrong private flag used in f2fs.
>>
>> I'm not familiar with that part of codes, so Cc mm mailing list for help.
>>
>> My question is newpage in .migrate_page() may contain non-zero value in .private
>> field but w/o setting PagePrivate flag, is it a normal case?
> 
> I think freshly allocated pages have a page->private of 0.  ie this
> code in mm/page_alloc.c:
> 
>                  page = rmqueue(ac->preferred_zoneref->zone, zone, order,
>                                  gfp_mask, alloc_flags, ac->migratetype);
>                  if (page) {
>                          prep_new_page(page, order, gfp_mask, alloc_flags);
> 
> where prep_new_page() calls post_alloc_hook() which contains:
>          set_page_private(page, 0);
> 
> Now, I do see in __buffer_migrate_page() (mm/migrate.c):
> 
>          attach_page_private(newpage, detach_page_private(page));
> 
> but as far as I can tell, f2fs doesn't call any of the
> buffer_migrate_page() paths.  So I'm not sure why you're seeing
> a non-zero page->private.

Well, that's strange.

Jaegeuk, let's add a BUGON in f2fs to track the call path where newpage
has non-zero private value? if this issue is reproducible.

Thanks,

> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
