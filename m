Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD48974819
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 04:12:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCqK-0000mL-Qg;
	Wed, 11 Sep 2024 02:12:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soCqJ-0000m8-KQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=px2AqrtuFotZ5t2D08oL2CvFg1X2zjNGPYD434j0fCU=; b=OQT9MYvtqOCfO+OJOXKlluF+RR
 U4lbnOaZKw3QRAXPmsPiPar5Wl67rSUxpGAWjRuNCFtljsVCVS0nISn0uHkN2KznzGxxgVuzRpscV
 3GHilfsum5MGnKlTfPhrFbqDkKhmR2F+qfHMz3rdcHkiF3IRNDRPmFuyXNVv0TaR3+VU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=px2AqrtuFotZ5t2D08oL2CvFg1X2zjNGPYD434j0fCU=; b=lDc1kFUAawYA0hQ08IpTtsaJbh
 Uu1WOH3uRwtJ/DEomTULe2QE5QDGAxW7FYaBgG7cnSNvqsoAJqizH62WpzLZrknwu4RKUz4CeF7Tl
 u4kFeWXvZ6xJcA6yx2dBFHTX8McOg/r4W4shmzCOLFFxolAYwDAtRPIaZKXwV7GJajCM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCqI-0004sC-VO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92C3CA43FD2;
 Wed, 11 Sep 2024 02:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D334C4CEC3;
 Wed, 11 Sep 2024 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726020740;
 bh=LWsEjwaiPxkwFQ8eWGD/xC9gv87fzsLoBKo3pGlhlW0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bb6Zsm5OiQY9UHDz+tVXaxD/TWPeAQdJk2UuaQ11anAaRngLckFJOn1OW2NaXKY42
 qH4sSDiT1GK4toPHFA5lqYl+cSIt8YXDE5MSegJMOE3YQd+Y9wkCW91Xl7xLEVDkio
 H2U44WWgD4Z9BGXB3oaNL0ygW8qK2MguCzZSMHDX1dOEgLEEHMa/k43iJePGbyljWP
 kzI5kJy55nBGp0iUJqqO5mCDbn5A/eE2WyJqQSuG80wYxgXig/gYXu1zW5gBB1e/83
 c/k3soc0qyRn9QMzR1LWGQPAyvRBOHvBMxPikHOuruLTh1FltaF7YJJ0tBZvlHBv34
 i7wJKVB9dejJQ==
Message-ID: <14cfeb5f-3fa4-44b1-85f7-2eca124a882c@kernel.org>
Date: Wed, 11 Sep 2024 10:12:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240909221946.2004046-1-daeho43@gmail.com>
 <20240909221946.2004046-4-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240909221946.2004046-4-daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/10 6:19, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Need bigger BG GC migration window granularity
 when free section is > running low. > > Signed-off-by: Daeho Jeong [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soCqI-0004sC-VO
Subject: Re: [f2fs-dev] [PATCH v2 4/7] f2fs: increase BG GC migration window
 granularity when boosted for zoned devices
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

On 2024/9/10 6:19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need bigger BG GC migration window granularity when free section is
> running low.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
