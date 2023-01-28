Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C4D67F552
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 07:53:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLf59-0001N5-3h;
	Sat, 28 Jan 2023 06:52:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLf58-0001Mz-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 06:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUaqzQgYKSNiKwuoaTeOdUMrUFdw4GPkszHSN7yxW/8=; b=RrAQgR5I9tTpk+vrcmz1qS8aIf
 RBztUCsFEvyQrSGTOXCRuljqNi/r8YqPaLW8Z4cgXxgdYNwrgR6inSmsrsIITM6xFFA/7BfH40m96
 6+WoMgIRTLw8LAObcFypVM1FhQarqoBu4Kx61r4bGzGCmJC3tkBJmUPxQuEmvxZl2fuU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUaqzQgYKSNiKwuoaTeOdUMrUFdw4GPkszHSN7yxW/8=; b=eZ8q2h3GGrBstVgflmRYA11Uvq
 hQa5fYxRkgYW4AfBAQBNxl358j5Pd+DqbwWN4k0At6DfSrbd0XNNqQxJxVysxfwWSL9H/NPxF5ebO
 5kRSCDVV0MNFqIT5Z1xY+k+FtTKrOx5eloQO66yCariAfa3ORpEiuOX9meZwKHNCqxnQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLf56-001Q71-SM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 06:52:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FBC8600BE;
 Sat, 28 Jan 2023 06:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406D1C433D2;
 Sat, 28 Jan 2023 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674888769;
 bh=moCmHtP6WNEhW3voaGVZN+oBQpsMfXGYlro+vQJN4FU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VegJ0q314axePk3BRR0facAsmCUuptbrASXuZL/NUmfkRjTxzOqA2hTNX+MNkI5rm
 tZdVBXUYBo8ZpReTiPcV5SQYDQQXZhqEh28zh+fDuGbuVu5JYZYxoHjlpe58spZBfC
 Qhb84+Ov3I3LXzCMQsxdTxJGVbMc+qmA607QabgTigxiv6s5Ei6f44jtIY4b0+1DvM
 EEx3JcnhTFunAmE2m7mo1ahnVFc7u2cVUNATSASnySHPBrTHry1XTWSqYBlumBE/XG
 0PgStTI3DzIIBsAniUYTsjV2N4wOGYgrkR5JaO0yYabs7rCMrv14eN5Crrf5mTiWtb
 LtF1eecbVM18Q==
Message-ID: <7a1dda12-7c86-d5fb-4875-19b28bb786e4@kernel.org>
Date: Sat, 28 Jan 2023 14:52:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230112133443.16713-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230112133443.16713-1-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/12 21:34, Yangtao Li wrote: > commit 3fde13f817e2
 ("f2fs: compress: support compress level") introduce > compress level, which
 macro(COMPRESS_LEVEL_OFFSET) is 8, But use wrong > comment abou [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLf56-001Q71-SM
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clarify compress level bit offset
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

On 2023/1/12 21:34, Yangtao Li wrote:
> commit 3fde13f817e2 ("f2fs: compress: support compress level") introduce
> compress level, which macro(COMPRESS_LEVEL_OFFSET) is 8, But use wrong
> comment about compress level.
> 
> Let's fix it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
