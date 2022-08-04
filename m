Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE44589D2C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 16:01:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJbQ3-0004SS-GZ; Thu, 04 Aug 2022 14:01:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oJbQ2-0004SM-9j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 14:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQg/EQamLpkE4FWNNhGh5guN9+ccjDUZynpnzdA06oQ=; b=KH8yNkClm26waIGKakkj48Jmj/
 57qFjKe1a6qu5BXdRMnglSGYMPpeh8z94jetkmdi0c7f88DgCf/1sQmq/gP2N13CNaV8setYOU9mi
 QE8PT0VgNLyrsUjr/jY4eqy4iMENBejzxW59atamjcf+Mku6PZ3LnvjX/3OM9vF8R0EY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQg/EQamLpkE4FWNNhGh5guN9+ccjDUZynpnzdA06oQ=; b=WJ4VMESAnDCnoQ2eG1ogwvnDUf
 4RQJ1SJQX4gZQhp56hN6g3DDrG0tZAASPZ7c9yM4stW/wgzrBFqSpw/Pw/4c6pPCGZyZLSPWKDktk
 d6FmgSXTiffyD+gxKo29IFMegZ1To/sq2O7R/EZP8dedLCp/rOjfWE1Be0UNsRdpZVmM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJbPZ-0008II-1H
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 14:01:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD2E6187D;
 Thu,  4 Aug 2022 14:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04982C433C1;
 Thu,  4 Aug 2022 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659621638;
 bh=44EaSTH/Ox2pXCNNfhFtFnngy0oaJjVTBA7tB7sktt4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OeMZgjZPeoSLlVg9UFMXO6YO/RRo0sivroJY5y36dGrhxhB3Tx3ELVlH0/BauHalh
 HfNYvU6kcPdQce9VivY/L22H0TaUDpGQX5d+iOHc+BnHIGTL4rEi46xOnO1AGWNjS5
 4jStt0n7YGJilT1xkbaWlrSHuycGjI5Sh4RiXLai2vG6U1Fw4/aBXkNB3Px+p/meeX
 5dnQ0g9z3tVDCCRtYTm238nb9d710I6zTfFtfypvIyXN7lrCVDY5CoHlzJLG0CIJuO
 C5xO3XxCkn6HA+xz7DPx2UH9PX71Fd/ErpFTXfuaSTtuxSYTcO6yADr0imnAJu9t3y
 Xt2KQz0UIbejw==
Message-ID: <40c540bc-b74b-1e6f-6135-3ea36f66d5a4@kernel.org>
Date: Thu, 4 Aug 2022 22:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Fengnan Chang <fengnanchang@gmail.com>, jaegeuk@kernel.org
References: <20220731033347.455209-1-fengnanchang@gmail.com>
 <20220731033347.455209-2-fengnanchang@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220731033347.455209-2-fengnanchang@gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/31 11:33,
 Fengnan Chang wrote: > From: Fengnan Chang
 <changfengnan@vivo.com> > > When write total cluster, all pages is uptodate,
 there is not need to call > f2fs_prepare_compress_overwrite, [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJbPZ-0008II-1H
Subject: Re: [f2fs-dev] [PATCH v4 1/3] f2fs: intorduce
 f2fs_all_cluster_page_ready
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/31 11:33, Fengnan Chang wrote:
> From: Fengnan Chang <changfengnan@vivo.com>
> 
> When write total cluster, all pages is uptodate, there is not need to call
> f2fs_prepare_compress_overwrite, intorduce f2fs_all_cluster_page_ready
> to avoid this.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
