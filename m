Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A1727C6F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 12:12:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7Ccx-0003AX-M2;
	Thu, 08 Jun 2023 10:12:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q7Ccj-000392-OX
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTqCTkU87N1MjeTb/hGh2bN1ueQh790/XvLIA3QB6MI=; b=fZKI0SHkmf74Rq9TubL553frFc
 QzFRl89vXndshuKWQqOA8bNDvBcybZpR4oxEDbKrCRw/cNqpWvvE6icMaQ3GODlbCmRs+dMGVGslH
 C1uvLPgym5+SXzz4OsK1MS97sLezcQkdoO24AYTmVt7QZfEHpVdPnuR++4/DQQR5J1lM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aTqCTkU87N1MjeTb/hGh2bN1ueQh790/XvLIA3QB6MI=; b=TVkCePyiF1Xfb+NQe2wTlk2/oW
 lEfQr0xXGpQTAXUeMwdZMIhwBoZP47K+F5z1wAHaDQOPV7DeqZvan6uuZHe9+/IYFUPhEiCs3JVTh
 bk0f+wBLkEv4TLnhdevlIuuhACN+T2l0exNGBYErKVHryhXWteAQFptOj/Ioe3QSgznE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7Ccf-0006z1-Rz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 10:12:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 726686133B;
 Thu,  8 Jun 2023 10:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4236C433D2;
 Thu,  8 Jun 2023 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686219119;
 bh=O7H8bNFpm2s9CtD+sRPpMy+feLf/EJEH6ZI7LjHujr0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IBvYAI2CqeDaE06Z7QBTcl22qDFy/UZtWs5ACJLtzp4gGck5OpamsXAufhiys1Tlc
 b7Q9P5pEd2ksOe0bOFtoOuF4ordItjiBRsYcIl2ziy6b0RhXBquTeB0vzBcY2L+4v2
 ner70azGNZ1Wo6vxsyhIevFwIE5AlKH4fa9xCfmoyd9KPrnKT39B7GVnjAswNBmthy
 WTYdV/hHk7fu3pN8cG3eh1bO4A2gUu88IHn5xb8tOQFcUc57/XD0XkThaL2P95RbD7
 FXYW+0Xi8OuGIl4UcyaxkypAvZLGWmursjMhU/fyO2wr/VNKDQpJmcZpVcrtPOI6Gv
 bCORgcSXo0qhg==
Message-ID: <36678490-ee03-4ce0-a5b1-5292e9d92b8b@kernel.org>
Date: Thu, 8 Jun 2023 18:11:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230606173948.3390215-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230606173948.3390215-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/7 1:39,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Do not check F2FS_ZONED_HM for the whole device. We need to do this for
 > each area of devices. > > Signed-off-by: [...] 
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
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q7Ccf-0006z1-Rz
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix wrong write pointer check
 for non-zoned areas
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/7 1:39, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Do not check F2FS_ZONED_HM for the whole device. We need to do this for
> each area of devices.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
