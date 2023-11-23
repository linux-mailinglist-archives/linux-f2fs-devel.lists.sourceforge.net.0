Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3527F67DF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 20:53:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6Fld-0007c7-FF;
	Thu, 23 Nov 2023 19:53:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r6Flb-0007c0-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 19:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dqAMuOipmlmjkedrTMrMYw6IQ27y72GpypxSjNpVMec=; b=DW9jgDmYknQbs2iiOl5ZMlorYF
 7Yh86i4ZMA0pkcqua2hsHGo5aAGjkrhmAUN2BC0Af4AD+GSQ+p4WTVvNHD/Ff3mLjlbFLshNTyXY4
 F3U+H6f+b/sft3jC51WVe1MU1FDd0t3x8Ug4mvVnDAqnDqZwM0hsy8M7MO2Z0P8Ow7Xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dqAMuOipmlmjkedrTMrMYw6IQ27y72GpypxSjNpVMec=; b=IfIF7ob1tThSIYHQmZTOCJeZ1y
 cHglzC3z7wlmqoHjKRkPcITp2BBM9zy9YBkgot6HEj9c9Q0EAK91eoMVYomqu+HSJNCU3EZ+1rH2o
 7qw+AzdFbSV8pmzAF7KqZsqGetoJkzDXIqXPJE/eDRv/nPwu4/JtF8avJKgr7zfqSjSE=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6Flb-00DnoN-9f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 19:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dqAMuOipmlmjkedrTMrMYw6IQ27y72GpypxSjNpVMec=; b=a2QncgnUb6QJ1Lg5GgMVA+2T3/
 fbNoKVoUugUVzcl9emA543J3GMHcNhnm+oCBdO+j36w8Ysf6RcjIRGYk8ImVYrVP6NTpC6pPk8Yfy
 ne4FO/7UHfFZQh3ZdS9FUageGdGYES9sh/7udHCFJmQ3qeUssJW+M1jt/WbkzSDuJZw74EONPufr0
 8qecS/s8O3lCDY2qu9K8GlNYUNsehkx8PmzntcsDJvtos+abYityUdLWCHM/tjdfSSBaPldfUHiNj
 iG0QoeEfxs2RnQinORy9UydAqRtMS5T2sMUKNxto2pYOktOZqlUdoEBPaQgQS3JpvIF5AyZX5Xa/i
 WfrihlkQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r6FlP-002EPf-1m; Thu, 23 Nov 2023 19:53:27 +0000
Date: Thu, 23 Nov 2023 19:53:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <gabriel@krisman.be>
Message-ID: <20231123195327.GP38156@ZenIV>
References: <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
 <20231123171255.GN38156@ZenIV> <20231123182426.GO38156@ZenIV>
 <87bkbki91c.fsf@>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bkbki91c.fsf@>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Nov 23, 2023 at 02:06:39PM -0500, Gabriel Krisman
 Bertazi wrote: > > A paragraph above you've said that it's not constant over
 the entire > > filesystem. > > The same ->d_op is used by every dentry in
 the filesystem if the superblock > has the casefold bit enabled, [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r6Flb-00DnoN-9f
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Nov 23, 2023 at 02:06:39PM -0500, Gabriel Krisman Bertazi wrote:

> > A paragraph above you've said that it's not constant over the entire
> > filesystem.
> 
> The same ->d_op is used by every dentry in the filesystem if the superblock
> has the casefold bit enabled, regardless of whether a specific inode is
> casefolded or not. See generic_set_encrypted_ci_d_ops in my tree. It is
> called unconditionally by ext4_lookup and only checks the superblock:
> 
> void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
> {
>         if (dentry->d_sb->s_encoding) {
> 		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> 		return;
> 	}
>         ...
> 
> What I meant was that this used to be set once at sb->s_d_op, and
> propagated during dentry allocation.  Therefore, the propagation to the
> alias would happen inside __d_alloc.  Once we enabled fscrypt and
> casefold to work together, sb->s_d_op is NULL

Why?  That's what I don't understand - if you really want it for
all dentries on that filesystem, that's what ->s_d_op is for.
If it is not, you have that problem, no matter which way you flip ->d_op
value.

> and we always set the same
> handler for every dentry during lookup.

Not every dentry goes through lookup - see upthread for details.

> > Look, it's really simple - any setup work of that sort done in ->lookup()
> > is either misplaced, or should be somehow transferred over to the alias
> > if one gets picked.
> >
> > As for d_obtain_alias()... AFAICS, it's far more limited in what information
> > it could access.  It knows the inode, but it has no idea about the parent
> > to be.
> 
> Since it has the inode, d_obtain_alias has the superblock.  I think that's all
> we need for generic_set_encrypted_ci_d_ops.

Huh?  If it really depends only upon the superblock, just set it in ->s_d_op
when you set the superblock up.

Again, whatever setup you do for dentry in ->lookup(), you either
	* have a filesystem that never picks an existing directory alias
(e.g. doesn't allow open-by-fhandle or has a very unusual implementation
of related methods, like e.g. shmem), or
	* have that setup misplaced, in part that applies to all dentries out
there (->s_d_op for universal ->d_op value, ->d_init() for uniform allocation
of objects hanging from ->d_fsdata and other things like that), or
	* need to figure out how to transfer the result to alias (manually
after d_splice_alias(), if races do not matter or using a new method explicitly
for that), or
	* lose that state for aliases.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
