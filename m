Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3A8D33CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 11:57:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCG42-0007t2-LX;
	Wed, 29 May 2024 09:57:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCG41-0007sq-Cx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 09:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dULGHIJA2ySiW/+NDqhJaTVkfHHpiB74jz924iY4K0=; b=kQsyzFTAm6+zaZ0fKgF/fYpsUw
 W9fR/YItzINAzUX1BvGQrCy3c61RQDjoFTDpeiBzysYCYBOXuhChTf4AV8IaU1KSNY7ThuJQ/2qIj
 PAA7pshJvNu/7UPSChbhKX5BezTHMChb27RJxK20Js1Zndv1E64XJUKZighADZ9ugVso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4dULGHIJA2ySiW/+NDqhJaTVkfHHpiB74jz924iY4K0=; b=B5e8Lu1DB+murGynE7gmeH1FYt
 lqWY5E9ftKajIsvhc12AQsPaz6s4NCbbkBSN/qY16C/veEwrwK/99o7EZxtEBlf6Uzi6/5JGMwKSU
 tQnbhd3g1hLAbWqaQfck9GfcgmkC5Eu4MYLAmZMFRjigprc72l21QPacrGZ/UeiE74Sk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCG41-0008ED-Rf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 09:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9DB0626F8;
 Wed, 29 May 2024 09:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE548C32786;
 Wed, 29 May 2024 09:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716976654;
 bh=6XgEyPsEN2NFoJlrtqnjT0UAsnXAycD0xgXGpmhOtc0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SVhPXxqkJ5iR85XHhjMyba0+veN+xlnvqZa+qCAzsIptXQyKKftc9Y65yuALp0f81
 I63nHeQrHyNb8jqIgbfNtleyQHR3S2IT12R8N2cmJ34u2bve/jKSB/F1tjOu/6lPHU
 5zaI5Owq88NkMMTglLDHon/Ftk/8zaIetimTAL506CD6L8US8qAEoGTuMzxtPxyH7s
 ZCYrOlnOrOM7MVwFjBFdiP+gVZQnOsED36Mt7GmZ7kk8ibouRzfHTzoXVlJaBKl/qx
 lGSXtZbzWGd9Ma56jSnm1eN69DZeUqefSU3NKaIQxhxLR1n0lf/9amdjkYgT2TQV8H
 Ns3vQOWIGQZCw==
Message-ID: <19f53d36-0415-4b34-9b6b-e28ea19a44f0@kernel.org>
Date: Wed, 29 May 2024 17:57:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1716976020-28757-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1716976020-28757-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/29 17:47, Zhiguo Niu wrote: > SSR allocate mode
 will be used when doing file defragment > if ATGC is working at the same time, 
 that is because > set_page_private_gcing may make CURSEG_ALL_DA [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCG41-0008ED-Rf
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid use SSR allocate when
 do defragment
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/29 17:47, Zhiguo Niu wrote:
> SSR allocate mode will be used when doing file defragment
> if ATGC is working at the same time, that is because
> set_page_private_gcing may make CURSEG_ALL_DATA_ATGC segment
> type got in f2fs_allocate_data_block when defragment page
> is writeback, which may cause file fragmentation is worse.
> 
> A file with 2 fragmentations is changed as following after defragment:
> 
> ----------------file info-------------------
> sensorsdata :
> --------------------------------------------
> dev       [254:48]
> ino       [0x    3029 : 12329]
> mode      [0x    81b0 : 33200]
> nlink     [0x       1 : 1]
> uid       [0x    27e6 : 10214]
> gid       [0x    27e6 : 10214]
> size      [0x  242000 : 2367488]
> blksize   [0x    1000 : 4096]
> blocks    [0x    1210 : 4624]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>         0    11361121    11361207          87
>    356352    11361215    11361216           2
>    364544    11361218    11361218           1
>    368640    11361220    11361221           2
>    376832    11361224    11361225           2
>    385024    11361227    11361238          12
>    434176    11361240    11361252          13
>    487424    11361254    11361254           1
>    491520    11361271    11361279           9
>    528384     3681794     3681795           2
>    536576     3681797     3681797           1
>    540672     3681799     3681799           1
>    544768     3681803     3681803           1
>    548864     3681805     3681805           1
>    552960     3681807     3681807           1
>    557056     3681809     3681809           1
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
