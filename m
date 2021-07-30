Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED03DC1B2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 31 Jul 2021 01:48:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9cEv-0002Q0-WD; Fri, 30 Jul 2021 23:48:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m9cEu-0002Pu-KX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 23:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jAyq703vH5fPc/0XjCleB/ZlvS59Go+unrD5CQzkHcI=; b=eYrgz7+1rPnFBuJWVPFJMzdXH1
 Fuee7U8hz92ExZKq51sg8DMPHjp+ghkGwl6Kn3uCx+xeWXCJBjCiCezMMZVDQGBue1w3c2foDWtoY
 wWxSYfORf9hAs7oZiQTFs1HOjXC19n6GkAGLSAqB3reTT8Rlnw7CfYEYLe/GO8LbgPYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jAyq703vH5fPc/0XjCleB/ZlvS59Go+unrD5CQzkHcI=; b=bH2VZBj1TVYFMWzafQ5ShZ8VRz
 /JXTrJeFAotzEns/KUXOFh2ZGS/J8L2Pw6r/eEiBNNMswkoMmq0Iot/jz+pjHMMW+xNbu1CY1ne5n
 lVln7VyMJqRDGX7WjL0OBfGJORTpufkIcF4PN55iQ5porjEtAjMVx7CfLengzh8oKNY8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9cEt-0006rU-3I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 23:48:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D60D160EFF;
 Fri, 30 Jul 2021 23:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627688901;
 bh=f6q+H13wgYJiez7omm0CrRokrHgcc4Jfz9N8xk7Ur54=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OeCT6v0YaN+2zeHoyvr1eoMaZ/UVirYeQYxY9d9K7SZFoPlXYKKpbTtUgICU9X1YL
 CH1WfGGEwK8wnRRQU5iShUx4SHNeIGFudnM1EZqK/KZJAIhjzs1TBh6031FLg69dIa
 HP7plJEu0dz5ntfL2oHGscEU8sjGAcxpz/t/wADMvpUlaGlvbbnt5RVoD0J0xp7wps
 lVFn46CbIFuGKrxi2ZFdchfXN4vaBetCMM9jWRFN6BBRXiqXbMYLrWmEqIwSvuKzeg
 YkLVt1lKMwCjcSMbMzDcdmbbLwTL73g+ILCXg/t9s+RczZBhk+DkY/iJDc+xNPIpzl
 ke59o1aC3ZqKA==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210730100530.4401-1-chao@kernel.org>
 <YQREtmDLBNKSQViC@google.com>
 <c0af2126-7383-a579-e020-6480216c46fe@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <1a540deb-4219-4000-2f8d-a72695f1dfde@kernel.org>
Date: Sat, 31 Jul 2021 07:48:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c0af2126-7383-a579-e020-6480216c46fe@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9cEt-0006rU-3I
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce nosmall_discard mount option
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Chao Yu <chao.yu@linux.dev>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/31 7:41, Chao Yu wrote:
> On 2021/7/31 2:28, Jaegeuk Kim wrote:
>> how about adding "discard_gran=[small|segment|section]", and keeping discard_map
>> in the small case only? And, I think we should set the section mode for zoned
>> device automatically.
> 
> Yup, better,
> 
> About the naming, it look discard_gran is not clear here, since there is another
> sysfs entry /sys/fs/f2fs/<devname>/discard_granularity has the same name, and
> also semantics of newly added mount option is not only control the smallest discard
> size, but also indicate discard start offset should be aligned to segment or section.
> So how about using: "aligned_discard=[none|segment|section]" instead?

Maybe: "aligned_discard=[block|segment|section]"?

> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
