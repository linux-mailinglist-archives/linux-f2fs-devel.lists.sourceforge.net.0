Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3D3DF910
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Aug 2021 02:55:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mB5Bh-0003z0-1v; Wed, 04 Aug 2021 00:55:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mB5Be-0003ys-V9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lig83yMROpldhT56dxWJOgRXz4qsa5VlbJuXK3aImBU=; b=EOgl15dWLH7kW6Uu22rtqhYVG7
 +HOHFatM1DhxTH2mGYy/ek/+Qo4QH9ozI+9pbK3S+vGARMEUYeGWyE9/SmsaaFuGPmt2UpLkBJ51Y
 QTN6lY9Okk71IEB7MVWTE0t7CgnTjMxjopCWWCSbew4W+Hs940e3fyI8BT7RJYZIA5XM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lig83yMROpldhT56dxWJOgRXz4qsa5VlbJuXK3aImBU=; b=e+bIwaB8/j+xepFcd509C8eLjp
 dcFT2dK736esDg3WCoMZLV6GGzBD406JVjEKGMbhpojErK6NBEpd1GldZB7/M4a13magZzKRzpNpe
 yWvgnf03A89RVFgSpogMnxp6y8iumD7MsWPgndDlqiHtlOm1tuFaPZEYzzkyxuxnUlj4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mB5Ba-0004g7-SF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Aug 2021 00:55:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D76560EFD;
 Wed,  4 Aug 2021 00:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628038501;
 bh=aJH3kOdf8qd5RXoedFR4M2Cq1LOGvclWPP+/896MrNs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S/6vQY8ThuIEr1Lq8yWPTcCQwrgF2wLQbzHS/JYyCzDSpWnvScsdx07CnoG3uflZJ
 j5KPw3Q0pA4JfGi031sivlece5NjCmXAqwTp2quXcrIiNNxlwMQg9h2mN3oCEnXyAg
 sUgvZ9I3d7JOlfBKuKkIc+4x8WgDggE0FxUh0P5CeI75Jx/53ADY/iXwO+WRkVp+rc
 JqYk8eJOexrzENIgxdVNMY5FZhej1xfyGC2601FKlddg1DiOiPisTE3EJWFP3q+RHz
 F8SCAHdiFNEJEMXNGEAtHHfVI/UtIReuKXWzL0FkmCvaA5DiJPa6rs9FdW/Q4/KYbf
 s3QPWyKpnNLGQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210803023912.26667-1-chao@kernel.org>
 <YQmNzBofsqv/zEdb@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <d08ada1d-b0a3-6ed8-449b-10bf2518f5ba@kernel.org>
Date: Wed, 4 Aug 2021 08:55:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQmNzBofsqv/zEdb@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mB5Ba-0004g7-SF
Subject: Re: [f2fs-dev] [RFC v2] f2fs: extent cache: support unaligned extent
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/4 2:41, Jaegeuk Kim wrote:
>> @@ -247,6 +247,11 @@ static struct extent_node *__attach_extent_node(struct f2fs_sb_info *sbi,
>>   	INIT_LIST_HEAD(&en->list);
>>   	en->et = et;
>>   
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> 
> Can we avoid the above ifdef?

What do you mean by "avoid", getting rid of CONFIG_F2FS_FS_COMPRESSION directly?
or wrapping codes into function and define as below?

#ifdef CONFIG_F2FS_FS_COMPRESSION
void foo() { implementation here }
#else
void foot() {}
#endif

>>   static inline bool __is_extent_mergeable(struct extent_info *back,
>> -						struct extent_info *front)
>> +				struct extent_info *front, bool unaligned)
>>   {
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> 
> Can we avoid this ifdef?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
