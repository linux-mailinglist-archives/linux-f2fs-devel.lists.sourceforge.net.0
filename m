Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D8248285
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Aug 2020 12:05:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k7yUa-0000ng-32; Tue, 18 Aug 2020 10:05:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1k7yUY-0000nK-UL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 10:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1CCGquylX71KDdCAwA2iJHahtHl1/4eQuBxd7BGCEw=; b=ROPugXwHpB2MCLFpx5nFy8DCqF
 FlngPIYt2y/BHGJZH5GX0rgeontisfkiIwW9jOJNs1t+LUIKFqChWRhIlaKaaJeWYEUABFnhj+7rY
 5K0ljZYccMcxCqPUPkvYM+5Hqc5UZnzawFkN7Hmyz2LNuwM/+7n/4X3CzDAT3lBw9I/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T1CCGquylX71KDdCAwA2iJHahtHl1/4eQuBxd7BGCEw=; b=NsF4h5qCB6btRHLZftIBj1visZ
 feWdNAOGvaFHNnxkw5P89urj7QDsyIPz19vPyb9/pLLa22hpRLNcIYHq3UAUCQ8biu39oXcKU+itX
 QsBwdhlS1e3itp9nlf4vvD4XxcZJeizYTNBMRfYZrZKMqXL0kfVnjhQbeuJEWH8OmcHM=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k7yUD-00F98U-L3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Aug 2020 10:05:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597745111; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=T1CCGquylX71KDdCAwA2iJHahtHl1/4eQuBxd7BGCEw=;
 b=DbDr6lWkxxM+GumnU1NfXuujzfpIquvnzqhf/jAFaeh4dWStRsCBMf6kbSinsu+XFXX20heY
 hLB5Ilt4B6OLJmHmQ+UmLjX7q0N44CSXiLnbD/CiKbs4H5raeqqlbbURl4FEUV871DCTIZll
 uF+M/aN0sdZCRc4S7gbdeQyzRDo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f3ba7b52f4952907d80be70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 10:04:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98B32C43391; Tue, 18 Aug 2020 10:04:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B6E7C433C6;
 Tue, 18 Aug 2020 10:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B6E7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Tue, 18 Aug 2020 15:34:31 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200818100431.GB5062@codeaurora.org>
References: <1597392335-4998-1-git-send-email-stummala@codeaurora.org>
 <e1251327-bd48-215d-e558-08780474bddb@huawei.com>
 <20200818095547.GA5062@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818095547.GA5062@codeaurora.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k7yUD-00F98U-L3
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix indefinite loop scanning for free
 nid
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

On Tue, Aug 18, 2020 at 03:25:47PM +0530, Sahitya Tummala wrote:
> On Tue, Aug 18, 2020 at 04:29:05PM +0800, Chao Yu wrote:
> > On 2020/8/14 16:05, Sahitya Tummala wrote:
> > >If the sbi->ckpt->next_free_nid is not NAT block aligned and if there
> > >are free nids in that NAT block between the start of the block and
> > >next_free_nid, then those free nids will not be scanned in scan_nat_page().
> > >This results into mismatch between nm_i->available_nids and the sum of
> > >nm_i->free_nid_count of all NAT blocks scanned. And nm_i->available_nids
> > >will always be greater than the sum of free nids in all the blocks.
> > >Under this condition, if we use all the currently scanned free nids,
> > >then it will loop forever in f2fs_alloc_nid() as nm_i->available_nids
> > >is still not zero but nm_i->free_nid_count of that partially scanned
> > >NAT block is zero.
> > >
> > >Fix this to align the nm_i->next_scan_nid to the first nid of the
> > >corresponding NAT block.
> > >
> > >Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> > >---
> > >  fs/f2fs/node.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > >diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > >index 9bbaa26..d615e59 100644
> > >--- a/fs/f2fs/node.c
> > >+++ b/fs/f2fs/node.c
> > >@@ -2402,6 +2402,8 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
> > >  			if (IS_ERR(page)) {
> > >  				ret = PTR_ERR(page);
> > >  			} else {
> > >+				if (nid % NAT_ENTRY_PER_BLOCK)
> > >+					nid = NAT_BLOCK_OFFSET(nid) * NAT_ENTRY_PER_BLOCK;
> > 
> > How about moving this logic to the beginning of __f2fs_build_free_nids(),
> > after nid reset?
> > 
> 
> Sure, I will move it.
> 
> > BTW, it looks we can add unlikely in this judgment condition?
> 
> But it may not be an unlikely as it can happen whenever checkpoint is done,
> based on the next available free nid in function next_free_nid(), which can happen
> quite a few times, right?
> 
> Hitting the loop forever issue condition due to this could be a rare/difficult to
> reproduce but this check itself may not be unlikely in my opinion.
> 

Sorry, I was wrong above. During CP we update only ckpt->next_free_nid but not
the nm_i->next_free_nid, which is done only once during boot up.

So yes, I will mark it as unlikely conditiona.

Thanks,

> Thanks,
> 
> > 
> > Thanks,
> > 
> > >  				ret = scan_nat_page(sbi, page, nid);
> > >  				f2fs_put_page(page, 1);
> > >  			}
> > >
> 
> -- 
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
