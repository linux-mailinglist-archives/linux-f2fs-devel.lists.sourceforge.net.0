Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13D17B4C5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Mar 2020 04:04:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jA3HZ-0003WF-Q2; Fri, 06 Mar 2020 03:04:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jA3HW-0003Vo-E7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 03:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZOMWZQxHKmTjCuz4rH2EIO4fJcoj+hJ0hT38eLMHzdU=; b=ShXlzdIwX7GyC/fUZQIoXCbVDQ
 du4Ew1BqPMtFSSvn+TEJAivsEYnnhJPoZH0ugqQhD3YSD6eblK1igGJV3g8QfZXZzQQ+ycBKunZUv
 zfiXNnWsPL1Xh3OznFTSCtqwKOfU1Ko+zkUNIX12fS/tay3vOAzJvlVfCfTi12Y/FYmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZOMWZQxHKmTjCuz4rH2EIO4fJcoj+hJ0hT38eLMHzdU=; b=jTp1jnLq66UuZkQ72L3SEfE9rw
 t5vp08PVevkJ7buHF8yPtJImjL2VRLifSyMpWgUCZaAlL7kSUS36AnK6K+WaSY/hKPtRw3z/2UbAX
 N6MqYdGIeuRZ3LnMSrRAO5pE1l38s6eAaEQ684iPJEqV2zRfv2sHSDuVb70AA/0DYiQI=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jA3HL-009pLV-T7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Mar 2020 03:04:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583463842; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ZOMWZQxHKmTjCuz4rH2EIO4fJcoj+hJ0hT38eLMHzdU=;
 b=LEVe6Pscdkn2k6XyzeSDQlRhW6Iy7sOmnRIJhTmGD/lofES5cYDqWHkz7+DQfSAKdqYy7zRX
 ZtrmQYynCO5TMq8PJqu1BoSoyJ7/5r88RQ8NlIBHhVoqdry2rC+9ExaCRTAMTb6Wy7zglycF
 s34byi1xk1H/sqJawP21Ja7Fd10=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e61bd84.7f2ed0b5c180-smtp-out-n02;
 Fri, 06 Mar 2020 03:03:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C150EC4479C; Fri,  6 Mar 2020 03:03:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FA0DC43383;
 Fri,  6 Mar 2020 03:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FA0DC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Fri, 6 Mar 2020 08:33:27 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200306030327.GH20234@codeaurora.org>
References: <1583245766-3351-1-git-send-email-stummala@codeaurora.org>
 <1583245766-3351-2-git-send-email-stummala@codeaurora.org>
 <e164f166-5c3f-a2ce-aec6-ff01ecb902e8@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e164f166-5c3f-a2ce-aec6-ff01ecb902e8@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jA3HL-009pLV-T7
Subject: Re: [f2fs-dev] [PATCH V2 2/2] f2fs: Add a new CP flag to help fsck
 fix resize SPO issues
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

On Fri, Mar 06, 2020 at 09:19:39AM +0800, Chao Yu wrote:
> On 2020/3/3 22:29, Sahitya Tummala wrote:
> > Add and set a new CP flag CP_RESIZEFS_FLAG during
> > online resize FS to help fsck fix the metadata mismatch
> > that may happen due to SPO during resize, where SB
> > got updated but CP data couldn't be written yet.
> > 
> > fsck errors -
> > Info: CKPT version = 6ed7bccb
> >         Wrong user_block_count(2233856)
> > [f2fs_do_mount:3365] Checkpoint is polluted
> 
> I'm not against this patch, however without this change, could
> fsck have any chance to repair old image?

Sure, I will update the fsck patch to handle it.

thanks,
> 
> > 
> > Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
