Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191C497BEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jan 2022 10:26:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nBvc7-0002S7-Lt; Mon, 24 Jan 2022 09:26:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hch@lst.de>) id 1nBvc6-0002S1-0q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jan 2022 09:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcXJu9e6b5trBlmuwWUMc7FyxqkPEPmQ/xdjE9rNxO0=; b=VacUk2m1jDku7Qay0XUgTFyqmC
 3soSupsQDWE6p6dE8vILPL9ZUbdD+Y52LBxBrRoAczHfu587Ja3ssLIwfPZq/UemT/Vl12kB2ReEc
 Khue4PyXniv/Hdnk2EUlng7qpzRqyEsrqta5jBGqEMXljmiYf5LQ1SUwgf2TWXdy5NBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KcXJu9e6b5trBlmuwWUMc7FyxqkPEPmQ/xdjE9rNxO0=; b=L/NbWZbFnjDXAd99L7fbtYS6Av
 WsuvMPXOxDG64gOZoECrXRhv06cXyRuzgNiYG7iSiotqpgUT/2RFN29PxpAjEt+vCPSqSti+obAvS
 mJrCTJ6fdcbUzZCGBbfE8N48Y4N09Uok0W98h1/CWt6wNiL6MTAA87z7W9R0MSwhtqIU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nBvc0-00ACXa-A8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jan 2022 09:26:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B760268BEB; Mon, 24 Jan 2022 10:08:55 +0100 (CET)
Date: Mon, 24 Jan 2022 10:08:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20220124090855.GA23041@lst.de>
References: <20220118065614.1241470-1-hch@lst.de>
 <87zgnp51wo.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zgnp51wo.fsf@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 20, 2022 at 08:10:47PM -0500, Gabriel Krisman
 Bertazi wrote: > > Fixes: 2b3d04787012 ("unicode: Add utf8-data module") >
 > Reported-by: Linus Torvalds <torvalds@linux-foundation.org> > > S [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1nBvc0-00ACXa-A8
Subject: Re: [f2fs-dev] [PATCH] unicode: clean up the Kconfig symbol
 confusion
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 20, 2022 at 08:10:47PM -0500, Gabriel Krisman Bertazi wrote:
> > Fixes: 2b3d04787012 ("unicode: Add utf8-data module")
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> I fixed the typo and pushed the patch to a linux-next visible branch
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/commit/?h=for-next&id=5298d4bfe80f6ae6ae2777bcd1357b0022d98573
> 
> I'm also sending a patch series shortly turning IS_ENABLED into part of
> the code flow where possible.

Thanks.  It might make sense to get the one patch to Linux for 5.17
so that we don't have the new Kconfig symbol for just one release.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
