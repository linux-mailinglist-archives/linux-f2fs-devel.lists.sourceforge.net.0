Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B953628F62
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 02:36:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouks8-0003z6-1s;
	Tue, 15 Nov 2022 01:36:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ouks6-0003z0-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 01:36:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KT5lhJ8X6nnHvDMDcO4Q0RC2ja93ylevc6qVFmQlt/o=; b=ZMsY9LRTAfmTWpGczDwU1O+0NW
 Jx4OPzsui5oTdwvXkt8c5lFvNZSFzGrKBapRSPaA1c/KL1q+na3tgPnyEdgJlB3SOMrWX8oWJ7POu
 DJHbCFz/N1iyoP0TtTwADtHgXL7XSdfZ8pXZAMoQLRISPXOrTSqB0aI3bBQJexAQayLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KT5lhJ8X6nnHvDMDcO4Q0RC2ja93ylevc6qVFmQlt/o=; b=iv8Yeo5thRF3ZQP3/U6qedY/AC
 0MsnNEJjM1Rbj5QBDK1dHEpPIBLsmuxVBTueAferwBeaImweFiTRlhto8ZM3fBkbYAL7+/6eAR/xG
 xQBlnHWHOU4N021zow0spFDC/0Hx/meFraurSeGvKzOO7rWVoC60vK69qL2YdNhCNKSE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouks5-008Zre-UW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 01:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A6BEFB810F7;
 Tue, 15 Nov 2022 01:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5DDC433D6;
 Tue, 15 Nov 2022 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668476170;
 bh=u+r7M+gVUdsXzOnX5qWOPAIFTRPi6iT3MfWb6GlBZws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I0ErSM1hAmys7z2U16mv9a1MT7eBIFJVPIfjyvg81jFMNwBnLRJyARfzElfsnmiQd
 VtnxPfl7TmoR3emO9ycDk2TlmlEHC/EyNORUx0M61PAtRcZCFCpK5ZB8r/VNS94yHJ
 PcCS11/1FCKLF6E5++CjJwr4ybrVjFh/6PApcHeMmklLWLlBqHQ0pbPfBy18wHcnjb
 TaH9c7QFC4gj3i3+lP9ncnYQqgVYZD4fS8itvjomED7mBjwiU6GNeCMswOMXi08Q86
 4nuTBW3x5dW/wJb7ychgSpt/prCHjxFvH1pJA1BbfC2j4d6rOHeoCSZLD0Mt+8lhJA
 TgvE7oN/+F7BQ==
Message-ID: <9c5d267e-d040-0e67-27fc-d6ff6e5dae25@kernel.org>
Date: Tue, 15 Nov 2022 09:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yangtao Li <frank.li@vivo.com>
References: <20221111161349.60689-1-frank.li@vivo.com>
 <Y3LF7SjCLKaz7OWi@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y3LF7SjCLKaz7OWi@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/15 6:49, Jaegeuk Kim wrote: > On 11/12, Yangtao
 Li wrote: >> Complaint from Matthew Wilcox in another similar place: >> >>
 "submit? You don't submit anything at the 'submit' label. >> it sh [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1ouks5-008Zre-UW
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove submit label in
 __submit_discard_cmd()
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

On 2022/11/15 6:49, Jaegeuk Kim wrote:
> On 11/12, Yangtao Li wrote:
>> Complaint from Matthew Wilcox in another similar place:
>>
>> 	"submit?  You don't submit anything at the 'submit' label.
>> 	it should be called 'skip' or something.  But I think this
>> 	is just badly written and you don't need a goto at all."
>>
>> Let's remove submit label for readability.
>>
>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>> ---
>>   fs/f2fs/segment.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 3654c30e0517..0a72e787c585 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -1144,13 +1144,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>   		if (time_to_inject(sbi, FAULT_DISCARD)) {
>>   			f2fs_show_injection_info(sbi, FAULT_DISCARD);
>>   			err = -EIO;
>> -			goto submit;
>> -		}
>> -		err = __blkdev_issue_discard(bdev,
>> +		} else
>> +			err = __blkdev_issue_discard(bdev,
>>   					SECTOR_FROM_BLOCK(start),
>>   					SECTOR_FROM_BLOCK(len),
>>   					GFP_NOFS, &bio);
> 
> Thanks. I added {} to meet the coding style.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
>> -submit:
>>   		if (err) {
>>   			spin_lock_irqsave(&dc->lock, flags);
>>   			if (dc->state == D_PARTIAL)
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
