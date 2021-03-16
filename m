Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893733CA8B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Mar 2021 02:07:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLyB4-0000MQ-D8; Tue, 16 Mar 2021 01:07:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lLyB2-0000MG-RB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 01:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zIJi9B3gotz2Fu+vHRL9q9q/EFcY1E8kyYn5p3txyMM=; b=ftaq87KvKQtXvBSj4nT/9ILmaf
 QwMd5jbkWXoanNSuaNMFg6zWXBrsoC+nwl0wORiZ3E72iKRk1j7u3a+Mwn6RS8+NYJai06yyrlS8L
 3scMoxAycS8fhRMPStWqVE18snacbX/2VeXLPhQtBSh9yb6gZDCXR1psRDT4JpSx2MMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zIJi9B3gotz2Fu+vHRL9q9q/EFcY1E8kyYn5p3txyMM=; b=eQd3SEPYdVX/vWMjKSRiA8QKwG
 ebYfZQ65ISi3e2h/JQRLOKneRg89c3igt5HSb398zx0pD1GRsHWBI2i+s2IKBWXgYarpZehYlewob
 NhjWF7HK7IEcsc6f8IOsPQKNf+tHNaGysM5FcH9by0BK4cKNLAutMDdVHomm7rLemWjs=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lLyAv-0006H6-9E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 01:07:16 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dzw6p337ZzmXPW;
 Tue, 16 Mar 2021 09:04:34 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Mar
 2021 09:06:53 +0800
To: Daniel Abrecht <linux-f2fs-devel@nodmarc.danielabrecht.ch>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <685cd73aea4daa72236ec53aa9c3a7fe@abrecht.li>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0940744a-3e2d-aa6e-1b55-e2cb6c29475f@huawei.com>
Date: Tue, 16 Mar 2021 09:06:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <685cd73aea4daa72236ec53aa9c3a7fe@abrecht.li>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lLyAv-0006H6-9E
Subject: Re: [f2fs-dev] [PATCH v2] Add -P option to preserve file owner
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/16 6:08, Daniel Abrecht wrote:
> I use user namespaces & debootstrap to bootstrap a system, and then
> copy that into an image using sload.f2fs. However, without an option to
> preserve the owner user & group of files, some files end up being owned
> by the wrong user / group (0:0), which causes all kinds of other issues
> 
> This patch adds an option -P to preserve the user and group of files.
> 
> Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
