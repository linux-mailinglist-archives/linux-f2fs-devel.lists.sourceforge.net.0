Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7BC2C18B7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 23:52:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khKgm-00006b-1W; Mon, 23 Nov 2020 22:52:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khKgl-00006T-LE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 22:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fbkTYFIyrcZo5GLe5hQNgBzsua17Nhz3YjSN5w+C21A=; b=Ha5TZcRvNWviLB3zQOcsgIREbC
 sHjqXb0AXli5Mx5++D+o5mbbchvt66XSNfU9Z/3w5smRl2MTdwnYmxBPFiOhgnGVfFpI/OKDWsx3b
 aPBjV1OyfZQWflVi8jsZFRD+Hr+Pv33ZkYPz/ZXXUsH4CWPcNls6D7JOq8Icay0sP3Xw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fbkTYFIyrcZo5GLe5hQNgBzsua17Nhz3YjSN5w+C21A=; b=AGA5n66wHtqgNpxWRM9TCIfUBk
 Rt8tj0rqUj6GC95L8/Cvb4K23xSVHrGan/hnAdly+PVZmAhlx4SOMz9P7TOad5OZk2qY5UQLZZW7O
 o9z1HGONJkSIsOfsSUGWq8l2+3rHKwNxQ4PXZ4PzORQpj5Dgc/TKj/Qd9M01sOvbGaEk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khKgi-00C7i1-11
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 22:52:03 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F86C20715;
 Mon, 23 Nov 2020 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606171906;
 bh=ZXc9vIM5l13483UKyWWsubayfXoDDXtja33VNeTcUhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qsDDuDnWK5GUaGQVbz8/5EO0/9DSdVrAPwZxZyKsgRZfSg/kyAN/ExsfMf6vCCBrg
 Bxpxd6KXI7WTvuvsYFKMGz2q2Z3jn+8IqNQnKyAF+mOclvnBsqJVUQI0a8ZsKfitu0
 oI21w81HVsopyq5JuVAM+2IYVC2aMkThQZlQxCTY=
Date: Mon, 23 Nov 2020 14:51:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gao Xiang <hsiangkao@redhat.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Message-ID: <X7w9AO0x8vG85JQU@sol.localdomain>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201122051218.GA2717478@xiangao.remote.csb>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khKgi-00C7i1-11
Subject: Re: [f2fs-dev] [PATCH v4 2/3] fscrypt: Have filesystems handle
 their d_ops
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
> Hi all,
> 
> On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
> > This shifts the responsibility of setting up dentry operations from
> > fscrypt to the individual filesystems, allowing them to have their own
> > operations while still setting fscrypt's d_revalidate as appropriate.
> > 
> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > they have their own specific dentry operations as well. That operation
> > will set the minimal d_ops required under the circumstances.
> > 
> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > since we cannot adjust those later on. This should not result in any
> > change in behavior.
> > 
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > Acked-by: Eric Biggers <ebiggers@google.com>
> > ---
> 
> ...
> 
> >  extern const struct file_operations ext4_dir_operations;
> >  
> > -#ifdef CONFIG_UNICODE
> > -extern const struct dentry_operations ext4_dentry_ops;
> > -#endif
> > -
> >  /* file.c */
> >  extern const struct inode_operations ext4_file_inode_operations;
> >  extern const struct file_operations ext4_file_operations;
> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > index 33509266f5a0..12a417ff5648 100644
> > --- a/fs/ext4/namei.c
> > +++ b/fs/ext4/namei.c
> > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
> >  	struct buffer_head *bh;
> >  
> >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> > +	generic_set_encrypted_ci_d_ops(dentry);
> 
> One thing might be worth noticing is that currently overlayfs might
> not work properly when dentry->d_sb->s_encoding is set even only some
> subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
> ovl_mount_dir_noesc => ovl_dentry_weird()
> 
> For more details, see:
> https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
> 
> Just found it by chance (and not sure if it's vital for now), and
> a kind reminder about this.
> 

Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
feature enabled, regardless of which directories are actually using casefolding.
This is an existing limitation which was previously discussed, e.g. at
https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
and
https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.

Gabriel and Daniel, is one of you still looking into fixing this?  IIUC, the
current thinking is that when the casefolding flag is set on a directory, it's
too late to assign dentry_operations at that point.  But what if all child
dentries (which must be negative) are invalidated first, and also the filesystem
forbids setting the casefold flag on encrypted directories that are accessed via
a no-key name (so that fscrypt_d_revalidate isn't needed -- i.e. the directory
would only go from "no d_ops" to "generic_ci_dentry_ops", not from
"generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
