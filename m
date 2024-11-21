Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D22419D4A3C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 10:52:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE3r7-0005HO-Vk;
	Thu, 21 Nov 2024 09:52:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tE3r5-0005HA-U9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1eLazXBjRcjYImfeZTBJr7qAZiAz0S1Pdh8Tb9XldU=; b=HXiSS2ezHeBJjivyFTIMgYHYFM
 vpoKcV2gAW7m3/RoHPgInSYynPR0M292QEUPZKi1ESj5KOg/KmvJ4E/KJ3HkaOUUNxFROr1jkIZ68
 RG8ldZKGFwhGcWnS+xe8kMQlGNaAO62vMABXPA4PaIEfH8vGTXhqHD5Tc424jmD/LKHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L1eLazXBjRcjYImfeZTBJr7qAZiAz0S1Pdh8Tb9XldU=; b=f1Wk6G/ed8c35pn/LI6kC5IHLd
 3Ymy5qkFUMv1iQ+BLaP46XDaAgfTbLpHMAcWcennvoXz3f5gGV6WLmRAi6R1VmutQoCPlUxPXJoDY
 ziH5NBL8W+B4jb3o+nfVfGdv4Y3QotNwpK0VLaHg/oMF1GcHnuVCEe3UEgM/Sn7pB4Fw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE3r6-00012s-1B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 09:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B2A7A403A5;
 Thu, 21 Nov 2024 09:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA979C4CECC;
 Thu, 21 Nov 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732182722;
 bh=sC6TbBxe7dSD/xnDQ4ounlFzJ+vZBrJkacNjr2Pkudg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=riCaEXGfb0M+cwisD5dO3e4jyFzZ9ZrfUubAk5t06bQMStvEAVmUB8ckxv0LDJGAv
 JU2OsJ3kwCcf2uyYvx0NPlA+eXTkpExvns2CMwkM/lfWyNUMordqSG3xATNOadpBV0
 BV22yuGTW7nb5aIYcQiiffdgd+egzga+NLJDVL8YC1uoFQ0I5CJUZF/1aRIVjlkQ+d
 zqsKSjZfp2FbIJam3HXuHcCElu+qykI1GOo/xNqUFKitv1UnT8AKg+0jiOgj4EQetY
 xQAfyRs3Q4sd77d6Y095+yTx84Pv0BMWXQCPs5rcf8vFBXCjovRr1YeyYQPXFOAtl/
 RGQna9DfIzNFw==
Message-ID: <782b8685-4397-4213-b41c-e350c900a7b0@kernel.org>
Date: Thu, 21 Nov 2024 17:51:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <202411211538.Tus6kZm1-lkp@intel.com>
 <20241121082657.2644346-1-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241121082657.2644346-1-shengyong@oppo.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/21 16:26, Sheng Yong wrote: > Fsync data recovery
 attempts to check and fix write pointer consistency > of cursegs and all
 other zones. If the write pointers of cursegs are > unaligned, cur [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tE3r6-00012s-1B
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: fix changing cursegs if
 recovery fails on zoned device
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

On 2024/11/21 16:26, Sheng Yong wrote:
> Fsync data recovery attempts to check and fix write pointer consistency
> of cursegs and all other zones. If the write pointers of cursegs are
> unaligned, cursegs are changed to new sections.
> 
> If recovery fails, zone write pointers are still checked and fixed,
> but the latest checkpoint cannot be written back. Additionally, retry-
> mount skips recovery and rolls back to reuse the old cursegs whose
> zones are already finished. This can lead to unaligned write later.
> 
> This patch addresses the issue by leaving writer pointers untouched if
> recovery fails. When retry-mount is performed, cursegs and other zones
> are checked and fixed after skipping recovery.
> 
> Signed-off-by: Song Feng <songfeng@oppo.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
