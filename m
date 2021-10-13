Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEC42C2C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Oct 2021 16:18:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1maf5O-0001IH-4V; Wed, 13 Oct 2021 14:18:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1maf5N-0001IB-5a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 14:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8wdD8gTE4znP8ZINdANP9pRA9FXiK3VqbYWNglAT68=; b=H2Qcxo4///2YnynJiIdqCfzXRV
 WfjVymFqhRagNwcyNxh1eMsoQsBh4xfbF8qN2WiILHu1Ft6B5Jt8uEtv3QZbP1tO9kiNVLf3wTTX0
 XJOYdCH0xYszaZJ1XaXqpUdidrJZfpKQ/pQbswbtgOmSvUnXqZi3rL0fJbaWBqChYk2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8wdD8gTE4znP8ZINdANP9pRA9FXiK3VqbYWNglAT68=; b=HJd+jR6sj32hrmB6RT5V8sH8EB
 ibxS3dj3z6GvH1T6pzWsL7crtiE2NMTyCIKXF6O42mJDrPorXaL5zLC1sNeh48V0bJhSFNNQN90DU
 G//XxHFq53STMCwk/MceVoNsIJ9oJ3t87zxr4PtG9dd2C32XSC1cI1OrQCsbCk+wWEus=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1maf5M-008S5s-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Oct 2021 14:18:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FDEC610CB;
 Wed, 13 Oct 2021 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634134699;
 bh=o4y3ndbyguXXtobJH495oY++cOr/9vmGtB8WTaG/fpU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=av+dZT88Z7sB4/D4rZDz/3/76Rv7wPRbzhefNoP52xc09A28Tl1oUmSPBUeKsrMYT
 ACebys9J1xqMDsiVHHaVra8KMWUVwy7Ee+t/uZuQLruSzaJFUxw2U51F6WAxjeaXV5
 4ITzaH194SQ3y8sAPselBloAPvhmSL/b8sLOQrd9w+1dMdg19PSC+xlcH+NsnSPA1d
 hivnPn5Pzba/yZXb6dY5c/COdghhEv2D27K8/4alD2J/9l1sJw1NBNe1yicu4rc3cK
 PjqpLeB5XqMFs8WXfJ6kbIvG5MABD81Iln+9iTunyGH0+gVgYg4uD8wKbx65LoOKSQ
 GdplvWJKaj2Xg==
Message-ID: <7feca651-b87d-2d00-7a2e-5e66b4f81221@kernel.org>
Date: Wed, 13 Oct 2021 22:18:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Qing Wang <wangqing@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <1634095744-4579-1-git-send-email-wangqing@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1634095744-4579-1-git-send-email-wangqing@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/13 11:29, Qing Wang wrote: > coccicheck complains
 about the use of snprintf() in sysfs show functions. > > Fix the following
 coccicheck warning: > fs/f2fs/sysfs.c:198:12-20: WARNING: use sc [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1maf5M-008S5s-Kc
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace snprintf in show functions
 with sysfs_emit
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

On 2021/10/13 11:29, Qing Wang wrote:
> coccicheck complains about the use of snprintf() in sysfs show functions.
> 
> Fix the following coccicheck warning:
> fs/f2fs/sysfs.c:198:12-20: WARNING: use scnprintf or sprintf.
> fs/f2fs/sysfs.c:247:8-16: WARNING: use scnprintf or sprintf.
> 
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> Signed-off-by: Qing Wang <wangqing@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
