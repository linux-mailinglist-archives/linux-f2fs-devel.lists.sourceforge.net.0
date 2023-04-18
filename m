Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 433206E68AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 17:51:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poncH-000762-Tz;
	Tue, 18 Apr 2023 15:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1poncG-00075w-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 15:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u5RLL63zoNr1Ao3qJAlZuq/ukOLRacNO3JV45K3S11s=; b=LRu0wgpC3Yg/J/vPq7wG7D5r6t
 vVedqZtA2gQwo1TQok287AIleXwNFrhhNddOo8tc85fs8+wy5RQ3OnGsZ4X+VCRKGwDjEAP08G+XN
 r3qFnwaV1FdT33v4k0zIKu+qGDEz6QZegM5CYTIggSWUkXRtnJbd2OBFZa/2j09kgUDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u5RLL63zoNr1Ao3qJAlZuq/ukOLRacNO3JV45K3S11s=; b=Bw7ewA1AKOF6Q2y8Juj/X9dhUs
 Y4BFp5na5S+d41CJ98wBQDS9wJb08Nb+5OcQRlfGUbpCpAYfyaolcKye9QYyLQGztC6IU9EksNfmR
 5Aj7U5RhZaqmvI3OLmBBPycMuMIHrQN+ofPrkWN9fhD0wDvPrK8aiQPKisvfirX64PsE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poncE-0006Rq-OV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 15:51:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 664C16360F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Apr 2023 15:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236AEC433D2;
 Tue, 18 Apr 2023 15:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681833088;
 bh=cjoNEFKJsnxGn9jI3vfiGlvd+QKFEzWm+NTDrFboZxo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ALTkAZNELep2uIbFTjqID1ZplV3k8EnH5AfFc3Yoy1V6FtNka2qHFsRcqxjamQL5f
 RuqAnvDIZwjTNa+NMwc609odY8AzsWUqf5sQG9XR/DmvqySSAJMauZ8ztp0drxebGq
 7a+F9wi9gVrxB+G3oSe/7NcwJ0HxoD0CjDCRa5kBjbrZkMsCxEi4VFTWnL+5Xjl7yt
 27JtiTtpwTcS55mPZg2uBzWEo5+CkrJpzW6r8oCvOSwPB/Fzve8v9isdui2JhiZLat
 H163dxTlUJFbZexf0CTnIiZBzXZLTJLcXR8TwMDyFNWb0wKZk2g11RLY4jrGf2Snkr
 z0hAiBmNFA5MQ==
Message-ID: <2ad8e637-6914-2d3e-3cfa-5f0f7f5ccaea@kernel.org>
Date: Tue, 18 Apr 2023 23:51:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCyZGgf4RSEjyHTF@google.com>
 <a4e49177-3959-eb2b-996c-5d07b7390495@kernel.org>
 <ZC2aA+i5+HpdJ6M2@google.com>
 <f4ae2b3a-0aff-8941-4081-9dc53334c590@kernel.org>
 <ZDSaCsLSYLyzUxBQ@google.com>
 <6c9abd05-297a-ea4f-fd5c-9f4d9fb488ab@kernel.org>
 <ZDgmGoWx2bHNO1zP@google.com> <ZDgmvf6O488GG7tH@google.com>
 <ZDhXNMkgnmjccIhF@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZDhXNMkgnmjccIhF@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/14 3:25,
 Jaegeuk Kim wrote: > Fixed a xfstests failure.
 > > From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00 2001
 > From: Jaegeuk Kim <jaegeuk@kernel.org> > Date: Mon, 10 Ap [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poncE-0006Rq-OV
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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

On 2023/4/14 3:25, Jaegeuk Kim wrote:
> Fixed a xfstests failure.
> 
>  From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Mon, 10 Apr 2023 14:48:50 -0700
> Subject: [PATCH] f2fs: refactor f2fs_gc to call checkpoint in urgent condition
> 
> The major change is to call checkpoint, if there's not enough space while having
> some prefree segments in FG_GC case.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
