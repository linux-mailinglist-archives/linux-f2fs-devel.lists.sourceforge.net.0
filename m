Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E84F62452E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 02:41:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSsql-0003Yk-20; Tue, 21 May 2019 00:41:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSsqk-0003YZ-0i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QOLpUbH4lutweZjKC2Acb8zvZvpcQNflCUKfWiMAlsI=; b=f5g0WY9ZmfpGpAUTrtFhrIrywD
 cZ82h3+wiraKJmNp6vZlETnQAoUD6RKc9QIJewwGrqk4OAgZ1Lz/GShZSlSQSR5Ok660Zs2HlPMb5
 Ors6JISOJhwJSDsat1oLq5BYgGwupgLmElRbWx+/yRb0kDqMB6OA5GarPU+9uJxpOrh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QOLpUbH4lutweZjKC2Acb8zvZvpcQNflCUKfWiMAlsI=; b=PM5LsAMVMQpzU0VOz+5GWE8Q5/
 8YFcBtggRbQoDvg/gwU/VY0OYhfNuFOCTH/DOdbvFu/J88NkL1O/8Czdo0aUO1vHsPf09CHctEqGk
 xXrxJO1Q3BBOKAT8mgeBbnAutH85qa6JigvbCGOQ18Z66P6U075uogBAupJM0D91TT+Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSsqa-00Cw1a-Hq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:41:49 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97DB021479;
 Tue, 21 May 2019 00:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558399294;
 bh=Hi8CWUPvFqYNtSGug59owSA1L/4doZZYflpgAHOx/NI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SECxqMXFQ/j6wyvpLukk+PEqZbVg3UD8pzGWfEB3cDMvHu7ylmQsOOz+L2OIaPY+D
 hock02mJ8MMM//K9xtaAOin90wDonftuTQm6rUigo4kdalTLksNy4ZCBJeAtgCGNI8
 8BGZwn9rAJ/QyQATo7LHfoVj4ym06Nin3tTSnEes=
Date: Mon, 20 May 2019 17:41:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20190521004119.GA647@sol.localdomain>
References: <20190520172552.217253-1-ebiggers@kernel.org>
 <20190521001636.GA2369@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521001636.GA2369@mit.edu>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hSsqa-00Cw1a-Hq
Subject: Re: [f2fs-dev] [PATCH v6 00/16] fscrypt: key management improvements
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 20, 2019 at 08:16:36PM -0400, Theodore Ts'o wrote:
> On Mon, May 20, 2019 at 10:25:36AM -0700, Eric Biggers wrote:
> > 
> > This patchset makes major improvements to how keys are added, removed,
> > and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
> > adding new ioctls that add and remove encryption keys directly to/from
> > the filesystem, and by adding a new encryption policy version ("v2")
> > where the user-provided keys are only used as input to HKDF-SHA512 and
> > are identified by their cryptographic hash.
> 
> Do you have userspace programs which use these new ioctl's?  What's
> are testing strategy for these new ioctls?
> 
> Thanks,
> 
> 						- Ted

This was answered in the cover letter, quoted below:

I've written xfstests for the new APIs.  They test the APIs themselves
as well as verify the correctness of the ciphertext stored on-disk for
v2 encryption policies.  The tests can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git
	Branch:       fscrypt-key-mgmt-improvements

The xfstests depend on new xfs_io commands which can be found at:

	Repository:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfsprogs-dev.git
	Branch:       fscrypt-key-mgmt-improvements

I've also made proof-of-concept changes to the 'fscrypt' userspace
program (https://github.com/google/fscrypt) to make it support v2
encryption policies.  You can find these changes in git at:

	Repository:   https://github.com/ebiggers/fscrypt.git
	Branch:       fscrypt-key-mgmt-improvements

To make the 'fscrypt' userspace program experimentally use v2 encryption
policies on new encrypted directories, add the following to
/etc/fscrypt.conf within the "options" section:

	"policy_version": "2"

Finally, it's also planned for Android and Chromium OS to switch to the
new ioctls and eventually to v2 encryption policies.  Work-in-progress,
proof-of-concept changes by Satya Tangirala for AOSP can be found at
https://android-review.googlesource.com/q/topic:fscrypt-key-mgmt-improvements

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
