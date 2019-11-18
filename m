Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D77100B07
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 19:02:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWlMR-0008VT-31; Mon, 18 Nov 2019 18:02:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jarkko.sakkinen@linux.intel.com>) id 1iWlMP-0008VL-KM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3TPllAOv4Lo4S7bZQWHqmlat5e2VChoiW+6NC8u6fOo=; b=IPcAz5g/S0hnxcjDY5v+4IcwOo
 RKV9PjoMfMOJVTzdyculj0HxpniTXtkZYZCBBVs2csF99N2g0yW+WKhZ+lDM7qBBDKe/QWFvFRwMa
 kEH3bm3NNPMPI4K09zf+yWbH4cPUZpEUEp54uCnr1YbWNOen0uy+E9Nyg0b5EK08GBj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3TPllAOv4Lo4S7bZQWHqmlat5e2VChoiW+6NC8u6fOo=; b=DFd6ZwZohyIGfdnVPJOd+NpoVN
 Kt1XiWLuGewoL9SOCuHFRUpKcMS6HDEV6U2EBm7aa65Qs+QcMGZPglniNeiQ6VrObgoS8y7boC+g4
 I9KxszAW2maz7WvpXOPAIpTuDFNuuFue0oUnc7nN4Rp76gubW8WFq6lthkpCDnUNVOXs=;
Received: from mga07.intel.com ([134.134.136.100])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iWlMO-0053SW-39
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 18:02:49 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 10:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="380733937"
Received: from cooperwu-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.3.195])
 by orsmga005.jf.intel.com with ESMTP; 18 Nov 2019 10:02:23 -0800
Date: Mon, 18 Nov 2019 20:02:22 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: "Theodore Y. Ts'o" <tytso@mit.edu>, g@linux.intel.com
Message-ID: <20191118180222.GC5984@linux.intel.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191115172832.GA21300@linux.intel.com>
 <20191115192227.GA150987@sol.localdomain>
 <20191115225319.GB29389@linux.intel.com>
 <20191116000139.GB18146@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191116000139.GB18146@mit.edu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iWlMO-0053SW-39
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
Cc: Paul Lawrence <paullawrence@google.com>,
 David Howells <dhowells@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 15, 2019 at 07:01:39PM -0500, Theodore Y. Ts'o wrote:
> On Sat, Nov 16, 2019 at 12:53:19AM +0200, Jarkko Sakkinen wrote:
> > > I'm working on an xfstest for this:
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?h=fscrypt-provisioning&id=24ab6abb7cf6a80be44b7c72b73f0519ccaa5a97
> > > 
> > > It's not quite ready, though.  I'll post it for review when it is.
> > > 
> > > Someone is also planning to update Android userspace to use this.  So if there
> > > are any issues from that, I'll hear about it.
> > 
> > Cool. Can you combine this patch and matching test (once it is done) to
> > a patch set?
> 
> That's generally not done since the test goes to a different repo
> (xfstests.git) which has a different review process from the kernel
> change.

OK, sorry, both fscrypt and xfstests are both somewhat alien to me. That
is why I'm looking into setting up test environment so that I can review
these patches with a sane judgement.

/Jarkko


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
