Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853F2F7E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 15:34:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0QAp-0002KM-PZ; Fri, 15 Jan 2021 14:33:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1l0QAo-0002KE-KL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 14:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JlKooYtElvoBMZ5GgPDQkCOzjeZLLHw0zI1ErnpiMME=; b=A6xDc67xfC3NN2x2PtRSSVURYQ
 AdvO+3V0Dxsp72AGyxMm5hAguVFLzzzcP+1wLIgbcNCMPuwNCD9P1gN4SGg7NmqlzMGRsgnlEt1PW
 Yoact7wMZYp+s7szG5M2bQuq0fIvQ67DcoNaRFQEjAmdDQ8JMXDBGQB3eGGDhZ4hbIe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JlKooYtElvoBMZ5GgPDQkCOzjeZLLHw0zI1ErnpiMME=; b=DZ3MdlxO76uaBfQptHVHOrXTvc
 8G3uVqVawmbB6uQG3yeE0RW8jO20lvRTxRmoMnGgzKlHxMsz1umsfwV0GxmhlNxbSNNOG+pKpebm4
 8dIkRT341ggMt0hFgstG/ubFyF7hEA5V92C1poBNH7yrkipgPriII7rsA2/3w6hrk00c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0QAb-004s0L-07
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 14:33:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06050224F9;
 Fri, 15 Jan 2021 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610721219;
 bh=JlKooYtElvoBMZ5GgPDQkCOzjeZLLHw0zI1ErnpiMME=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=n84OuihdpxPZSCEyu2+9PdEdvMGODoT7rfwGJKCJVQu+RWVvZv7kKTdyzVBwQHjER
 /KgPuCh4t/3RrSVuGEFnO+43KiugUEQ+1pxhLEnOjG+VoqPXRith5tGebZky3XctZ7
 9vr+OIFeQnvqJPT313tBjeqbN2pO1vMzzFVrgPd7G5/h/7GEARTEleX6E83tTcZX4s
 f9LhQFOfAALetyeqoqT7wmf/2P/sel/bHB16EPXoStanCObOLhU3kP3C9tXWux6noH
 zaIb/UlThPWSsDD5ji8nY7q/9pFPFO5YQXKqPfPQyHG3SJ7Exv3FapLkH54c1lrrKy
 S1MzyvnqxCn9Q==
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <yuchao0@huawei.com>
References: <20210114062302.3809664-1-daeho43@gmail.com>
 <965dc435-c0a0-36ca-7e97-c3aaa3831bff@huawei.com>
 <CACOAw_x4R+rWZbi4TQym_sWuyqOGRR5w3iOs1A+e+g=ZT5k7FQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b64dc9dd-9f22-cb91-c633-d7bbc74abf72@kernel.org>
Date: Fri, 15 Jan 2021 22:33:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_x4R+rWZbi4TQym_sWuyqOGRR5w3iOs1A+e+g=ZT5k7FQ@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0QAb-004s0L-07
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: introduce checkpoint=merge
 mount option
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/15 22:00, Daeho Jeong wrote:
>> ktime_get() returns time based ns unit, in extreme scenario, average
>> time cp cost will overflow 32-bit variable, I doubt.
>>
> sum_diff is already turned into msec using ktime_ms_delta() above.

Yup, I missed ktime_ms_delta().


On 2021/1/15 22:23, Daeho Jeong wrote:
 >>> How about updating queued_ckpt and total_ckpt in batch, update atomic
 >>> variable one by one is low efficient.
 >>>
 >> You mean like using spin_lock()?
 >>
 > Ah, you mean like updating these values as much as the count of the
 > loop at once?

Correct. :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
