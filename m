Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C35AAD9D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 10:13:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2pfgBbFFJLdXu1C8jp+scGqyF+iSCSIdWQ4jS3v/HY=; b=XgTycw8wf55suKYc9AMwYRpFA/
	ChN2tC1QZ8kh2ARwSJ2k/T/vY2daTLtwU08YQoeB9c++MfI5NVhi5KzWHbJPGX7C07mafrjcpSIy4
	MXkbf1Y69RdMARM7sLY+hsa7h+VTvgYqyHfxGfreJWVW05pAKP+m24rFmK3OZtRWp4U4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZuH-0006k9-Dz;
	Wed, 07 May 2025 08:13:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCZuG-0006k3-3w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iKURaMRy17xvcmhmAbVSDj1jY+oERXMZP2XMy3oB2q0=; b=Lp91iPJpanpErCnjpgs7M5vT8P
 5qZa4zzH6mPfpQHG5vQua409ZLIqKoFkLr7ZlHCf95CPqG+KYphZbgiEcmxcJQB+5LcagcxsSvH7Y
 tQj8VMX5TaNbHKDTSJZFz+r0aeRYHuKjDZwKBu14CCUGMNISfAlRXhwJ6YDqQ1zzccik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iKURaMRy17xvcmhmAbVSDj1jY+oERXMZP2XMy3oB2q0=; b=QrFg8j2R+yBuzhV6zepMnSQZJy
 cPiX14FvgMRH78wLDUq8fXqhbX9S8icG1lo8U5FAWxvfGhhJs8Ms5uk4i28xC3iYXbJalfjB33BcC
 2IH+vjnwP2mxRsvVGfrfaXBhntrdzKrHSTWGrTzNxbzT+5xUWD1oyVzITz79o1zANnsY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCZu0-0005iK-Ac for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F82BA4D64D;
 Wed,  7 May 2025 08:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F633C4CEE7;
 Wed,  7 May 2025 08:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746605585;
 bh=IZxfW3aY2ijlXo9tHf4EeDK3rtqmiq2rj+jcSefHlrs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ElyxMD0qsNo1xrvfU1I0zzDSuHpGGF6NYRI7mGgEXR2RCcX9OoDXSsSQf0+h5oqCW
 nS5Lr5XBOQBC9cREFI64aIZOfV/iBbMEcI+2xRZipvKzQQ4fs0nkzMf2AHkN22nqjt
 nCP81yAsScDYSgPhgrYYpl3GP1KPdEa9gZfha+QfNkxCOHmIZBKdnQVH4Li55+pQAR
 KigZ/nP7XeiM7GG2YRbfRF/ryeZN/9bzGyq+7z2XNnJE9/e+aXnrWSbrxwl9BTtTMH
 VgGMDmHz4fgWLpzinRMNmysi/LHZRbFJrzr1t7H5yADliZVG4zYKshlaVgeNsP1q8L
 kbxnA3kQwVbEw==
Message-ID: <d9720676-5e03-4298-8811-f6cd0dc8ea0c@kernel.org>
Date: Wed, 7 May 2025 16:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
 <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
 <20250507074817.GA4516@lst.de>
Content-Language: en-US
In-Reply-To: <20250507074817.GA4516@lst.de>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 15:48, Christoph Hellwig wrote: > On Wed, May 07, 
 2025 at 03:38:20PM +0800, Chao Yu wrote: >> On 5/5/25 17:25, Christoph Hellwig
 wrote: >>> Hi all, >>> >>> this almost entirely cleans up usa [...] 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
X-Headers-End: 1uCZu0-0005iK-Ac
Subject: Re: [f2fs-dev] cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 15:48, Christoph Hellwig wrote:
> On Wed, May 07, 2025 at 03:38:20PM +0800, Chao Yu wrote:
>> On 5/5/25 17:25, Christoph Hellwig wrote:
>>> Hi all,
>>>
>>> this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
>>>
>>> f2fs_sync_node_pages can still return it in a way that is not handled
>>> by any caller and eventually is propagated to userspace.  This does look
>>> like a bug and needs attention by someone who actually knows the code.
>>
>> Oh, I guess this is a bug, thanks for catching this.
>>
>> Anyway, let me fix this based on your patchset.
> 
> I'll resend a fixed version later today, maybe wait for that.

I've submitted a patch, maybe you can rebase new version on it?

https://lore.kernel.org/linux-f2fs-devel/20250507080838.882657-1-chao@kernel.org

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/common&id=a0b7dfb634f98b88875e7bc3166159d2abc7f164

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
