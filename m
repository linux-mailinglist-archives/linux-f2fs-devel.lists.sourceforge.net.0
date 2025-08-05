Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D2FB1ADB9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 07:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rt+uI2R7Tqeuk5znnc66uA7A6Bxuwvcb1T8MTXANP9E=; b=JUGTnnGfrA3eE83J7dAxWKBNRZ
	p6XcKPfuxTkgl38lmiJijhJrqL+hyR/wT+7O4EtaNkt0RnP/1+JYPHcStshkYOZb6WAOkMsBULtCh
	z4CXtNI0b3MX1PaBX6ORpVlmFYMzkC/jm2yT2HFUiFYgntIb3QvwMeJAvE8jQqTCXSio=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujAYE-0008Ia-Af;
	Tue, 05 Aug 2025 05:49:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ujAYC-0008IS-Di
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 05:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFGiwa3p8fuHGYG/Rw7MyLIOANCTtZXMDrfPtBgsAno=; b=Xk5pudhV7D5AwLzol7cqBl5SXR
 W/Ghj0+1gaub220xG/XNz3w+rjQ2bGXqFFxLqMsmSUxEfOk5KbX6xrojgxwgptYQdhUtXVk4Ftlfu
 cO+JZchKo7Z321NHIZ3egl7ZTt9bkqciMGJB333F5Vd5EkpXFbz8AYm+H+OdJpnOLP/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFGiwa3p8fuHGYG/Rw7MyLIOANCTtZXMDrfPtBgsAno=; b=BQ6CB/OGy93PSa+6kjIJVzf9ud
 9JDTGxLB7gb/03TWgxF24FlgXlMob67t5L4WX8v8R2hPzUoA5tLXBFmOZx/GKUF7h4fPqP+GY89M+
 XDUOgf4lpM5niQek034lNSWog0i/53U8K69LW7zrtHAnG8DrI2dtF4u0rpJs+FmIWl8M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujAYC-0001FZ-QN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 05:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 687A25C5E42
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Aug 2025 05:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F901C4CEF4;
 Tue,  5 Aug 2025 05:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754372957;
 bh=3Nr00w9vYDhdnCOhEa0XYsyMa4KmO3jx9H0/SdfTun4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nWO5QeyIAsBIpdZdOEKvDRQdodmjgrWKBXhaS0GGo2f+ykeF1mgLXs9ERngGBSkYX
 D4bAP+lCteZK84IdO0gXU6b7FlpI2qKgaVmicg33WozkWe5MtcyVObt9EkYefoxMhQ
 6SBbWbR/ohDw+BiXq/erutDKL0NRqwta4vgKEtvZX6B85Wr0ztAhZTMcqcVT2soLJk
 pDRKuN0jLWDrY7kYtA4K1uoU3FEujJUehJsdaDPeiHLcgi5JvYsdst9Y4bqBpgIjO5
 vWf8b4dNfJgvjcEVupcZ4avE/vGLjPhSdEBmRlZL2XKzqXVIAJ5mS5+YfKQ23xZnS8
 904v12SsMvvtg==
Message-ID: <3f5698cc-a686-43e7-9169-7e3a825963f3@kernel.org>
Date: Tue, 5 Aug 2025 13:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250801161341.396038-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250801161341.396038-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/2/25 00:13, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 external/f2fs-tools/mkfs/f2fs_format.c:392:31: error: format specifies type
 'unsigned long long' but the argument has type 'size_t' (aka 'uns [...] 
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
X-Headers-End: 1ujAYC-0001FZ-QN
Subject: Re: [f2fs-dev] [PATCH] Fix build error in Android
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/2/25 00:13, Jaegeuk Kim via Linux-f2fs-devel wrote:
> external/f2fs-tools/mkfs/f2fs_format.c:392:31: error: format specifies type 'unsigned long long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>   391 |                         MSG(1, "\tError: Unaligned segment0 start (%u) for zoned LU (zone_blocks: %"PRIu64")\n",
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   392 |                                 get_sb(segment0_blkaddr), c.zone_blocks);
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> external/f2fs-tools/include/f2fs_fs.h:289:18: note: expanded from macro 'MSG'
>   289 |                         printf(fmt, ##__VA_ARGS__);                     \
>       |                                ~~~    ^~~~~~~~~~~
> external/f2fs-tools/mkfs/f2fs_format.c:404:31: error: format specifies type 'unsigned long long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>   402 |                         MSG(1, "\tError: Unaligned start (%"PRIu64") for zoned LU from segment0 (%u) (zone_blocks: %"PRIu64")\n",
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   403 |                                 c.devices[1].start_blkaddr,
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   404 |                                 get_sb(segment0_blkaddr), c.zone_blocks);
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
> external/f2fs-tools/include/f2fs_fs.h:289:18: note: expanded from macro 'MSG'
>   289 |                         printf(fmt, ##__VA_ARGS__);                     \
>       |                                ~~~    ^~~~~~~~~~~
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
