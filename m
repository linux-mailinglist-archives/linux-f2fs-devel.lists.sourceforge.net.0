Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E44ACE11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 02:43:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHFXl-0005EU-R1; Tue, 08 Feb 2022 01:43:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nHFXk-0005EN-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=812cBK+/o+aOJ3deOlBP6iUQKYYborsWbYZFcmMQf/I=; b=YCZ1jXgvSJKQOMGwVWvAkQQ3wX
 JUW4h2bGqIzARdkZ8cut+gPvKBhvbFWbiiUDpInGJigOea51PODJVjkSLvxBr9Xcp4SuTHnSSCqcM
 mG2SNvBsuC7rf8n2pXCueeTm73G8mJ7F0wseYKPFCJk1jBpDNzN3dQDpObMeKxNZ+Pt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=812cBK+/o+aOJ3deOlBP6iUQKYYborsWbYZFcmMQf/I=; b=SkdJjIQBPG1CJf+e5JHgt4+TLv
 NGTl08WhcPkJEe0HPZxKyFJOZtCrB53lpomXhgIqrJO/7HfhE3MGG5d+1uM3lHCi54+nkJPbsnrbQ
 n0ImrqxMv1XeAFhwTomImiEbhNGBpkTdZkmY16nRs90Yb5jqWiGTqt7F6RZyLxyPjBrk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHFXf-008FMd-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:43:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3355660C11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 01:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249F8C340ED;
 Tue,  8 Feb 2022 01:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644284613;
 bh=xaw81OWLyuHjUMNsu7vc3jEE0twr/5mqrEcd4KZXj60=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=hwmfAwJI3a0DoV58ZKIafVjMUKHn/jfkH6rq6AqYQSjc8B6hCM9FImI7Bc28gO5XI
 4j2iUZpgV7hmQf/2E2ZMi8Ym8TZroAR5Y9s84GrKtfZ3d9v+qx1DwejiGj4f7IWZ1k
 R/6EpMvGaKpRd4xycCZUePXXVODzo6TGVtf/vV9dULdDrxoocPI6iHudopkzdh1HiX
 bTGzIbMNGtZAlu6yDPIpYUdGACSe/TYRSsMLMBr92uQFsqw6XMUFMjueqq8mzatTXX
 /CJdwHEVVhzjyuWQ2mctgIOPfGK0MczJnK3bJykuHwfW4hfURefkQaaw7wGlJaXps0
 cX2HZPMfRHosw==
Message-ID: <38422afe-fed3-63ab-345f-04ff21c1a1cb@kernel.org>
Date: Tue, 8 Feb 2022 09:43:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220127214102.2040254-1-jaegeuk@kernel.org>
 <YfsjEb2ii3eyPzng@google.com> <YgFsi7cvYOs6oB3e@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YgFsi7cvYOs6oB3e@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/8 3:01,
 Jaegeuk Kim wrote: > This adds a sysfs entry
 to call checkpoint during fsync() in order to avoid > long elapsed time to
 run roll-forward recovery when booting the device. > Default v [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHFXf-008FMd-Pf
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add a way to limit roll forward
 recovery time
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/8 3:01, Jaegeuk Kim wrote:
> This adds a sysfs entry to call checkpoint during fsync() in order to avoid
> long elapsed time to run roll-forward recovery when booting the device.
> Default value doesn't enforce the limitation which is same as before.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
