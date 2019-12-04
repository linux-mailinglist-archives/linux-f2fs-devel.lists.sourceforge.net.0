Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF51120A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 01:32:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icIab-00051R-3d; Wed, 04 Dec 2019 00:32:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1icIaa-00051K-3V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 00:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kpnUs4Iwxj9dPtkdku8k23GyUam4bE+bRqDR5fXV3ic=; b=loF9IrnLRvV4khwPhWD7dlwxgg
 fJV8Rt0wokhJ/0umRTsql95EPTabI8XA/4gccPQjmrCQeFQCaTbHUuGko11gUBNGq4opNmed+TSK9
 ++UMTRaXFRDaxYvu1Pw7QCLaG4v+EkGFDVwMBki2plInI/AD4ChlcaBw8Pezmbw+2q04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kpnUs4Iwxj9dPtkdku8k23GyUam4bE+bRqDR5fXV3ic=; b=fRISSt8BWjOwoPiDayKBATGaMM
 sUWBnVXJYeJ8UJsnIcPX6KywPMkHcBsWGCSe44OGg+gXSxOk1LC/gCmqcTX0Ysgh9s0PFUQ9nhiCW
 pSq1qIp+ymvO+yFJir8cG7E6xYOUC+VPpF5C9WMClmtSYvs7tte5e+3kLroRBEco+PPM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icIaY-003Gf6-O9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 00:32:20 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F59820674;
 Wed,  4 Dec 2019 00:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575419533;
 bh=8ZaeCwEq+6xIABYU+SGqp6hX6Y6XpUzqAIOiEL+4ptk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H+JHr/MY13+OR7Xg3FnTUgq77Cu2JRb/F5u+aykghFc6qGYlML4b6ddbV54qHYV0C
 HkJpYWB7n8o3CzDTRpPQ6YK/SIfmqLJ7ehkznxzeKGCk0Je1hCzegtpse65co4wjGM
 dAdXmhvWd1VFRWMfustTw3Kz4aCxFW4LVjSG3khk=
Date: Tue, 3 Dec 2019 16:32:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20191204003211.GE727@sol.localdomain>
References: <20191203051049.44573-1-drosen@google.com>
 <20191203051049.44573-5-drosen@google.com>
 <20191203074154.GA216261@architecture4>
 <85wobdb3hp.fsf@collabora.com>
 <20191203203414.GA727@sol.localdomain>
 <85zhg96r7l.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85zhg96r7l.fsf@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icIaY-003Gf6-O9
Subject: Re: [f2fs-dev] [PATCH 4/8] vfs: Fold casefolding into vfs
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 03, 2019 at 04:21:02PM -0500, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Tue, Dec 03, 2019 at 02:42:10PM -0500, Gabriel Krisman Bertazi wrote:
> >> Gao Xiang <gaoxiang25@huawei.com> writes:
> 
> >> I think Daniel's approach of moving this into VFS is the simplest way to
> >> actually solve the issue, instead of extending and duplicating a lot of
> >> functionality into filesystem hooks to support the possible mixes of
> >> case-insensitive, overlayfs and fscrypt.
> >> 
> >
> > I think we can actually get everything we want using dentry_operations only,
> > since the filesystem can set ->d_op during ->lookup() (like what is done for
> > encrypted filenames now) rather than at dentry allocation time.  And fs/crypto/
> > can export fscrypt_d_revalidate() rather than setting ->d_op itself.
> 
> Problem is, differently from fscrypt, case-insensitive uses the d_hash()
> hook and for a lookup, we actually use
> dentry->d_parent->d_ops->d_hash().  Which works well, until you are flipping the
> casefold flag.  Then the dentry already exists and you need to modify
> the d_ops on the fly, which I couldn't find precedent anywhere.  I tried
> invalidating the dentry whenever we flip the flag, but then if it has
> negative dentries as children,I wasn't able to reliably invalidate it,
> and that's when I reached the limit of my knowledge in VFS.  In
> particular, in every attempt I made to implement it like this, I was
> able to race and do a case-insensitive lookup on a directory that was
> just made case sensitive.
> 
> I'm not saying there isn't a way.  But it is a bit harder than this
> proposal. I tried it already and still didn't manage to make it work.
> Maybe someone who better understands vfs.

Yes you're right, I forgot that for ->d_hash() and ->d_compare() it's actually
the parent's directory dentry_operations that are used.

> 
> > It's definitely ugly to have to handle the 3 cases of encrypt, casefold, and
> > encrypt+casefold separately -- and this will need to be duplicated for each
> > filesystem.  But we do have to weigh that against adding additional complexity
> > and overhead to the VFS for everyone.  If we do go with the VFS changes, please
> > try to make them as simple and unobtrusive as possible.
> 
> Well, it is just not case-insensitive+fscrypt. Also overlayfs
> there. Probably more.  So we have much more cases.  I understand the VFS
> changes need to be very well thought, but when I worked on this it
> started to look a more correct solution than using the hooks.

Well the point of my proof-of-concept patch having separate ext4_ci_dentry_ops,
ext4_encrypted_dentry_ops, and ext4_encrypted_ci_dentry_ops is supposed to be
for overlayfs support -- since overlayfs requires that some operations are not
present.  If we didn't need overlayfs support, we could just use a single
ext4_dentry_ops for all dentries instead.

I think we could still support fscrypt, casefold, fscrypt+casefold, and
fscrypt+overlayfs with dentry_operations only.  It's casefold+overlayfs that's
the biggest problem, due to the possibility of the casefold flag being set on a
directory later as you pointed out.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
