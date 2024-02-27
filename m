Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 494098688DE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 07:09:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reqe6-0002fW-Uw;
	Tue, 27 Feb 2024 06:08:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reqe3-0002fQ-Qa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZTpylAV6C+klQAm8/ckLm9742gv0ACh3ENcKpjl350=; b=PcjJbyfzP8f68nCzogcw2SzmDs
 dYvWHKGhvE+F21EDRG/HhMUkR498tUvG7gMVaxb2AxaBULTofdZoOVgZb7bid/Q8BevjXQ50OX1is
 2xd9ZSlvtkK1SQDE/d7Qm3RPma31csCj7BrLgtaKdKgLCqG7wrmBzGx5El85K0eoHwl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZTpylAV6C+klQAm8/ckLm9742gv0ACh3ENcKpjl350=; b=LoNPZ2jk+DbVwWzyVGhs20Cu0G
 VBGA54XYLP6UeWJe1dqvlpDMfz6WRLEegfZSo4chmen4ZEsjes7BzPsuHjqiNLrskssLbv2xJd52Q
 MLLzgl+7UWDll9m7HFHX3PQEVdqpQOKpDWB2O4Shgg3l6KL9miOSND4hdpwBWcNOAp6w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reqe0-0003uB-0b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 06:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8225561380
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Feb 2024 06:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D443C433F1;
 Tue, 27 Feb 2024 06:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709014117;
 bh=zyZ53bXR7NudODqVYwDdT0UwnIl9wLhNRm6xad5mwF8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=qaq4xH5c7VeCzJjc5mjEH0XkwhczWdFoKePFxbXKp4YGH0th+3DGsEbFmlSEP0JoG
 1JFm2DdfNKc+/+cNNMxfqBbOUPKQbqgavpesyfCD9gkPvhGxG74stgbksDT/gGjTvM
 o8gy5feGCR2wcnbkz6NI/GwiwkrJ8DUKAvVK3PCs+yQY7ipKxqWadvHj7wdAabD1d8
 houexgAywN35U6sDPjTp/l24LuEJF5sLZJqBtD/drFJFwhQMtLH2p+4HHdC9LTwkxe
 7yqcZ185YFUGfQ2cceNVw3+I+7W3f/mHML4Zuf1FgWpsG7IrrELm6G9cheyvLIRA5O
 KccidT5fU3GLQ==
Message-ID: <be97cea3-fb46-4c87-b858-e28f31bfa45c@kernel.org>
Date: Tue, 27 Feb 2024 14:08:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <Zd0bUnFCWmPtwK2u@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Zd0bUnFCWmPtwK2u@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/27 7:14,
 Jaegeuk Kim wrote: > In cfd66bb715fd ("f2fs:
 fix deadloop in foreground GC"), we needed to check > the number of blocks
 in a section instead of the segment. > > Fixes: cfd66bb715fd [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reqe0-0003uB-0b
Subject: Re: [f2fs-dev] [PATCH 1/5 v2] f2fs: check number of blocks in a
 current section
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

On 2024/2/27 7:14, Jaegeuk Kim wrote:
> In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we needed to check
> the number of blocks in a section instead of the segment.
> 
> Fixes: cfd66bb715fd ("f2fs: fix deadloop in foreground GC")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
