Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F22555ADDA3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 04:58:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVOn5-0006tF-No;
	Tue, 06 Sep 2022 02:58:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVOn3-0006t3-C9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 02:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KRSCFecu011dikO4TGJ9f8CwcSGZX2l1jY30hj560w4=; b=YKQkYNThiFnzw4uWPuHrRAq8B1
 htmG3sAlF7fmyXFpChQS3pzu9FDSJKeVxyMf2lFw70OVh+r5LCsy+gwHJcP3kQ9zr3VEnXY2zvgdD
 bFVDvFReb8JBHRjxR4AyUTcfMoi5Gj/YG+SiElI+rdUuGvnGVrWndAxgO1ATcC5QwZ9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRSCFecu011dikO4TGJ9f8CwcSGZX2l1jY30hj560w4=; b=dSu0JswaH6QBTI0HrYomhkO0jL
 kk3I8Tsw0tO0zGbANYr0x2rV0exUpUbLxN9b+qgL++vUbozZZAbXBw9hQ+RiOp0HDcFvD6/faykcY
 OtfOs5zi3X7WPVUO46sCOM48xQX3Sb1pG+56tVAm/VLo/pSP4qb5KYSlsKg2Xlyx+pFw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVOn2-00Gri6-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 02:58:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87276B815AE;
 Tue,  6 Sep 2022 02:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B0EC433C1;
 Tue,  6 Sep 2022 02:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662433089;
 bh=VgiapESEI1yn/ros3Sr8//iotTzOvdG+P3RJkMjESKY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OsEQQfmEVINpX7FYkFcr71JUfSj1GdHcdvuS6Qjp8k//sSPrLNFbzKvR/n+wcPNss
 wRu8ermPIbjIyuhu2aI9O4/nYsVMszbZ2om/jEgcaCxLm7zXFGQJ64HaZttd/bJIY9
 n6UHbkf2KzoVbXLGxX5BZxbXbs39yLCBJMpsSgNDMdM4BHVsFYLVkttIZfinQjMNbH
 PSGT3r3LCO8p4hlTEGHUWsLCcljHQKNMBFqq2dQ5TfOpmVWrf/hBjuuaSWIuppKeXC
 TfXR+/7zh/IsIza0gRuOYxJTpyN3Clpd+dxOkfqPKNGkHUWzdDGeles29Z4r3m8j/b
 FwLEd/Qe/MmyA==
Message-ID: <758e68ce-2c23-f2b6-3034-3c4b339400f1@kernel.org>
Date: Tue, 6 Sep 2022 10:58:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220901071937.93945-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220901071937.93945-1-zhangqilong3@huawei.com>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/1 15:19,
 Zhang Qilong wrote: > It have checked "compressed"
 at the entry of > f2fs_sanity_check_cluster, just remove the > redundant
 check for better performance here. > > Signed-off-by: Zha [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVOn2-00Gri6-P1
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove redundant check in
 f2fs_sanity_check_cluster
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/1 15:19, Zhang Qilong wrote:
> It have checked "compressed" at the entry of
> f2fs_sanity_check_cluster, just remove the
> redundant check for better performance here.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
