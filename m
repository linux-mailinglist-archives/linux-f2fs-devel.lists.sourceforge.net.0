Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF408D2D73
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 08:41:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCD04-0005Hc-2k;
	Wed, 29 May 2024 06:41:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCD02-0005HV-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 06:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KoT54QWJ5EuO+27rjRRJ5Cx6M6oNZucAlV/sk1T66os=; b=Ucc43JAb57H/oZA8aM6gaOGqYQ
 8DpDRcWaqL1yPEngvYGkHjNRvtSqqgfQk89Uvy9ttEH4zy0NHO1g2ROXkmQnz0+r67xFebcDyyjgE
 AqUHesEUykbnVBtiT2SwWoNNWwkgZUthv1uLO+kbx84Z6WY6z9cvvXW1+DVFmEbbIIUU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KoT54QWJ5EuO+27rjRRJ5Cx6M6oNZucAlV/sk1T66os=; b=cwq95RPKCCDbt2Nj/pIzVI9y5D
 h6+tG4EMwxIjRRVJ37mXk+7IH+JpW4pKMvvIhcGJWrFShvaxpGNKSWMoXgN4vwrKE2op8GUDBxD4q
 34PQRHgyXjJJ9KAWy4jGqIJk16Ct2CBNy0WLxbuY6Fvq72iPlJm4E4euzf1ELaV6FPhc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCD04-0001Av-7k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 06:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 14233626CF;
 Wed, 29 May 2024 06:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532A4C32781;
 Wed, 29 May 2024 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716964876;
 bh=k3V0Pd1cFiFWwmKqrTyNx4LO0sg+Qha0YEjt6+PuOY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oW1gWA81Joc0k0G2+fQ92ExleQt4opjBNl7oHegQ0+rQqZQWGMn1LWMY1uS104Nzb
 Bh+bq7DYu1djN+B1lmlP2KFTRHz0ig18r/TVBINhqyeHU44u+1rN9QFLkQjlkcpDv9
 loj4fZ0G8+RSdPuGTzyzaqsfnwot3MVC8RGb0bpHxg8MnU/5rYzystOSnxCfx00uzF
 nYUBcSfBLtIPJ2bbO5hNmXhrAg7PtiEdsGglPFToCg3rSLHlahlMPg8ny4ISEbvenj
 RNSlX8t0CAbFxZabiVCk03tKrtitQPssqwF4zYI+5CAAC2shjnnZ8pLGFk2KG5FtjT
 Av5e/roOsm+KA==
Message-ID: <5a331b45-244e-41a1-9745-d3ab38cbb17d@kernel.org>
Date: Wed, 29 May 2024 14:41:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240523224700.265251-1-drosen@google.com>
 <20240523224700.265251-2-drosen@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240523224700.265251-2-drosen@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/24 6:47, Daniel Rosenberg wrote: > Xattrs for files
 with inline data were being skipped. This dumps those, > as well as xattrs
 for folders. > > Signed-off-by: Daniel Rosenberg <drosen@google [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCD04-0001Av-7k
Subject: Re: [f2fs-dev] [PATCH v4 2/2] dump.f2fs: Fix xattr dumping
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/24 6:47, Daniel Rosenberg wrote:
> Xattrs for files with inline data were being skipped. This dumps those,
> as well as xattrs for folders.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Reviewed-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
