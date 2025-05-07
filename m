Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A0AAD2C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 03:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKkgCYl7QDp/mF2HadETYtq9IkDDn2xPx3i9MZ/RBik=; b=HrJAoZk7PKmLae0pXMEU/kE/zL
	H7e35eacDEw5y5v8HmU819r4Jq/rC2STrs86sDglIzb1NbLupUic5GjhGYZYfN7SGQ3ymoZ8qL8h6
	hSkZz6UCehQYDB1fPoyQ07R/esGEMOxyAmQuPN+ZVNVg96C1Z0Dz1by2Pypje+eH9t+0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCTW4-00067z-Cx;
	Wed, 07 May 2025 01:24:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uCTW3-00067s-6c
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 01:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y53Or0ju7IW3r8d/UGisGDsEA5/7L7BTCG1Mu1G2cQs=; b=KW8bec9VfMNsL7RT+1dNVjOxuc
 Qx6gFFd7xESkdL27w0Q56F4DocqJKc3sEvGWWvbnMKOVhrUy1ahWFzU1x0kmLlqOTsyj8waln7hmE
 hTvO0w6oMJcfomCJQbiAhcUYLUrhjrz2TnxYVz1V3SGlrTi83b/xBsPOgrE29jrRW2bI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y53Or0ju7IW3r8d/UGisGDsEA5/7L7BTCG1Mu1G2cQs=; b=cWAjHXmBrvpKLxuIDa7Z5NYWIl
 Yf0u9CQJ+GvtsoHitOac8OUmMoaWaKj7gDDdjUOcBnP0TEbenlhlQ5vCW/zkrfAteBdGU4ded8o/w
 +jggUaFj0dj52b3h3g+o2w1Rxkhibyt/yhgsgUkKkmQ64rbZhyPt3dVa1dqv3k3HMkBE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCTVn-0004Ip-DY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 01:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE4F949C0A;
 Wed,  7 May 2025 01:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC2EC4CEE4;
 Wed,  7 May 2025 01:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746581020;
 bh=F4eggE/XuvmFU6Dzpov5lbcFYVF1XKoy/tEW6B4VUpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BWSCbLO7kICn4t9yIanA0ANkvU/GeY08csO1HjIbMev00UHlhYwxHXSF6mR9hKD1q
 zL47fz8tUvnTBBFnq0aoXz+QUa0XpDvneSQaqWUQDnp2bSMtcJbb91vGtQed1a1Spv
 CDDKNrLOzA5Ojwx6NnVc47Q43ZNl/oUalMsiNbFiSRLKvcxdDQlCRgD3dnfp2ywe+F
 rp01ZSc9HIZc82kTJbe4XbWhiQm0oPmMfiaxG9NoDpJZpPQzt0KMOf9+ofJEr/D6n8
 HjZBCRPe41Td4wK0ILNU+RfUhK2NjHQ/THLKbY/CKz3WRg/EMJbV3MK2gZsvla7Qye
 tGgjpWz1ODIxQ==
Date: Wed, 7 May 2025 01:23:38 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aBq2GrqV9hw5cTyJ@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <aBqq1fQd1YcMAJL6@google.com>
 <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9170e82-a795-4d74-89f5-5c7c9d233978@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/06, Eric Sandeen wrote: > On 5/6/25 7:35 PM, Jaegeuk
 Kim wrote: > > Hmm, I had to drop the series at the moment, since it seems
 needing more > > work to deal with default_options(), which breaks [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCTVn-0004Ip-DY
Subject: Re: [f2fs-dev] [PATCH V3 0/7] f2fs: new mount API conversion
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/06, Eric Sandeen wrote:
> On 5/6/25 7:35 PM, Jaegeuk Kim wrote:
> > Hmm, I had to drop the series at the moment, since it seems needing more
> > work to deal with default_options(), which breaks my device setup.
> > For example, set_opt(sbi, READ_EXTENT_CACHE) in default_options is not propagating
> > to the below logics. In this case, do we need ctx_set_opt() if user doesn't set?
> 
> Hm, can you describe the test or environment that fails for you?
> (I'm afraid that I may not have all the right hardware to test everything,
> so may have missed some cases)
> 
> However, from a quick test here, a loopback mount of an f2fs image file does
> set extent_cache properly, so maybe I don't understand the problem:
> 
> # mount -o loop f2fsfile.img mnt
> # mount | grep -o extent_cache
> extent_cache
> #
> 
> I'm happy to try to look into it though. Maybe you can put the patches
> back on a temporary branch for me to pull and test?

Thank you! I pushed here the last version.

https://github.com/jaegeuk/f2fs/commits/mount/

What about:
# mount -o loop,noextent_cache f2fsfile.img mnt

In this case, 1) ctx_clear_opt(), 2) set_opt() in default_options,
3) clear_opt since mask is set?

And, device_aliasing check is still failing, since it does not understand
test_opt(). Probably it's the only case?

> 
> Thanks,
> - Eric
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
