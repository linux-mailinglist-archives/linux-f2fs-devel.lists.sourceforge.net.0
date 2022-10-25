Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D460C1ED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 04:51:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onA2l-0002nK-Tx;
	Tue, 25 Oct 2022 02:51:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onA2k-0002nD-3C
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8K7aGlVrTIkSNksNXEF0TAoOdjxtG6XGtVJh9hMb9U=; b=F2fK7Sl3iRk1b4286SxmM2bSHN
 ljsObeoAyArbuk9boXoM92YRsUpceb9VuKulKWAQ0NV3zfugsXBcnyGUPkNjApN3C2rSona9dlJ9k
 hR5vfXKV8ENOYa6/g9SZ5F/k/H9HmOzwJgf2+ClTZR1nFhZlmxtSj7bfYi4rzqCsAWy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8K7aGlVrTIkSNksNXEF0TAoOdjxtG6XGtVJh9hMb9U=; b=DM91jqpTXXcXRV/7wvCyEXxPbP
 XhQLw4/UhQYJ4g6FfbJ3KgpVrfX9K2firA6GfNXAniktwBc+A/5Y4WxKnKtasCuAx0AYImv7LrbV/
 XJRv5uWjvlUzfiypz7LnXRQdziH8yn3fze1B2Rkuk99T6uVJcMmRsBSil1rXdYdE/lag=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onA2f-0000MH-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:51:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEBF7616FE;
 Tue, 25 Oct 2022 02:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7D1C433C1;
 Tue, 25 Oct 2022 02:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666666298;
 bh=7DyQiRYGX5iB56h+VCaUyEKZGSQILTTmtLWCE7ekI1Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O66ZC1UOs3IINrIKW1K/NMPMYa3qZ77OXjOYdQD1MJafjJTQqu2mkAzzpHlC3Qu0H
 aFxedUBT4fcW71hIHgNm0oGKhg7cDLfRTHlmjFhFox1G2FlmcW3zLQYObATzKbOSKR
 SsazqazQPPhjdkaCOqI33FBI/QBeO11GS0xqYE9tXbu39Osud66VVdrD0R1UNhaEJ4
 iRdSR2SCSMX5i2jityCRBRrl3EmEGm8wAVNNjt16mOppuM7/jpEUTGRWmcFC+hn9RZ
 cs/xkbNbY7qWcpOzIK42zzwZAfEHT2tJ9FJdAMxKwoc2rqx+3ld0ew2cle8flSfoVe
 I+NI0Cqcwl5Fw==
Message-ID: <429625d3-ca81-d067-deb7-e9d40725eaf0@kernel.org>
Date: Tue, 25 Oct 2022 10:51:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <dfc051bb-71ca-035c-b945-ad298aa5e1ae@kernel.org>
 <20221025023334.77096-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025023334.77096-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 10:33, Yangtao Li wrote: > Hi Chao, > > What:
 /sys/fs/f2fs/<disk>/gc_idle > Date: July 2013 > Contact: "Namjae Jeon"
 <namjae.jeon@samsung.com>
 > Description: Controls the victim selectio [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onA2f-0000MH-Ql
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_idle sysfs node readable
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

On 2022/10/25 10:33, Yangtao Li wrote:
> Hi Chao,
> 
> What:       /sys/fs/f2fs/<disk>/gc_idle
> Date:       July 2013
> Contact:    "Namjae Jeon" <namjae.jeon@samsung.com>
> Description:    Controls the victim selection policy for garbage collection.
>          Setting gc_idle = 0(default) will disable this option. Setting:
> 
>          ===========  ===============================================
>          gc_idle = 1  will select the Cost Benefit approach & setting
>          gc_idle = 2  will select the greedy approach & setting
>          gc_idle = 3  will select the age-threshold based approach.
>          ===========  ===============================================
> 
>  From the kernel documentation, this node only describes the writing of
> the value, and does not describe the reading of the value.

  If the value is used by userspace program, after the change, it will break
userspace.

> 
> Actually, this modification does the same thing as commit e60aeb2dee1a
> ("f2fs: make gc_urgent and gc_segment_mode sysfs node readabl").
> I understand it is an addition to the omission of the patch above.
> 
> Why gc_urgent and gc_segment_mode can be modified to string, but gc_idle
> breaks forward compatibility?

Oops, I guess that patch may have caused a regression...if there is any
user..

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
