Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD664D54A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 03:21:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5dsf-0003st-H6;
	Thu, 15 Dec 2022 02:21:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5dsd-0003sn-LW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 02:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyAXDev9WSill4HuJnaajXGPYdKPo6XQwrGW9OqzahE=; b=eDQ7MuaTQUgt9oMU6jEmDYvJaS
 JjcFNT3rEv9EmjnR5up2TAysU+eVYWuS3EpOqsWK0O+v9UHJLvg3kQp6JgGS2YBquR8FgrQZhvNn5
 f8V2SCxA8p3X0njT5BzVdtXPUbN/hXIW6FDzLaaXrSf2OTRdUC+AjjNBjDXTrYw3LgyM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyAXDev9WSill4HuJnaajXGPYdKPo6XQwrGW9OqzahE=; b=grVAy+3etaBClV22CzUCBi638u
 XNcz9X6CIxhl6T7UA7xBizCtfo0dOn6EF7t3pWMY4G6EqaiX+z8WmkQdTtLR+puNUd6H9F5Mq512h
 YG2Sgq5SsNG9X3akgjC925E7TB/2+uCqIkCE0Xeg7sNLoAsaZs6l71YdbLyCXXV9OzlM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5dsb-0006KG-RJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 02:21:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72D4161BD1;
 Thu, 15 Dec 2022 02:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BE3C433D2;
 Thu, 15 Dec 2022 02:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671070903;
 bh=0iptShXCJSeoqtzCgX7jkKKJ6AltXplKHWxJjv7ZfSU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h8ApMoY4UCDFGj96nVZyZuCwCu6XJQ1VaOst3z1I6TELfMyQSThXcbqKUujpUMjhH
 ZqKCcS6uaLYbzRE6dbhYfo6cDci7/QDFARjcG5c5xOWnc3NFzsvmhml3tarWXwA8dH
 eo1EUGE/4rQe2uTQlw99JsVA2lmWSNFb2aeHZ20BvUZvgbTiY7peYVYLFRhipS/FND
 +/S+yZLpQj9lluurWUyqz8wgCrCwygeT+XVHQnkx57RPzXhzkiIcxYl7rHxuagcegd
 +WTrBl0R777uK2Ifh6SR4Q2bsY1YN4AYjqHhfCup7mk9HJM2mkb+6aZHW/h85vv8Mz
 +6ouq1VA6PA7Q==
Message-ID: <acc94cef-3d37-d1a3-21cc-3a514be3291e@kernel.org>
Date: Thu, 15 Dec 2022 10:21:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yangtao Li <frank.li@vivo.com>
References: <ddf243c9-f557-7f11-1964-8d2324f84092@kernel.org>
 <20221213115454.14885-1-frank.li@vivo.com> <Y5jOTL66ph3Nq/Hr@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y5jOTL66ph3Nq/Hr@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/14 3:11, Jaegeuk Kim wrote: > On 12/13, Yangtao
 Li wrote: >>> What do you think of extending this function to support
 io_counts?
 >>> >>> void f2fs_update_iostat(struct f2fs_sb_info *sbi, st [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5dsb-0006KG-RJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/14 3:11, Jaegeuk Kim wrote:
> On 12/13, Yangtao Li wrote:
>>> What do you think of extending this function to support io_counts?
>>>
>>> void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>>> 			enum iostat_type type, unsigned long long io_bytes,
>>> 			unsigned long long io_counts)
>>
>> Support to have extra io_count.
>>
>> But I don't think there is any need to add additional parameters to f2fs_update_iostat.
>> IIUC, each call to f2fs_update_iostat means that the corresponding count increases by 1,
>> so only the internal processing of the function is required.
>>
>> BTW, let's type out the iocount of the additional record in the following way?
>>
>> time:           1670930162
>> [WRITE]
>> app buffered data:      4096(1)
> 
> How about giving in another columns with additional stats like avg. len/call or max. len?

Maybe call is better? w/ it we can calculate avg. len/call.

Thanks,

> 
> app buffered data:      4096	1
> 
>>
>> Thx,
>> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
