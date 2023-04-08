Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C46DB7E6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Apr 2023 03:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkwwv-0006l4-Gs;
	Sat, 08 Apr 2023 01:01:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pkwwu-0006kx-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Apr 2023 01:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0VrHUU9OzbcYt44r+okJ4lfOR9O8jB7eTghyVvUjnVU=; b=Gh8WyWDCKh3VIBvG9vsifVWj5V
 e1Qv2HvqbQFL0vp8EART1rVuTwKUD/sanq7uJB+PpXfoKq1jmnHDjmftzVHph5+on6pEviK5KpOlA
 D5TdCDc0y6Wip6bPvARrLb/6B0Sl1ljefr2K0mDNgtC9bic48zeAH9TGzVFzn++zAmu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0VrHUU9OzbcYt44r+okJ4lfOR9O8jB7eTghyVvUjnVU=; b=d0UZKKSPQtAhUuutachZQrfy7y
 1CvVRbnM3We1y2LwY0wfQI6qSKLbz28GFEjaQv4GUMyoxKar4la+Zv83dRV37PbbR9Qid/RTUltiu
 d88wrWmEmh74oGT3JjqpOP4fq6UPb2obKQ+rtQkKJ0B/5UU+ewKYtfTEEB0QFtH0UQnY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkwwp-000mHr-Q5 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 08 Apr 2023 01:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37BC86541E;
 Sat,  8 Apr 2023 01:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B849EC4339B;
 Sat,  8 Apr 2023 01:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680915646;
 bh=9vLXjx0bZMseT0zJHK4962YmSv0A40msCDS1GhEa2Is=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=crKpCvLiEj8G/fazCQZ0aBerTQL1NSg1GQ9TRDij22IMuf1qnprdhxHJ01FsIAUbC
 x9JsdSJzHUdaj8dERqn1/bYDIQyyml7OHk7KPNWgikcQz1UZPPl70dL4e+xqQG3GId
 k+9xXdSk3tpbrV4OTP84HVJyvA3qxdBetfi297jFav+WhB6G6r/qLv7BWKVTon6lfs
 TmYsEoYEqviaAolI88R5wFiLK3urw9kD+MNfIM04LX92H6S9Z8bblO1V99SbuoxdYv
 kiwIsm7z2vpuCGP4eDRmQ0nvDhil4sUqiw2cZ+WwXF/6kjNHxvYG0S1k/S8ww1YLT9
 sSkRZ97b8IjFw==
Message-ID: <35d38e44-fcac-f19a-7ac0-ad3232bc8e5c@kernel.org>
Date: Sat, 8 Apr 2023 09:00:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230326062128.1423340-1-chao@kernel.org>
 <ZDCCkJiVhvLec9c4@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDCCkJiVhvLec9c4@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/8 4:52, Jaegeuk Kim wrote: >> + if (irq_context)
 > > if (irq_context && !shutdown)? Yes, let me update in v8. Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkwwp-000mHr-Q5
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: support
 errors=remount-ro|continue|panic mountoption
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/8 4:52, Jaegeuk Kim wrote:
>> +		if (irq_context)
> 
> 		if (irq_context && !shutdown)?

Yes, let me update in v8.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
