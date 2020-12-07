Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DF22D1456
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 16:05:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmI4S-0008To-PT; Mon, 07 Dec 2020 15:05:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kmI4P-0008SU-H1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 15:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=27TbVxViQ4DMTPA6gQMcPBS4WkglgEtkmDD0MeoKeic=; b=OEaIrEzj34ZkiueFsEm6JBdKZW
 v7emY7q4zV8/ln2K2vJ9kzmxodoU7QkI5U7X6xIjaP3mdLPScoS2OiUSBZz31Vo+htQhD2v1qqgfM
 kGUbDJ6q+cmJKytYoKVMp67GNjKHDSDjkxYzVIYKKNDMOLlmBYPo/BrdJgY6uzUhmu7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=27TbVxViQ4DMTPA6gQMcPBS4WkglgEtkmDD0MeoKeic=; b=LXjnu1jZW20kEJbyn7xwmkP3Nt
 RuIw2ZRDgVY/5j28WpHOSyDFeaqKhRGzdV2dUurwCYFsEj9AIEJUhKapHYFS50xA3yiBA1JP3fDcX
 ZEWA6IXm0lWaQGOUsOoV12PQZESENDCXNx1ugJ19mOx3yCIRGnxN3RYmKjJsuwFNJYfg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmI4F-0028NQ-5j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 15:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607353474;
 bh=+m4VjiTjGFNz/muvZcdSPiu21+zcpdowj4/SxbH6yow=;
 h=To:Cc:References:From:Date:In-Reply-To:From;
 b=CTWxiZRRSGXZ8oY4RJbseR5Ci6mHqzSqqjTYcvm0e8o9z0ogrrfkxS55oBR+MXFik
 VvECt4yfIRr8d3hMftu+DRG6NC8gqvJEc5MkOaMtMz4cKBgME8P2El1HAuKnG3JZyZ
 u+uw3n4UQwyPGZHLKajuY4+nDWdS0v4KHouAfONeLyPhOUzjPcoFk2ayReEbdzibJs
 vUkDzwSi1qe4iv4BKoKatN/Edh1NEh3OuEO/Qs9rkv82ksQKhJbYofvjKdwPYPeRdZ
 B6CiBj/qAQvK8DOeqWcfGVSHK7jkunhSgQQPIT4NlyR5DM7eV7NiwqusdFIsFtevsG
 CG341T8tOPrAQ==
To: liush <liush@allwinnertech.com>, jaegeuk@kernel.org
References: <1607338774-8541-1-git-send-email-liush@allwinnertech.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b78048de-f69a-79fd-1512-cf55321dbb3a@kernel.org>
Date: Mon, 7 Dec 2020 23:04:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607338774-8541-1-git-send-email-liush@allwinnertech.com>
Content-Language: en-US
X-Spam-Score: 1.9 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 2.0 PDS_TONAME_EQ_TOLOCAL_SHORT Short body with To: name matches
 everything in local email
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmI4F-0028NQ-5j
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: convert to F2FS_*_INO macro
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
Cc: tiny.windzz@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/7 18:59, liush wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Use F2FS_ROOT_INO, F2FS_NODE_INO and F2FS_META_INO macro
> for better code readability.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Shaohua Liu <liush@allwinnertech.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
