Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024493D0A1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 11:49:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sXHZr-0006m6-3g;
	Fri, 26 Jul 2024 09:49:31 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sXHZp-0006ly-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 09:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixxJF7juTcmO0pBrj3JhM6u7YqVkuD+rGka+gIVkjdQ=; b=J0S/US8vXnrpEhaN5saw9eMWQF
 J+NMDz7IZYq7K+pozmm/IEvcGC+we7cmBED0UAO/bEV7VeW9Adj38kZh32Ej6pdqDRFJnXHvBF1dO
 BY/ekM5fDyDVFtloWGn5hD9AI11y5IyVFFUKaeLcBcwBgRm1x56Tbw6Nn85icXtKnRTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ixxJF7juTcmO0pBrj3JhM6u7YqVkuD+rGka+gIVkjdQ=; b=YlaZAixPsUuKvLmlPUk2NKPSMr
 tIbk7xyKsjsqLASXnssnIFtOUZZ4cZvUNuAUyCb6rYOgAgPU9V6aBUtqviXOupnBUYa7RfGUZ0N96
 XiKdEAOnBruMK6BiaOiuzs2D3Oy3RDJPWNjC3P++QxyqeXbfpTZDX0TaQqGNc3/DSloQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sXHZo-0008Qn-NT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 09:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F19B2CE1751;
 Fri, 26 Jul 2024 09:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1153C4AF07;
 Fri, 26 Jul 2024 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721987356;
 bh=AAUbx8TeBWYEP6Ic4mOlnbercYp2YYgawpoonj8ove4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kjoHjQIdBTBZEAtG/lyrrvZLqmM5byKGZsbI6Zd7uTRJ0UYwni2GTBI/WxoMCmTcD
 BtM5ypdXPlednu6G3uBePlKYUBcN7nlkG1AD4xVIRHXPoslwQBUr11Lb7PU2WwI2U5
 fLB9YWbDuaHgpn3AJkJJZ1qYpXZTeCwGuf8NxfIFBgtUR7A7U1IvIGftfeB5+H9e54
 0o3yOKHWXDkxkcZOirZTcRf3B79f9mqT1WZGeL+n9u6U/zArydBfmXnJ/vbwFG2ec5
 AkrucdiC15BW8HGM9utv57JMo8xuaGzDwdn+RVJmSmgS26Y1DxNeDxRNlbM5NCRBEu
 9d3u5nxhJXz5w==
Message-ID: <a2138acd-9478-4706-85e8-761438382474@kernel.org>
Date: Fri, 26 Jul 2024 17:49:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1721975246-32345-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/26 14:27, Zhiguo Niu wrote: > This is a supplement
 to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes") > for some
 missed cases, also cleanup redundant code in f2fs_llseek. > > Cc: [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sXHZo-0008Qn-NT
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to use per-inode maxbytes and
 cleanup
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/26 14:27, Zhiguo Niu wrote:
> This is a supplement to commit 6d1451bf7f84 ("f2fs: fix to use per-inode maxbytes")
> for some missed cases, also cleanup redundant code in f2fs_llseek.
> 
> Cc: Chengguang Xu <cgxu519@mykernel.net>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
