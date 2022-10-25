Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ED460C150
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 03:45:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on90c-0006Ef-2E;
	Tue, 25 Oct 2022 01:45:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1on90a-0006EZ-AV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zU/kYwWCWRp9HAe8vIUGOfw/iY+ojEbd4XZln+SQ50=; b=E4zmea12FNHkLNb6tvLeKxAjZJ
 V7ijuzF0jHCyklVbpV/36uyk/d0cDMFrI3HWwcs+Jrj8lxgd9oLs1s+l7i15zZPIwpuLoQR83d+T1
 Zk6u7DsJ+JL77UeXyKhvwVss4dMboefhozgC9Y/6zGhNwAosZhQNrS4XKYq4zX90QoOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zU/kYwWCWRp9HAe8vIUGOfw/iY+ojEbd4XZln+SQ50=; b=nIUlq13zLs/rh5JNMBcuH82lES
 mv7r/t7ximUiSe/bjpBXPYunzj4bvPdeSjSRRTt0gJj57/tuUim0QRCyQ/WxY+tI9I1f6YhQD/s01
 NUYqxl60zSuaVc5CCySY2V4XDXL+SnqhCYh8C7ZwQeQ40X9S1ZWaZQ4uAMy6IFIDeD7w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on90W-00GGlW-3p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:45:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4D32616CE;
 Tue, 25 Oct 2022 01:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B00C433D6;
 Tue, 25 Oct 2022 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666662326;
 bh=2oFVmjIn9m9WJjC2ZDlPGx0e3SXtjNWV9+Dh/HY/3JY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hG9NROEexa5EbY349L4h8+E4KqEKN0+cn33M8cBVQ4mqKaByQDcXyStZQgfdY0gmt
 5vCIRz9q3ndIm34suz1hQT5p4KAOt3T8UUXzrp982HXZBP7kNPLyZR+no8F2BMcbO2
 u/IbdTzyx2kAVRMvALdem90jSlh+w1q6CUnIKXc5y3oeUwhNVQORvVc9EIq3EqySOi
 ORcqgbdR9cT0xaNhyMyik42YOsIb05v0jW/ktObfxy09DZq7SCMP27IV/JZm6FCn7Z
 D777Z1uVfDn8toJ8F75xjBN58UMkEusrw1ZxpfYKZVM07CVYbCtmZlOBjmwPZ0SRIp
 TpuBjECt7uqjw==
Message-ID: <c2333196-df50-ad98-948f-aed4b83ec7ab@kernel.org>
Date: Tue, 25 Oct 2022 09:45:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221021092435.17124-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221021092435.17124-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/21 17:24, Yangtao Li wrote: > This patch shows
 the discard pend list information: > > Discard pend list(X:exist .:not exist):
 > 0 X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on90W-00GGlW-3p
Subject: Re: [f2fs-dev] [PATCH] f2fs: show more debug info for discard pend
 list
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

On 2022/10/21 17:24, Yangtao Li wrote:
> This patch shows the discard pend list information:
> 
> Discard pend list(X:exist .:not exist):
>    0   X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X X
>    32  X X X X . X X . X X X X X X X X X X X X . X X . X X . X X . X X
>    64  . . X X . X X . . X . . . X X . X . X . X X . X . X X . . . X .
>    96  . X . . . . X . . . . X . . . X X . . . . . . . . . X . . X X .
>    128 . X . . . X . . X X X . . . . . X X X . . X . . . . . . . X . X
>    160 . . X . . . . . X . . . . . . . . . X . . . X X . . . X . X . .
>    192 . . . . . . . . . . . . . . . . X . . . . . . . . . . . . . . .
>    224 . X . . . . X . . X . . . . . . . X . . . . . . . X . . . X . .
>    256 . . . . . . X . . . . . . . . . . . . . . . . . . . . . . . X .
>    288 . . . . . . . . . . X . . . . . . . X . . . . . . . . . . . . .
>    320 . . . . . . X X . . X . . . X X . . . . . . . X . . . . . . . .
>    352 . . . . . X . . . . . . . . . . . . . . X . . . . . . . . X . .
>    384 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . X
>    416 X . . . . X . . . . . . . . . . . . . . . . . . . . . . . . . .
>    448 . . . . . . . . X . . . . . . . . . . . . . . . . X . . . . . .
>    480 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

How about adding this into a procfs entry?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
