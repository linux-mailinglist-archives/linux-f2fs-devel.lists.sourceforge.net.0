Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F360C1206B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Dec 2019 14:12:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1igqAY-0005o0-U8; Mon, 16 Dec 2019 13:12:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1igqAX-0005ns-Q4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q0pBmJyHoGMcfoxMIO9NR0WcibYzLY+o67Wbt+x0BVY=; b=a21HMH5cZPeHDJLu7I/E02vnms
 vezWOmcJnTejxHl+GB0uaOeanJgKtlu0jlhjMwCaVhufESge3Ubqz/7diw9O1HNFJ0EGaIU7koQiz
 qfc9ir2ZpCGEOiUsQu8A0SeORFQ4u16Qy8etzXLvkwkp+uuoxYj0uQiuFbXl/b/wvcc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q0pBmJyHoGMcfoxMIO9NR0WcibYzLY+o67Wbt+x0BVY=; b=O6wdfncQuekAIlDFGs+BKQpXiW
 FYKUQ4mBp4eXIbbVOSI+vKTL96yLkk/6oUbRV8SeRcO2YqP+p4+a/S2c5UXw+UbcEXiqpSi8wnl25
 Qa3+8G79iONr1xOP84GlsAhoDRWcYKk8DfflS6Q0Iciqbv17k/2+H0GrpdmQoDAa8KdI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1igqAV-00ElPC-Rv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Dec 2019 13:12:13 +0000
Received: from [192.168.0.114] (unknown [58.212.132.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DB3D2053B;
 Mon, 16 Dec 2019 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576501925;
 bh=Q0pBmJyHoGMcfoxMIO9NR0WcibYzLY+o67Wbt+x0BVY=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=jVmrChrSC3D3pKVsHt3mju/obeBFQ2If4PtAalDYDKiA9Mfld0zFCz7ywgxW4Hnuo
 qHix+BXzyMfiaxoxi8Ee2TFw4kiom/n6imwsgyWyZVV0/nGepdpSXFR8/k0xf9urou
 h4PjvoVc7Nn/zCCOJOXWuMztwcgYPj53ezBAEMsA=
To: Markus Elfring <Markus.Elfring@web.de>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <a69924ee-2729-3835-da9d-4fa0062c5737@web.de>
From: Chao Yu <chao@kernel.org>
Message-ID: <5c26d7ea-1fa1-1277-2735-5d5b221c2de0@kernel.org>
Date: Mon, 16 Dec 2019 21:12:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <a69924ee-2729-3835-da9d-4fa0062c5737@web.de>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1igqAV-00ElPC-Rv
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019-12-16 19:08, Markus Elfring wrote:
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>
> How do you think about to avoid a duplicate tag here?

Don't worry, will remove unneeded tags when resending formal patch.

>
> Regards,
> Markus
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
