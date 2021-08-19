Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF1D3F1485
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Aug 2021 09:48:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGcmM-0003DN-8l; Thu, 19 Aug 2021 07:47:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mGcmL-0003DC-C3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 07:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pge/C90BhDZsT5HXcLqvsOVVjVDmlrYhu0KdoFRnx1g=; b=Pp4HLIyhaTOEGbcKvvoAGPmT0C
 RxO46wlNXbzxCyO3ytj88xlHGsfo9U5YhcmXX2J0wTwZFNNkxJjX2xZP3bA4kquF7U6M0mR/l0d1A
 ykejfpM0g2aA4rHANlG6CvtxTE77z1LA2Trd4iyBfLHvBT4Cg7D4cnWmoJeuuQe9CjWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pge/C90BhDZsT5HXcLqvsOVVjVDmlrYhu0KdoFRnx1g=; b=h2iNG5mQnxe7IVEsrMzHQhxUql
 kOQOOxmh1wnD45wTmZQChqSOHNtSnZ7NnY5nflK9MV+kd/ch41hTC2X63sf+YuUeK82AR43fRLT0f
 uC8hzkZXdWTqeUklcgFVGo+MHFCJdoX821PV6LMxh/RLIPYb1lnzwpii+Dl+LU/ATWRk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGcmK-00BHrc-Q0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 07:47:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68CDB61028;
 Thu, 19 Aug 2021 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629359266;
 bh=dKGXr58QI9hhP/tAM3xxN8kjv11VKdqGpfR9ZIEUPpE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C6x8UX345MewAxXAO9rN5joko81ZZBCDbtwydFOE8FMFotDHlaqLjBwDnlHmPoA7b
 DM85bg6tCLSDrNT3jNCwZu54hQ1HK720a2mxZr89P0IovOt/p3vb/2zcZMk6Ku3/9I
 3FldFttNVIH2o/z8wBPuTAV4Kdn/iJNRV4nOfpsmmjik8IQ7WD4b58ZH13Ed2KZk2C
 R4ZkXhUB6TjxJeo9VSonh8xzXZMqImgOoO/3cF/aUUw8YUIsfXoDQecVq3REZB69aj
 H9u4lVNpil3mT2EexKh9OGxAbxVsiYve66v4ag0AL11B9PrFZlS3Gv7+dtxjalEPXo
 jqlotsbVlFIfQ==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210816072248.45498-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <df8c22e8-f9bb-de50-1ff6-d7b6eee491bb@kernel.org>
Date: Thu, 19 Aug 2021 15:47:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816072248.45498-1-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  1On 2021/8/16 15:22,
 Fengnan Chang wrote: > Don't create discard
 thread when device not support realtime discard. Don't create discard thread
 when device doesn't support realtime discard or user specifies nodiscard
 mount option. 
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
X-Headers-End: 1mGcmK-00BHrc-Q0
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: Don't create discard thread when
 device not support realtime discard
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
Cc: Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1On 2021/8/16 15:22, Fengnan Chang wrote:
> Don't create discard thread when device not support realtime discard.

Don't create discard thread when device doesn't support realtime discard
or user specifies nodiscard mount option.

> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
