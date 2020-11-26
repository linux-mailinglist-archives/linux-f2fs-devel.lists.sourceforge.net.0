Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7542C5B22
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Nov 2020 18:55:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kiLUU-0004mh-Vf; Thu, 26 Nov 2020 17:55:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kiLUU-0004mS-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 17:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWwFEbNQKqp/L0RKQKuEFeK2szpI+Qm87h+sAbKVLPw=; b=dAcq8NlWiPvcbeYKP7Cc1b3tPJ
 YO3/vmVb7BB/tveg3B1M+yspPaCqZmRiNUT/YBlivqlIitY++u01WrcnJ2Vm3aI1dhW95gZ2PdQKW
 RUZ/JlCh0mGthi22nrFeH923IWNbhQluwlKMLwtTq50X20WQllpMN/886Ke2nCxK0aQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oWwFEbNQKqp/L0RKQKuEFeK2szpI+Qm87h+sAbKVLPw=; b=R+giq9CqQbXdycjzvm5aeKn66o
 78I9+qefZ7Y9shPkLAVnwJove1XAZ/WyGa3e6e44q3feJs3gSN3mcGf39GiE/QwAtzckLrpitCsGE
 bGetISYbeEQOaR0Wlyl1XUoslFAb9KoZbWnHlAqtot3OtoQqRcL1roDknnTh5K11AzWw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kiLUN-005qBQ-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Nov 2020 17:55:34 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66B4420665;
 Thu, 26 Nov 2020 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606413322;
 bh=JAgoZA3nJogzefKO2GKhKaCZwMcQOntnimDPGPW9vKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SGPeDVKGxyAJUNpfcCMqrvpwHiq00QbykinOkr099+Y/RPNJCxRgDVOzuVWx9+R6L
 fC9tC7d1vdiHGqHLE0kW1kwxCkHFtGSkM200y+bmE9gmhdkn3dTXH9XAx/0uY4N6CT
 3JkIHs9ACcQ9nPWW66lNk7ikX6lcsvg2vmG1YEic=
Date: Thu, 26 Nov 2020 09:55:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X7/sCLnVPOjkC9DI@sol.localdomain>
References: <20201126103709.80006-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126103709.80006-1-yuchao0@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kiLUN-005qBQ-Vi
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: add compress_inode to
 cache compressed blocks
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 26, 2020 at 06:37:09PM +0800, Chao Yu wrote:
> Support to use address space of inner inode to cache compressed block,
> in order to improve cache hit ratio of random read.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>

If the file is also encrypted, are the compressed pages that are cached still
encrypted, or are they decrypted?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
