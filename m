Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 236663C343A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 10 Jul 2021 12:42:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2ARM-000762-7e; Sat, 10 Jul 2021 10:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m2ARK-00075e-7t
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 10:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ii4EKc6vVQ859c4b9UEWZYGs0oKpAPG3InBxYtQ/OHA=; b=Ji/M7ZQaHz8CaXNRoIgeBsAsxw
 TwXNPvntpAVML70DLg4YnSwvk4kHNUHk+jTcX2dvhxtyF/0Hbg1qYWi75DJgt3VjByVE4+5u7dtEP
 mcB5eGqhOX9lqlLsSROjjUyqk7fJiSJHIbGOgA4KPyTTfwodyyDQR08HJ0Flq9Ree9+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ii4EKc6vVQ859c4b9UEWZYGs0oKpAPG3InBxYtQ/OHA=; b=nFMoKIW5SG5t+HFfpx2HqDbjeC
 C0CC2BAAr6BWRSbe33iwXuRh5dLvYWOl0CNseNJfBbxIfHrasAhIkjmBLnAIDY7YylaXsb6OjwC5h
 MTyHGlcctPr6AI0p6A+5QtIUBbB+I1zwkA3ysm59eT4msMtRdMLBduLVRNpaGerlrNsE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m2ARD-0006RZ-Gl
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 10:42:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3608761206;
 Sat, 10 Jul 2021 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625913733;
 bh=lhKGmUxmKWhzNv905Oek6K4ehDxviGsc0ezlV3WIHAE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKbcV6HfK5H3ZmXNkbPznYubj5Uu3CB3gjQMKLnQ/FrsaPYT+uGwlWnx8jK5xY1Rl
 DsVQB2eDfRhjC/Kau03qvyLUdqYlLC0GZHai1aRHXRM/omfK0inTdbaqNKwICogDSg
 J/DUVKd6EITqRWY73dH+ifAYbnLxaIfXAzifZZLl1aXlRXg5Z24VNjTcbhthJRq3GW
 MFzwhBvoggRCOGWl0iPrFHKefw/dqcIAj89rpwmKHd89qKb4TdcmAXutDVGTbvyBvy
 eqM/a/ndgCRJBcsxS6PK17hHFlW+0/mjI+ch8eFTsqyWsbRVrHCPKa9BQpHjCg2K19
 6KoFq2P+bNs0A==
To: Daeho Jeong <daeho43@gmail.com>, Daeho Jeong <daehojeong@google.com>
References: <20210710055357.1638111-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <5cdacf69-329e-f883-82fc-3eac08c3d539@kernel.org>
Date: Sat, 10 Jul 2021 18:42:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710055357.1638111-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
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
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m2ARD-0006RZ-Gl
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add sysfs nodes to get GC info for
 each GC mode
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/10 13:53, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added gc_reclaimed_segments and gc_segment_mode sysfs nodes.
> 1) "gc_reclaimed_segments" shows how many segments have been
> reclaimed by GC during a specific GC mode.
> 2) "gc_segment_mode" is used to control for which gc mode
> the "gc_reclaimed_segments" node shows.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
