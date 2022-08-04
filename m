Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140F5896C3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Aug 2022 05:54:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oJRwY-00022b-Gz; Thu, 04 Aug 2022 03:54:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oJRwV-00022Q-4G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 03:54:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o73Olwcmos+2zhNFuliHjqgYOqyzLA+DtyMN8FV9P1s=; b=A59EDrc66aAlo5uGLSh4X7fan2
 dq7n5MsWdcQJjmxtDbgp1rAoQ1U6rBhHSfW+tY1bUsPJSBg/4i4a8F3yBxUf7GZ7aEp0gCgBThpaM
 q4ACxWE5QrzOp1ZGKoK6IhRDOnme+584tNLncEW5e7FvlFci9kuBEZ3xnyLllxXSQsi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o73Olwcmos+2zhNFuliHjqgYOqyzLA+DtyMN8FV9P1s=; b=mgn8s3qX4jRluuKwu2MwkY9jnZ
 /s3froOh4wUWgNsvMYnJjRS+BM1PS9BxNrxMQ4wGthtrhieUQKNGCyB6Tv9ddGWVmeLoWJK+Z5al9
 8YKrhaBpnWMwsZtY9GAKorR5PyLurMgKoBR2YFkT9wIDQS4Lt1CiwgcQE8DcFIjAFTgM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oJRwT-0003bw-FL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Aug 2022 03:54:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 645C8B82488;
 Thu,  4 Aug 2022 03:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE97BC433D6;
 Thu,  4 Aug 2022 03:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659585265;
 bh=TRaZPizYt0MhyTdvIV5gDkYU2dqlDxCp3JATlfnKkos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bggZUorbj0n4/fqwqMqaZFYuRhR0NLjKaELiYSxT03PoFapIaC+cnM8Ur6UhOTq/o
 CHu8V61IjhPYrfkIdJU8TVYPJAPs04BSoxBZcbgaRSRb/fnO33ZzbN7PdccvllJCvL
 fhyWRC6usAmEkj05zJjoJxyITHhC/3KhIeWpQMpjsk8INVMxa7w1Y+PPgV+qTkqs0L
 dg6a7iQb1gwW519pGaTcXXFi+JGIjnuoNiCEC2ShafBq94iYOQe4Nu1qtyEc68DTKh
 AQ+zwm8xPhXM5QNCgD2Hc5obYSWkobQ27m7s858px8+69/K+KrikpytTCSr00hm7a3
 7FHFrQqt+1tOA==
Date: Wed, 3 Aug 2022 20:54:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <YutC7yUo/mTfty9q@google.com>
References: <20220801092202.3134668-1-studentxswpy@163.com>
 <YugaBtQcoR4XhXiQ@infradead.org>
 <b43b3babb8aea836add289245c640688bec87829.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b43b3babb8aea836add289245c640688bec87829.camel@perches.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/01, Joe Perches wrote: > On Mon, 2022-08-01 at 11:23
 -0700, Christoph Hellwig wrote: > > On Mon, Aug 01, 2022 at 05:22:02PM +0800, 
 studentxswpy@163.com wrote: > > > From: Xie Shaowen <studentxsw [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oJRwT-0003bw-FL
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Replace kmalloc() with
 f2fs_kmalloc
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
Cc: studentxswpy@163.com, Hacash Robot <hacashRobot@santino.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/01, Joe Perches wrote:
> On Mon, 2022-08-01 at 11:23 -0700, Christoph Hellwig wrote:
> > On Mon, Aug 01, 2022 at 05:22:02PM +0800, studentxswpy@163.com wrote:
> > > From: Xie Shaowen <studentxswpy@163.com>
> > > 
> > > replace kmalloc with f2fs_kmalloc to keep f2fs code consistency.
> > 
> > For that removing f2fs_kmalloc entirely would be way better.
> 
> Dunno, maybe doubtful as there's a specific "fault injector" test
> built around f2fs_<foo>alloc. (CONFIG_F2FS_FAULT_INJECTION)

Yes, it's very useful to run the test checking the ENOMEM case.

> 
> For a student lesson, it would significantly better to compile any
> patch, especially to avoid broken patches, before submitting them.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
