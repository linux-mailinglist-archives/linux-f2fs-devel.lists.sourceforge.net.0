Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7248C649BFD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 11:23:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4fxw-0004Vl-7M;
	Mon, 12 Dec 2022 10:23:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4fxq-0004VD-Lh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 10:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZkzRg4u725kPYHWW9hJ6hM/nk88CRoqJl3MqMvbMeys=; b=cLEAxulvBR4kLEcWDtJzBPssJe
 o9dE2kdpgfyjHLunLAB+Rk+9/0GSoqRqRbetkfLUKXxqw1ze6YPGcstNfH4TmyYENcYDok1oMj6ip
 T499K1tkgsoORvCDABQrPcQYsGQC9E9O9k0Cip74qv2F8CIJSeJKFYTLe+pPjgD4tfSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZkzRg4u725kPYHWW9hJ6hM/nk88CRoqJl3MqMvbMeys=; b=GuIulSyKopuS/WJ7TI6YiSv4+k
 ccxl0XGG014ksDvwFdHXg5qC6Vm7XqcwZHzNK+0j8UQRe2nmKKc4hDwYg1N7z6Xrp7RO1E7HiGMlC
 uYqz0enwxvKdxaCKYjRNRpDyFxLkqRScatgbWJVrcMj/6FvtRTeUYQgJNEApOPs32dZc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4fxo-0003g0-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 10:23:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F4B860F93;
 Mon, 12 Dec 2022 10:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EDAC433EF;
 Mon, 12 Dec 2022 10:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670840586;
 bh=eaA9Ecx2vK5nM7LogognJdRgdhZwRl/7vGOtUmN82A8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kU0gy2TKFN6jg5sLVps40wqHVutxGRXqfBqb/rLzTqgUHBOtXVqqnMpO+V55hJlSr
 ouAwqDsMgVDYVERAh4gJwKBLTcLnkVdt+4MnM/coe5p+s2y3JRZbqeCMCYYuBujDaJ
 P0GeeJqVfI2ogYRoOYtgGdQvxJ2tuPuV0JVRyh0015S4tcbUFw9mXqWdjaVmbEOWC/
 Gc0MtMQiKXOvDU1hE/QlQoI0EJSyntXHZGyK2pz70//F/TmrEPMF02nUBBpEu3y9aR
 pgK8RNKB0Hyr6C6osHJ3Xzcz7VfeAe4X0rSJKw32QBxBqMatjoppyrvxg0CmwQ8/0j
 l6cEXMIgFrWuA==
Message-ID: <5cc534fc-1192-887a-91e1-2f1c2283b212@kernel.org>
Date: Mon, 12 Dec 2022 18:23:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221212054706.65579-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221212054706.65579-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/12 13:47, Yangtao Li wrote: > Just like other data
 we count uses the number of bytes as the basic > unit, but discard uses the
 number of cmds as the statistical unit. In > fact, the discard [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4fxo-0003g0-SZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: add iostat support for FS_DISCARD_IO
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

On 2022/12/12 13:47, Yangtao Li wrote:
> Just like other data we count uses the number of bytes as the basic
> unit, but discard uses the number of cmds as the statistical unit. In
> fact, the discard command contains the number of blocks. In order to
> avoid breaking its usage of application, let's keeping FS_DISCARD
> as it is, and add FS_DISCARD_IO to account discard bytes.
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
