Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA05AAD857
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 09:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6Nj2mt0cb1hDtjR1kjdSQHFXTAfVtuWiV9zBgixo4w=; b=TmuLWZXn5Z18hf1iJM8K4hjJYQ
	J64gPIGBbsKI6yzYtVkaVeqvOlDDPw0/JlWOuP04C8zxh1b6/mj7Duf5m3lhJogTwzu9cS7SW3Qus
	iKPDvi9VurpRUdx6lHpSv8afQgEH/4ZmJy5yZFvIKfV61RB6aKZDbmCGoO5fJQOhj2M0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCZMj-0005ih-Hn;
	Wed, 07 May 2025 07:38:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCZMi-0005iY-MX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ndvVvqzW02iDMlSVq1UhwKyoVbRbz+prEu0cTgjgUNA=; b=fGYyEllK9sdra3/hp27VScxutw
 0wdnW2xaoGTwJKjx8CBoF0vrYsjrWZBQ8X7FnlmrklI6aIRux4Qjjpm+V2jBmIvieg026ch4Tgr88
 eCoD85VxOw9lkaYrlbNBoXKDDEuK2LFJYcAGKtd+k+NgB4g2mnbvER9Var+gsy2xevvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ndvVvqzW02iDMlSVq1UhwKyoVbRbz+prEu0cTgjgUNA=; b=EhQFEbNa+GPBw0BnNqcNx+osjU
 QoVlaxv/jKnrVgQvuuB1B26TUMB9C1QkTvWh0uDHQu9IWrirAtz+GI8/CoivhUHOWPAVdH50YU++q
 NjjZsTM4ITku9toTwnMusNyLQ+rT9LkAYtg6lZXC87OKwA6DM1RQvsfu6l2RRma4Weho=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCZMT-0003J5-2A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 07:38:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8977649DC0;
 Wed,  7 May 2025 07:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E141C4CEE7;
 Wed,  7 May 2025 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746603506;
 bh=OQNVDW+Or51VukOrXMnIsaIqPxIvjVsqNhnia7ZvKKU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lX9kRX+f3tNfG8qYW8VH+Zmoaez5JKKR5ZaBYAHAXZo1zIeU1h3VGqXsvwPjYt8NU
 H+3c0ICicoGJ3VjmkwHv+bkFKHwMOUmJEZ5IcB6hOe5+YuuAzSQX/+TZQ1C9qbd+eN
 YPZLWxi3pTFbsbHEd+doTFDrko51eJ4w0nPf2+nXXnSyjhiSogQtWgwFZP6Poxldnj
 NY+uqnxVeyyKn/JA5P2gUW1dFeycXonduN3APHznzlO9tJ7Rgd8OyJryNacKr+hvED
 /5wvyIzXFfdM5OnnQP33/6fxW7gDhyPdau7fqCvJ3ei1wcZmhpi6HVfPDXJ5havIMa
 AupA2pZfwgSPw==
Message-ID: <43d55ab4-c490-4f3d-8331-dc47f427d06d@kernel.org>
Date: Wed, 7 May 2025 15:38:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250505092613.3451524-1-hch@lst.de>
Content-Language: en-US
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/5/25 17:25, Christoph Hellwig wrote: > Hi all, > > this
 almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs. > >
 f2fs_sync_node_pages
 can still return it in a way that is not handle [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCZMT-0003J5-2A
Subject: Re: [f2fs-dev] cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/5/25 17:25, Christoph Hellwig wrote:
> Hi all,
> 
> this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.
> 
> f2fs_sync_node_pages can still return it in a way that is not handled
> by any caller and eventually is propagated to userspace.  This does look
> like a bug and needs attention by someone who actually knows the code.

Oh, I guess this is a bug, thanks for catching this.

Anyway, let me fix this based on your patchset.

Thanks,

> 
> Diffstat:
>  checkpoint.c |   22 +++++++++++-----------
>  compress.c   |    5 +----
>  data.c       |   13 ++++---------
>  node.c       |   43 ++++++++++++++++++++-----------------------
>  4 files changed, 36 insertions(+), 47 deletions(-)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
