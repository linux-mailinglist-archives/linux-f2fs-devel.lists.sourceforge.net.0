Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF8E9A1BC4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Oct 2024 09:37:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1L4B-0004AS-1s;
	Thu, 17 Oct 2024 07:37:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t1L4A-0004AI-2a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 07:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YyA817qnouGzck4BJQb3KNkj1Wa7Na3nYIc9/hUp7E=; b=F+uX6+dgL3XwKupPqQW8C/Ty9P
 NfZvY8YtUEXYjNmpKwNuK0iCVo+570+j1vgmrZzSplc5V62pexrNdZgF6zWj/TjglfPqkNpzT0l8H
 iuOoG/1DMIc69tQl2ZNsngPZ1eh0YnCFZgLBzkGiqmMMMR+1hcpQ605+35M1fw4U2FiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YyA817qnouGzck4BJQb3KNkj1Wa7Na3nYIc9/hUp7E=; b=cPIAGjaPgjkvdG4pm5EP7213TR
 CaLEnnr5J6A2Dj7mKGALKi6YyX0KQzcCo0iRpm7Ul2n19M2moDHZJAjwPIX8Jzcx9FF5/sz+y6H83
 EEwJrSahK6lrTTP8I6DM4ajdVTSkT+SPhsPUGwjiecw/pmC2fFMHc0SGNThdX05aRTBA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1L49-0008MY-FD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Oct 2024 07:37:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A8F925C542F;
 Thu, 17 Oct 2024 07:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F4AC4CEC3;
 Thu, 17 Oct 2024 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729150610;
 bh=DZW8tP1ExDwXOCc9NFCPeno7zioU/xqa4Gnd6frTMAY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CmDW5gtJs+QfR20iowIOMP8F+FXpQPYhNjdNz3mA5QiwP/ysIXyxxViYBsRkGivEX
 Sxb/HRaVgFUeBkkXnkt3MTEEmrX1Lc76U2pOraohHb76hldUJ0rcEcCnSettmWtdbu
 CLKhOKcpYQHai9neCzmZMqfrmf7bH0/dg7eWdbN57EmVFX3cRC0e4xBjSFGLsoiAKw
 TK1/vxIvb05ygk4Ef3tGR5O/GIBbWpqilRe8uvZ712U8u52Flk3RE0dEqylp50nIen
 L+z2Rjj80ZS2P5hJYyo6Ta14GUQ/eiEfp+ORuy7UgP7Zqu8Fc8R15A9gtDN4R8PyYa
 sBmI6qwsTuFlg==
Message-ID: <40d285ce-d2c5-4cb0-9040-fd35f9e14159@kernel.org>
Date: Thu, 17 Oct 2024 15:36:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20241015165427.1158782-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20241015165427.1158782-1-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/16 0:54, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Now we reclaim too much space before allocating
 pinned space for zoned > devices. > > Signed-off-by: Daeho Jeong [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1L49-0008MY-FD
Subject: Re: [f2fs-dev] [PATCH] f2fs: decrease spare area for pinned files
 for zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/16 0:54, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Now we reclaim too much space before allocating pinned space for zoned
> devices.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
