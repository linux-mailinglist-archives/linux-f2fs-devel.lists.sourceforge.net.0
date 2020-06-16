Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B01FA5B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2020 03:37:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jl0XL-0000GT-SW; Tue, 16 Jun 2020 01:37:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jl0XF-0000GD-Az
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 01:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMh92ChtsXia9yszVbB8XBW80SKYdVIfI1TvNqZjeKY=; b=K36pBMcVT5Hn7nPiSBrN65SZIv
 XomGeqAjPp77+jJCN21UWhTi0DqAJMJIfcJSf3hpW0fYv+8gBbXyKc0Ywzvt39Oz7b71ZHfKaVSBa
 mgjChS46WBSYZhaQ2GNx4xF+DNrVVCf6VLCXKeR3MUgg6BpJEgzzmZJOvkIvkxrt6vkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xMh92ChtsXia9yszVbB8XBW80SKYdVIfI1TvNqZjeKY=; b=b9RAu1OilDbwMPDjMyj8xFRD11
 ks/UTD5XiLIwXZe3hZ4pHIukey7YyqC2TDXaqFJ7S6eRgKPtZfmTORBcw0xAkxIlXJ0LVtkCh+5Zz
 xxwIGxGxZYnkG/t/pAJJ5QgU38qLfXPimJjFLyrFIfkeO9y2Dr7mOPUixPoo0TdiNTiw=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jl0X5-004PCb-OV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 01:37:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592271423; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=xMh92ChtsXia9yszVbB8XBW80SKYdVIfI1TvNqZjeKY=;
 b=ge7g8V8/1S/+ay7bLoFFMgkGLwgrRzjeUuMZpltXRctESvX7TCOkNRTTVjBtOlkUh//nAj0+
 VuOWfxqUZX0K3lAY5yjm4jQsiEClyGn6wDMYfW6ftbjzFBAzgOzWL0+COLmMDcVAVTjyCBM9
 Y77snkF0LWN0nVS+bk8eVYQSMc0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ee8221d86de6ccd441a77e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 01:36:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 650D0C43395; Tue, 16 Jun 2020 01:36:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B682C433C8;
 Tue, 16 Jun 2020 01:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B682C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Tue, 16 Jun 2020 07:06:22 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200616013622.GC2916@codeaurora.org>
References: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
 <20200615050019.GA3100@sol.localdomain>
 <20200615061633.GA23467@google.com>
 <20200615095316.GB2916@codeaurora.org>
 <20200615154720.GA902@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615154720.GA902@sol.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jl0X5-004PCb-OV
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free when accessing
 bio->bi_crypt_context
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 15, 2020 at 08:47:20AM -0700, Eric Biggers wrote:
> On Mon, Jun 15, 2020 at 03:23:16PM +0530, Sahitya Tummala wrote:
> > > 
> > > Should I fold this change into the original patch? Or keep it as a
> > > separate patch when I send out the fscrypt/f2fs inline encryption
> > > patches?
> > 
> > It may be good to keep it seperate as we already have the base FBE patches in
> > several downstream kernels, so this fix can be applied easily. But I will
> > leave it up to you to take a call on this.
> > 
> 
> We should fold it in because the patch this fixes isn't applied upstream yet.
> 
> We'll need to submit this as a separate fix to the Android common kernels
> because they already have a previous version of the inline encryption patchset.
> (I assume that's where you have the code from.)  But that doesn't affect what we
> do upstream.

Sure, no concerns from my side. It can be merged into the original series.

Thanks,

> 
> - Eric

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
