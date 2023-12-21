Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0AE81AF45
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Dec 2023 08:19:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGDLG-0004Q9-00;
	Thu, 21 Dec 2023 07:19:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1rGDLE-0004Q3-6i
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FlGscbfTW0+KZ3jK5mNcHMl5tg6QSPd929CFqIP8WR4=; b=ke5qmxEGDCmkrh4REbZWRwMKBS
 1ITA3Pf5hLPrx6PFTBP9ARn4TeKE/oLbmRXEg5woS4F4lcZR/9dT3m+0LuygmROTuxtIOMMCvLVHH
 sgxeIsj+awdTGxagwi5gttikb0OunVC7Xh5uwcBNkauEVqhKK1TdwqS5+GQwccJ+2vno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FlGscbfTW0+KZ3jK5mNcHMl5tg6QSPd929CFqIP8WR4=; b=FTCA0nenIW8Lpps7ayQQjziH1h
 VXWoDabOzhbSvam68g44qF4WjYss2OT9kJLTsX0BY0ugZI3aIqY3jeLbymFtWWUx1J/n3NW2Kfkls
 PqUsAuvyOu7uQ+oolByQAuvscVhJ2ytx1gDGyQeHqHBmw+Nhkw6+H7ufEIOCHAygnLJQ=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGDLE-0004gT-0d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 07:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FlGscbfTW0+KZ3jK5mNcHMl5tg6QSPd929CFqIP8WR4=; b=p9aUctXyb8mC3Y8J31qjUJd/Dm
 kXv/m0A37ctQPOfBFc5ArzhSiO0fWfVarlLSk8vvvvv/+l5lwCEMG/y7C1UsrruMCzuoiVzuB/yux
 EQnW7FqU+9ynAtgrB9TsBAjwd0z66pMobmqauRorvhD5vhNmZ1ItZg7AXrXM+XYtGTs6e1ehZvlkL
 Fm3dLRmAH3qmvfPQD0pKQPX3x6ZICAS+Bzr2vcSXAPotfuKzhE708sJ46Lw1YnpVCbQeqpdFKaqT9
 fivLhjGFX7ZgOTDXv6xfeDLr/iRTpC6KlfZWhaqTIdUXGecoiwZwaCpBGTTAVWTCjG2WTytOOJry4
 mQuh31qg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rGDL4-001IZE-2A; Thu, 21 Dec 2023 07:19:26 +0000
Date: Thu, 21 Dec 2023 07:19:26 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231221071926.GB1674809@ZenIV>
References: <20231215211608.6449-1-krisman@suse.de>
 <20231215211608.6449-3-krisman@suse.de>
 <20231221071402.GA1674809@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221071402.GA1674809@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 21, 2023 at 07:14:02AM +0000, Al Viro wrote: >
 On Fri, Dec 15, 2023 at 04:16:02PM -0500, Gabriel Krisman Bertazi wrote:
 > > fscrypt dentries are always valid once the key is available. Sin [...]
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGDLE-0004gT-0d
Subject: Re: [f2fs-dev] [PATCH v2 2/8] fscrypt: Drop d_revalidate if key is
 available
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 21, 2023 at 07:14:02AM +0000, Al Viro wrote:
> On Fri, Dec 15, 2023 at 04:16:02PM -0500, Gabriel Krisman Bertazi wrote:
> > fscrypt dentries are always valid once the key is available.  Since the
> > key cannot be removed without evicting the dentry, we don't need to keep
> > retrying to revalidate it.
> > 
> > Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
> > ---
> >  fs/crypto/fname.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> > index 7b3fc189593a..0457ba2d7d76 100644
> > --- a/fs/crypto/fname.c
> > +++ b/fs/crypto/fname.c
> > @@ -591,8 +591,15 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
> >  	 * reverting to no-key names without evicting the directory's inode
> >  	 * -- which implies eviction of the dentries in the directory.
> >  	 */
> > -	if (!(dentry->d_flags & DCACHE_NOKEY_NAME))
> > +	if (!(dentry->d_flags & DCACHE_NOKEY_NAME)) {
> > +		/*
> > +		 * If fscrypt is the only feature requiring
> > +		 * revalidation for this dentry, we can just disable it.
> > +		 */
> > +		if (dentry->d_op->d_revalidate == &fscrypt_d_revalidate)
> 
> Umm...  What about ceph?  IOW, why do we care how had we gotten to that
> function - directly via ->d_revalidate() or from ->d_revalidate() instance?

Nevermind.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
