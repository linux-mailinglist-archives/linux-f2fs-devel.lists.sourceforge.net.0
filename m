Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8052B7A9B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 10:48:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfK4L-0007u9-E2; Wed, 18 Nov 2020 09:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kfK4K-0007tt-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 09:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LZDPTnI0SfHQDqX/PRxzLbm4h6u3pu5GkRqcG8AMgU4=; b=EB+3nI3IlhUOJw0OYuk8335Xn
 Mu0G5nrh4pOGd5J7gHIDTrmcDqsdDYD5gTLcTsygYYVZyb1J5K6kvtGz7mHeueZ1A3FypGWB47h+V
 DkDdVQAY1ZvG/JVEFplAd+rWStxM1d4wPG0CM2oA4z2OyyfpRTvUh+gdB/VcmxXU6SKHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type
 :MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LZDPTnI0SfHQDqX/PRxzLbm4h6u3pu5GkRqcG8AMgU4=; b=Z
 HSZ76JqELcKXCqAXaYAHvBYcKoq8MZdbyRFJFphP4R9z0ibPHMiQYs3d77+DfKa6m8vNYqBPBklI8
 GYKd8IsOf0LC/k2MlgYq8jXBjuxNueLbc2fc/cFIkc89k76Q5Lx13nOmSAM+uedTBT6HuG+ykrrR4
 lnPaFQKTX4Vj7VD0=;
Received: from z5.mailgun.us ([104.130.96.5])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfK48-003Fm7-MA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 09:48:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605692872; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=LZDPTnI0SfHQDqX/PRxzLbm4h6u3pu5GkRqcG8AMgU4=;
 b=Yr2XWMP+tW9E4xRZ00QBTG+b/RrNzhDuCQN7HC/XMvnHSonEqoJdt2Tj+0Ly+WkekRWiqljA
 EDkq3UWeLpcpDsa1PLlfxF6UYTUSuvYtfkzTYgS4UiARuN/rYYlgoc6iejKfRSXBW7Gib/3Q
 sAUrJyyTHtsOZevjNaxG4vui1tg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fb4edc13825e013b5f31009 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Nov 2020 09:47:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C7DC5C43463; Wed, 18 Nov 2020 09:47:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C4FBC433ED;
 Wed, 18 Nov 2020 09:47:44 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 15:17:44 +0530
From: stummala@codeaurora.org
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <0891f749dc8537fc56a35634388827be@codeaurora.org>
X-Sender: stummala@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [104.130.96.5 listed in wl.mailspike.net]
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?104.130.96.5>]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kfK48-003Fm7-MA
Subject: [f2fs-dev] f2fs: cp_mutex starvation issue
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

Can we consider to move the sbi->cp_mutex as well to use rw_sem similar 
to this patch of yours -
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/fs/f2fs?id=fb24fea75ca5ceef59f753494b2efd453606e08a

We are observing issues where fsync() of a high priority task getting 
starved when there is heavy IO from several low priority tasks.
I would like to know if this was considered before and if any issues in 
doing so? Please share your inputs.

Thanks,
Sahitya.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
