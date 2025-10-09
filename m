Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6369BC746D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnWx9dvi6TBXKoZhPx9nrBNhyAj2zm4v5BxZwzhVlD0=; b=fSxQRLhadfPl815W05PHocmtoF
	JABMstXdIaBPQEyQI80JLEVAGPkRb0Y8HhTqbLBXP1PkTCMrjLSff0b+CNaQ1EPXd+JzvBk3OW31Q
	1jJqHuQmZuXx/HWohOvc94O0rXJGezQpbvf7XWY9KI4K6PdSHese1X+e0bWoChNfqygQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6h7Y-0007W5-Rl;
	Thu, 09 Oct 2025 03:15:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6h7W-0007Vy-3C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0iPSSKsuakMqEnFClxNqZS8HHC43Nqlq8pIeT9YSGQ=; b=JegbGn08jeaIaPffigiFKRia8x
 TqyDbh1uUbM9mSu+Wk0h7V/RTsJNqVO6nfbNfO4v/zzPW/X/dX3aUIBfI01hXllO00nPV93+oCa9K
 vrHSMtIFjIsJWyX0LdDsFP7uz68fRdaZay9gj/ecXVn9Y5lDeVVSkaL/xmG8fuVfLf5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n0iPSSKsuakMqEnFClxNqZS8HHC43Nqlq8pIeT9YSGQ=; b=Kh9IFVbe3fId/RxnrZMeHMHlbH
 w7SkdtCCC2j0vGBGZMXsdPaxR4C/Ioaz4EWAthVpIuzrjcu9KTevhxUR2Qvxr3WA1dPOzknVKV6BV
 Jzff0eOwP0GO2IHsztS9owzPbrlaTaHbV0FwHvcuLIx6uB5sUxnX0v39SibSxINLvwyo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6h7U-0005Ux-Oq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CCFDA604B9;
 Thu,  9 Oct 2025 03:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E37C4CEE7;
 Thu,  9 Oct 2025 03:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759979697;
 bh=VxdVFeEekQvwsHI+Hcvm/2sBm05P6xZAXuTaVx/1N0c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hM9mxkoW975flQisRAZlmkqpBgOWjTZwdSF+4zz4OIMEstzFrlaFWmXQ6uTS6uYvP
 ZppVAAv5UATPQXu8VO8a27W3vrQtdIFk5o9JpkGD8hjX5Oqz2fqV4HD4O8J2yTnhny
 JMVhy2YHAio7SeCWsKMUlD4InTI/cwwJOxGU03nGMjG2NVKzPPwgKkFz7Da2TT9GV6
 7cGwYOBSAwB/DSfN3/nfZsOMKiRUHKpL+H3+r6UfuZligAs4varKMLwSQS1ygMZtb0
 VRAvBrHKy0zo2N4P35pxp6uwvBgHzb4Q5Toz58CK8tf9LzD+G7tQyv9LD8k7hUtPPm
 uC5nkXUrUnTnQ==
Message-ID: <5f08d6e5-f7f2-4109-89b1-03485516e54e@kernel.org>
Date: Thu, 9 Oct 2025 11:14:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251003224308.1948874-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251003224308.1948874-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/4/2025 6:43 AM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > The current version missed setting one time GC
 for normal zoned GC > cycle. So, valid threshold control is not [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6h7U-0005Ux-Oq
Subject: Re: [f2fs-dev] [PATCH] f2fs: maintain one time GC mode is enabled
 during whole zoned GC cycle
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/4/2025 6:43 AM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The current version missed setting one time GC for normal zoned GC
> cycle. So, valid threshold control is not working. Need to fix it to
> prevent excessive GC for zoned devices.
> 
> Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
