Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97189407AEE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Sep 2021 01:45:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mPCgi-0004b7-PX; Sat, 11 Sep 2021 23:45:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mPCgh-0004aw-EP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Sep 2021 23:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R9YlOcuzzuAyv3ThEs6dM+K+vfoxM4pDPOUXDaUkkuQ=; b=lo33XyJPik7V10t0jVCPCujusE
 Yp0nBOfRhxzaPceRDV1bogsDAt3ev7bSRvrR3gmOHYvFQLpMFTG6euZ7WYR/nfiH/KPYS7aBrrKie
 ckiOVDlTu/SCthPY0FWonAnBUCHrMJMfrrPb+s9FUXf6Ov+Rv+3J8YmW8CvFZ12Zlokw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R9YlOcuzzuAyv3ThEs6dM+K+vfoxM4pDPOUXDaUkkuQ=; b=gBA23uI4k+VivNy4jS56xORp5i
 NjSmJ/k3bb1hwuLfPz0ur6WvP2x7c9BYvXJuc6VUJMPqbGYGLF7Wrs4bvEVEJay6Vi/pey3t42mgW
 Yh0dXl/SskLoVAs+8d5MLTLpbGlBzITt/2Awn7OikWj46trHhfdWKXd3dWgQjnV3P8EM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mPCgg-007XWa-TA
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Sep 2021 23:45:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4348861212;
 Sat, 11 Sep 2021 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631403929;
 bh=R9YlOcuzzuAyv3ThEs6dM+K+vfoxM4pDPOUXDaUkkuQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q8IxT5dr2TeAtl0aZu9vsQu7yyYT+lIYc6bLY1U+f3wz/r1Rf2Mt4O74l47U5vtZR
 y8BfcUouXX6BQpCQSdVufrX63szUir719LYmXvW/zZ6Jj7Z0NLYjf/SrxFGcTfbntV
 WJXJWOKqHcD0MMoYdjc1bF8M68/JqKouFI4akm3TF9U2TkptrGsT6iGLnMUOQiW9hN
 X12pdJdUSbvmbNUUjhT+FseO5CT58kGVdH1oVCqR9iq/GVHWz7//ilTXP1gdaz175t
 EEvv9HIKSunif+MmTkIbO+S3JDRC/2KxdgQnZK7f5YoUPLIElMRv1VPHWLVsjZM4E9
 On3YM8O4bqFAg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daeho43@gmail.com>
References: <20210902172404.3517626-1-daeho43@gmail.com>
 <YTvmhVhLlBPeASHT@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <9f4a2954-e8c9-abc5-5df4-a7cec53433a3@kernel.org>
Date: Sun, 12 Sep 2021 07:45:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTvmhVhLlBPeASHT@google.com>
Content-Language: en-US
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/11 7:13, Jaegeuk Kim wrote: > Wait. Why do we need
 to add so many options here? I was expecting to see > performance difference
 when getting random segments or random blocks as > an extreme [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
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
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mPCgg-007XWa-TA
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/11 7:13, Jaegeuk Kim wrote:
> Wait. Why do we need to add so many options here? I was expecting to see
> performance difference when getting random segments or random blocks as
> an extreme case. I don't get the point why we need the middle of those cases.

I guess we can simply the aging test procedure of filesystem by changing a bit
based on this patch.

See comments in below thread.

https://lore.kernel.org/lkml/425daf77-8020-26ce-dc9f-019d9a881b78@kernel.org/

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
