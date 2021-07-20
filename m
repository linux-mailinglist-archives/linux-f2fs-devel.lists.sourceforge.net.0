Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A271F3CF113
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 03:04:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5eBe-0006DJ-8Z; Tue, 20 Jul 2021 01:04:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m5eBd-0006DD-6H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMdkJHwT/zvawaAeWYGanfuUmlNP2FqHwOytlmwhCw4=; b=iGOFk1v0d0V0ADFG4WWcEOr3FS
 ZYM0wMLi+XVkuTRh7X8ktKON/bcl5Z46vcgHbnxMmagnG5ZplNUKDxTwh6OzyOcI24BwlkQ6Mtbfk
 L28UxjkQMK5AS9sqC22ZvL4E0I3j2doa8QRidvNnRCOogMqLYFKogBJEoFSTGIA5TM5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GMdkJHwT/zvawaAeWYGanfuUmlNP2FqHwOytlmwhCw4=; b=mjrfiSBecza+GGakk7aKA2XV0J
 gkAtwaU8HYu5mhblnyN+RYh/w4Pl+kQ4TXaRcXmyoHkTbE+C9DXwhY8oqhMqQjiLtENczouR2TKqA
 S+cvHIPUOLos/mxqWpVkN7WCG+pM3v7ag85j5c1pYENAbyI9xwlay5rx60U7OjE+6uEY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5eBc-00E7fr-5p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 01:04:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB30C600D1;
 Tue, 20 Jul 2021 01:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626743074;
 bh=RPXkB20FKT91RU0xvgWTL8V/qTewlOmPJA7L6IT8MNQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I9iOc7Si61GdhzHbktPjMN/k9cChM95UflBRXWHCM6KojM9cnX9+6e1a6vJP/kDQN
 m5reAgiwr5qU2ZRbeAsRflNLRKjkz2eHpPHWc74zYSdmLq2PWPe3u9wfgAZbvNJe7R
 S6qGzwzAWzLM2aF7gr9nUayoCsvo4LAVn7TwuEPdyG2rX1gquXxnXWSFEVm5D/eir9
 ESsKS+znCSyCrGDJpLOC81nDUViiWaSStrW3zSoK1mNFNHWbHFDiw/CAAdJPg7ceSv
 o00Eg7sDDXRyVaMuxKbYoli1fAtjgWNJe1XHTl5QD4KHHKqhRot0gxQwmcRfSbdG9A
 uKKYBEGCSJ8wQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210714231850.2567509-1-jaegeuk@kernel.org>
 <YPXJj+63rNtcnGdy@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <89067443-81ad-ce81-2765-44625d59dbeb@kernel.org>
Date: Tue, 20 Jul 2021 09:04:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPXJj+63rNtcnGdy@google.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5eBc-00E7fr-5p
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: let's keep writing IOs on
 SBI_NEED_FSCK
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
Cc: stable@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/20 2:50, Jaegeuk Kim wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered, so it
> is not fully critical to stop any IO writes. So, let's allow to write data
> instead of reporting EIO forever given SBI_NEED_FSCK, but do keep OPU.
> 
> Fixes: 955772787667 ("f2fs: drop inplace IO if fs status is abnormal")
> Cc: <stable@kernel.org> # v5.13+
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
