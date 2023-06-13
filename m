Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3E72ED64
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 22:55:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9B2j-0005U3-DA;
	Tue, 13 Jun 2023 20:55:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q9B2i-0005Tx-J7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 20:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YBprs7LhqyrDKS55NNw7wEyNV34miROtGR28t7ZTXqM=; b=SmfsybCLFC6sb9qb8Smb0Nlb/P
 TLDsZj5y/qbFgU4jNzqhVJuKSNDtvvLPY7lLDiY9uNJiFjT+xjGnpwEgHtsxSXnUSArMzF9Jpi9+2
 Q/gdXwK6I8VxJWlPUfs5Twa23YqFQk2XtRP+c2k6SrFh9oUmlBEhJN7Vesb86FZLaEis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YBprs7LhqyrDKS55NNw7wEyNV34miROtGR28t7ZTXqM=; b=dK+oHWg/efXv1PGaecQvZg03RW
 Qtw2Fd+BjWqSHWp+IBB2I9esXknHgc/gRPxJuGSnJ76R6JdP504GOF1BeZ7hNV4VAeQS1uZvyYH+9
 zrXB4AhUZDOivltWM5PQR5EX4VJkd+VGedS51iGgQo7uEsmFTDBSETnMyWpgNmFJTpI8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9B2g-0005g4-1r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 20:55:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36541616D4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jun 2023 20:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891D3C433C8;
 Tue, 13 Jun 2023 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686689697;
 bh=2G/oXPNkXgh+LbIBpNL29H971gSaq+RR/8la7aZ0G1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EaERnhMrm9B8weqXWGcEn6YRvb1I8qyPiuaZdeQ3pQz6jzu4ITKF7t7v6q+Ix+kzc
 IVr6zzAmcT+7hVeu9xbAfhancqievylX+Lo1h+b7hzsNr+FJSfjDbYnyBqdayNOtG5
 kG46dsGNtgeB8c3+0Au3O91r9G0qg3SdB+UEPK9uYO/G+WGBg0HY2AG/gZun7ETAgr
 OGZgXjHHzRn21rW0/xq1mVOKXp7LHouLzliYNur5ekqLBwE8+4JNdXhbWBp0FBjblR
 WB+Lnqht/elecEaHjbIEYpXxKGOszJ04PmRuKObAJXUXvFdUJD212bi+l2+sjTaYXY
 5K540z7/nBjzg==
Date: Tue, 13 Jun 2023 13:54:55 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZIjXn/pqXcMxfzrz@google.com>
References: <20230607162954.2651657-1-jaegeuk@kernel.org>
 <ZIc28R76RSEC6uo1@google.com>
 <d92516e1-2eed-c46b-78a0-4a93573c0ed7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d92516e1-2eed-c46b-78a0-4a93573c0ed7@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/13, Chao Yu wrote: > On 2023/6/12 23:17, Jaegeuk Kim
 wrote: > > ZSTD does not support compress_level=0. > > > > The commit
 d7ffafc99c42
 ("f2fs: add sanity compress level check for compressed fil [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9B2g-0005g4-1r
Subject: Re: [f2fs-dev] [PATCH] f2fs: set zstd default compression level to
 ZSTD_CLEVEL_DEFAULT
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

On 06/13, Chao Yu wrote:
> On 2023/6/12 23:17, Jaegeuk Kim wrote:
> > ZSTD does not support compress_level=0.
> > 
> > The commit d7ffafc99c42 ("f2fs: add sanity compress level check for compressed file")
> > started to complain this.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Final version:
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=e59031a552b5cbda098a7ee421ec56bd084dfd4d

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
