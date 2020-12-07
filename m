Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C932D1465
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 16:06:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmI6E-0007pm-SE; Mon, 07 Dec 2020 15:06:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kmI6D-0007pe-QL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 15:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dfvUFys5PlyLlUBaZxoL5D39xceuNUcpnMuxryCUGG0=; b=f5YtucXS4BoNNH9Evv97Im4zDu
 /dpNZp5LzcuX1f0Ynzv/oUeZ9esevrfKFWZBhOIBvhD232LWyGOGyw6Je/7zmqU26rbMWcZSEgLr8
 9a4NWqHipcOWT/A/UHxftDSJvNrlUurp5tJrp15s08TaftJOmxfNYd/C1C6+ytytcdZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dfvUFys5PlyLlUBaZxoL5D39xceuNUcpnMuxryCUGG0=; b=TwZo6iCxva1OP03hDqkKKIzIC6
 GpKIgz1JkIstuPF2cM31iiWb+B5fv3kKOxPCNdlFQOvxG3nZ2YudxcdEdl0cScY+LpLh33pCuy9hb
 tNnXrAKC85hXDhhZO9IuKKGgoHuT0p8PwMs9m84+e0iFn+2f5J4yuPrWg40d4fVGg3wY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmI60-005TKX-9t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 15:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607353586;
 bh=UknzbuqDK9Fr9lU5a/hvPbN5gZqB4HgBYDMvW5xk22o=;
 h=To:Cc:References:From:Date:In-Reply-To:From;
 b=RdeVVeFZ+1EebKQ1sop+/hBrxDOp+MY5WY5bTSTdqhkWNqC26tjopTYHot3Ixq+Gy
 eHrF+NdoYGKzYzY38gWBXZMdq/Xxg6F5CWIx0UjCoZf2FB63/OyiJrZeb4XlPjD/AE
 xo66czp1Y9Cx//p6M8Yq5vr4rhq1dHncn9trFzQGRtEEnQnQTZzvWTdun3MyJHdoMX
 m901JKk07azeW3SP9DV7UuhFw/DHW3qBLsBEWwCj/Vy1RiIrKo6DRkq98AB9eLoAF1
 yqgCXM/z8yDP4WHh947/nu67TpVrZhDZIPM62wUBDbdLV8ZnfqOToa/M6KM/k0Qkq3
 Gm4uYIzLFp00A==
To: liush <liush@allwinnertech.com>, jaegeuk@kernel.org
References: <1607338774-8541-1-git-send-email-liush@allwinnertech.com>
 <1607338774-8541-2-git-send-email-liush@allwinnertech.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b576e982-3d7f-4fd2-bc70-e7986847a549@kernel.org>
Date: Mon, 7 Dec 2020 23:06:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607338774-8541-2-git-send-email-liush@allwinnertech.com>
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
X-Headers-End: 1kmI60-005TKX-9t
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: don't check PAGE_SIZE again in
 sanity_check_raw_super()
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
> Many flash devices read and write a single IO based on a multiple
> of 4KB, and we support only 4KB page cache size now.
> 
> Since we already check page size in init_f2fs_fs(), so remove page
> size check in sanity_check_raw_super().
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Shaohua Liu <liush@allwinnertech.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
