Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5701909AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 10:42:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGg4l-0005bs-18; Tue, 24 Mar 2020 09:42:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGg4h-0005be-EW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 09:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDjvfUz1TdrHTC0GeNmX1SvfZPB9FMO63jLsxOz8TuY=; b=LWl8Omp+yRdi1aIsovVFXk14aB
 RSUa36PCkUdTWomSvTw4ND7mDVBwFjyCM/BqqL1D7qc6/OlLRPg4PTiCpNiuLSe5zj4PQEbFpqHRV
 5NdamfhZdiid95Gn5TeQB+RbInt6hKhjNy0uUXiiqcV9P5iJKyObtXkPognyIs24ENGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDjvfUz1TdrHTC0GeNmX1SvfZPB9FMO63jLsxOz8TuY=; b=XjwNlRZRl4UerqmEmHV/8tpv2r
 mOLU5yLaWX4w8I9ixBm3CAHAESH4AIfbRNvQ8F1PWLR+i9t2hdwuIUNadrNS5HbC1JPUQoMn06yOc
 Pg7RaYJpl4stehivx0C4KBV5GPZ9MI9F5tP3IXqwQwIF6H4NH7rerRwAAdWS2xhC2fYU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGg4e-00F1b6-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 09:42:19 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 53CDC440437667FA7491;
 Tue, 24 Mar 2020 17:42:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Mar
 2020 17:42:07 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1585041170-11445-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c6964da4-2aa2-11b5-0b7c-4f74b5e1ec7f@huawei.com>
Date: Tue, 24 Mar 2020 17:42:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1585041170-11445-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGg4e-00F1b6-Dz
Subject: Re: [f2fs-dev] [PATCH v5] fsck.f2fs: allow fsck to fix issues with
 online resize due to SPO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/24 17:12, Sahitya Tummala wrote:
> Add support for new CP flag CP_RESIZEFS_FLAG set during online
> resize FS. If SPO happens after SB is updated but CP isn't, then
> allow fsck to fix it.
> 
> The fsck errors without this fix -
>     Info: CKPT version = 6ed7bccb
>             Wrong user_block_count(2233856)
>     [f2fs_do_mount:3365] Checkpoint is polluted
> 
> The subsequent mount failure without this fix -
> [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
> [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
