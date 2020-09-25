Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06266279498
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 01:16:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLwx9-0003rL-Qh; Fri, 25 Sep 2020 23:16:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kLwx8-0003rD-LE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zmKCOVxtL1iW7mSO3Kk8opUNGoBcDNkx+1BCVP7F10I=; b=bCh6cmnl6xogPcapzkBCF/LHHA
 M/VSA15l1kUIOZFbKOkWd+8tqMfZRO7dH6G3BZx6b5k/rClY4e2k1qAq+UUbduGcZPoKDkrx2QRz2
 y9Qo03/jBqCPN9VcoHBSIF0bR1LartSm/fM9VEBBwZ/toHDqNaee5C5qS9MLDvqsSC1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zmKCOVxtL1iW7mSO3Kk8opUNGoBcDNkx+1BCVP7F10I=; b=HpWed7j86Yie9pJhQbEwGhA2Kl
 Hks+a3R2OedmOKItHfx9TdAMwBcf7IR2QAlkZaO3R99etxAnwB3HmgHEKxAFUE0Cp/afRQTLbXUB2
 VkyFpTPeIuA0QrtGJE92Y5adjPVUqqQ9mvtqV4gI5Z/ordLD5ulsWttCZrH0RdnbO32c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLwwr-0066XN-RU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:16:34 +0000
Received: from [192.168.0.108] (unknown [49.65.245.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D8CD2074B;
 Fri, 25 Sep 2020 23:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601075765;
 bh=kAmqMHpW9W/yJcZRYE7F4Ixf4RVq6Q/KthxY8rnnZ2I=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=W2XyKNFmf5EeiXF+GR2jNDESU1sVFmMbkSDQWt0BMMeIqUocOlnIBeQcliGsvs4Qu
 7jkjkNEtsxb7TRMP1L2NqrpZHlV6cR/fOFF0kDN/PE45KM3sSHxz9WaOM574pH88IC
 9bafZe0vcr24pLDrDW+Dl2UZp6LOnT7Fe0JXzSp4=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
References: <20200918030349.19667-1-yuchao0@huawei.com>
 <20200924200305.GA2568648@google.com>
 <dbf3a532-cd38-2b31-e4ab-e83505c6c9c4@huawei.com>
 <7a072554-9d64-b4ac-b85b-de0acd9e507f@huawei.com>
 <20200925170729.GA2843966@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <d05174f0-4ca6-c492-8ce3-ac8f146e177c@kernel.org>
Date: Sat, 26 Sep 2020 07:16:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200925170729.GA2843966@google.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLwwr-0066XN-RU
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to disallow enabling
 compress on non-empty file
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

On 2020-9-26 1:07, Jaegeuk Kim wrote:
> On 09/25, Chao Yu wrote:
>> Jaegeuk,
>>
>> I noticed that in dev branch there are several patches which have not been
>> sent to mailing list, could you please send them out?
>
> Chao, which patches?

Jaegeuk, they are

	f2fs: point man pages for some f2fs utils
	f2fs: fix slab leak of rpages pointer

Thanks,

>
>>
>> Thanks,
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
