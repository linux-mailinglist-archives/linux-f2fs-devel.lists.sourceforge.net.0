Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B268DA4B670
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:18:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towJf-0007If-2R;
	Mon, 03 Mar 2025 03:18:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towJd-0007IL-JK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BpMcnf+siP/jOEf3mMzhuljOUVsaROuRufwS9vf+v0w=; b=aKxhWKJePvyJIpT1TZm9a95qYH
 PH6lsk5F0UKYCL7Izd6NriyAFOVXBdoCuoKKw5RmixfP74xZ+CdGSZEwrnwGFbhmrcqw/41D7I/tg
 5kesPHImHxz0bRBPbLv0ZsRBe15+50pc2nHF0nJccNHxi00IO7imQBiRgJZb8NV5VTX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BpMcnf+siP/jOEf3mMzhuljOUVsaROuRufwS9vf+v0w=; b=AoDQl5ntwwx0aNCmv30NJ4aX5f
 nplvliFhgQPQoyLv/dD9+XkTmq+/QBwbQ2A7m6zuO5mW/xO6Ebsk9m/aAkNcscjZjFEnslxO4/zda
 B/ZqO9QKHsWz+d7wuhykSQZusy3HHUOeMQLvSYparOl2i0VW2Cl0pJFghhwdRW9B/08w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towJb-00051j-OM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FC8A61196
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD48C4CED6;
 Mon,  3 Mar 2025 03:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740971868;
 bh=BpMcnf+siP/jOEf3mMzhuljOUVsaROuRufwS9vf+v0w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=guPclwxCDpNlsl9Z2VVAAWITQJc+vm2+ym5jNVf3Wz3qNXACDQZtvJ79qjExh5sx2
 9p7EbYJ2n0ZbA3AJuzXit2BIo/gs0nQin5Ui2zjwdOJcsGmYKmk9FjNEwxY4eQZL9n
 vJ/u0ShNVb7O6mPrVFGp7MAmr/exQ8iclTGdTrNLmbnX26ajLggz4ozDHbTwLZsgd/
 MBDnnMVGbNK3kKDFlz7z9mW0HpbyZlqLyrztKhnha51i6zSRQ7RxFrQwORnOyXkAqx
 /qV6Wznw5YP7KgT2WYRGbBS15CfSmcZ5B/S1cE6AjXuKC2SMwvr4rrvs0MZWjCmqJf
 V7M0taLu5c1Pg==
Message-ID: <3aadcb7b-272c-4a14-b4e8-bac89903a18e@kernel.org>
Date: Mon, 3 Mar 2025 11:17:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250228190854.422890-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250228190854.422890-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/1/25 03:08, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towJb-00051j-OM
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: support fadvise dontneed, random,
 and noreuse
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/1/25 03:08, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
