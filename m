Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FCFBA01
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 21:36:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUzMw-0001SL-ML; Wed, 13 Nov 2019 20:36:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iUzMv-0001S0-CT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6FHRCFlZwk4ddGyBZ6vKher/yipY9ZrAix78EeHjfsQ=; b=BDueuLXGYvBbzAXso99FCUmxKQ
 CVrZ2EVS4mPfj2qAPYVp3KEY3H6dgwPX7qAPK+e3BxR7//7Si6agnd55oINnYky78RCAmmrap0URU
 oJ9WccQ7/pYsF2J2KEIz2KAwrwW0vUhjZ8Ge0dIg8L36qiyfiBX3i+0bKKJ5s/zBIheQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6FHRCFlZwk4ddGyBZ6vKher/yipY9ZrAix78EeHjfsQ=; b=PJnlL+Dj/gn6frowsaw1DsXI0y
 rXx/QtiCyW/HgAfq38I4DumMlVu1T1oXuq1gwcWb0zrr/dR6lBJjARlenQFmDVtUsOrLXEANs7o2W
 XbBqgICz4shrHzETBDaE8ArmRK7YD3P1IRi7FOEqyr1MP1Udm1cyuD6RGRFUqPc3lz+s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUzMt-00FiDK-0t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:36:01 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1D53206F0;
 Wed, 13 Nov 2019 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573677354;
 bh=F7ZEXH3Tifjy9sGUrwh8Fhs+H6mYs1GYZonZpiJuwEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cN+5BXj91Btq6Ry/bO1VhiaNdo4x1+Lt3QDXuQLQyXlsCVgrWNJGKLW3Zy0M3qYgf
 kZYrGKdT5NAbCuJckqXAScixPVqWmbN98LNs2qdXXxKYYq+xhab0ygSaprMlJrUDjc
 2Rl8cQmt+I9y4p/mks0qpzDMku7DMTI2kzVonDxM=
Date: Wed, 13 Nov 2019 12:35:51 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, keyrings@vger.kernel.org
Message-ID: <20191113203550.GI221701@gmail.com>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 keyrings@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>,
 linux-mtd@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107001259.115018-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUzMt-00FiDK-0t
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Ondrej Mosnacek <omosnace@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 06, 2019 at 04:12:59PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
> specified by a Linux keyring key, rather than specified directly.
> 
> This is useful because fscrypt keys belong to a particular filesystem
> instance, so they are destroyed when that filesystem is unmounted.
> Usually this is desired.  But in some cases, userspace may need to
> unmount and re-mount the filesystem while keeping the keys, e.g. during
> a system update.  This requires keeping the keys somewhere else too.
> 
> The keys could be kept in memory in a userspace daemon.  But depending
> on the security architecture and assumptions, it can be preferable to
> keep them only in kernel memory, where they are unreadable by userspace.
> 
> We also can't solve this by going back to the original fscrypt API
> (where for each file, the master key was looked up in the process's
> keyring hierarchy) because that caused lots of problems of its own.
> 
> Therefore, add the ability for FS_IOC_ADD_ENCRYPTION_KEY to accept a
> Linux keyring key.  This solves the problem by allowing userspace to (if
> needed) save the keys securely in a Linux keyring for re-provisioning,
> while still using the new fscrypt key management ioctls.
> 
> This is analogous to how dm-crypt accepts a Linux keyring key, but the
> key is then stored internally in the dm-crypt data structures rather
> than being looked up again each time the dm-crypt device is accessed.
> 
> Use a custom key type "fscrypt-provisioning" rather than one of the
> existing key types such as "logon".  This is strongly desired because it
> enforces that these keys are only usable for a particular purpose: for
> fscrypt as input to a particular KDF.  Otherwise, the keys could also be
> passed to any kernel API that accepts a "logon" key with any service
> prefix, e.g. dm-crypt, UBIFS, or (recently proposed) AF_ALG.  This would
> risk leaking information about the raw key despite it ostensibly being
> unreadable.  Of course, this mistake has already been made for multiple
> kernel APIs; but since this is a new API, let's do it right.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

David and Jarkko, are you okay with this patch from a keyrings subsystem
perspective?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
