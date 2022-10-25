Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097F60C54A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:34:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onERu-00046Q-SP;
	Tue, 25 Oct 2022 07:34:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onERu-00046K-3L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ehi+LvsD9YUDzqPNOcSLLhdfiTtrCCKmSx1ajcATEyY=; b=IXzgi5qyb2K87Ki8FdSSlmsXkt
 yXodBEu7oyGp8tqoMhlb2PoqeRXA+BHav86QLXDndFau4jZ7yBUVfcTJ/0G1S3oYMO7fAcZBaLncv
 84Y/gUjoU6R1U9ttV3DMzD1BYDmtUlaNRTJ7+ADE5wUbdz94UA6ixTJlA7pnXDFF7b1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ehi+LvsD9YUDzqPNOcSLLhdfiTtrCCKmSx1ajcATEyY=; b=m2wETP8NCrVnKJifbrzD6ejveZ
 WTJ+dyf2O5pbtI9hyWZd1lpoAXP0PP+PFJaZaO9uxBpbhLuqaEIQyWV+8U+1wAElbUfgCcHHwnQk/
 xzxG6CMMVZg7sTEcTjURO/rtJoqjyR6mcBuSNo7H69aTzkQH+Dzlfey5legG2kvSJVKY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onERt-00GcWc-JR for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:34:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37457617B6;
 Tue, 25 Oct 2022 07:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9BFC433C1;
 Tue, 25 Oct 2022 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666683243;
 bh=NcRaNLmBZOsJOGIc24y8WcRzr4vKPzeQM9yCUXgw2n4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UbBtBHL84PpfTDG2QTFSgIKReaZiBNj0KWsHDbn0nYUxeEQcLRDeboq7qyiuDcE6K
 QapIbFjKuNwJwkUfoWO1Az1MBvAPtEWTaN7exsnjNJkdyu/1J9/jOjfMEVGr2JujIp
 ybZdVZFAPnwdnJLQujtaKz5r1jwDgjX67PV1CYbR80d3z2Ez/Du3zHzZlAtZ4hWtEQ
 lzV1Uv+KzyPjBgfJW53cmRiT3nXViKsIKFTlkjl/Zqcyk9Eq26zhqPpfO/1FbJhH6/
 X2ji6qFTJzExLDPgvAHdk/XzEWFc5D5Bm7UpZJKRoflp6JzExdcG2JDfTEukKXhIxe
 YbDLH14/4w7JQ==
Message-ID: <a5744cfc-8c00-02bb-8518-6e86380557c4@kernel.org>
Date: Tue, 25 Oct 2022 15:33:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025065025.35017-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025065025.35017-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 14:50, Yangtao Li wrote: > Under the current
 logic, when gc_urgent_high_remaining is set to 1, > the mode will be switched
 to normal at the beginning, instead of > running in gc_urgent m [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onERt-00GcWc-JR
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix gc mode when
 gc_urgent_high_remaining is 1
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

On 2022/10/25 14:50, Yangtao Li wrote:
> Under the current logic, when gc_urgent_high_remaining is set to 1,
> the mode will be switched to normal at the beginning, instead of
> running in gc_urgent mode.
> 
> Let's switch the gc mode back to normal when the gc ends.
> 
> Fixes: 265576181b4a ("f2fs: remove gc_urgent_high_limited for cleanup")
> 

Unneeded empty line here, it's trivial though...

> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
