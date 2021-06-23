Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7D3B1CD4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jun 2021 16:47:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lw49x-0001wQ-LA; Wed, 23 Jun 2021 14:47:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lw49w-0001w0-1Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 14:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2GMvBYFWGRVAdjtywPYTd1s5Wmlys/Oh1IKCFOI43pQ=; b=AJ38YmjpZN7MRrt/zdAKoif0eh
 chtFtg7EJ355B28RYzL2DLWZO/E0nySS98IrkWYsaEWW0ER8yKGbZ0sea7e681i5iuOq7lXGSqnJr
 NSDe/aiXdg79Ckjxd6GSMwoWnKyjeuLLDA3Kbj3o6eaph6BKoLnuHYZVp0pzmjPnasz0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2GMvBYFWGRVAdjtywPYTd1s5Wmlys/Oh1IKCFOI43pQ=; b=CqAS+D26Q4QzOsNdkdMJ1RRRHu
 BZntaQoqVS153DLlefGXedgCeyVKMzAf19cidoL92y0/7ejdmWaRbX5a05K+02GOpAzEZc+51FRIt
 PuMugFBAiIpC+NbfeTyA4Xl1hDtZ+MCw0J2P+s61RBMZtXtGgOUKKZpFNlQ64eeT1Sy4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lw49s-0007Qt-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 14:47:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A1856100B;
 Wed, 23 Jun 2021 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624459632;
 bh=rVH8AZcPyAWXalCdOX+fn+q9gEBlsggnVNXBSp7gojs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Lx+UwfWpRtC8hlY7oHBdlFdQeVw31hB2VcbZeNo29fLr3HUi373l/FRPRMrx1f1Tm
 m2ir/yIVvcExV5ZjaoYiXAedTQHV2N02RPtf4I1uceBuBZsWsAAg8pnndzu0p7mNBj
 ox/2u+zmDoy4bYjV4mdSL1mfhVJe7IAxwv5LT52U4oaC00FyL5SakWufnecrpIsJm9
 9y1DJBdi6xL9CKT+JF6vAVlRzCqLdrwzYXcfDunLV9OYHxmhu6KTAHrxVDrIfdick0
 RhWI52o5mmGpWhWrzMqWIcTNAW6wjG4dbbTnzEh49/AwVMdrG3Knv3DeBW1rGfat+9
 oCY4bEg4ZLRHg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
 <20210621023939.1510591-3-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <e94edf00-e8bb-9bbf-fc01-d4caea138249@kernel.org>
Date: Wed, 23 Jun 2021 22:47:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621023939.1510591-3-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lw49s-0007Qt-Fk
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs-tools: fix wrong file offset
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

On 2021/6/21 10:39, Jaegeuk Kim wrote:
> This fixes wrong file offset updates.

Better to describe why the file offset is wrong in original
code...

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
