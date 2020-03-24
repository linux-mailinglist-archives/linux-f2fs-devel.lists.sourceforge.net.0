Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA91914CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 16:40:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGlez-0005Xu-Lq; Tue, 24 Mar 2020 15:40:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGley-0005Xm-1U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 15:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FPGxPYCsW51MQQhRPitWFRu+1qQJ1PE724DEsYMgSik=; b=YSm6uWVPcUaqDK1duCo2BJHHcq
 EBByI7WWRnvucWts9il0GjwiLR6+iIvFHQ22IxmRmrXFW4HsQJnjxgSHsCBpROHgP9SRFdW4/dXSD
 d4N/a4/wHFmiCZPPmUkhlx9Ku6VxOKlB5YSkxwvbWdQZFrN1kVwa/dHZAbU8pImEWblA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FPGxPYCsW51MQQhRPitWFRu+1qQJ1PE724DEsYMgSik=; b=VuEmhUDXXDgh48B2SPTUeY4rHG
 fG+IuqCNGpSeCn9fTLMUnMfJ6sbDHFWjIBChVwk93vsGwPddWpVtduCcVxqfBiaEeLmeW3LOwkM12
 Ux6pWUapoPuuaL0A1wOh5L+cjhgMJchkeUrZVw+U1tDPXdz/AqIOI3CcNaAHgi7KIEdk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGleu-0023BU-5s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 15:40:07 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66AC120714;
 Tue, 24 Mar 2020 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585064398;
 bh=lGDpf82yhyBXP69b0NUOoaMPEW8UINXiLyyIVIv/9FI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TBo0lPlwRXSdnDE+bhsL/UEUB7N0XVLgFH+hU/exJbLOlwW6l8RIeGAHBtqAGTcn8
 oRxxbw7wAaDleMZ7E11AEcjWbIIcAik+kexPMsReTLLghhpUoZSXSPR06MU6lp5L61
 iJudVQ+Bw7LlGuG6kKh4jPNdimy8Zce/k4zMC+JQ=
Date: Tue, 24 Mar 2020 08:39:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200324153957.GA198420@google.com>
References: <20200303094602.50372-1-yuchao0@huawei.com>
 <1ee0c565-930b-2379-b22b-40ddca271de3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ee0c565-930b-2379-b22b-40ddca271de3@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jGleu-0023BU-5s
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: support zstd compress
 algorithm
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

On 03/24, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2020/3/3 17:46, Chao Yu wrote:
> > Add zstd compress algorithm support, use "compress_algorithm=zstd"
> > mountoption to enable it.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> > v2:
> > - avoid accessing invalid address
> > - introduce .{init,destroy}_{,de}compress_ctx callback functions.
> 
> I guess we merged related patches with wrong sequence as this patch
> depends on ("f2fs: compress: add .{init,destroy}_decompress_ctx callback").

Done.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
