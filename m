Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3639B1C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 07:01:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lp1xR-0003Me-PQ; Fri, 04 Jun 2021 05:01:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1lp1xR-0003MY-4n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 05:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qU+POD4s+GeaIJuBoqX5AyiaiwqFB5AyROEyuWhefU=; b=HPX1sHayEsWllzfsaO+KrDXEMP
 JAVEaEdirtu1QKDYs6RV2yOAPKqUog8jpIjRbvbPDsqXGZIMMXx6KKE/61saUR840BwQqoP/1wufO
 OpmphGpI/k3/xB41Q8KRRB6S8RLsQf+5XUOTBIyCIy0rgRWU2qkygXzD8StHpo2Sb4Lk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+qU+POD4s+GeaIJuBoqX5AyiaiwqFB5AyROEyuWhefU=; b=DiwGYo+6JWilmumsNHjOazUKbn
 L3ooCs6Jl0ac0Di617oncCA2JDb7YpCgz1kY1xq34YxLrG0u5PT2SlVaHnLKpvl/4r26nb3SgHJn4
 XtAeobwxTyaeXnNp1+VMjz+ERS51q2av5NvUcfBtq333qbuEViQwG1I5iiMctyHMc5xU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lp1xK-0006Nt-5a
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 05:01:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47F976138C;
 Fri,  4 Jun 2021 05:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622782869;
 bh=FX6o7aB6iS8uy89W3MSrtVuCO1EpSj36V4h5Npoe450=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgBIwOAY1BynVNx0Ow7+EJcnJ8OeXkGp9rKCjhykWbfHAKuCTHi+Bl2yD/YjbU5Me
 LKuaAUS6fFA0s2gD0UcnaXo9xcyh2FiNaOVmSYWkvNVIoTc50ArtJcDX1xTeOWryAu
 6kabYQIquTtaM3Q7LDdPL6348hPP0bnFMnqcVxqNunmwNvsWVjXbyLzE+XVTI6+U82
 H02fB0o7GKn2A5tKM3O5sBBEigLANr1z7vtO8+qyaXH5gyvYMQjMOpKS3VPjDx61kF
 c5dNoonMRp8zCbCagSPantf2ijeJddzQcUNfGMRQ9ypW6Ny0d/nwLld5DBNZ69NhC4
 2VRDwHX/nsPxw==
Date: Thu, 3 Jun 2021 22:01:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YLmzkzPZwBVYf5LO@sol.localdomain>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
 <YLlj+h4RiT6FvyK6@sol.localdomain> <YLmv5Ykb3QUzDOlL@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLmv5Ykb3QUzDOlL@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lp1xK-0006Nt-5a
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Advertise encrypted casefolding
 in sysfs
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 03, 2021 at 09:45:25PM -0700, Jaegeuk Kim wrote:
> On 06/03, Eric Biggers wrote:
> > On Thu, Jun 03, 2021 at 09:50:38AM +0000, Daniel Rosenberg wrote:
> > > Older kernels don't support encryption with casefolding. This adds
> > > the sysfs entry encrypted_casefold to show support for those combined
> > > features. Support for this feature was originally added by
> > > commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > 
> > > Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > Cc: stable@vger.kernel.org # v5.11+
> > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > ---
> > >  fs/f2fs/sysfs.c | 15 +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > index 09e3f258eb52..6604291a3cdf 100644
> > > --- a/fs/f2fs/sysfs.c
> > > +++ b/fs/f2fs/sysfs.c
> > > @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
> > >  	if (f2fs_sb_has_compression(sbi))
> > >  		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > >  				len ? ", " : "", "compression");
> > > +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> > > +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > +				len ? ", " : "", "encrypted_casefold");
> > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > >  				len ? ", " : "", "pin_file");
> > >  	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> > > @@ -579,6 +582,7 @@ enum feat_id {
> > >  	FEAT_CASEFOLD,
> > >  	FEAT_COMPRESSION,
> > >  	FEAT_TEST_DUMMY_ENCRYPTION_V2,
> > > +	FEAT_ENCRYPTED_CASEFOLD,
> > >  };
> > 
> > Actually looking at it more closely, this patch is wrong.
> > 
> > It only makes sense to declare "encrypted_casefold" as a feature of the
> > filesystem implementation, i.e. /sys/fs/f2fs/features/encrypted_casefold.
> > 
> > It does *not* make sense to declare it as a feature of a particular filesystem
> > instance, i.e. /sys/fs/f2fs/$disk/features, as it is already implied by the
> > filesystem instance having both the encryption and casefold features enabled.
> > 
> > Can we add /sys/fs/f2fs/features/encrypted_casefold only?
> 
> wait.. /sys/fs/f2fs/features/encrypted_casefold is on by
> CONFIG_FS_ENCRYPTION && CONFIG_UNICODE.
> OTOH, /sys/fs/f2fs/$dis/feature_list/encrypted_casefold is on by
> on-disk features: F2FS_FEATURE_ENCRYPT and F2FS_FEATURE_CASEFOLD.
> 

Yes, but in the on-disk case, encrypted_casefold is redundant because it simply
means encrypt && casefold.  There is no encrypted_casefold flag on-disk.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
