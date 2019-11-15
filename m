Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB4FE84F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Nov 2019 23:53:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVkTB-0005wB-A6; Fri, 15 Nov 2019 22:53:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jarkko.sakkinen@linux.intel.com>) id 1iVkT6-0005vw-B6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 22:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=USXIIyVD4MMVAJc7YV54cJ3jWMgCEG2uBHFD4uFoLrE=; b=Tq01I3j59LudmNJLl3lakvmatr
 sQ8I2X5dDiqNj7cDolpiC3QeQXpBVs8v2SJzELk8K+5aplL/1d6D8+l33GC/HYdt28vXV/w6wjxob
 OKyN4QqgWvLb2hI9kri+2FKQZiHwgwCSvQfXvSkP7C8JGMcLmNRHI8sSf5LIZKmY26GY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=USXIIyVD4MMVAJc7YV54cJ3jWMgCEG2uBHFD4uFoLrE=; b=hc8Tse/FgS4xu0miOH+x2EHxFW
 +eIiDhj9Ui0WIHplv8yExfSddlXHLGnYn0Lf2MzZnPLJzRKODmYwsr6C4t7qQlOGhc/Hpg2yuW/tK
 Bokc3l1AP2QGD0X39ng9ruWZ695F8fHisfNSm7V4TgX9JPlz7oBDe/3rJI49hQX1qtpE=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVkT4-006CA3-ML
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 22:53:32 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 14:53:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="230598878"
Received: from bpgilles-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.95.141])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2019 14:53:20 -0800
Date: Sat, 16 Nov 2019 00:53:19 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191115225319.GB29389@linux.intel.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191115172832.GA21300@linux.intel.com>
 <20191115192227.GA150987@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115192227.GA150987@sol.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iVkT4-006CA3-ML
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

On Fri, Nov 15, 2019 at 11:22:27AM -0800, Eric Biggers wrote:
> On Fri, Nov 15, 2019 at 07:28:53PM +0200, Jarkko Sakkinen wrote:
> > 
> > I don't see anything obviously wrong. Just would reformat it a bit.
> > How you tested it?
> > 
> 
> I'm not sure all the blank lines you're suggesting would be an improvement.
> The ones in fscrypt_provisioning_key_preparse() might make sense though.

OK. Some of this aesthics comes from the feedback that I've received
during Intel SGX patch set review process (of course subsystem is
different i.e. x86). I tend to agree at least that before a new
conditional statement it is more readable if there is a blank line
before it.

> I'm working on an xfstest for this:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/commit/?h=fscrypt-provisioning&id=24ab6abb7cf6a80be44b7c72b73f0519ccaa5a97
> 
> It's not quite ready, though.  I'll post it for review when it is.
> 
> Someone is also planning to update Android userspace to use this.  So if there
> are any issues from that, I'll hear about it.

Cool. Can you combine this patch and matching test (once it is done) to
a patch set?

/Jarkko


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
