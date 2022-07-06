Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAF568B2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Jul 2022 16:28:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o960U-00034c-Md; Wed, 06 Jul 2022 14:27:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o960S-00034W-L7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 14:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPMKNqkAs2iYuaZXrVF5QfRwO7V1B42YDbJRQd+bDpI=; b=AzfL1azCPpxR2zbfZgbl9L/Jlg
 cQnk1Mb136dMDs+K3bPrFdsjZwJSqpvQrUYd9Di+V74Bgu7DAp57C+nyrTqNEs4QnL1G95ayY24Zp
 QZMq8rJfWlkBxIdV3uAF0TfrJUNvoEyj816z4EuLt2/X5bo20Q+7XHHXcoy90H3rIiHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cPMKNqkAs2iYuaZXrVF5QfRwO7V1B42YDbJRQd+bDpI=; b=jbT2jrHqz8DUYW5AGtOCibNFWG
 VVnjF6OTiNH99Er8tz0CHwLTeA+fDC3jUBv+w4DFIRBIYIMoNpRxJbDuZaDciS3DDLgD3q0PXM+11
 sxGwMn398c/EBQa62QXVDIICzQAzvdAoAOd74squgM3FXqgjK6RFPbgCPnVmyw0OvBQI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o960S-0003iR-Hr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 Jul 2022 14:27:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AEB661EA5;
 Wed,  6 Jul 2022 14:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A0C3411C;
 Wed,  6 Jul 2022 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657117666;
 bh=AqYKdoA9FLd1G1LCk3C1+7u1lQg7N8l1i5b7UcNhb2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W+bHK5c2gd9jzkU7diwCyrMzC+1smiCjHNYkX81108IqSzsZqkxt8iEAZc/UDg6Ts
 NFLzQBo+YZPexyYLaM/tBzCD7wZAY73J+7bYoosX8WRb24E2gxGnOr/D0uBIbU0DO6
 mJjPkr2Igm8XxD6QDbNbZ+FVuhQxEG9dXLsz0JuDrwMjH1fi4XxOUFHUOtEn3PRSfQ
 ZOM+AWHotV5kFHBCoBAXPRi26zYUpfs0CYRyog3LA7H1L0wTVjS0mjqwatqGtKFQ5Y
 gOXMCW0BILY1HTanXIDSlv6dc9uBx98CPb/a7LtO1fZss5oYJGj/4NErbWcbTVydfE
 H98jg6lW5Od2g==
Message-ID: <c181672a-faa2-2f2a-b495-b9c9fee56d50@kernel.org>
Date: Wed, 6 Jul 2022 22:27:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>
References: <20220621064202.1078536-1-chaoliu719@gmail.com>
 <7fb689d9-11ba-a173-8ad4-a328a03298a8@kernel.org>
 <YrPq5N61W9vFGTub@liuchao-VM>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YrPq5N61W9vFGTub@liuchao-VM>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/23 12:24, Chao Liu wrote: > On Wed, Jun 22, 2022
 at 08:50:33PM +0800, Chao Yu wrote: >> On 2022/6/21 14:42, Chao Liu wrote:
 >>> From: Chao Liu <liuchao@coolpad.com> >>> >>> Files created by [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o960S-0003iR-Hr
Subject: Re: [f2fs-dev] [PATCH] f2fs: allow compression of files without
 blocks
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 Wayne Zhang <zhangwen@coolpad.com>, Yue Hu <huyue2@coolpad.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/23 12:24, Chao Liu wrote:
> On Wed, Jun 22, 2022 at 08:50:33PM +0800, Chao Yu wrote:
>> On 2022/6/21 14:42, Chao Liu wrote:
>>> From: Chao Liu <liuchao@coolpad.com>
>>>
>>> Files created by truncate have a size but no blocks, so
>>
>> I didn't get it, how can we create file by truncation...
> 
> I'm sorry I didn't make it clear. We can create a file
> by passing a FILE parameter that does not exist
> to the user command truncate(1) [1].
> 
> How about using truncate(1) instead of truncate
> in the description of the change?

Fine to me, as f2fs_disable_compressed_file() uses the same check
condition. ;)

Thanks,

> 
> Thanks,
> 
> [1] truncate(1): https://man7.org/linux/man-pages/man1/truncate.1.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
