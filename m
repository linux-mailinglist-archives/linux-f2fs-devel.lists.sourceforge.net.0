Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA02912FAFA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 17:57:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inQGg-00077v-Mz; Fri, 03 Jan 2020 16:57:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1inQGf-00077o-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 16:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQJKyI5pRKlIoYBPR8AGPVRtE3GObJajSqK4aDMS/FE=; b=K0HlFFJwo66zzL6BUyUnAiEufb
 esfLYDi7W4MVB0LR4TDnp+AA4xCFrRbg2V5N6klmazpVz6J/9bl4UdkCiBd6XD3CpcSFFt0jb7NaN
 SQ92IM1xPpl4SATX5MIuhGszy6WfTFGdax452QOiiIOE+j92tAnpry17g5hmtyqRP0wo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQJKyI5pRKlIoYBPR8AGPVRtE3GObJajSqK4aDMS/FE=; b=japo3Gj1vae6MVS+l0mIsga3gF
 C1UYSprKWKn/gHR8T4ynyCWlt05MDeqlfUB2lqaRe2KejCSI5oCv+ZjNsUb9PpzX+6cuHSpZlTBfQ
 L1SSdaIrGg0BJ8NcueccZtIjH8yEMlLe6soUEC7JXOlY1VRAnskuN3IF2tzt8alSoVy8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inQGa-008Xr1-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 16:57:45 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5DA7206DB;
 Fri,  3 Jan 2020 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578070649;
 bh=RL+yaap+s7Gb++esPrb+ddyBAFUgLJGNTPp2fhE5Iv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxXw7SXw9knA6E1AFwsb7GlSx8TbEgrh+y/7fgxxpaTXB0F5IZCHr/2+nyXyPozfw
 ILl+8PJ4ckpEtM8xPBGI2xuFFCndo7KoiDhyzVqKfQU8Jg6s2/6sW1x7+8GxdVCmlv
 Etw2e1txnGpwPLJlYb/D0D+m8j+Y3f1VWe9VXDjA=
Date: Fri, 3 Jan 2020 08:57:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200103165727.GB19521@gmail.com>
References: <20191119222447.226853-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119222447.226853-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1inQGa-008Xr1-EQ
Subject: Re: [f2fs-dev] [PATCH v2] fscrypt: support passing a keyring key to
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
 "Theodore Y . Ts'o" <tytso@mit.edu>, Ondrej Mosnacek <omosnace@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 19, 2019 at 02:24:47PM -0800, Eric Biggers wrote:
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
> This patch has been tested using an xfstest which I wrote to test it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to fscrypt.git#master for 5.6.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
