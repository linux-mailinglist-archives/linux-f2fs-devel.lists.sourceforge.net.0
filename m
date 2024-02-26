Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3B86686B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 03:59:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reRCg-00059L-Jd;
	Mon, 26 Feb 2024 02:58:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reRCf-00059D-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eQDrix/Lyl6saDqwYDz12NdkTI70Mg2lQ/Q153RiYdE=; b=i+rvKU8zbOLKjjg4suUloCXtEw
 962765ZXWy9JD0CnPOQpzn8+NTxySPlyPqJemkxswvvzooXKOFsNbk4AKrztCGmIRMQWU9VJ3KMZw
 +Ks2fzaLcnHv43dXl/3oZMQVrGccslIZronLUvws6ILkSFjrDW48t1fvQ6wpzZVzpBoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eQDrix/Lyl6saDqwYDz12NdkTI70Mg2lQ/Q153RiYdE=; b=Wy9naVuQxPu/R2Z4MBxSWmzqOP
 H/D8WS4yHZB9Tnfo3KIK8SDZ/OkBhSnFDDAmCsuC67GbKCGVJZGqNcvWBzfH915sS1VuLnznE37cX
 Xkm7s5IAVhqI6U7rodFUmQofxzLt9nF7kOgaNIt9l2I7mSp0/j4iNzTlbNiSia3fI4XE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reRCf-0002au-SQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72FFD60B29
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 02:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360C8C433F1;
 Mon, 26 Feb 2024 02:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708916328;
 bh=RfBWpLaLGNc6IDMNpsE0Yy7Ub8NnNUuIZa8qRbfcZvI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Y6uxVAo6kDfvR+tACBcxtJLT9K42alVgDRsv0T1vZ3t3xr4VBT3661Q8qjkvtc+/G
 DWokoik9zZyMyWVel+RNcu7DmWBok8kyOOGWfRWtHSymUGYScIYmhD+eEBHoAPxpI4
 DkTY02DwM8+br93DOBnnQG0Cf4lyGJ1fw/J1rF3XBhnbzMLAJKnRVLZkeAnJLTs+2k
 4CnWA9RAzzQczzufMFeA+GpyDUpfFQ8Zu5xE7mVuOCWmxqAgxw9yGqOzw7HeJ5Li+w
 Z0spdDPSRAEgOiDoc2s3dbk4k37qtu8kS2yEHYRP2/A4Q6+8qHjtqoc4251EfA1o48
 bfDWyJfSOQESw==
Message-ID: <6b2854fd-8999-4671-a243-d78139f8a40f@kernel.org>
Date: Mon, 26 Feb 2024 10:58:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-4-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240223205535.307307-4-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/24 4:55, Jaegeuk Kim wrote: > Don't get stuck in
 the f2fs_gc loop while disabling checkpoint. Instead, we have > a time-based
 management. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reRCf-0002au-SQ
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: prevent an f2fs_gc loop during
 disable_checkpoint
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

On 2024/2/24 4:55, Jaegeuk Kim wrote:
> Don't get stuck in the f2fs_gc loop while disabling checkpoint. Instead, we have
> a time-based management.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
