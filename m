Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D208BB15A01
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 09:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsCWghcNYzFi8qFRDtdgELgQ9SD8RTlM7hPPTGtwhWI=; b=l1iIpF22R7BXUqB4GccDHf609F
	f3gnfPQQueBeG8y0o1OnV5WzfGldPIJ8rqitCDzV5Xk3phXgj6OlinQ/Zbxgj6z+A3kE6IW9DAmbd
	UtPqn8iFfUJY7sgb9Zp8GN96GbJKjAnEghdpmPrKZ+iDxWA5J4Amm+CmMBwEji8YHR6Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh1aR-0007hg-3s;
	Wed, 30 Jul 2025 07:50:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uh1aP-0007hZ-Iy
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YPjPFRTnyONB1vY5nByxijchrZSHT0noyc0Cmc02bo=; b=CwEeF6Mcu+a5zoHGBNIW/2Xso8
 gzPChWU816MDj9kGJEp3fEI2eUjty0NkngIXHSwxa92actc6FB6YsRAxrtBkf9o5PXxOHAjNzqJ74
 ACyUZh6+cCwjnOAd5O8all3SJKO/ciw4U7YccgC3XvnON8F2jg9jTJ8/QkqLpC+xHdWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2YPjPFRTnyONB1vY5nByxijchrZSHT0noyc0Cmc02bo=; b=cs6s1bDH7dQdJnxMdryBNFF/nM
 SXGvqcLMm7rdiZ1do5bYLG1nGKsvuFeh6/uq4BEPx3b2rEiJdwq854uRZKTFSz3x5bCcZQH5AWsZ9
 BAquGYeXb24cvgQolvctt1D4CgG17xPozta6vuLIkqxL3lnHBcJEWBYh5POCXKoIUDFA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uh1aP-0001Gi-55 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 07:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B35D443C00
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 07:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ACCC4CEE7;
 Wed, 30 Jul 2025 07:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753861842;
 bh=PLxMdyBOmFm9Wv/N1YgZMHVRlt7b4RNf6Pesv4a8inY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EYCSGonn4Uyj2IQt+XtjAr1zsOU+QI/yWtMTG/AutFFFx+Fi/2yCI4+OEpfWVliMF
 2KSKE07nc1pi5cuehXGFduBXlREMqIH3jOwFsiRyJXJMWxzLS4+qMG99R7iwiSjMu+
 sBCom3PuB9sg3h4mi3vqzozoLFoBqnpCkFaL4JSz3ESD5MhxGDoiswt33pk7QiTTkG
 f3sxH2TEW40V4kq/c7OU1hogPmnBLwLol4GicG6fZRr+hmh7YzzlJp7DxdswmZbP2j
 hC1WdA/7Ylav6N88YQFPHPpa/GHYaZwCWu1XUcAgWrcpShvpq7uLMTkW6KxLHY1Rbs
 V/zee1KaOJlsA==
Message-ID: <a0ecb0c8-6f29-4b71-936d-69b0c30dbbe7@kernel.org>
Date: Wed, 30 Jul 2025 15:50:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250729204719.1253285-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250729204719.1253285-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/30/25 04:47, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Let's drop the inode from the donation list when there is no other > open
 file. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uh1aP-0001Gi-55
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop inode from the donation list when
 the last file is closed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/30/25 04:47, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's drop the inode from the donation list when there is no other
> open file.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
