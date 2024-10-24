Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CA9AE325
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 12:56:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3vVD-0003Uw-4t;
	Thu, 24 Oct 2024 10:55:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3vVB-0003Up-Pb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dvOgl0BufS65tTzfeb0CBGZ5DP8BRRGLuh31FEiucVs=; b=VCkqeO8FWAzJUMQIWzFOHDtcsy
 oWSK+na6s4zbOst8S7vs+OvSQBVOEkkGuu0dOdCWhEr+CXuM6qBeg9ijr43HPpPby87ea1JLHUAXs
 8LCooTmXetdhKdZD3iJCyEY77c+V/2dRRZoNnOLvAAp1JB2/9jQer9hduhGZYMECnp88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dvOgl0BufS65tTzfeb0CBGZ5DP8BRRGLuh31FEiucVs=; b=CVAiTFEAnaOYVNnHNX94CxhxWw
 PoBQsdJoc4yFmSeg+5exFBwnUKHBVZ9EdL68o4mJTSh4O08JMaem62ipH3yRd4k2w63S+wTC9TXMP
 IF5qeqK1I6bVq/V3yPWjqEtZ5roiCKN5KPIF+9jpFZdWbg1wFfiKlrey6i/M2S9hjOV4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3vV9-0000x0-Pw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 10:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D89045C5F93;
 Thu, 24 Oct 2024 10:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133FEC4CEC7;
 Thu, 24 Oct 2024 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729767325;
 bh=dNnmN5+5yg40IHrPKPMEYFfCZT4E8KyHcfATYAlEPug=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=K6Vy2/GKTmu6EcpqINCGeaWKzS2PeKbQ1O6ayUww4noDNJVnChrwdACZHBhYfqpjx
 vMDn84M3497Nuv9/YOrMgHRK6+OlH1reAr3/Z46n+FXMLL6Wp6LC2UtFxImqmXcZrh
 VJ2dvQ5WifSqAVeLEgMiRYzozo2tDhYkA+jmZ2ilspXR61DE1L/BV4//UJIs48tJ5J
 1HeXNLyip+ySPPpCjGk5VpivS+igVusTRoiin7jhBKlz5EOogpGc9qCJFHpKCzijIv
 hUof4s02D2u2MWcp5OxevDPwfilCS9a2jW7uI4a5XfRFVRr8skTqWJX8YN9DkThX7h
 RowlIqG1oSL0Q==
Message-ID: <62749dd7-74e9-4d9b-8203-cd396b705afb@kernel.org>
Date: Thu, 24 Oct 2024 18:55:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20241024033641.517015-1-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241024033641.517015-1-shengyong@oppo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/24 11:36, Sheng Yong wrote: > If dot or dotdot
 is lost, fsck tries to add a new dentry by > f2fs_add_link(). The blkaddr
 of the directory inode should be > passed to it in order to update t [...]
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3vV9-0000x0-Pw
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix incorrect parent blkaddr when
 adding lost dots
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/24 11:36, Sheng Yong wrote:
> If dot or dotdot is lost, fsck tries to add a new dentry by
> f2fs_add_link(). The blkaddr of the directory inode should be
> passed to it in order to update the dirty inode at the right
> place. This patch fixes the uninitialized `blkaddr' to avoid
> corrupting f2fs image.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
