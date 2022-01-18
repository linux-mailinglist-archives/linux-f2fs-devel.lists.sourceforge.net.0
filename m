Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2EC492E0E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jan 2022 20:00:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n9tih-0000mS-La; Tue, 18 Jan 2022 19:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1n9tig-0000mM-GP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jan 2022 19:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YzqlcHlNmXKdPo1T+fK8GhtfeHBb/4p0AI3k1Gfzx30=; b=gpZ1fJCCslWCERVXuRLNYvl3zN
 lzT6tEM21khcshJ1pzPDvm8nlQpQjdgWxRye3CJbyggHsG1ROEvuhSC7ybsoUdN1IYXoJZsowPCG/
 INc+9Gcvkcb4EzRwN1sEGHlxs8r5p9zEStlMhrhdeR3QW/CCbaa48Fu8Cvdcm8vg3bUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YzqlcHlNmXKdPo1T+fK8GhtfeHBb/4p0AI3k1Gfzx30=; b=GOjzmtcPNb1oAwiot64t4Nau4s
 lfm9qCBw0V8kw++mczTX9V1LMSttf7XatfKsQ2C2EtQGqQSD5sbdFWBQ34XBmSzFeW3G0NsdFDoxu
 fb9lN+taEMYAyxhBxfk2B02Zk3X40iKEvEPH1VclYQYQ2vUHN9K91G+QV31fvJsc/uEU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n9tia-002QzI-Q3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jan 2022 19:00:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94FF261513;
 Tue, 18 Jan 2022 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2036C340E6;
 Tue, 18 Jan 2022 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642532422;
 bh=FOjqpugW7iHBFqdscviARPKMa6+ETkTBT3vGwr8GDsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kY+lW5knbAqjl45K6SEbMmJfEWgriOSPN0tS7tqgtbcKWlr4UkSFBfQPCaHDAmqH/
 krMP/B4LND7OjQtfOhITJk1It9IGMfp2P/XitkDBC5tNNWNEi4ynjWoFwCZCdQPR2t
 XvV+0qyYUf6DH+gi6pVp0bE0oiPEqZY8xgFGFFmaXE63Eeytp4wBRg3s4dCa2bhS/X
 e/q4NWUHRawRmYAR3leBrBJ/IsH/+6N0n2A8kd+uw5lB9jsHsBeQ8zg1bSxJmYVrwo
 tq59g8RWkMgRtOhsOaCzQRD/wz6S3ar+5lOejOaeLaJrMn8F8RMiCPZtGAsF+bPdVw
 j4oKu8Jks3l4w==
Date: Tue, 18 Jan 2022 11:00:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YecORDbXEmi9cFwC@sol.localdomain>
References: <20220118065614.1241470-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118065614.1241470-1-hch@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 18, 2022 at 07:56:14AM +0100, Christoph Hellwig
 wrote: > Turn the CONFIG_UNICODE symbol into a tristate that generates some
 always > built in code and remove the confusing CONFIG_UNICODE_U [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n9tia-002QzI-Q3
Subject: Re: [f2fs-dev] unicode: clean up the Kconfig symbol confusion
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
Cc: linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 18, 2022 at 07:56:14AM +0100, Christoph Hellwig wrote:
> Turn the CONFIG_UNICODE symbol into a tristate that generates some always
> built in code and remove the confusing CONFIG_UNICODE_UTF8_DATA symbol.
> 
> Note that a lot of the IS_ENALBED() checks could be turned from cpp
> statements into normal ifs, but this change is intended to be fairly
> mechanic, so that should be cleaned up later.
> 
> Fixes: 2b3d04787012 ("unicode: Add utf8-data module")
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me,

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
