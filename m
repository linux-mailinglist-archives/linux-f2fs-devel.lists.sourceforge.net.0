Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACA758849
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jul 2023 00:10:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLsuB-0001eh-4A;
	Tue, 18 Jul 2023 22:10:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qLsu9-0001ea-IH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 22:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ar1hS8qkCLYcuRS90oQ9frsG2ME74WGwUMj7H9/ijCA=; b=gC9bUf4dQfiQoTQt3WO2StnXnM
 FOjkQpSN3yOwsTaumNbDBgs32YPgNJ7rdePPqSKaNW7oKgGgQ9IcrhUI4HHrbbjmYfGbGIEwYloCI
 wRHCzW/j0byB4TDEdQ6oSRGp+AB83VJRdDOXWyFnGCHLfpr20xNFcrRj1KqV7KVQl9WA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ar1hS8qkCLYcuRS90oQ9frsG2ME74WGwUMj7H9/ijCA=; b=QQyaHWw4T69UmqPTmlq7xC2rhz
 Q33ssndzRc1frAGiuDxwi9FpJUTGZzsq4bG0Yf3LaPVy+p6dITwTBiLu4jFLYGIWYJs+GX2pF+88f
 pydRupGPuqzb/gGf52VsKhzYrOjKh6+Tix8Dps76LH7INg38DA47qglBkJoNd+xExsIU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLsu9-00CJTE-0L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jul 2023 22:10:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6995861269;
 Tue, 18 Jul 2023 22:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B545C433C7;
 Tue, 18 Jul 2023 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689718242;
 bh=N9VprbmcyfsUGUzo3F8QagSXSUpuZxEJLOZz4+DJsd8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PuNa0R7001LENL2JRD37XvuwidpUxdIf0B9ioJPshgsa+WiqpKDW8R8g1hBEBdfUM
 RCbwjD5W5l9Bd6m6m5o3cAAxyasl5fSYIxdJQZL5mJUzfagFbBqj1/Y7HzbnPDrSq/
 cEK7/MtSWLIVrQGIC/nrl6B+z1nkQuEdi4grmH8cpnJzueVs4xGkFY/sATd5KLCmbD
 FsT+XS6j1Imo1VbpTY0FRpthfugptFReBBQQ/d0IyXtYPUjfTRG8+3pY/DJH6nlvxB
 RQFHii7kFOTxMEUNlcHv8m9+/AUy6aN/uACsh6es5Yd4+n4X92i6Z7CVoSfRj2UCX9
 rt8gq3dXyjOGw==
Date: Tue, 18 Jul 2023 15:10:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230718221040.GA1005@sol.localdomain>
References: <20230422000310.1802-1-krisman@suse.de>
 <20230422000310.1802-5-krisman@suse.de>
 <20230714053135.GD913@sol.localdomain> <87h6q1580a.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6q1580a.fsf@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 18, 2023 at 03:34:13PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Fri,
 Apr 21, 2023 at 08:03:07PM -0400, Gabriel Krisman Bertazi wrote: > > [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLsu9-00CJTE-0L
Subject: Re: [f2fs-dev] [PATCH v2 4/7] libfs: Support revalidation of
 encrypted case-insensitive dentries
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 18, 2023 at 03:34:13PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Fri, Apr 21, 2023 at 08:03:07PM -0400, Gabriel Krisman Bertazi wrote:
> >> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> 
> >> Preserve the existing behavior for encrypted directories, by rejecting
> >> negative dentries of encrypted+casefolded directories.  This allows
> >> generic_ci_d_revalidate to be used by filesystems with both features
> >> enabled, as long as the directory is either casefolded or encrypted, but
> >> not both at the same time.
> >> 
> >> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> ---
> >>  fs/libfs.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/fs/libfs.c b/fs/libfs.c
> >> index f8881e29c5d5..0886044db593 100644
> >> --- a/fs/libfs.c
> >> +++ b/fs/libfs.c
> >> @@ -1478,6 +1478,9 @@ static inline int generic_ci_d_revalidate(struct dentry *dentry,
> >>  		const struct inode *dir = READ_ONCE(parent->d_inode);
> >>  
> >>  		if (dir && needs_casefold(dir)) {
> >> +			if (IS_ENCRYPTED(dir))
> >> +				return 0;
> >> +
> >
> > Why not allow negative dentries in case-insensitive encrypted directories?
> > I can't think any reason why it wouldn't just work.
> 
> TBH, I'm not familiar with the details of combined encrypted+casefold
> support to be confident it works.This patch preserves the current
> behavior of disabling them for encrypted+casefold directories.

Not allowing that combination reduces the usefulness of this patchset.
Note that Android's use of casefold is always combined with encryption.

> I suspect it might require extra work that I'm not focusing on this
> patchset.  For instance, what should be the order of
> fscrypt_d_revalidate and the checks I'm adding here?

Why would order matter?  If either "feature" wants the dentry to be invalidated,
then the dentry gets invalidated.

> Note we will start creating negative dentries in casefold directories after
> patch 6/7, so unless we disable it here, we will start calling
> fscrypt_d_revalidate for negative+casefold.

fscrypt_d_revalidate() only cares about the DCACHE_NOKEY_NAME flag, so that's
not a problem.

> 
> Should I just drop this hunk?  Unless you are confident it works as is, I
> prefer to add this support in stages and keep negative dentries of
> encrypted+casefold directories disabled for now.

Unless I'm missing something, I think you're overcomplicating it.  It should
just work if you don't go out of your way to prohibit this case.  I.e., just
don't add the IS_ENCRYPTED(dir) check to generic_ci_d_revalidate().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
