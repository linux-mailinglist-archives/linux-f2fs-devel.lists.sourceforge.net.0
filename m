Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A045F2637D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 14:11:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTQ5S-0005Ct-3w; Wed, 22 May 2019 12:11:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hTQ5P-0005Cm-VZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kbLhTAWbV0hQYZfXEOSKfNHLS3V0V2q951LBdSddVs=; b=bsCz5wYERh0arpsXfNmHFF+VQ3
 i314lPYUcbR1V8TxuGuc1lsSvJNFAYIC+S/sIoGNNYCDL0qwvAV/1cHe7rN9XmEeKKxs0DUMC+GbC
 BAeiZAii6CjViOmsr4uvT6gXccz1i/mKuM/2bNC/vtCq6C5ZXRlPfxnDD8Vp0PcepuUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kbLhTAWbV0hQYZfXEOSKfNHLS3V0V2q951LBdSddVs=; b=mZQoIQyvhmXMimfV18ntCoeiiV
 Dgy0k6oYDjMtJ0Yj1XSLnGCLI3mGL920pKuQnQVw+/tZKdIneHNmIeDXVh2E10qqTIVE8Vj3KpLdi
 dnVVhL0M6BkDtwR3qf3B6+nY+QHp91oAoqEzibC2AB9S195/9kav29IoAQ8zHytmEnTQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTQ5N-00GzeT-94
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 12:11:11 +0000
Received: from [192.168.0.101] (unknown [49.77.233.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42F88217D4;
 Wed, 22 May 2019 12:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558527062;
 bh=vqoKaIgIsnl6kmFRLmVywOYGRZkOoiABHpJMvNxtN7M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V39z7Kmimq/m7c/buNPu7L7Zo6mHJZO+B0691idmAhY/rU8rSBXEebXFKkgP6DMai
 ymJEcPVaWdqrtlCOXzCqJr17cq0A5N9wx9OGj/n5YjBxLwQPmyjsC1vvd+AJs6d4i/
 jp1LPja1q756MWXrycKkXJ/7JnVkZPCEiYw+hlbM=
To: Jaegeuk Kim <jaegeuk@kernel.org>, Park Ju Hyung <qkrwngud825@gmail.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
 <20190514063623.57162-3-qkrwngud825@gmail.com>
 <20190521001137.GE61195@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <358ee0ea-02ba-346a-af95-ab949003cb15@kernel.org>
Date: Wed, 22 May 2019 20:10:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190521001137.GE61195@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hTQ5N-00GzeT-94
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: always assume that the device is
 idle under gc_urgent
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-5-21 8:11, Jaegeuk Kim wrote:
> On 05/14, Park Ju Hyung wrote:
>> This allows more aggressive discards and balancing job to be done
>> under gc_urgent.
> 
> Let me merge this first. :)
> 
>>
>> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
