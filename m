Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79E92F64B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 09:33:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sSAmi-0004Rp-CF;
	Fri, 12 Jul 2024 07:33:40 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sSAmg-0004Rh-Os
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aNLzgOYLXAIuzD7FMx1zwXyE1R4lGbm8dqVNd1AWtrs=; b=CKHxmCg19tSySyHyBz4w/I6nK+
 5WXucU++irsdT4b7Bp+QRVBP8lxshjJ9EkjgKnZVoyurVySB3BgptkUEFB+Qli5PJ5gnsrVGbR41y
 LRCwbzF+vp5xoP7dkBwU++IKYBv8mObZyOxcnH06rD/ATrtM708jYbIQF6mefeufqTlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aNLzgOYLXAIuzD7FMx1zwXyE1R4lGbm8dqVNd1AWtrs=; b=hz/yrcqM1IzoJYE6Hpw0M6CqbS
 eVN+aI+2YE+AhlLBd+7tSnkftG0ubS7aWT3Ta8UkWa1jGPlpqp5/jpV3+vrs4KhVZ+uDvPClXJqsN
 nFpr+PBBMb1khSiQobR0lgAS2l6oKpJ8siy6rOdSbUv+8go9xwSgl1ajEtpnWO3fVefo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sSAmh-0005bh-Bx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 07:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 41CF361E56;
 Fri, 12 Jul 2024 07:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34532C3277B;
 Fri, 12 Jul 2024 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720769607;
 bh=A+AECDdN44hSn3L3+HKGSnAHvCrCo8EaQ1/VV7oEklo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RnqDs9L+JI5/FuRYNvZEQ3Accw0oRfJKFt4eRdx46kIA4ngemCWsE0pgRo/jAQjor
 udGnLANQHGNShjN4JkrYZ3zQMMOYOZZwzd4Gb2hbAPiy3+WKZEsozYXj7UF/Q22Q6v
 2ceC+1eLtftkcqvVK6O+QwDFp2UYpzRgXdIFfxlDaFhT1UpqbEO8MspkCYQgB90NlW
 0/Djb5JBkzmK+S8FX4lpnUgX8cSNdJ3ztt+rBeSEZPWb04Y3+jq3IiGyVXTDnARJCk
 icQ4sNQjlZTz82qDZRk0kucVl2S/LDQCmvoUHMoiD4zkjI8mLh6QoFw4GgyfE9YPoC
 jQXZu9WvmWrPQ==
Message-ID: <d35ef4d4-22ae-46ef-885d-7e9aa674deb1@kernel.org>
Date: Fri, 12 Jul 2024 15:33:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240712020133.140148-1-shengyong@oppo.com>
 <20240712020133.140148-5-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240712020133.140148-5-shengyong@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/12 10:01,
 Sheng Yong wrote: > If a superblock failed
 in sanity check, it should be fixed. This patch > add a new state `sb_invalid'
 to tell fsck needs to update superblock > at the end of al [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sSAmh-0005bh-Bx
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: update superblock if invalid
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

On 2024/7/12 10:01, Sheng Yong wrote:
> If a superblock failed in sanity check, it should be fixed. This patch
> add a new state `sb_invalid' to tell fsck needs to update superblock
> at the end of all checkings.
> 
> This patch also cleans up force_stop, abnormal_stop, fs_errors and
> sb_invalid by merging them into an `invalid_sb' flags, and each of
> them is indicated using one bit.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
