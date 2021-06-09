Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C61813A1CEC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 20:43:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lr3AF-0001MJ-V1; Wed, 09 Jun 2021 18:42:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lr3AD-0001M4-G8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 18:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QN9ys7sPpOtseG7PH6g+kPRQPq7y8d3damILZou2Crw=; b=IbxNOdV/X/Lb4nc6JHTvRZbEon
 zwF9Tn5Pmkd9Vs4ieUrzNdoi4whVGc/P3VxIA5bNukv5XpoXsU5C5Mxwexg4Y+2dkMnZjEqTdMpgQ
 jau5YELQ9kmrGnz4ybQwJJLzbl9vGDHKHnaeUFan7LGzf4ZD05Y8Caj0xK1W/wnzx7VU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QN9ys7sPpOtseG7PH6g+kPRQPq7y8d3damILZou2Crw=; b=lo6htFpdQBFWmPvQLiiGY2PFPt
 n74UcpgYgNRDtXiHYLtOV6F3kn7KH/vXrCxZ+WPxeUhPU9/Bh+uAjoCuKl8tnyE75pxG7ou7edluo
 xo+l+iWHcgZQH3uTkeaSDoxPXv48lkeFueItpdB+/F00mcFNVekilhOiViulEfqIdmq4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lr3A7-002Tp7-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 18:42:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C6AC613AC;
 Wed,  9 Jun 2021 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623264162;
 bh=1AJcM6ROJcogV9vl0XOa3lPJNCybPa/QRAATw7jIB7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MicRDtS2/f/+xTuVX82v8ZmLTaYx2r/NN1B2VZo4h3p50w5ffIxJP30qKcoDUee10
 8moA2yMjg00OjQXo0yvy5rrsMPc7TPk3bkS1Jojole8SJJ44JmT9Zxc7qn/1Xops8B
 5DvcgJycnAgnqAlLh3mjtUSL8OYRLlkgJsy8tkrEyBGDTqEuYEZHT1yEq5WsnZvfzF
 mQPWGE9h5K3x6WM/fV1ggkhn1eBespLaDmsAlxWfxV5xUJGr0v78uZQhOaPD5fgUl5
 J4r524Iw3hBbq1hyfA9grDTeNdExhWZB5srysv0wzPU/hUUiXrNDeaI/otIrFfJXTE
 9jv6Lrmgy8BJQ==
Date: Wed, 9 Jun 2021 11:42:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YMELoAH7T5b5HLhm@google.com>
References: <20210525205138.2512855-1-jaegeuk@kernel.org>
 <17318ac1-19e7-dfed-35f8-65a8e325fc61@kernel.org>
 <YL5Oth8oKnV7h8Pm@google.com>
 <53531f1e-7232-df4d-3a43-43db0e8581f1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53531f1e-7232-df4d-3a43-43db0e8581f1@kernel.org>
X-Spam-Score: -0.3 (/)
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lr3A7-002Tp7-Kt
Subject: Re: [f2fs-dev] [PATCH] sload.f2fs: use F2FS_COMPRESS_RELEASED
 instead of IMMUTABLE bit
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/08, Chao Yu wrote:
> On 2021/6/8 0:52, Jaegeuk Kim wrote:
> > On 06/06, Chao Yu wrote:
> > > On 2021/5/26 4:51, Jaegeuk Kim wrote:
> > > > Let's use F2FS_COMPRESS_RELEASED to disallow writes only.
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > 
> > > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Too late, as I published it in master.
> 
> Oops, sorry for the delay.
> 
> So does the patch "f2fs-tools: support small RO partition"?

sload.f2fs: use F2FS_COMPRESS_RELEASED instead of IMMUTABLE bit

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
