Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E2872C84
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Mar 2024 03:03:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rhgcU-0007fK-19;
	Wed, 06 Mar 2024 02:02:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rhgcS-0007fD-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2l4GQoBXuMY3m6xncUjZG2bfjOR1AQDRcBHenZ0nP6k=; b=bWDgtcWiNru8rVBpx1oal2LtT0
 M/KY+jQWsYgFhLI/pZeiK4iTkMiAVkC0M69ZixdWdZp87UWPsOvQ+RozufK6bi7RircJugb0isMEG
 cFVRjoPAVdThnu5nei5/yyDM7cPRy2Uz1ibwHCEuTRsuWdxCTqr0XVQJFSqduxCaz/lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2l4GQoBXuMY3m6xncUjZG2bfjOR1AQDRcBHenZ0nP6k=; b=VSk2Lh9w1zxSjID5Yr1GXBPrk7
 qjpS5HmO549bD2W3yVEWw+CQrhnoVm5scPthADpvfP9ajwI40FjqnSMQEf7XpqFFb0iGUTwOhjaJt
 iMEoW3GFdrnl2bfzxpzutA5LyyrVYnR3vN5yACSkqORoGjzHPeZYupfRREUlgYaPPW98=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rhgcM-0006Nm-AY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Mar 2024 02:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BC209CE20B4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  6 Mar 2024 02:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FD1C433C7;
 Wed,  6 Mar 2024 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709690564;
 bh=zLmRQZT2psM4oP63UO8fehCjhuvQc+CNBeJgKOl1FOc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fFr+hdJ9tRBa//cNIjLXzoDKrOmsp2/IF+1J7sdZikk0Ev+Lw33A8Rwq3kzUsf8Ek
 cZ9NOh0SI6tEIxRFxuslQ19O66m6QgfrVzo6iHtjQJ3M1vEBBu2r8aIxgwxs75fkj/
 8hVGnYUkU99+9W+xX5xlAfGejiBLh2EWZsJRT6Ijd9munfbiftOCEd+Nk+p7smCUkb
 q5Kt67nYkpcCCYVIs4fc8K4lL+HR0Na99bFLIxJkM9UYnpWSDLw2xN9b1+3XezH5LI
 H0C06/q62xNacDxQTTpQ4RrKj2vG5BLo4kAz5VteFmDPfPr5AG5J4mUlTaHABWFF5Z
 fUKd6LAUprNZA==
Message-ID: <f0c2b89e-20a6-497e-946a-eabe1101d778@kernel.org>
Date: Wed, 6 Mar 2024 10:02:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20240305204834.101697-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240305204834.101697-1-jaegeuk@kernel.org>
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/6 4:48,
 Jaegeuk Kim wrote: > This fixes some android
 build failures due to the missing permission when > checking the loop device.
 Until we get a better solution, let's ignore > the error wi [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rhgcM-0006Nm-AY
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: deal with permission denial on
 non-root user
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/6 4:48, Jaegeuk Kim wrote:
> This fixes some android build failures due to the missing permission when
> checking the loop device. Until we get a better solution, let's ignore
> the error with warnings.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
