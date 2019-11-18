Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 536C2100B38
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 19:14:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWlXO-0005BW-AO; Mon, 18 Nov 2019 18:14:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iWlXN-0005BP-V2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRNLL8Kq4J/k7S2tqB8036QtGz3D4hpmmjT5VvsyOGQ=; b=T6+1P2kVUp7YEW7uIUWsTHT3BA
 Zf+iYgJfYBHayS6NWO/F6ZKOEK1GKtO4kiJvvj7RgHSjIh8gBZZ4GQ4pKcaWFJdaRd5wHLs9SgGSB
 oWL1HCjBsqhfpo3vSI/WEsfl//RZaAWhsTsnEOwkl+sZI9BQO1rasDf+0BavPYD1SgX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jRNLL8Kq4J/k7S2tqB8036QtGz3D4hpmmjT5VvsyOGQ=; b=VT3LZniPJNMJL4+cj+Y8kuaH88
 ZYyrLPBlBmJajH9H8iEjgRoXzfbviUpsDB6U8BADqXdOmIZ5zb53IIgG8RFEXu9O3WnRCEvGdfeX4
 xfsmx8NVYM9PuNLnKgpClRQwBH+w9JUQ9nyVLAtJxiosxIgzTpnPByVMytPR0L43gqnY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iWlXL-004uil-TZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:14:09 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9E65222A4;
 Mon, 18 Nov 2019 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574100842;
 bh=WZxqlzttko/t7K47E27WckLwF631L0ReSZl1x8L+sOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6vOHOV6ktxUb9heORDtsKoQ/z6ArKiQs+i7bmlG2wQA2tzuuSGHRDOKvq391UoSY
 9BViUuNg+zIzMk3bFb7ar9tx5vhYOp34EEJ9k4nxuwKAyq5YH0xCJdTAB1PdlvdeFb
 v15IUmEsJZms5J6GntPM7NXh22mmkl/j8bBeyK0w=
Date: Mon, 18 Nov 2019 10:14:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-ID: <20191118181359.GA184560@gmail.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191115172832.GA21300@linux.intel.com>
 <20191115192227.GA150987@sol.localdomain>
 <20191115225319.GB29389@linux.intel.com>
 <20191115230430.GA217050@gmail.com>
 <20191118180102.GB5984@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118180102.GB5984@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.9 (/)
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
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iWlXL-004uil-TZ
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
Cc: David Howells <dhowells@redhat.com>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 18, 2019 at 08:01:02PM +0200, Jarkko Sakkinen wrote:
> On Fri, Nov 15, 2019 at 03:04:31PM -0800, Eric Biggers wrote:
> > On Sat, Nov 16, 2019 at 12:53:19AM +0200, Jarkko Sakkinen wrote:
> > > 
> > > > I'm working on an xfstest for this:
> > > > 
> > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?h=fscrypt-provisioning&id=24ab6abb7cf6a80be44b7c72b73f0519ccaa5a97
> > > > 
> > > > It's not quite ready, though.  I'll post it for review when it is.
> > > > 
> > > > Someone is also planning to update Android userspace to use this.  So if there
> > > > are any issues from that, I'll hear about it.
> > > 
> > > Cool. Can you combine this patch and matching test (once it is done) to
> > > a patch set?
> > > 
> > 
> > xfstests is developed separately from the kernel (different git repo and
> > maintainer), so combining kernel and xfstests patches into the same patchset
> > doesn't make sense.  I can certainly send them out at the same time, though.
> 
> Is there instructions somewhere how to build and run these tests?
> 
> For me it is sufficient if you point a branch and have some kind
> of instructions somewhere.
> 

There are many ways to run xfstests, but I usually use kvm-xfstests.  See the
command to run the encryption tests here:

https://www.kernel.org/doc/html/latest/filesystems/fscrypt.html#tests

More details about kvm-xfstests are here:

https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-xfstests.md

But if you want to run tests which aren't included in the prebuilt kvm-xfstests
test appliance yet (such as the test for this patch), it's not quite as
straightforward since you'll also need to build your own test appliance:

https://github.com/tytso/xfstests-bld/blob/master/Documentation/building-rootfs.md

Also note that this test will require both xfstests and xfsprogs updates:

https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=fscrypt-provisioning
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfsprogs-dev.git/log/?h=fscrypt-provisioning

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
