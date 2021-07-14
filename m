Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983F3C7AFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jul 2021 03:18:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3TY4-0003Kl-Ka; Wed, 14 Jul 2021 01:18:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m3TY4-0003Ke-2C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 01:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3TP6covGAb2QhWUY4cGrTmx6R63b3UWbZc8NMm1NsWE=; b=VcbaZUhMDpSk4kR7FKhd8GUmgl
 Mnn6FZEZbGWl6CnwFk++s1VYZ3oUfLxWS+LrLpJYZ/s76XJft1FTKR5VTiXT4BSaeSU4oce1LTmm2
 ELaUDOR5r6WlkvKH/M+UxvQx20GnsFChgVxkwdneiY/jpU22SflZ2mrd9gKFwegLRWiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3TP6covGAb2QhWUY4cGrTmx6R63b3UWbZc8NMm1NsWE=; b=RbUi2c6Dqay/hqg6dPnbQrB5WZ
 tBusucOXZHztrfLRTe5Nt2j9jzL+ykiN2qOBxc6VkKl59Wc8Q7zxOO88C9K6iS1ZQdbbivz2KqVi2
 zCmgDxYDaccwtg69IQET+e9SdC+rNU5MH+K9TI8yskl//XNbSmHpXxzwBV3+w1tR3HZo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3TXx-007WZY-Rn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 01:18:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C7EA61289;
 Wed, 14 Jul 2021 01:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626225510;
 bh=bqfOynOanswB3TxAvDkcHsdBKl4aw+fhSQzv550AhsM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QsoJ75rHPZgxMYtN9OqMq0C7Z9tNGJTbSMcgc48pd5ul+pOT8/qDCJaNMClP6RNhI
 D12CnH6xukrQ+LXCj2DnmOPg1eF4tEJUT0+vIqVar66dvLlB9XyvaXNJtC+sMto1ot
 mdiwzS3AQJbGHZ+h8KktdpzkT+smyMHMapStpxWmWNiMET1iUvy5mn/smPhpyBjAjy
 Gayhbw2B/otBmgqpM2P9ZoNKCP/taRdlOuFFD+Z0uO3x/CMA9UJNGGD43nlrHp7SR3
 aBFmbVmMoTfEE9zBkLAGnTmyYjzNKv7yeKoEXmIFgv0lUPBN+f8xnj5it2VkVUNvdI
 AMHmAwns/5s1g==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210622115059.24860-1-changfengnan@vivo.com>
 <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
 <73528afe-8331-85af-48c1-f9d733ed8e39@kernel.org>
 <YO4lZxIH772ms1wB@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <92a5734d-c1f7-8088-f3af-43b8cac42991@kernel.org>
Date: Wed, 14 Jul 2021 09:18:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO4lZxIH772ms1wB@google.com>
Content-Language: en-US
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m3TXx-007WZY-Rn
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/14 7:44, Jaegeuk Kim wrote:
> On 07/13, Chao Yu wrote:
>> On 2021/7/13 10:35, Fengnan Chang wrote:
>>> Hi Jaegeuk:
>>> 	Any comments about this version?
>>>
>>> On 2021/6/22 19:50, Fengnan Chang wrote:
>>>> when we overwrite the whole page in cluster, we don't need read original
>>>> data before write, because after write_end(), writepages() can help to
>>>> load left data in that cluster.
>>
>> Jaegeuk,
>>
>> Let's queue this in dev-test for testing?
> 
> A bit worry about unknown corner cases tho, Chao, could you please test
> as well?

Yup, I just plan to do this, may focus on data consistence.

Thanks,

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
