Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94275B1DFFA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 02:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rhs6NzzZ3auxP6UuXKsRC1RI/51D+f3XyKZFI58QHQ=; b=eKRs4ba6fnSTMyu3QAyS+q1Oeg
	XMrl3dcYi1I2S4NN+pBOLlhdc00usVn27qL1BaBQxSdVobsOclPDvTcB5WVIiKjcL47qRdeoLtNOq
	7JOlA4vIVmApXPrUt0NXj95E7GGySFsqfZ5x+Uf36Q7KqI+nxRD9i0YfuSd8tQuGcc7c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukBAb-0000el-5l;
	Fri, 08 Aug 2025 00:41:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukBAZ-0000eV-Ic
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 00:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uaRwVN9RtgFy7E7q/ULMyjiaYddnVMEDgj3pVenHKVc=; b=ccs6eAIscLTWPT9oX9eKvoiGRH
 FGjR3JY+ODo9WBK1rBpN/lsNHQm5Rgx7XnuQTf25y9pa8lpGmqw5sW8HEglyrsU46A1DVRbo3OYgy
 6HpErAhngiNdO5gi8/E4OFNzsTpe4RB8na+psw03aq744IUbipYwSFWh/c9pHoLb3rUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uaRwVN9RtgFy7E7q/ULMyjiaYddnVMEDgj3pVenHKVc=; b=XirGQZelOlFcD6dUhpl1hX60RF
 vYw8hyLshH2rozkqrTyRMzuU2poUhkPJHZOiE5iCNmyEwdbDOzWWu+GG7aZcYyQJmKzWUdOZsXcWy
 EhIDI4CmKpxnFOkW10+SCRNiFD0qoazb5zXEGaK8orrkxe2XqMhBA13ksg6l4uhs4Pv4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukBAZ-0001uM-4k for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 00:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEED45C594E;
 Fri,  8 Aug 2025 00:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924AEC4CEEB;
 Fri,  8 Aug 2025 00:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754613664;
 bh=Y/UZhbO3jCl/I0AE4sOModnYvbCVGZq3rcVehhzkitw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nVjHkbJZP5JHdyANoCqCRjpow+Qxe72ptb8GkmNz48zztOKzraDaz/ytoJ3ZYO09T
 RPH8k2XDRLbYQSM6cbG8yZdZ0FZFaxc5I7EMvj+zVZHnBJ+SmQFDU5FpFccF2LIMWJ
 dbH41xn5t21sg9huq5C63AjYFSFuykjSP6D6ZamdD7ieWQiBk6X/McGuHhbzMR4Li8
 T0HgymwKMOioU/j2zTJbhuwckhmh2My/xDmoQNWicHBhLLJCaqGM4Lyvsa3uviiO+x
 VzQfAk055iwDgDweqM2fMrjGPvoVyfaEpR7VpPBDo+M+/0eEqpvKAymeyzgm3fHQKT
 aTzH9zQ54oEkA==
Message-ID: <ed6bbd87-3be1-4963-ac81-68ea9a150a66@kernel.org>
Date: Fri, 8 Aug 2025 08:41:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Xiaojun <wangxiaojun@vivo.com>, jaegeuk@kernel.org
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
Content-Language: en-US
In-Reply-To: <20250807084442.422751-1-wangxiaojun@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/7 16:44, Wang Xiaojun wrote: > This patch fixes
 missing space reclamation during the recovery process. > In the following
 scenarios, F2FS cannot reclaim truncated space. > case 1: > write fi [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukBAZ-0001uM-4k
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/8/7 16:44, Wang Xiaojun wrote:
> This patch fixes missing space reclamation during the recovery process.
> In the following scenarios, F2FS cannot reclaim truncated space.
> case 1:
> write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO
> 
> case 2:
> CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO
> 
> During the recovery process, F2FS will recover file A,
> but the 1M-1G space cannot be reclaimed.
> 
> Fixes: d624c96fb3249 ("f2fs: add recovery routines for roll-forward")
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
