Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB033D275
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Mar 2021 12:09:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lM7Zi-0000zQ-SI; Tue, 16 Mar 2021 11:09:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lM7Zh-0000zI-28
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 11:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OFtX+PIKrPWVjHh7uzVfH7+KsCwnQmpBgFHLcwaMAvs=; b=imunUzAQcYKAfyxNWa5rnPHP9O
 Qd7C/D0YvGxFiB2FfnBCmMrziHZuUctS5+CplG7Xnn7R3L9jYC+49O945Il/tTjAI2vT6BCmu4K5e
 Xpfqn0C8Wh9pF53wvU6uUqLZlV2msmU3xAv5Ig9d7DiOQpRQPeXj+aZh+d/IpRluM8ts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OFtX+PIKrPWVjHh7uzVfH7+KsCwnQmpBgFHLcwaMAvs=; b=UUKoL8iEwm77eC6ozw3owBWfUJ
 Bw8Cnd+7MKEkQbfOh8bnZEZfWfHSvICSj8gSB3AKZ0eDlFicwbCYejjuJSLmclkdB8gKP2RxhdPED
 7rO+ZTGkVXPnoXDcOJelxbmI1Yum6h0DT1n+JOCkjZIHckkrrw80aggpl6beIvOYr9mo=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lM7ZX-00027x-0r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 11:09:20 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F09V56rSBzrXBF;
 Tue, 16 Mar 2021 19:07:09 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Mar
 2021 19:08:58 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1615886958-717-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3c453b72-892f-7044-2edd-224b82202608@huawei.com>
Date: Tue, 16 Mar 2021 19:08:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1615886958-717-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lM7ZX-00027x-0r
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: allow to change discard policy
 based on cached discard cmds
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/16 17:29, Sahitya Tummala wrote:
> With the default DPOLICY_BG discard thread is ioaware, which prevents
> the discard thread from issuing the discard commands. On low RAM setups,
> it is observed that these discard commands in the cache are consuming
> high memory. This patch aims to relax the memory pressure on the system
> due to f2fs pending discard cmds by changing the policy to DPOLICY_FORCE
> based on the nm_i->ram_thresh configured.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
