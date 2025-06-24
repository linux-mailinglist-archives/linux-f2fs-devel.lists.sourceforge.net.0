Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6FAE6829
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 16:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yevMKtCIbB5+2YKZJ+V81LvqIoAP7IZR4BMH284lLUo=; b=PWO8RhsMLPDgTJab09WVKO7b0h
	KpvjNrxndo88EFSqox9+h/hLyiSc6zqIu6lFJL5XrM6mPunWkPglpLH7pIgUxuFoVz0hnLBeOD8t3
	0AqC8Vr8gi7h0FLlfXTafcvCZPdL2km7AIEZYp47jpAi61ktDHCZ51mPof22DskkXXho=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU4UJ-0005mn-2m;
	Tue, 24 Jun 2025 14:19:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uU4UH-0005mZ-6G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ICg/7jxJwnOEadyu70V5TZQ81AP6UQ084Xpb/uCMq1A=; b=Y7+IqBBi1DQ6XBBzhjPcSrPBFP
 0wDlGg7qipBwLHKtsn07K92QMmqB/+LrOCyvHqcPVAFPaSDKSXE7trydmPIigGtVfliPuG7E3MSEg
 muuqZLRNLrC3AJKFs8n17j7FaDduQix7aYraIZDQZkRxLAdghWmcIv4Fz0ir9ZZxJyfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ICg/7jxJwnOEadyu70V5TZQ81AP6UQ084Xpb/uCMq1A=; b=iVpKA5DwGGzolfo8bu06OGiyq0
 He7wohZb4hL/Le+pxfGvkC5S8VFYZUWEyVQ3ecSMv4zeBkkXUe4ZwG6ayqaS1qACpG21Izb7U6xMg
 trfo26+kYottm9eMcpbnGJuaONaFMOdh4drBuaaPkZ6zykBE/QeoPGWIYFTnBTxQJGpU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU4UG-0004Wy-Q5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:19:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A4FCA51BCA;
 Tue, 24 Jun 2025 14:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C733C4CEF0;
 Tue, 24 Jun 2025 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750774734;
 bh=wlzegHMQtoHuKF3Oe9ZMLorLoGNAfb7HrIptnLROpW4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OPBya4mZVeDK8tIPUakpMZXp6TeRWI9z0mnsr1usATCwrmA2ia8D890+5eC0pW+eg
 hOets0zptRdM1Uq+Mdv4mj9Gh7F8PzAUjfkSOVucAUbVC9tpII1kOV/0AedhxWIaLZ
 uE0otjh3danJMerS0Av4kLgYgbtqB8ljzB1Xn+Yovw/XrGTWVkb04D9bccLbFYsU0+
 5PG5TWy8fT5IHXP/c8gryH0MJdew0qSmzddwnPiXQYJnuo9hG7iQd5ekDHptk1onmB
 eO9LKqa3vxe2dSNp0s9lF/HT+EwZzD4jFfnA9Z/IILEMVCvzwd6IMZuc8eP7yBNnFW
 N05mztJt+O5pg==
Message-ID: <b69b9567-846d-451c-8645-50b6a4b74ac1@kernel.org>
Date: Tue, 24 Jun 2025 22:18:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250624035938.3176350-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/24 11:59,
 wangzijie wrote: > Introduce sbi in f2fs_setattr()
 and convert F2FS_I_SB to it. No logic > change, just cleanup and prepare
 to get CAP_BLKS_PER_SEC(sbi). > > Signed-off-by: wangzij [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uU4UG-0004Wy-Q5
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: convert F2FS_I_SB to sbi in
 f2fs_setattr()
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/24 11:59, wangzijie wrote:
> Introduce sbi in f2fs_setattr() and convert F2FS_I_SB to it. No logic
> change, just cleanup and prepare to get CAP_BLKS_PER_SEC(sbi).
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
