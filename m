Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4BB705C8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 03:42:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz6As-0007oG-R4;
	Wed, 17 May 2023 01:41:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz6Ar-0007oA-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mBL15OG4btwMAIwoqJ+vgVpLOXS1/6GYdzt5H/XEf4E=; b=j+2J/qNuTYjxEUKTIB1kQYcUeW
 nfD2dymjDVphi4KeNDHJUN3CqMwfODiFaof0IYGYAIfxlQj/fMxz2EZscYpcerbvGAVFMWEZbSOlu
 scdIfNCyxLXOBfbag9pZZ1UFjSlf3SpseTPhroBvNLcvN2p3Cms3HfOis3VG57m0F944=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mBL15OG4btwMAIwoqJ+vgVpLOXS1/6GYdzt5H/XEf4E=; b=FtokRmYj1uu9awzfCiI8GX5Hwx
 3TKvmvYPQot+yCjQRuHe2sX/Vw6AVzSTvow/QhUkDbCgXJNiY18GdyPoTqTg72dGvWUBMutpXBLkP
 ZLsGs42auJ42zVtA7tvH6PAAf2hnO1zjE8HGLL11trd8fov5l0r7FMZqsyG4d3mAgZUA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz6Ar-0007O7-2g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:41:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE0E961935;
 Wed, 17 May 2023 01:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECA1C433D2;
 Wed, 17 May 2023 01:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684287707;
 bh=erTvzO56PRJGbOagUI6tf6K4N2Ka6vbhmI7Zg9jSg/k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jNs6o0YqWaMT/lFmwQsNvudJVc8heA34a6upy/RUnd2oZBqoLipNLh+GB5s3eErZb
 SEaHZs7qycDeSZoVRLviLWepCb0qocvR79RoNFWwtJuj9pbJ8J6BQUtNU96Y6sFb2U
 o7sRQ1F7gpdl0ZZfJ+1c2FLTSYCf4e//qhj5PoYhfTC6x0Hq+s5SywcfBH38hhMIzh
 nfiEZ0N+9h3oB1PBU8qFLCjyU8b363R/vrlkt7o57CbvCscFNjspRmdwc2/HIDJiXC
 /djF4Vrx94iuxwLrdD5PWWLCVt1sCq9MSBevSN4wDsWg6i+6QExTFbwQ05FG+kcKlN
 aaa7MkwEcaYKA==
Message-ID: <5ec503fe-0874-ed56-637c-331e6991dd27@kernel.org>
Date: Wed, 17 May 2023 09:41:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230506114537.49470-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230506114537.49470-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/6 19:45, Yangtao Li wrote: > This patch supports
 a new sub-command 'move_range' in f2fs_io > to move a range of data blocks
 from source file to destination > file via F2FS_IOC_MOVE_RANGE ioc [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz6Ar-0007O7-2g
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: support move_range command
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

On 2023/5/6 19:45, Yangtao Li wrote:
> This patch supports a new sub-command 'move_range' in f2fs_io
> to move a range of data blocks from source file to destination
> file via F2FS_IOC_MOVE_RANGE ioctl.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
