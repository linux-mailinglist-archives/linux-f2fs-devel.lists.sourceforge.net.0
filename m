Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2B64AD46
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 02:42:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4uJ5-0005n9-P4;
	Tue, 13 Dec 2022 01:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4uJ3-0005n3-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bLSFQT8QEk6qk9SHziJBMPL7AUqT5AlaD7K51Cl0nMs=; b=P60BkPdVDvEYPgcVLg38oiyKCm
 ge1mMJ5D8GMd0ozpZoMnYS1FRSZi1IVOgsXAiQruWyHTY4Jf89EFP8MM4CnS/bmCsn3Tc14dZKRMZ
 zsC1IXNBF3Nayjnuu9C6JNl8ioCXY1KHclZI/doM4b58daP8zKErBwd2LL2XeF4X+mWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bLSFQT8QEk6qk9SHziJBMPL7AUqT5AlaD7K51Cl0nMs=; b=fG1pywl/uIgQz6mtMSAFImElj6
 x6J7JHWUpU74cavX4QjlZNxzB1dV6rBI7uTuvrvxDVBZLZf0/Wf3Ev3XsHs1BWP3gaGle6kwxaa3+
 9/e3SSEE6SfWDaandJfziO0PmcLHh6A8dIwvfwiWHycgX6POXGzY+bNF3dnbI5Wrc7AQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4uJ2-00FIP1-Ig for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:42:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CE8AECE134C;
 Tue, 13 Dec 2022 01:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ABBC433D2;
 Tue, 13 Dec 2022 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670895713;
 bh=iBJ1gFaWA6XHrDu7utx1m9eYCwImkczuDB8uIaGi7GM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PxrfqvszjiwvDrdf+9C7gHgtSp7EDjv+WkbrNIaKfYvpQ7/BDg3l01uPJWUzYqlKY
 Yn+xL2ufpvWSL6S/UFtu9TevZHVlzPuGoPH/aXcJxxfFm+syVauSOwoMn7zZ7Gy0gK
 BgGljCNtPomAKxSFF8m8SmSNWoVvJfw+TXTODGuVHGL6B21QW+CDNrWeft39xpdv7Z
 OstILjVYzV6Imr7u3PyyTIlF7796E6oIhvrHsNHfOqaMt1kDHQe4IFPopuV9TwD700
 BqAOHw4iOT+HkaMe+KpgommwOM2vmePotbgc0VYrkrzmEKKoexU3dmZXztF61ZkBAI
 T/ShPItVlRG7A==
Date: Mon, 12 Dec 2022 17:41:51 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y5fYXwWu91cxskFj@google.com>
References: <974f5013-b6af-a39e-0b0f-2ce86253eaeb@kernel.org>
 <20221212141429.6329-1-frank.li@vivo.com>
 <2f100a4a-592d-f098-b204-efeef58341ee@kernel.org>
 <Y5evHVvzGC/8lMfK@google.com>
 <a364cb12-3241-50a7-fdd5-323825d0a911@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a364cb12-3241-50a7-fdd5-323825d0a911@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/13, Chao Yu wrote: > On 2022/12/13 6:45, Jaegeuk Kim
 wrote: > > On 12/12, Chao Yu wrote: > > > On 2022/12/12 22:14, Yangtao Li
 wrote: > > > > Hi Chao, > > > > > > > > > The difference here is, i [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4uJ2-00FIP1-Ig
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't call
 f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/13, Chao Yu wrote:
> On 2022/12/13 6:45, Jaegeuk Kim wrote:
> > On 12/12, Chao Yu wrote:
> > > On 2022/12/12 22:14, Yangtao Li wrote:
> > > > Hi Chao,
> > > > 
> > > > > The difference here is, if we use f2fs_realtime_discard_enable() in
> > > > > f2fs_put_super(), we will only write checkpoint w/ CP_TRIMMED flag
> > > > > when discard option is enable and device supports discard.
> > > > 
> > > > > But actually, if discard option is disabled, we still needs to give
> > > > > put_super() a chance to write checkpoint w/ CP_TRIMMED flag.
> > > > 
> > > > Why do we still have to set the CP_TRIMMED flag when the discard opt is not set.
> > > > Did I miss something?
> > > 
> > > Hi Yangtao,
> > > 
> > > I guess it's up to scenario. e.g.
> > > 
> > > mount w/ nodiscard and use FITRIM to trigger in-batch discard,
> > > if we set CP_TRIMMED flag during umount, next time, after mount
> > > w/ discard, it doesn't to issue redundant discard.
> > 
> > If fitrim was called with a range, we can get a wrong FI_TRIMMED flag. Isn't it
> 
> We can set CP_TRIMMED flag only if fitrim was called on full range w/ 4k granularity,
> due to it will check sbi->discard_blks variable to make sure there is no range we
> haven't trimmed.
> 
> > better to get a full discard range after remount even though some are redundant?
> 
> If nodiscard is set, and sbi->discard_blks becomes zero, it says a full range fitrim
> was been triggered.

That gives another assumption, and I prefer to make it simple.

> 
> So, previous check condition has no problem, right?
> 
> 	if ((f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi)) &&
> 					!sbi->discard_blks && !dropped) {
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > Thx,
> > > > Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
