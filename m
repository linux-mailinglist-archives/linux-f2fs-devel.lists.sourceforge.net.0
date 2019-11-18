Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E60100B74
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 19:28:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWlkq-0005q0-7M; Mon, 18 Nov 2019 18:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iWlko-0005pt-WC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUpaLYWVHmiJTRumraMgioOdCTazzqmZRsbYpWT6fbs=; b=YPC5xzgqu8As3nzblcSshtyK0C
 tvJ31/+prFZqj9xOAKIzKvue2myBHukcIhrsaUkOlfY+1KZlwA3ODX59xF9wug1tj2W2JnFA3cDO2
 17K8ciz02scK0UfetEoUc/F+mLlDCcrz6kc2h96eJPvBqTUMbYwYhCvLD5jgrSFqjRdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bUpaLYWVHmiJTRumraMgioOdCTazzqmZRsbYpWT6fbs=; b=bS3LKQYx5pAmQ/k84Qf+jYWcn8
 zC0Dz74gPQbaHmtl9FUNOsgUP3cUSSOSUyPC9jm5IJ9ZXN5c2ElxHtJMI2t/qAWRk0nA7g8jaCBkd
 nqlW6UkJ5RW62ZyoDyUotvIIwq8J1sJa9yJxN38bLINn6nCSTWkK/LlvGKYvAKEit/ic=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iWlkn-00555H-AP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:28:02 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 523B1222BF;
 Mon, 18 Nov 2019 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574101675;
 bh=hgVt0ngLY4LQROiy5izRjuCjb237dxfSwA55PVeCtzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l114SmjFfMiCK5ArBiu50w/LTL4XSqt3bVoIVKzINA/oG9Eh2EGM4xiS+QA/Fgv+J
 mNypcXQpHUUYB5tY0Rr45k0ckpA44+9bEcKlJjm9DuvrhibzFR2abrr8mhumozpFnk
 s8EdB/fhR/Pqz8BjKwXm8lcS9QbxbklPvJUw0TD0=
Date: Mon, 18 Nov 2019 10:27:53 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191118182752.GB184560@gmail.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191115172832.GA21300@linux.intel.com>
 <20191115192227.GA150987@sol.localdomain>
 <20191115225319.GB29389@linux.intel.com>
 <20191116000139.GB18146@mit.edu>
 <20191118180222.GC5984@linux.intel.com>
 <20191118180516.GD5984@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118180516.GD5984@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.7 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iWlkn-00555H-AP
Subject: Re: [f2fs-dev] [PATCH] fscrypt: support passing a keyring key to
 FS_IOC_ADD_ENCRYPTION_KEY
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
Cc: David Howells <dhowells@redhat.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org, g@linux.intel.com,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 18, 2019 at 08:05:16PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 18, 2019 at 08:02:22PM +0200, Jarkko Sakkinen wrote:
> > On Fri, Nov 15, 2019 at 07:01:39PM -0500, Theodore Y. Ts'o wrote:
> > > On Sat, Nov 16, 2019 at 12:53:19AM +0200, Jarkko Sakkinen wrote:
> > > > > I'm working on an xfstest for this:
> > > > > 
> > > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?h=fscrypt-provisioning&id=24ab6abb7cf6a80be44b7c72b73f0519ccaa5a97
> > > > > 
> > > > > It's not quite ready, though.  I'll post it for review when it is.
> > > > > 
> > > > > Someone is also planning to update Android userspace to use this.  So if there
> > > > > are any issues from that, I'll hear about it.
> > > > 
> > > > Cool. Can you combine this patch and matching test (once it is done) to
> > > > a patch set?
> > > 
> > > That's generally not done since the test goes to a different repo
> > > (xfstests.git) which has a different review process from the kernel
> > > change.
> > 
> > OK, sorry, both fscrypt and xfstests are both somewhat alien to me. That
> > is why I'm looking into setting up test environment so that I can review
> > these patches with a sane judgement.
> 
> And also since I've just barely started to help David on co-maintaining
> keyring it is better to put extra emphasis on testing even for the most
> trivial patches. That is fastest way to learn different interactions.
> 

I gave some tips about kvm-xfstests in my other reply:
https://lkml.kernel.org/linux-fscrypt/20191118181359.GA184560@gmail.com/

However, please note that xfstests is really about filesystem testing (including
fscrypt), not about testing the keyrings subsystem itself.  So while you're
certainly welcome to run the fscrypt tests, for most patches you'll encounter as
a keyrings maintainer the keyutils testsuite will be more useful.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
