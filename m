Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1AFFE3F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Nov 2019 18:30:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iVfQ1-0002HW-IY; Fri, 15 Nov 2019 17:30:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jarkko.sakkinen@linux.intel.com>) id 1iVfPz-0002HD-JH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 17:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWcX7oylNZmX12Lrm67bE44Swo+hnDKmSPFc1Af2TcA=; b=Jon/3HQIT/D5tYq0Ofy6xMRyfu
 cb027YjBbtq+giALaM+Kx4CrJ6C9pGz/hRcRIJIuFM9I0nMTQXoWe1fk+9+HPrDCWBS8LlrfHHXVW
 sEcTmR40iEWGf1bdf5Iy+4PCzUl5c0f657+vd/XgwDAa0bd24ffZWRDKcAeSgZP/HEMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oWcX7oylNZmX12Lrm67bE44Swo+hnDKmSPFc1Af2TcA=; b=I4r1M6fQo2+iBec8POwSCqbk5R
 5iwMrDB4TrFWjB4HmREV71VLkArfl2LdxJxCfkPqfeiKpFBg8XixXrtqwoEi8mmAMB3CzF/REp6lc
 5mjzmt+ugo6/EcLWYo/Wus8jkd3+PZa20t3fg3rwVKAZ28IjBFidAdsUECUh4O7Zlgt0=;
Received: from mga04.intel.com ([192.55.52.120])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iVfPy-0018RN-8d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Nov 2019 17:29:59 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 09:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="288613668"
Received: from sgaffney-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.252.4.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Nov 2019 09:29:45 -0800
Date: Fri, 15 Nov 2019 19:29:44 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>,
 linux-mtd@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, g@linux.intel.com
Message-ID: <20191115172944.GB21300@linux.intel.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191113203550.GI221701@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113203550.GI221701@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1iVfPy-0018RN-8d
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 13, 2019 at 12:35:51PM -0800, Eric Biggers wrote:
> On Wed, Nov 06, 2019 at 04:12:59PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
> > specified by a Linux keyring key, rather than specified directly.
> > 
> > This is useful because fscrypt keys belong to a particular filesystem
> > instance, so they are destroyed when that filesystem is unmounted.
> > Usually this is desired.  But in some cases, userspace may need to
> > unmount and re-mount the filesystem while keeping the keys, e.g. during
> > a system update.  This requires keeping the keys somewhere else too.
> > 
> > The keys could be kept in memory in a userspace daemon.  But depending
> > on the security architecture and assumptions, it can be preferable to
> > keep them only in kernel memory, where they are unreadable by userspace.
> > 
> > We also can't solve this by going back to the original fscrypt API
> > (where for each file, the master key was looked up in the process's
> > keyring hierarchy) because that caused lots of problems of its own.
> > 
> > Therefore, add the ability for FS_IOC_ADD_ENCRYPTION_KEY to accept a
> > Linux keyring key.  This solves the problem by allowing userspace to (if
> > needed) save the keys securely in a Linux keyring for re-provisioning,
> > while still using the new fscrypt key management ioctls.
> > 
> > This is analogous to how dm-crypt accepts a Linux keyring key, but the
> > key is then stored internally in the dm-crypt data structures rather
> > than being looked up again each time the dm-crypt device is accessed.
> > 
> > Use a custom key type "fscrypt-provisioning" rather than one of the
> > existing key types such as "logon".  This is strongly desired because it
> > enforces that these keys are only usable for a particular purpose: for
> > fscrypt as input to a particular KDF.  Otherwise, the keys could also be
> > passed to any kernel API that accepts a "logon" key with any service
> > prefix, e.g. dm-crypt, UBIFS, or (recently proposed) AF_ALG.  This would
> > risk leaking information about the raw key despite it ostensibly being
> > unreadable.  Of course, this mistake has already been made for multiple
> > kernel APIs; but since this is a new API, let's do it right.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> David and Jarkko, are you okay with this patch from a keyrings subsystem
> perspective?

Thanks for reminding. Still catching up with keyring. I gave some
feedback to the patch.

/Jarkko


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
