Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71B844FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 04:24:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVNgw-000385-V0;
	Thu, 01 Feb 2024 03:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rVNgw-00037z-9F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 03:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LCmRERkZF1ZezYHJErNmgTRl8CZAg0PDTuNt5bZWcLc=; b=WN/IVPhSIhuZ0s00IDlmxDBkw6
 dbOzitRbmoX56d6gWHD7yYONt3gZH1T5V2T3pOZ3LOykOxTxrPtgzBhn3W7dD6XiwYN6m8GlYkfnk
 FhrQ/LdV5xU6GywJcN1U3zSBqM+h6/Coq3s4twTBuZqm8aT6G85PK4KR+3BIzKMCMOlA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LCmRERkZF1ZezYHJErNmgTRl8CZAg0PDTuNt5bZWcLc=; b=Za8O/53tOaK+xMczmqx3ijtKFZ
 3t/WkYysbG+8Q6HDWtKBG8ApkY715zOvOXT0JxxAxfef1yqy3t/4q34ozuDmEInT36dijQjUmw+uE
 OzXPMsMaWoSFluXdkE9xzR+y1JbNEA9/F+g7vJyqiXHOXcTc00/s9EpyGI3ggHUEO2Eo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVNgu-0008VY-MS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 03:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED29D6130D;
 Thu,  1 Feb 2024 03:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B2DC433C7;
 Thu,  1 Feb 2024 03:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706757875;
 bh=gc4v17wSZ6Qjqbp/jjpPvy6HAXY8q3i8CoEzcQx+p5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9HIfgrjQN4UNK2O52IcyksmHgjKicwwypq6hTILIRCeBTVo7SGVmoVgOQMPmzZkL
 Vqi/r9+whLWGODUxnvUCkEnpq3Q6a5RG5LRgFd+xpXosOJk1TC+3r3u+sBAq7gmN0G
 8zOOYrgD2uypAEsiGN4DBstHrpzMXul2JLcMIY2swDh4zdE2SQUW4kIHcv2MR21U8d
 HvgerTiSlDB1DNZorlBKtkOFUwfuKZ1utk5FzYoMeWDl8TdAnmAZILJYVNOxn3fwJv
 GfXv1vIfQc0feHnLFvYA2nDWxczw6BO30AknTWTP3XK1cJPHf2v4mW2E1Jv4zbN45a
 QuXYf6lmq0Fiw==
Date: Wed, 31 Jan 2024 19:24:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20240201032433.GB1526@sol.localdomain>
References: <20240129204330.32346-1-krisman@suse.de>
 <20240129204330.32346-5-krisman@suse.de>
 <20240131004724.GC2020@sol.localdomain>
 <871q9x2vwj.fsf@mailhost.krisman.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871q9x2vwj.fsf@mailhost.krisman.be>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 31, 2024 at 03:35:40PM -0300, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Mon,
 Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote: > > [...]
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVNgu-0008VY-MS
Subject: Re: [f2fs-dev] [PATCH v5 04/12] fscrypt: Drop d_revalidate for
 valid dentries during lookup
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
Cc: tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jan 31, 2024 at 03:35:40PM -0300, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Mon, Jan 29, 2024 at 05:43:22PM -0300, Gabriel Krisman Bertazi wrote:
> >> Unencrypted and encrypted-dentries where the key is available don't need
> >> to be revalidated with regards to fscrypt, since they don't go stale
> >> from under VFS and the key cannot be removed for the encrypted case
> >> without evicting the dentry.  Mark them with d_set_always_valid, to
> >
> > "d_set_always_valid" doesn't appear in the diff itself.
> >
> >> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> >> index 4aaf847955c0..a22997b9f35c 100644
> >> --- a/include/linux/fscrypt.h
> >> +++ b/include/linux/fscrypt.h
> >> @@ -942,11 +942,22 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
> >>  static inline void fscrypt_prepare_lookup_dentry(struct dentry *dentry,
> >>  						 bool is_nokey_name)
> >>  {
> >> -	if (is_nokey_name) {
> >> -		spin_lock(&dentry->d_lock);
> >> +	spin_lock(&dentry->d_lock);
> >> +
> >> +	if (is_nokey_name)
> >>  		dentry->d_flags |= DCACHE_NOKEY_NAME;
> >> -		spin_unlock(&dentry->d_lock);
> >> +	else if (dentry->d_flags & DCACHE_OP_REVALIDATE &&
> >> +		 dentry->d_op->d_revalidate == fscrypt_d_revalidate) {
> >> +		/*
> >> +		 * Unencrypted dentries and encrypted dentries where the
> >> +		 * key is available are always valid from fscrypt
> >> +		 * perspective. Avoid the cost of calling
> >> +		 * fscrypt_d_revalidate unnecessarily.
> >> +		 */
> >> +		dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
> >>  	}
> >> +
> >> +	spin_unlock(&dentry->d_lock);
> >
> > This makes lookups in unencrypted directories start doing the
> > spin_lock/spin_unlock pair.  Is that really necessary?
> >
> > These changes also make the inline function fscrypt_prepare_lookup() very long
> > (when including the fscrypt_prepare_lookup_dentry() that's inlined into it).
> > The rule that I'm trying to follow is that to the extent that the fscrypt helper
> > functions are inlined, the inline part should be a fast path for unencrypted
> > directories.  Encrypted directories should be handled out-of-line.
> >
> > So looking at the original fscrypt_prepare_lookup():
> >
> > 	static inline int fscrypt_prepare_lookup(struct inode *dir,
> > 						 struct dentry *dentry,
> > 						 struct fscrypt_name *fname)
> > 	{
> > 		if (IS_ENCRYPTED(dir))
> > 			return __fscrypt_prepare_lookup(dir, dentry, fname);
> >
> > 		memset(fname, 0, sizeof(*fname));
> > 		fname->usr_fname = &dentry->d_name;
> > 		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
> > 		fname->disk_name.len = dentry->d_name.len;
> > 		return 0;
> > 	}
> >
> > If you could just add the DCACHE_OP_REVALIDATE clearing for dentries in
> > unencrypted directories just before the "return 0;", hopefully without the
> > spinlock, that would be good.  Yes, that does mean that
> > __fscrypt_prepare_lookup() will have to handle it too, for the case of dentries
> > in encrypted directories, but that seems okay.
> 
> ok, will do.  IIUC, we might be able to do without the d_lock
> provided there is no store tearing.
> 
> But what was the reason you need the d_lock to set DCACHE_NOKEY_NAME
> during lookup?  Is there a race with parallel lookup setting d_flag that
> I couldn't find? Or is it another reason?

d_flags is documented to be protected by d_lock.  So for setting
DCACHE_NOKEY_NAME, fs/crypto/ just does the safe thing of taking d_lock.  I
never really looked into whether the lock can be skipped there (i.e., whether
anything else can change d_flags while ->lookup is running), since this code
only ran for no-key names, for which performance isn't really important.

This patch would extend that locking to a new context in which it would be
executed several orders of magnitude more often.  So, making sure it's properly
optimized becomes more important.  It looks like it *might* be the case that
->lookup has exclusive access to d_flags, by virtue of having allocated the
dentry, so I'm just wondering if we can take advantage of that (or whether in
classic VFS fashion there's some edge case where that assumption is wrong).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
