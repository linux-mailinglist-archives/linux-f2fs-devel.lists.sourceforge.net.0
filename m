Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A09157FCE13
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Nov 2023 05:53:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8CZx-0002Uy-8m;
	Wed, 29 Nov 2023 04:53:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r8CZu-0002Ur-MF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 04:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1R38ZIL6PItsE4VJCnvik8TjfbvUEepVID/j4l7P7g=; b=VEuX/Yz+6Ih8pXSnZUuq/8NmiX
 zGnsaTKld+dRdmoCFTyDH8IVhsnUtkMjV8VbbbzIfOf25l70LudB4uBwCEde4ichjftkGJANvEfX2
 eDoZJrEyRW+weufwaT4geKJEAEzGQ/Fg00VKOMWC3dP3U5boGVIGhaS8Gb9cB5nbDB1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z1R38ZIL6PItsE4VJCnvik8TjfbvUEepVID/j4l7P7g=; b=PYv9g+QbPQ9eSaC+oWXuZTSOZT
 +Esb3/Ast5Qhhza81KiNAZsZKscb34zUPZYfcW7fgeh47x4TYqOv1ReqxliacOfpNrPZ2pfRvxyTB
 aJVlyw+geELwyfYaPcON1J83jvD48Ix4p4BUnOYvq+H2eFscEcNpR6ip+AtHir5rNClE=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8CZs-0005Ae-0S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Nov 2023 04:53:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=z1R38ZIL6PItsE4VJCnvik8TjfbvUEepVID/j4l7P7g=; b=Eg5UlXehHPMIfT8SBrouZgfkcU
 hCQIdUNoFzbwFQLMCBZNPjHuzaffVNLXDorIyx6omYtWmmXatluzh+wSH5P0HqMYNAJrNMeT79U6b
 ZnBcFG9ZoiAYf6neENYLGYKSHh4nMX5R4A7c1+IQ91AV/xUaHrujUlsty8zRmzTIIHaXgLtyg3AHF
 fPn8q6AeptVAFGsWZkTIiC1tZ4CVR/8QmK+qjYsZyOsa/vtQSEtF2U/tnzYTHebCij9wwW2dBaJhh
 y/ceevCidqg+Of7MdqEqOqDjwVPNCDCj77kiw5/MQ7nT79NZBERzCbsPGXW3GltRRtHLlXqF2Q0IK
 XEE6Dfsw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r8CZV-004l87-08; Wed, 29 Nov 2023 04:53:13 +0000
Date: Wed, 29 Nov 2023 04:53:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Message-ID: <20231129045313.GA1130947@ZenIV>
References: <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <20231123215234.GQ38156@ZenIV> <87leangoqe.fsf@>
 <20231125220136.GB38156@ZenIV> <20231126045219.GD38156@ZenIV>
 <20231126184141.GF38156@ZenIV> <20231127063842.GG38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127063842.GG38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 27, 2023 at 06:38:43AM +0000, Al Viro wrote: >
 > FWIW, I suspect that the right answer would be along the lines of > > *
 if d_splice_alias() does move an exsiting (attached) alias in > > place,
 it ought to dissolve all mountpoints in subtree bei [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r8CZs-0005Ae-0S
Subject: Re: [f2fs-dev] fun with d_invalidate() vs. d_splice_alias() was Re:
 [PATCH v6 0/9] Support negative dentries on case-insensitive ext4 and f2fs
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
Cc: Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gabriel Krisman Bertazi <gabriel@krisman.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 27, 2023 at 06:38:43AM +0000, Al Viro wrote:

> > FWIW, I suspect that the right answer would be along the lines of
> > 	* if d_splice_alias() does move an exsiting (attached) alias in
> > place, it ought to dissolve all mountpoints in subtree being moved.
> > There might be subtleties,

Are there ever...  Starting with the "our test for loop creation
(alias is a direct ancestor, need to fail with -ELOOP) is dependent
upon rename_lock being held all along".

Folks, what semantics do we want for dissolving mounts on splice?
The situation when it happens is when we have a subtree on e.g. NFS
and have some mounts (on client) inside that.  Then somebody on
server moves the root of that subtree somewhere else and we try
to do a lookup in new place.  Options:

1) our dentry for directory that got moved on server is moved into
new place, along with the entire subtree *and* everything mounted
on it.  Very dubious semantics, especially since if we look the
old location up before looking for new one, the mounts will be
dissolved; no way around that.

2) lookup fails.  It's already possible; e.g. if server has
/srv/nfs/1/2/3 moved to /srv/nfs/x, then /srv/nfs/1/2 moved
to /srv/nfs/x/y and client has a process with cwd in /mnt/nfs/1/2/3
doing a lookup for "y", there's no way in hell to handle that -
the lookup will return the fhandle of /srv/nfs/x, which is the
same thing the client has for /mnt/nfs/1/2; we *can't* move that
dentry to /mnt/nfs/1/2/3/y - not without creating a detached loop.
We can also run into -ESTALE if one of the trylocks in
__d_unalias() fails.  Having the same happen if there are mounts
in the subtree we are trying to splice would be unpleasant, but
not fatal.  The trouble is, that won't be a transient failure -
not until somebody tries to look the old location up.

3) dissolve the mounts.  Doable, but it's not easy; especially
since we end up having to redo the loop-prevention check after
the mounts had been dissolved.  And that check may be failing
by that time, with no way to undo that dissolving...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
