Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AE93A2EDD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jun 2021 17:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrMB8-0002QO-O4; Thu, 10 Jun 2021 15:01:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lrMB8-0002QI-2y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 15:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3y1uOT68vrgdKOS8GjsBScOsyQHjWE8vTtwgasjaWw0=; b=kkc/WXSmzYugXf+QQrQUf+XIj+
 TfJZ2nHoWuKQb2f+vkvjrLIsBjaqfGSgxlqCYuHDpdU5G+VHiAplp8uEtF6rGkiBzUjx/07Sw28s0
 DqE+Kj77tZJsZnZxCo/+XcZJGgysvmrxhMNpQWPKc7vV/gsSEJPU1B1I29kcC/sC0oCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3y1uOT68vrgdKOS8GjsBScOsyQHjWE8vTtwgasjaWw0=; b=eDidciNbA6/FJHPNDP5/ct4/2H
 t+b06SEsP+dymfbT9zUIm9haUBqvpAL7qq2iZQZjSUQd0Zu15NO1+Kxk0LTdSEX29tOElQ+UeQmnj
 HR/JNcoZPbyUhc24UjG/uHmoZ+Uq8QRikn+xR+IXkta4Pv+HhAR4neMlLXzepdx0DGlA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lrMB0-0001oa-NN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 15:01:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7452D610A7;
 Thu, 10 Jun 2021 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623337251;
 bh=wozgixq7baMQaX7zrRbfTIyBXN/uF7O+PeGlX9wdYbY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o/DOYe4NzSe5YXAE96Gh24erJZMo7sWYmIwikpZNa2mJ75SmQbFdFGceqI+72fjoC
 EEh9T9ag3L0d1eqIBiusVpsbRme0+BaKG5jRWeAgnjiNKTtOZ8Ahlckl+bwY6MVGgM
 zLnu2J7VajMBQaIVXAkz93zYJtpY6y2nbN9lhJkOffYTQdYlm6WUd/NfJvbHAj0Nuk
 IHgCQ3cYRVqvI9qHNPA0FbiSVX/t1vG2N17GyJFTpQDAX10YXJjgfKeNr2r3Tf0k7y
 94fUCBXptqgkkjjaLJRWlgX5JFjv9iEsOSQUaMLZxiwzQZRkapKeXYZsaGlPwW95Vb
 dY0gvI1Led7iw==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210525205138.2512855-1-jaegeuk@kernel.org>
 <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
 <YL5Oth8oKnV7h8Pm@google.com>
 <53531f1e-7232-df4d-3a43-43db0e8581f1@kernel.org>
 <YMELoAH7T5b5HLhm@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <fec816fb-a4c9-0e65-5f09-8c9fdae73c87@kernel.org>
Date: Thu, 10 Jun 2021 23:00:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMELoAH7T5b5HLhm@google.com>
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
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lrMB0-0001oa-NN
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED
 instead of IMMUTABLE bit
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

On 2021/6/10 2:42, Jaegeuk Kim wrote:
> On 06/08, Chao Yu wrote:
>> On 2021/6/8 0:52, Jaegeuk Kim wrote:
>>> On 06/06, Chao Yu wrote:
>>>> On 2021/5/26 4:51, Jaegeuk Kim wrote:
>>>>> Let's use F2FS_COMPRESS_RELEASED to disallow writes only.
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>
>>>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>>
>>> Too late, as I published it in master.
>>
>> Oops, sorry for the delay.
>>
>> So does the patch "f2fs-tools: support small RO partition"?
> 
> sload.f2fs: use F2FS_COMPRESS_RELEASED instead of IMMUTABLE bit

Oh, I mean does patch "f2fs-tools: support small RO partition" be
pushed as well? if so, seems I don't need to reply with the
reviewed-by flag.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
