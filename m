Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DAA65FBA3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 07:55:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDgdB-0001op-6W;
	Fri, 06 Jan 2023 06:55:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pDgd6-0001oi-Up
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 06:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XkD08v/60LEC4/F6qFtBEoBye3ItMlZoWq0yzEbOr1k=; b=jwjoJyk0BNy2WyAmEebyP6CQT4
 hN4dmwJI6KPY6Mq4AFXcZquCj6L3dziXBMd2xscZScQV4wqJ5CadAE/VufsCRyMLKAH9Adc+tZV5S
 erChuzHCPcEY+vY+IqJmh/QVsbG3f1YBZdfpvkt1PC08Fpl23jiNL1BjWqGp0SBcV3dw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XkD08v/60LEC4/F6qFtBEoBye3ItMlZoWq0yzEbOr1k=; b=a5YiRey16g3Dspya18G7Lx6zta
 cko1e32SZ1IBv9l5j9U7lPWQJ46Y6HkH5toeC/VmbMn/CMOQKZyiilqvkwwI+qYu1aV2bISN8+VNQ
 S07rSLPy6vPQarUyFCRC370oJDmnBfk8jSb2bN2jf36RDEuZFpwIqaRW/K7COpmP2SVQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pDgd6-0006G9-4y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 06:55:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9019B81C6C;
 Fri,  6 Jan 2023 06:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B344DC433D2;
 Fri,  6 Jan 2023 06:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672988096;
 bh=mYp2zRyTjIYgp++LwD9YzRwWbghe/qO3LyIqSRzIl4M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NCOxhMn3Js3lzLaRaQlpuq1WUojSX+aZO6ZFkcdYwDJNSBe/2S/GFBcnVoxOou6w7
 h1F0j/IHtsMJ/QKA1ODCMiGRra5+toO36e4QPi9C7VkwT7HqGP5Q6iJ8dybQh9ltZa
 l32PdqNuKjaxXKNQUpYOjb0sEcQOk2Q8i1l39Zv7dY0hTI4F+NzjJJiV2H5AIOKk23
 Hq2XR4JH4y5B7sSltrYy096hm5vEd6Idl2OkWn2uxzaKf79HQEzGuwb44njtiWRv6U
 DsxouLwWPtNITNcr0WdCHX9Id8kdqoKMDWfL4StuhYOrXKzFbz+JgtKS9s5X7EyS4J
 C/NSoQmSBLTqA==
Message-ID: <2568cc4d-ecc5-107c-337c-64f4ddd3b91d@kernel.org>
Date: Fri, 6 Jan 2023 14:54:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de> <Y7RkIbB5JAAJ3Rw6@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y7RkIbB5JAAJ3Rw6@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/4 1:21, Jaegeuk Kim wrote: > Hi Christoph, > > I
 applied the patch set with minor modification to address merge conflict.
 > Could you please take a look? > > https://git.kernel.org/pub/scm/l [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pDgd6-0006G9-4y
Subject: Re: [f2fs-dev] a fix and a bunch of cleanups
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/4 1:21, Jaegeuk Kim wrote:
> Hi Christoph,
> 
> I applied the patch set with minor modification to address merge conflict.
> Could you please take a look?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test&qt=author&q=Christoph+Hellwig

Looks good to me, Jaegeuk, please help to add my rvb tag for all patches in
this set. :)

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> 
> Thanks,
> 
> On 11/28, Christoph Hellwig wrote:
>> Hi Jaegeuk and Chao,
>>
>> the first patch in this series fixes a warning and subsequent hang when
>> testing zoned f2fs.  The other patches are misc cleanups for the I/O path.
>>
>> Diffstat
>>   fs/f2fs/compress.c          |    2
>>   fs/f2fs/data.c              |  544 ++++++++++++++++++++++----------------------
>>   fs/f2fs/extent_cache.c      |   19 -
>>   fs/f2fs/f2fs.h              |   24 -
>>   fs/f2fs/file.c              |   16 -
>>   fs/f2fs/gc.c                |    4
>>   include/trace/events/f2fs.h |   11
>>   7 files changed, 309 insertions(+), 311 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
