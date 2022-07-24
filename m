Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CFB57F49B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 12:00:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFYPq-0002kj-HY; Sun, 24 Jul 2022 10:00:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFYPp-0002kd-9J
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 10:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADvPD0I29Jhmj4LK8NZk3MT3Dfj0tmGy9tggGOZWVh8=; b=Pvy/ahToirLCfY2e9855FKh4ae
 rD4D+aB1XtHOjwh8TxJ/1qex/usGGU+UjWk1U+8e1RbmUSeVXcS27hYyAnHkBMH5HTkfBUQLhsfCK
 HUBb/MmhbdnI30AoFb6Q5oiiVdJI+V0cj3coEOko/d9ahYOC1fysmS2FEadj3OvpCWtU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADvPD0I29Jhmj4LK8NZk3MT3Dfj0tmGy9tggGOZWVh8=; b=XcwHO24QvUTZ96P7HecmpRSLDR
 71rmhEELHAmMOClgCEw0sfnkFotcssSkfctFeFj9jD0/w+cqjLxWtZCznh2jXzgxFY7XJbibBGn1p
 7V1TSA1+JpXxpiP3Gk4/lYpcrh8Rko8/U6/luQC6RL4zieEKpq+GkxcH4+wSbrnLmlhg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFYPn-0005T2-7u
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 10:00:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED985B80D5A;
 Sun, 24 Jul 2022 10:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F93C3411E;
 Sun, 24 Jul 2022 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658656839;
 bh=A4FHc+P9y/UxGoatQYWWeSdTQMu+VX8oS36oBmrynAo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mGqwt1OzRK2G0vTIgC026+s1UGmIMTpZtc++EhtzGRx5FUPu9VvBJ4xDxeiRiiSJN
 j+umsZvRUBYCHTIqaGqnkgVuYT2p/hLDhTIP3FQIwewSDXC+mZzfH9k2w5CFkpcIhh
 1xOyqBpOF14wtB4hGlcfWGJKWXZquHYWE9KsKzzNGv375W5p+d9C/CtO48YmGA34+y
 0AHA2HzBX9TLGOFKqoiWrBTs1QstMJBnihEx1rFoDojOzfVOjExZEJ0nQ+6Pe94XFu
 q/7/RPBARxrhD64DrLdv2gwpAcXxOzBMHEhPnGavegGndXLl6r/VB4EfZFpat6U3lm
 w1B/BPPKW/vJg==
Message-ID: <ebd98d0a-09c2-311f-0e82-ed87b3b7d66b@kernel.org>
Date: Sun, 24 Jul 2022 18:00:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, qixiaoyu1 <qxy65535@gmail.com>
References: <20220718032840.9653-1-qixiaoyu1@xiaomi.com>
 <YtoOGu/wyqKBJd1v@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YtoOGu/wyqKBJd1v@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/22 10:40, Jaegeuk Kim wrote: > On 07/18, qixiaoyu1
 wrote: >> f2fs_gc returns -EINVAL via f2fs_balance_fs when there is enough
 free >> secs after write checkpoint, but with gc_merge enabled, [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFYPn-0005T2-7u
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't bother wait_ms by foreground gc
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/22 10:40, Jaegeuk Kim wrote:
> On 07/18, qixiaoyu1 wrote:
>> f2fs_gc returns -EINVAL via f2fs_balance_fs when there is enough free
>> secs after write checkpoint, but with gc_merge enabled, it will cause
>> the sleep time of gc thread to be set to no_gc_sleep_time even if there
>> are many dirty segments can be selected.
>>
>> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>

> 
> I applied without {} to match the coding style.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
