Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5C3CC2B6
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 13:04:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4i7U-0001ga-EE; Sat, 17 Jul 2021 11:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m4i7T-0001gN-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 11:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7jag8tmW+bIe/qh2pK2Ps39YsHH4YfNzG/24JFqMH8=; b=gfZThDwwz3dr0j7hzfGr7Ru2Ww
 +5kGpXdUvWB9jUa1gBxJRhX+FEIDR8Gq6xSmvJXL7ioZ89OMZRzeIuf2LSm+MvgWtcrzYapVVJLB5
 EkvfW7XfojD7Smx9m7eg2GngDuKFqffIQgLDyPKAmq5jEeJHLFwn8ZaCNtp7655VX5VI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j7jag8tmW+bIe/qh2pK2Ps39YsHH4YfNzG/24JFqMH8=; b=MFnpnFsb4zbgvNARTu+rOqL93q
 cinKZYBlLg+Y+Q2wXB/glhKXUOybgxzRixJaJInZm5jA56S9YeYAk4EqKtvY5WVRp82T1LkM2+6Y6
 Yo0/VjyBapIVsbE/9SrIXlsLcJ4xzhXHtcxS7prjNuuc83eU5KU1ysYyz6EMDm5+2kmo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4i7K-00BYSS-1S
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 11:04:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98DD1613D8;
 Sat, 17 Jul 2021 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626519856;
 bh=XCEqKJfNeIitRHbTuY2JqLyiAxu7pt4itT138B/8Zbg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lw9ZD+ytp5hZ5JO5iZgXvl/ntvNvmTJcpI2rWT58zSQqLAjdLXzQ/HfjR40mus9wZ
 f5SHL55lkf900Y09d6w53UbNYrCUoz8x6v05bm4zCeD2WoDBklmTLO74RzoCab50Ho
 iyPE6Ynpq1IL1hjGodJb/tZ+r3f5tZLsVYhMohhi8A1TA8r40TlLvDGx6A4J/sx0fo
 4U6++8B6JiFmUts5WKcxnLFBzT/sHXqaE6iz5JcMiVORQc2IAG8pJVz7Ap0o/SA93a
 B3ThaSqkfBsDukQZ8f9An46WDrixKlr0fjeyBYFbR3efnT8M/glaLOj1yMc446uXi6
 j0nb5bdsdo52g==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210716215703.1560325-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <57f7ac57-03f5-e9cf-6850-d5e5c2948242@kernel.org>
Date: Sat, 17 Jul 2021 19:04:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716215703.1560325-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4i7K-00BYSS-1S
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: add periodic check in kernel
 version check
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

On 2021/7/17 5:57, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In previous, we did a full scan right after kernel version is changed
> and it triggered many unnecessary full scan whenever a newly built
> kernel is downloaded. Plus, we are lack of a periodic health check of
> on-disk filesystem images. So, I added a monthly periodic check after
> a new vesion is updated.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
