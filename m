Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E82B34A28A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 08:33:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPgyb-0003ss-Ts; Fri, 26 Mar 2021 07:33:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lPgya-0003sl-8w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 07:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F9L6A6ctK8SIY7jRrh/6Z0pPbOLKcXKNKcPV879c2gQ=; b=iLkyT9czEW/JTtQCxHk7x98snL
 9F4dg7264zpoVBG0LdBci+NgTz0HDkE4e3TlhHUKa2/0LN8oOlGLePYNSRiunhRGA4e56T7lPFezI
 fW6yTnZxiZzIGJ1h3zrZ+Df9AsrpvLh5ZsIOa+vgyaW60h3XowP7FADiiVLwQgJQqeSI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F9L6A6ctK8SIY7jRrh/6Z0pPbOLKcXKNKcPV879c2gQ=; b=TQuCVaxVBibxeOO5VuTK9uyBwF
 jFe8st5jPt8R/m6K7XlpHwf+WG09EhuzesB4C7rCpKeyLWqGH/PTom8sIgwMWUAf8owz0gLOA5o5L
 U7UEtap7I39AMLQjsna1EmRdaObnH7uqbaxq9ZiBgHzdLkDLoJTcMNKiongNOLPJ6Osw=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPgyT-00CyhB-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Mar 2021 07:33:48 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6DCt1LM0znWrS;
 Fri, 26 Mar 2021 15:30:50 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 26 Mar
 2021 15:33:22 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210324031828.67133-1-yuchao0@huawei.com>
 <YFvQGxLbpmDjxEzR@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2dfb085b-80ce-050b-5650-986675a07488@huawei.com>
Date: Fri, 26 Mar 2021 15:33:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YFvQGxLbpmDjxEzR@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lPgyT-00CyhB-Pt
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid touching checkpointed
 data in get_victim()
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

On 2021/3/25 7:49, Jaegeuk Kim wrote:
> On 03/24, Chao Yu wrote:
>> In CP disabling mode, there are two issues when using LFS or SSR | AT_SSR
>> mode to select victim:
>>
>> 1. LFS is set to find source section during GC, the victim should have
>> no checkpointed data, since after GC, section could not be set free for
>> reuse.
>>
>> Previously, we only check valid chpt blocks in current segment rather
>> than section, fix it.
>>
>> 2. SSR | AT_SSR are set to find target segment for writes which can be
>> fully filled by checkpointed and newly written blocks, we should never
>> select such segment, otherwise it can cause panic or data corruption
>> during allocation, potential case is described as below:
>>
>>   a) target segment has 128 ckpt valid blocks
>>   b) GC migrates 'n' (n < 512) valid blocks to other segment (segment is
>>      still in dirty list)

I missed to change 128 to n, so comments should be updated as below:

   a) target segment has 'n' (n < 512) ckpt valid blocks
   b) GC migrates 'n' valid blocks to other segment (segment is still
      in dirty list)

Thanks,

>>   c) GC migrates '512 - n' blocks to target segment (segment has 'n'
>>      cp_vblocks and '512 - n' vblocks)
>>   d) If GC selects target segment via {AT,}SSR allocator, however there
>>      is no free space in targe segment.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
