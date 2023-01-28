Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899E67F436
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 04:12:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLbdK-0002hO-Po;
	Sat, 28 Jan 2023 03:12:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLbdH-0002hI-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 03:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thchuWMn6eVoPYjWYrgB0YfxIZUaYqa3zs5vhz4gNng=; b=ah4AwtOGGpwUL420l2fl6X163i
 oNHYpQKFGppFTYg/PZYjBKzc6T88J0OLqVraBlhdqeSwZCAezN7vZ5DLmBGztT4Xmw2aG80WxvhVH
 Ych93eCCPtsY2ar/qFvdn1BOO74OqmxA8gKzQrySTrqR49QU3RuTqCLi2a5gRqPKLbNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=thchuWMn6eVoPYjWYrgB0YfxIZUaYqa3zs5vhz4gNng=; b=XnL+mcLgkGrjWpKdsZ9aS6xdRh
 fqv4UhsjxSQhvxaWk5XPRd1bhh/g/nLNl4ygZcAZR3njod1POWLjblrtTBrblRDyK1w0JStRtyeNY
 3SHjMdWIZRSKdENXy1B5HdffSx2EJJO/LEdZdP6maDcC7nMRxyxTgjbbE6Yhb68eh1oI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLbdC-001Dsk-Ss for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 03:11:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 927AAB82148
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Jan 2023 03:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAADBC433D2;
 Sat, 28 Jan 2023 03:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674875507;
 bh=XPaMcUNFzQtuzwo6CK8GiZUG4h20tNH9I9lk8x2KzFM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QG3VCHBlSfGhLGgZuhtNYKVq0bCXEY9+S+ordZOyfTL6rdDY64iDbVBnSroHV0mgy
 SB4zYXYLqeQzVWEWGawo2yVSzeuAx1c4X7gjWXx5XCrsol7HRPOrt5NuqSTadxeIbf
 2bjibS7c9FkPb9CzzAk8Dps0MTkCsENRcVaw6CwTSTg0/pEt/DfsiMjSZW/ySvK3pv
 0tCNCgOzOlXfnRhzMuDpVLDmUJa00BIwZPwWvFd5dCoZLPI04uo8uRv3oKJuEt5L+E
 YdZNJ5ZoBRBDTqDuuy1GA7POL/Zobg5Hs+i900EE7/j5Kc/lKNNkehQSNs2N3locDR
 QwNGYeNTRhevA==
Message-ID: <b2112f3d-e0a5-0562-9ea1-a158c75ef3b3@kernel.org>
Date: Sat, 28 Jan 2023 11:11:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230105233908.1030651-1-jaegeuk@kernel.org>
 <Y74O+5SklijYqMU1@google.com>
 <77b18266-69c4-c7f0-0eab-d2069a7b21d5@kernel.org>
 <Y78E9NpDxtvr2/Hs@google.com>
 <bb9a9d1a-0d4c-b27e-e724-f99d5b8b4283@kernel.org>
 <Y8CfUMsas4ZqVL0R@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y8CfUMsas4ZqVL0R@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/13 8:01, Jaegeuk Kim wrote: > On 01/12, Chao Yu
 wrote: >> On 2023/1/12 2:50, Jaegeuk Kim wrote: >>> On 01/11, Chao Yu wrote:
 >>>> On 2023/1/11 9:20, Jaegeuk Kim wrote: >>>>> In f2fs_update_i [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLbdC-001Dsk-Ss
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: retry to update the inode page
 given EIO
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/13 8:01, Jaegeuk Kim wrote:
> On 01/12, Chao Yu wrote:
>> On 2023/1/12 2:50, Jaegeuk Kim wrote:
>>> On 01/11, Chao Yu wrote:
>>>> On 2023/1/11 9:20, Jaegeuk Kim wrote:
>>>>> In f2fs_update_inode_page, f2fs_get_node_page handles EIO along with
>>>>> f2fs_handle_page_eio that stops checkpoint, if the disk couldn't be recovered.
>>>>> As a result, we don't need to stop checkpoint right away given single EIO.
>>>>
>>>> f2fs_handle_page_eio() only covers the case that EIO occurs on the same
>>>> page, should we cover the case EIO occurs on different pages?
>>>
>>> Which case are you looking at?
>>
>> - __get_node_page(PageA)		- __get_node_page(PageB)
>>   - f2fs_handle_page_eio
>>    - sbi->page_eio_ofs[type] = PageA->index
>> 					 - f2fs_handle_page_eio
>> 					  - sbi->page_eio_ofs[type] = PageB->index
>>
>> In such race case, it may has low probability to set CP_ERROR_FLAG as we expect?
> 
> Do you see that case in products?

Not yet.

> I'm trying to avoid setting CP_ERROR_FLAG here.

Copied, how about using the same logic for node page as meta page, like
we did in f2fs_get_meta_page_retry()?

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Randall Huang <huangrandall@google.com>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>
>>>>>     Change log from v1:
>>>>>      - fix a bug
>>>>>
>>>>>     fs/f2fs/inode.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>>> index ff6cf66ed46b..2ed7a621fdf1 100644
>>>>> --- a/fs/f2fs/inode.c
>>>>> +++ b/fs/f2fs/inode.c
>>>>> @@ -719,7 +719,7 @@ void f2fs_update_inode_page(struct inode *inode)
>>>>>     	if (IS_ERR(node_page)) {
>>>>>     		int err = PTR_ERR(node_page);
>>>>> -		if (err == -ENOMEM) {
>>>>> +		if (err == -ENOMEM || (err == -EIO && !f2fs_cp_error(sbi))) {
>>>>>     			cond_resched();
>>>>>     			goto retry;
>>>>>     		} else if (err != -ENOENT) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
