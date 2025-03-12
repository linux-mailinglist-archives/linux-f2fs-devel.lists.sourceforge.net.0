Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDDA5D3AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 01:18:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ts9o1-0001yj-Rf;
	Wed, 12 Mar 2025 00:18:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1ts9nz-0001yc-7V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 00:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rMmV95KfMYOSOuwrpe9GLg7ghg5pqY7RQiEb0Q/OJas=; b=HaA+NwakwN7iM5euJDpWVdZBco
 aUTE94TArA51M9y9E/vIob1WvoLeBYxZhHmyIa1JlEGW04hxyMG94RMdSra3CegBgiihEYJBR0nnv
 B9uflUwrp+R7fxlHLttQrvLHHnawovcdj2FpoH0p8KGRayLTT+WaqqV1g2iNpTioTSkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rMmV95KfMYOSOuwrpe9GLg7ghg5pqY7RQiEb0Q/OJas=; b=O9cBzKoETcs2aY1xEL2+LW9iUn
 ksqQUCS31NURt7+cwM+E+5cvI+5du2ZEfL+qP1Lll8qAAyfYF0riobOw3h28qx81QZP1z6fM6VTTh
 m3f9HN1ftEpb0GyOFZF1wQ3TKoY2mRx9GMzheVjJQkoWRTg2biT2w6QHJ6R5t5GJBltg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ts9ns-0005Hn-CU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 00:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rMmV95KfMYOSOuwrpe9GLg7ghg5pqY7RQiEb0Q/OJas=; b=ge9Ns2a3BwkDtNyZ9UbIyHO8Y2
 0PeIokoXdiA2S2EIANSsDCo+mkEjhziIZ52Z0dJxL2zzmrdwZ3lt/IyXcvYGrxCSgszIWKC4jyxl8
 5GTi43kcQfUZyOU5BBi66mE+GpYU6MJtpKQEM+3xpdV4ksubeFEVkm2EeryFpC7sqCiZyT7IiRSZF
 B6aWkhUYq+9Gzr55fxmAmANSTw5zQfg34Ey4AbN0Thf+Yk+tt6N/PWjxzO98dmmxpUiCCB0Ya7uaS
 3QfBqtGaIWakQMrnlp4JZcv47OhoHw4LbniwCbX3u7lPDr5UyVezjA+GHprS3G0tgDYz/pwHn5DDP
 bHmuS2iQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1ts9nf-0000000B2l8-00VK; Wed, 12 Mar 2025 00:18:19 +0000
Date: Wed, 12 Mar 2025 00:18:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: patchwork-bot+f2fs@kernel.org
Message-ID: <Z9DSym8c9h53Xmr8@casper.infradead.org>
References: <20250307182151.3397003-1-willy@infradead.org>
 <174172263873.214029.5458881997469861795.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174172263873.214029.5458881997469861795.git-patchwork-notify@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 11, 2025 at 07:50:38PM +0000,
 patchwork-bot+f2fs@kernel.org
 wrote: > Hello: > > This series was applied to jaegeuk/f2fs.git (dev) > by
 Jaegeuk Kim <jaegeuk@kernel.org>: Thanks! FWIW, I have a tree with 75 patches
 in it on top of this that do more folio conversion work. It's not done yet;
 maybe another 200 patches to go? I don't think it's worth posting at this
 point in the c [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ts9ns-0005Hn-CU
Subject: Re: [f2fs-dev] [PATCH 0/4] f2fs: Remove uses of writepage
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 11, 2025 at 07:50:38PM +0000, patchwork-bot+f2fs@kernel.org wrote:
> Hello:
> 
> This series was applied to jaegeuk/f2fs.git (dev)
> by Jaegeuk Kim <jaegeuk@kernel.org>:

Thanks!

FWIW, I have a tree with 75 patches in it on top of this that do more
folio conversion work.  It's not done yet; maybe another 200 patches to
go?  I don't think it's worth posting at this point in the cycle, so
I'll wait until -rc1 to post, by which point it'll probably be much
larger.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
