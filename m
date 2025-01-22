Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4758A18C06
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jan 2025 07:28:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1taUDX-0007ok-Nc;
	Wed, 22 Jan 2025 06:27:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1taUDV-0007oc-VX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 06:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6WWjB6UsG7qSkIlFATw+/rvD6xaupiD+niSoT6k/s0=; b=NjurEC0jhbu5G7FRrey4Wfe0ip
 2rmW+At1qiKqW4P7Qtj2rsVoRD593h9bbhmZGVpeq59kCpNjv7pO0vtr8a6b1uR/0wUK3jxs1IzaE
 jUi0R+wpv8DPvjRcahNGdT67azGAN4V952lRlBWrLYF9rwJp3Kwgdi89bv6PV/Iq+ybk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U6WWjB6UsG7qSkIlFATw+/rvD6xaupiD+niSoT6k/s0=; b=Q6ZUen9tGdWGGrFWyGZyA5lSCa
 ZadokIS2wK48X8BAsKfEH8Co+mtVxtWnrT12EsptY5AG2Eiro5DY1yUWZWd0VOud2YHILvuBbXemI
 iv8U+T14Kk9364KTaFpLjtgl6LXf/aoQOXnrpc65Gmi5K19iFxsJgfBAnXE23d/izYrA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taUDV-00086J-9A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Jan 2025 06:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1F787A41AC7;
 Wed, 22 Jan 2025 06:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8333C4CED6;
 Wed, 22 Jan 2025 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737527266;
 bh=0fNhnn0oujNo5YBIse/osBB8eQvOIr1B9Ka/JUVhE+8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nStQ0q2MVFZz4E1Vqjezwuf+p/d6CkpsI54Gr4U8tX5DVCm9WefrfS8Dt02Wjh/4k
 lOQ4vDmSw405mQUBi63cYgnSUWpJtt+teJaZqPMTwqOmn1JKIt7wQmk6OwygUSGdZv
 eqHa1Byf+Z8vJaMzdQVfSmmYH1k8aND/0+TL9FzdM4vhIUxmHuUmjWlyiDHr2OZmSC
 YIazp8L4W3XROp/Uzu1jJZ2Wmx2mYsX+qnIHHZz0XfHZhB9D8OVt/d5pzwh+SVRtjZ
 3htOGEzd/cx7/4EST9I2esaENRj1+cm8ZfdnVD/P/K8YJT3gJ06l3WRF3+7MnNd2vS
 IhcmDb0XMzXyQ==
Message-ID: <9edcabc6-bfaa-48ea-ab59-54180d6c62c7@kernel.org>
Date: Wed, 22 Jan 2025 14:27:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1737425741-3004-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1737425741-3004-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/21/25 10:15,
 Zhiguo Niu wrote: > The following two 'check
 only recovery' processes are very dependent on > the return value of
 f2fs_recover_fsync_data, 
 especially when the return > value is great [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taUDV-00086J-9A
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid changing 'check only'
 behaior of recovery
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/21/25 10:15, Zhiguo Niu wrote:
> The following two 'check only recovery' processes are very dependent on
> the return value of f2fs_recover_fsync_data, especially when the return
> value is greater than 0.
> 1. when device has readonly mode, shown as commit
> 23738e74472f ("f2fs: fix to restrict mount condition on readonly block device")
> 2. mount optiont NORECOVERY or DISABLE_ROLL_FORWARD is set, shown as commit
> 6781eabba1bd ("f2fs: give -EINVAL for norecovery and rw mount")
> 
> However, commit c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
> will change the return value unexpectedly, thereby changing the caller's behavior
> 
> This patch let the f2fs_recover_fsync_data return correct value,and not do
> f2fs_check_and_fix_write_pointer when the device is read-only.
> 
> Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
