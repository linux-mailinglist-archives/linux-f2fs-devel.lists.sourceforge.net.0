Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2573F9AEE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Aug 2021 16:36:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJcxx-0002Tb-Ay; Fri, 27 Aug 2021 14:36:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mJcxv-0002TF-LR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 14:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g0v+9Ynu1o7/Jj8FR3TsbELtvV1ccH9t4wPnsv+y0+I=; b=Qpnb8OuXfJQ8EqSuxQ5+FrNBFc
 I2hTxMt0DnC0wz7rig1Ogy+nm5V3jVKNkJ+fKl0f7wtYIEjx69c+RgzWP9CN04SFe/KNA5t9Lafx1
 uwhqKDWs3xMShm5bsf24KrCPPKxF37IqOlURLPwelQJw4PWlc/o038PvxrjmJHw9xUgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g0v+9Ynu1o7/Jj8FR3TsbELtvV1ccH9t4wPnsv+y0+I=; b=BQt31NlNx5ybMP7WATR8gURsxc
 g4h3OXrkmcpXM7gP5uh7DhXys+3qkaznrZpcPXO8v1hnw8rzWBByEyjWXxCE3wyVkUcdc1X2ac499
 5VwY/wClz6SQ4mm32eHA8FESgwD666M2peqeuR8CRwR5olQ4HLF6VppmVUY6HFhdrQt0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJcxv-003RKy-1j
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Aug 2021 14:36:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D99B66056C;
 Fri, 27 Aug 2021 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630074969;
 bh=z3xfp8u4+uJOQSeXp4ZKSEbEw8WZb1aXyFXJc6oIpG4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dYmTbIIQ3V/GB/pyfrw44fA+njyeg9YIDkkhKtbZOwMwmEyvY5i9gmTVNAnYzfp53
 o1scZZUjlKKZgDNGTlV96Kk5JRMqkWZEqsQI4zDYrLHsCOTgKRmCqzikmYYk1ngMQT
 2ObUaRu/jY8MqzTs9XCu6cOZ+GnP5UouxVjy7+RXW3cpuAPFsu0lYbgAWfLgZ1BI6P
 YzEnPV7ifnUUqFcPjeu57khSMpyqGYyiw4Qy1LH8p08XEOOUoINfMwW7cjuVSS/eoO
 6dYj0IGPQ4jflCvy8FikX45XEnISMUHI1HcVCnKtE3CueNq7TsKEJbFVPIjAQTAQU4
 4rGwtPj0o8CiQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210823170151.1434772-1-jaegeuk@kernel.org>
 <YSa3DPBIFZ5P17vt@google.com> <YSfGwKtGhutsTJ8x@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e0869c6f-e261-01d0-92d2-abb1cc2957ee@kernel.org>
Date: Fri, 27 Aug 2021 22:36:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSfGwKtGhutsTJ8x@google.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/8/27 0:52,
 Jaegeuk Kim wrote: > From 64fe93a7f9c35c2b5a34cfa3cf84158852c201be
 Mon Sep 17 00:00:00 2001 > From: Jaegeuk Kim <jaegeuk@kernel.org> > Date:
 Thu, 19 Aug 2021 14:00:57 -0700 > Subjec [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mJcxv-003RKy-1j
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: don't ignore writing pages on fsync
 during checkpoint=disable
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

On 2021/8/27 0:52, Jaegeuk Kim wrote:
>  From 64fe93a7f9c35c2b5a34cfa3cf84158852c201be Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Thu, 19 Aug 2021 14:00:57 -0700
> Subject: [PATCH] f2fs: guarantee to write dirty data when enabling checkpoint
>   back
> 
> We must flush all the dirty data when enabling checkpoint back. Let's guarantee
> that first by adding a retry logic on sync_inodes_sb(). In addition to that,
> this patch adds to flush data in fsync when checkpoint is disabled, which can
> mitigate the sync_inodes_sb() failures in advance.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
