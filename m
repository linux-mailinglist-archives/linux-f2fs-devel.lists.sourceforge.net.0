Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 646373F2973
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 11:44:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH14i-0004wE-Ol; Fri, 20 Aug 2021 09:44:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mH14g-0004w5-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pyAJBHnwzReT3aDOrkRE6xMdEIM3RRNoTJdn0AWhux0=; b=L5OREOkW18U612nwlNlapZycmK
 +9TSjCVZDAe+XNkN2OERFenKRO85txkHGCMrA06UQ654bLnKDGa/N8RGoI+Aozi3lZQZHgaozy5r/
 ZFGEJpZu0qnB1hMsGeakqqmB9MwK8CIfS2k3n1pf83qvHbCD5P5osx7xhOZCTaBh8PhY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pyAJBHnwzReT3aDOrkRE6xMdEIM3RRNoTJdn0AWhux0=; b=l1907JL2sbg3coc/gq4NenZ73l
 8HGngggK3CD3VjthdtLzpgaEuTW3HsNUG9r3ejK38EUbRfuHzEC8H5C+6kfnpadajrXfgfWvK35SX
 +m2BY0TPPMKDDv2OilkqRjTm/dieenNiDLhc3sfvmCTMXR5ola001BadhQkIMyzh5bL0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mH14f-0007zg-3z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 09:44:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C2CA61130;
 Fri, 20 Aug 2021 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629452663;
 bh=6+xqLN8/FYz9WrMSaZly42/22mrC/C9kFhWh6I5KzM4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lq7AIm+szGymPCXjDACvkLB7I33dG8UGGcl7gS2qG7Lb3RpAF5RDR4FOU1u6D3f8p
 JZ31V6bU+dqG7mtLHJYnJ0zJyKgZbM9prv5aXFLlA66k3i1r7LzHiNJc93NeLuzWDG
 x50OGh6YmbHUPyIXCR7wsP+5almCv3YAcQMgzPbI/EckieMv5o4WaMMY4kfCxqRJKf
 DcZ5pVt+Q7Nm6ijUcnv1+axxvMagVswr6GAmnVRhWudgSZyuhXzGfK8xsvn9ALamyd
 7/kvXvPkR7sD3bjun+QBo7+AUrtRxQr1Ns91fNUdUjDSG8f9S154ceHHJ13Zusms0s
 mkE3nE1zoUMvA==
To: Jaehoon Chung <jh80.chung@samsung.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CGME20210818101117epcas1p29573157a85608e87255d1af3a389f174@epcas1p2.samsung.com>
 <20210818101203.28314-1-jh80.chung@samsung.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <b651cea0-e932-3b66-ec04-e3aed948abe4@kernel.org>
Date: Fri, 20 Aug 2021 17:44:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818101203.28314-1-jh80.chung@samsung.com>
Content-Language: en-US
X-Spam-Score: -2.3 (--)
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
 for more information. [URIs: samsung.com]
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mH14f-0007zg-3z
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Update the usage about option of
 preen mode
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/18 18:12, Jaehoon Chung wrote:
> Update the usage about option of preen mode.
> It's difficult to know about preen mode 2, because there is no
> description in usage.

Looks good to me, it will be better to add more description in manual
of fsck for preen mode [1|2|3]. :)

> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
