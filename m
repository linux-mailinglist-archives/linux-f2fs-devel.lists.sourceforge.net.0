Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77B2D3D41
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 09:23:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmul5-0001hy-Fq; Wed, 09 Dec 2020 08:23:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmul3-0001hq-JK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c83VIdFcEZYZerHBWmiK1cr0+dDPv2nJeuqGqXqKGzk=; b=B/7DgiezwASHUP2905UF4odPf3
 8WmkHQ229DpK4tH2h8bq8BwHM3npKzAPUdnRyEYc96Ru8I5Df4eLgmy5N4wOEDq4OLALYpz8RFtK/
 BKaOTSPakJMR3bYPrYc/0Pw42FQtdMIqOLmZE5zsq/DieRuZtY7GTSofoxDONhS3e0DA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c83VIdFcEZYZerHBWmiK1cr0+dDPv2nJeuqGqXqKGzk=; b=IEf0WGLlY2ALLxt5l1ueM8ndVg
 b4+qdIeT+T9niCf3gCqaAE0bHt71vEB2cNWEAHnO+RWyMkQPT61uRjmyN6E+N+/hUV+sxOvdgh7t6
 YRKlbWCHwuqSq/pWECSnpdbNnPL50xGVrwKqMz9GYJa4NUrJ2iZZmxKjFuI5sCdSpbqQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmuks-007VgS-R1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Dec 2020 08:23:33 +0000
Date: Wed, 9 Dec 2020 00:23:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607502197;
 bh=MBbmbOIjq5eM4nxV5TZKAlCSXESrnTnoVEWXH8GhZc4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9q0T/V/EkEnXdZIOLiT53zAR8FSqy8mgWYHNVpK0nSKUrIBJAAckTYFIaR2cwDGx
 DvTxgm3/wEw/BJAU0kMYDvSLxtK+Zzul0KmGJBTMDaEo6UK7Ryb781wdauQ/YTW9DX
 9/BQ4Hs7WS0slTBveTPaFbOCq+UxbBOtR4QIoCUapTNBlPrGE7LwXWeqNJkvLLIKh5
 QMZxD3jd+HdwYqaBWLpaBD/4KK2/YaRtQC6KdAUMhgOt6wzZ+iX4F6rY7sI8Ry2G7h
 Y7WG/GwBmHQfgtEc+prFF1L9alCYAY7P/LQehfEQCrv8amomwe7nNLb8pRYVrSA1Zs
 DSKKnV1lmfitg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9CJc7xas7OqTZv2@google.com>
References: <20201208031437.56627-1-yuchao0@huawei.com>
 <22ac4df6-53ec-fb7c-c4dd-26435352a701@huawei.com>
 <X9A7Jn+cHRRcAmIi@google.com>
 <37d89d34-add1-5254-380b-233ef7a460d4@huawei.com>
 <X9BKX9PUMFkts9bI@google.com>
 <5398c880-d4d3-81b9-f3c9-765ba1470e96@huawei.com>
 <0d4a20ec-f6e4-ff24-8733-94cc3762195d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d4a20ec-f6e4-ff24-8733-94cc3762195d@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmuks-007VgS-R1
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: support chksum
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/09, Chao Yu wrote:
> On 2020/12/9 12:28, Chao Yu wrote:
> > On 2020/12/9 11:54, Jaegeuk Kim wrote:
> > > Ah, could you please write another patch to adjust the new changes?
> > 
> > No problem, will drop "f2fs: compress:support chksum" based on your dev branch, and
> > apply all compress related patches on top of dev branch.
> 
> Jaegeuk, could you please
> - drop "f2fs: compress:support chksum",

What I mean is keeping the old version in dev branch as is, since it gives
another conflicts when dropping it. That can add another bug at this point.
Can I get a separate patch to fix any issues in that original patch?

> - manually fix conflict when applying "f2fs: add compress_mode mount option"
> - and then apply last my resent patches.
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
