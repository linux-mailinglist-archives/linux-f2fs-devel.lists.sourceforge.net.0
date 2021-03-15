Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2F33AC77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 08:47:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLhwi-00037h-UB; Mon, 15 Mar 2021 07:47:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lLhwg-00036f-KD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 07:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cqOlyDbcrleWuWQdEeOtSIicMHD4k5gpxWrr9pX0tR4=; b=YfyRpClfJAaiqUiC5JpvKMsm9c
 eHUNwcy76FBKHoBx4gRy7i0E65KU6o4N5JpUve/S1p4aIb7Ss/ARBSfHasIlEu4/rXOz/39kmXYA9
 ZHiLIdVD13k1/MJTcCkJYanaT8rjZdwtt3OFauKv+LPJ+KOvTRINYe8yitLpRFUJaBgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cqOlyDbcrleWuWQdEeOtSIicMHD4k5gpxWrr9pX0tR4=; b=mfb8iQC2FKHKl+9JcOOrsC/oZb
 +jNGLR1dlXWZDsyUv1HJQ9i1JFSB6FOlZUnSbde6azX5Ud+nAhvN2I/l3at11nU72j+bgUi1ckKwO
 l7Oj8OWZ1QcJ/RybUMQsjeeOVUw8lgE40l2meAdP4FadYGEO+dxPkVNukGrH5581AS24=;
Received: from m42-2.mailgun.net ([69.72.42.2])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lLhwZ-0008CB-QP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 07:47:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615794437; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=cqOlyDbcrleWuWQdEeOtSIicMHD4k5gpxWrr9pX0tR4=;
 b=c/b4EWyKpRNg6lBTYsj1LmhrAsYRufGxA7SietIHWvKwsWqq6TPea5se/7MvoD5Jj7DP6EKj
 mk90ztIZXGOuBkeyjIhrPDaqUQKKieOh+DkHzG0niFQ1NImlI7HjUS0ppH8Wsn0SfhFJoUuk
 TDDokym3nrJSK8nRe0dEr2xKiOA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 604f10ebe2200c0a0d1fc409 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 07:46:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6DFAFC43462; Mon, 15 Mar 2021 07:46:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ACFF5C433CA;
 Mon, 15 Mar 2021 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACFF5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 15 Mar 2021 13:16:45 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20210315074645.GA8562@codeaurora.org>
References: <1615784186-2693-1-git-send-email-stummala@codeaurora.org>
 <49be0c70-4fe4-6acd-b508-08621f0623c0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49be0c70-4fe4-6acd-b508-08621f0623c0@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.42.2 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lLhwZ-0008CB-QP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the discard thread sleep timeout
 under high utilization
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Mon, Mar 15, 2021 at 02:12:44PM +0800, Chao Yu wrote:
> Sahitya,
> 
> On 2021/3/15 12:56, Sahitya Tummala wrote:
> >When f2fs is heavily utilized over 80%, the current discard policy
> >sets the max sleep timeout of discard thread as 50ms
> >(DEF_MIN_DISCARD_ISSUE_TIME). But this is set even when there are
> >no pending discard commands to be issued. This results into
> >unnecessary frequent and periodic wake ups of the discard thread.
> >This patch adds check for pending  discard commands in addition
> >to heavy utilization condition to prevent those wake ups.
> 
> Could this commit fix your issue?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=43f8c47ea7d59c7b2270835f1d7c4618a1ea27b6
> 
I don't think it will help because we are changing the max timeout of the
dpolicy itself in __init_discard_policy() when util > 80% as below -  

dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;

And issue_discard_thread() uses this value as wait_ms, when there
are no more pending discard commands to be issued.
<snip>
                } else {
                        wait_ms = dpolicy.max_interval;
                }
<snip>

The new patch posted above is not changing anything related to the  max_interval.
Hence, I think it won't help the uncessary wakeup problem I am trying to solve
for this condition - util > 80% and when there are no pending discards.

Please let me know if i am missing something.

Thanks,
Sahitya.

> Thanks,
> 
> >
> >Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >---
> >  fs/f2fs/segment.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> >diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >index dced46c..df30220 100644
> >--- a/fs/f2fs/segment.c
> >+++ b/fs/f2fs/segment.c
> >@@ -1112,6 +1112,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
> >  				struct discard_policy *dpolicy,
> >  				int discard_type, unsigned int granularity)
> >  {
> >+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> >+
> >  	/* common policy */
> >  	dpolicy->type = discard_type;
> >  	dpolicy->sync = true;
> >@@ -1129,7 +1131,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
> >  		dpolicy->io_aware = true;
> >  		dpolicy->sync = false;
> >  		dpolicy->ordered = true;
> >-		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
> >+		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL &&
> >+				atomic_read(&dcc->discard_cmd_cnt)) {
> >  			dpolicy->granularity = 1;
> >  			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
> >  		}
> >

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
