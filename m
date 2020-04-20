Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCC01B0788
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2020 13:37:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jQUk8-0006az-1f; Mon, 20 Apr 2020 11:37:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jQUk6-0006ad-Q6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FwkQvFRxwbLjQxAc2Z3zkT0Pkf1NFBtbxmMPO/jSwbI=; b=P8FXV2P3ODgjyKU1aObYcfjPJU
 eHRTpHSG/APFTlaNBXomd03AY3N8JVg6AconhyCFwdWVc36LyhUpoJup7V+fZEfghevgZyYkx4jGB
 xvjx+9g4Y8ebZZ33HH+D9wzTZ2ZuYWVAQbuxpEar6YBxnnsAWITjCb61wjOoYmp4qNF0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FwkQvFRxwbLjQxAc2Z3zkT0Pkf1NFBtbxmMPO/jSwbI=; b=JXirXbAOUsl83Hah+M9qI24NgX
 NDh5ZGNoUl/xI9S8rRZRpl+uj8NQ6Pi6fHFgSK/FU9VudX5771ekjVzaJ3YBRlN6HU3mkLksuDOuB
 LWok3VnOr/uMr5xY1XoiFreX1vkkLlYODFCeVGlgAxNM1d01E4bBSKVStdaiIU/PerS0=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jQUjs-004MD1-2I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Apr 2020 11:37:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587382647; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=FwkQvFRxwbLjQxAc2Z3zkT0Pkf1NFBtbxmMPO/jSwbI=;
 b=P+SgMdvW6SdoBQdpU9ZYFsdl9cM97444MYlqkjc/VCd2C43Gi9U8hDszS8ugmDmRGUQ0jnt8
 sKB82vTytPucENUAINzJPZwP9RQ00OeUA3z/fOV9FXtd50w4h+cqdu3QGVKwwN50n47U7dqv
 xDyWVwLsgjxXje8l+CMcKVUnk9s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9d8968.7f3340268928-smtp-out-n01;
 Mon, 20 Apr 2020 11:37:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98EFCC433D2; Mon, 20 Apr 2020 11:37:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0A63C433BA;
 Mon, 20 Apr 2020 11:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0A63C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Mon, 20 Apr 2020 17:07:05 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200420113705.GF20234@codeaurora.org>
References: <20200331090608.GZ20234@codeaurora.org>
 <20200331184307.GA198665@google.com>
 <20200401050801.GA20234@codeaurora.org>
 <20200403171727.GB68460@google.com>
 <20200403172750.GD68460@google.com>
 <20200413174237.GC39092@google.com>
 <20200414134403.GA69282@google.com>
 <20200416214045.GB196168@google.com>
 <e1b763bf-7f72-01eb-a368-9b70e0f46f55@huawei.com>
 <20200417161516.GA17901@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417161516.GA17901@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jQUjs-004MD1-2I
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint
 is in progress
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On Fri, Apr 17, 2020 at 09:15:16AM -0700, Jaegeuk Kim wrote:
> Hi Sahitya,
> 
> Could you please test this patch fully? I didn't test at all.

I have tested v5 and so far found only one problem where MAIN_SECS(sbi)
isn't updated properly. Fixed it as below.

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 603f195..a5166b1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1450,7 +1450,7 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
                f2fs_bug_on(sbi, 1);
        }
 out:
-       MAIN_SECS(sbi) -= secs;
+       MAIN_SECS(sbi) += secs;
        return err;
 }

I will let you know in case anything else shows up later.

Thanks,

> 
> Thanks,
> 
> On 04/17, Chao Yu wrote:
> > On 2020/4/17 5:40, Jaegeuk Kim wrote:
> > > On 04/14, Jaegeuk Kim wrote:
> > >> On 04/13, Jaegeuk Kim wrote:
> > >>> On 04/03, Jaegeuk Kim wrote:
> > >>>> On 04/03, Jaegeuk Kim wrote:
> > >>>>> On 04/01, Sahitya Tummala wrote:
> > >>>>>> Hi Jaegeuk,
> > >>>>>>
> > >>>>>> Got it.
> > >>>>>> The diff below looks good to me.
> > >>>>>> Would you like me to test it and put a patch for this?
> > >>>>>
> > >>>>> Sahitya, Chao,
> > >>>>>
> > >>>>> Could you please take a look at this patch and test intensively?
> > >>>>>
> > >>>>> Thanks,
> > > 
> > > v5:
> > >  - add signal handler
> > > 
> > > Sahitya raised an issue:
> > > - prevent meta updates while checkpoint is in progress
> > > 
> > > allocate_segment_for_resize() can cause metapage updates if
> > > it requires to change the current node/data segments for resizing.
> > > Stop these meta updates when there is a checkpoint already
> > > in progress to prevent inconsistent CP data.
> > > 
> > > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > 
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Thanks,

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
