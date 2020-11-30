Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1BB2C7F84
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 09:11:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjeHB-0000i4-5k; Mon, 30 Nov 2020 08:11:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kjeHA-0000hr-AN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 08:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nuu4YhVKiwYDdBAbETDqObKR/AQGpXTkkY6/R+XVyDY=; b=h8AQgQTevq+2KJR3wf1sdTb6ii
 4bLGHAIOpHw8lQSmS867KEGUEzaLK70zwOA3SyaKj/GLkyBoD2AWWeNzqZmVoGYRtbR/tKMTXx5UP
 1PsFkEG/v8rW8sjGBUbkZpNquOl84sayrqAGTxOR1dok//07i6fnYvpfCHxFzwPLsQUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nuu4YhVKiwYDdBAbETDqObKR/AQGpXTkkY6/R+XVyDY=; b=GX2QX3BNaXEi8sbn0r+pA7rr/O
 /k0Xt+ge+9Z+9APlWP4eVGk3jwJe03aey/rEN6EzxGsnrGeD2GK2DPYNk3Ye87/t4lw2FzQuNNpXy
 a355pFz4RyZUacopgRL+w0yMK7vru3eySyywjV6TDMAQMblnN5rlIAEKOWju+UqsREg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjeGz-00BDUH-Ly
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 08:11:12 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AAC220731;
 Mon, 30 Nov 2020 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606723856;
 bh=BHjT6zH+wiQs+1wfj8IucZLbZz91d2qrAaGEyisftzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D8rIxGkTB/pupC5KG6W4CZAVHhWyCGEQw8u8cyLweSpqn0mrcSVkKejMj7hXsUXD8
 mj6NfnxuZkt6N9A+PTtw1JUWYCDFT2jx8VfaGCUf/IpTePvtaFoS84CT9sDmDNOrOY
 ZMhzB1ydSPALb1RpQoHn5GRKBZGQU6pOF5kCpPwc=
Date: Mon, 30 Nov 2020 09:11:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jack Qiu <jack.qiu@huawei.com>
Message-ID: <X8SpT6J7VSDibHal@kroah.com>
References: <20201130073719.8982-1-jack.qiu@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130073719.8982-1-jack.qiu@huawei.com>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1kjeGz-00BDUH-Ly
Subject: Re: [f2fs-dev] [PATCH] f2fs: init dirty_secmap incorrectly
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 30, 2020 at 03:37:19PM +0800, Jack Qiu wrote:
> section is dirty, but dirty_secmap may not set
> 
> Reported-by: Jia Yang <jiayang5@huawei.com>
> Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section
> has several segments")
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> ---
> v2:
>  - cc stable mailing list
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
