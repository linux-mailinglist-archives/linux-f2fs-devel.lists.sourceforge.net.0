Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DACDC992E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:30:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWTldJdIU6irxXOnLqv/lh892wV1Gc1jhekUxm+SYx8=; b=gOwdTcpDhDQqmASpW+cuILfisD
	WPkkh5nVdaSResEudKQB9MyKY1/wrFwmm6XXuu/0dJKJ+VPl2Xoz+cxJXyditGjiUY/w9efLz98FS
	XBENcrLM6Zn7jNv2SHAd5QyW7Ye5JwZe63Lj0txcc6RuqNhLs32/PoDYN8SHGCw/h6ow=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQBTW-0008KM-HV;
	Mon, 01 Dec 2025 21:30:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQBTS-0008KF-R7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SN5NSWD/657GPecaqDBf11RAcD/kPst2aSGa9img00I=; b=aVIvB9NUZ2rEW4y1OIimheVZoU
 cti6RqU0V2/got/1HzZVs/6sCCCuXyZXVZjDfC+0tKop2CYru/89ECrsJ0qN7K0FISaF0OUsH8OSP
 2QQFU5MkMUuYpcRJgVduPKnHcpmEsXYxl0k23B73RbSD0+xX8LrzVX0XB4b1109I+Xts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SN5NSWD/657GPecaqDBf11RAcD/kPst2aSGa9img00I=; b=AqhR6M+LXbbY2Hb5Td0MqDkyl0
 07pln1/7bN2g8PzwssQEEHdl0MQKvJ1jQCXDDQec4+8XqkRQ0RrKqxN6IcXMD7RHwVAHw/5o01Fmx
 r+nhDHK3P19e28BBymjZQjxYRF2kDVht+jhYp0QM0szzGHej7Dsgx+N9SgXTZm6Mj3SY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQBTQ-0003Qv-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 66622408E2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 21:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7548CC4CEF1;
 Mon,  1 Dec 2025 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764624610;
 bh=Gxk7+YgTn0yaAxmqkqbsrNK5kWrnEy1PRiKKTclZ/O4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GXN62tLISSxDzcEmFkzj/iKRg4f/riWCooHYNCg3wdt2Id9OuqpAyRSf92JbGhK5R
 PwVEwMOufJ181mW/jW4JP5/WBOvBWCCztzPkEgDNLnct0TLIBnzFTajp1oRHDUeaen
 NzrNd/ewOB3tQoVNf4pNV+LBvDEgrrnkzdjPT4qev8JKYbpE6rI+tIeppzMf/McBXt
 6XF3HObmoZP9YS8y9VXqi8E4EfuprlbEXB8wytU3cJgOPSTcgj9t78lqayEaGK/4P/
 Q1zvfIBzXJk763RTi+Lfm2dKCDXGqW9cic7gL7laJdtE30Aot+FHdJf2ZAId8pSr4e
 MUxReS12ZZTvg==
Message-ID: <bcebf919-999f-4f67-9ead-db2e7f0656d8@kernel.org>
Date: Mon, 1 Dec 2025 13:30:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20251201204620.905318-1-jaegeuk@kernel.org>
 <20251201204620.905318-3-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201204620.905318-3-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > fadvise is better to describe the read method. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQBTQ-0003Qv-Oa
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs_io: rename mlock to fadvise
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 04:46, Jaegeuk Kim via Linux-f2fs-devel wrote:
> fadvise is better to describe the read method.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
