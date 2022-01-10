Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1256489D29
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jan 2022 17:08:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n6xE1-0003ZQ-1a; Mon, 10 Jan 2022 16:08:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <peterz@infradead.org>) id 1n6xDy-0003ZJ-8X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jan 2022 16:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y40BAHNG1efKDJCM2nKdzIsOy9eS9i8aYnZiWAFB4Kc=; b=IAogR0zxtCQm+iDnyrga1O0Yut
 ybn1GliLDO7L+ytrZGiV8BLvkGLqOwSgeR7eTjhHz3WUrEDRMJHKw3w4BFOGPC3HSQTAA7qCzu8uQ
 Uhisr/83awkIJcj6hZ/DLIGfuLypDlFah3hU75OgKwF2T83ehCn6lxw5rhQrTqiEGy7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y40BAHNG1efKDJCM2nKdzIsOy9eS9i8aYnZiWAFB4Kc=; b=XPxm73xRPctRisyrEy/TZJvcj9
 ESqPs4SqJ/K2Z1HbiJaEDU1FE65njd6QC/7D1s+HU168/XgFHSJEUqQq21UROwuyp7n3DCVJ8KMcW
 oCNzMqnDTbw/O5+RmNbX6Bz85IX8ihDrl3LgaQkTaceGn6vNRH7ikhERzqpK2CF4PHWo=;
Received: from desiato.infradead.org ([90.155.92.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n6xDu-0002z7-Be
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Jan 2022 16:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y40BAHNG1efKDJCM2nKdzIsOy9eS9i8aYnZiWAFB4Kc=; b=faNYTUfm6sqpK2gh7S3XBq+3sd
 3KT7KSh+D2fpWCuRpf6fyLk7ELIYEGY63cLZBiPz/0D5pj45kgJ3UI/Y1O3YWGgR7uYeVRh02v0Xx
 3UDg0YxZsZ97AyhsCOmuZaTOhqRwMfQayBwpOClP3MTri1DZWtwdNIEtwa/nH8ctusq1EfTNf3dt6
 pA+8PZpn/1A2tfWqsrPwsKK7NNOCX4bohYVitaYx4/Egc1cmXtYTTVytw5lqZVq+syMAA/NA930Eh
 VY684PK/GUlPI1vkyU9wP+os05/uH4jYDzB9DJ4Q6KFfJfeX7RUVryIXw+CBPsaGIepH8Hb8xkrqJ
 n2w0Oo/Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wBv-000Pjj-Se; Mon, 10 Jan 2022 15:02:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6429F300237;
 Mon, 10 Jan 2022 16:02:33 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 43B4220244CDF; Mon, 10 Jan 2022 16:02:33 +0100 (CET)
Date: Mon, 10 Jan 2022 16:02:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YdxKiVHBUYvVP7W2@hirez.programming.kicks-ass.net>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YdvoxkAAquI17UbX@infradead.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 10, 2022 at 12:05:26AM -0800, Christoph Hellwig
 wrote: > Adding the locking primitive maintainers to this patch adding open
 coded > locking primitives.. > > On Sat, Jan 08, 2022 at 08:46:1 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.92.199 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n6xDu-0002z7-Be
Subject: Re: [f2fs-dev] [PATCH] f2fs: move f2fs to use reader-unfair rwsems
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
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Tim Murray <timmurray@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 10, 2022 at 12:05:26AM -0800, Christoph Hellwig wrote:
> Adding the locking primitive maintainers to this patch adding open coded
> locking primitives..
> 
> On Sat, Jan 08, 2022 at 08:46:17AM -0800, Jaegeuk Kim wrote:
> > From: Tim Murray <timmurray@google.com>
> > 
> > f2fs rw_semaphores work better if writers can starve readers,
> > especially for the checkpoint thread, because writers are strictly
> > more important than reader threads. This prevents significant priority
> > inversion between low-priority readers that blocked while trying to
> > acquire the read lock and a second acquisition of the write lock that
> > might be blocking high priority work.

*groan*... that's nowhere near enough Changelog to justify any of this.
Because next is a whole series of patches making things even worse
because lockdep no longers works as expected on this custom thing.

Can we start by describing the actual problem?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
