Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B839C43B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Jun 2021 02:15:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpJyP-0001Y4-IM; Sat, 05 Jun 2021 00:15:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lpJyO-0001Xx-6X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Jun 2021 00:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itd0XdJNvfoiQSK1MoHy+6CjAN8mnOx7shRp/JPutzI=; b=j/cxqbiYyX93M9w8MOxgKSHzkl
 z2HnVid4R5AMKWRxBVwqvNLD1RlAiOQ00Z3hdlA096SzVxZ2rEqyIoumSX31e+ReKoOQ4vX0enWxE
 FdRdHOToXQllOI+R9URorT1sJVaMvDfzB8a/XYSZ5LRoyl2YY+wBDGe7Rc0tIQuAcHcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itd0XdJNvfoiQSK1MoHy+6CjAN8mnOx7shRp/JPutzI=; b=OImYwamkcNCKSmZ0MIU2MSabCl
 WxTsidp+XxiYwmTAGzzBz0yLgv/1IocCHlRpAk87cgAHRz0k9CNOEZJnmD1L/l2QtNqDuD90J89bW
 OuqiXiYV0tnAsGOIjXW+q9mohqHTDixUMgVLFj/4EZwnbsZBRC96Qof37V1qPM9f0QWg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lpJyL-0005ga-U9
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Jun 2021 00:15:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04AE86121F;
 Sat,  5 Jun 2021 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622852125;
 bh=CUYejrv1TGj5nCu6srkZoxNQGNQ4jCN+weoTDbXo4Ow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNZUMuoAy+1XER6Q+k6mO3psSn4w8H7IxFBvyRcx6DM+SxC/ZOiOk4kUI8KQckckg
 cr6jFWsi1e2Quk2Nu6ozrL5zvd2UJOlBegHi8F6Pi43WtHSARV+zp/Ekuz6EDihqM7
 7AMEcpsW2rh4mGFwrIFY4LTBso6IelFU6fF0NVaDCf5OJ+cQ9y7i4P+tBJWBNDNyMD
 xfXDrtU6GCsbHnC1wKG05tYNWB9Coe2Sf+06LdVil8u3Xxv2Fqgq7Ku/PMYRlcZTyG
 mObaTvxPmE2M8kbQiv/92szvDU9SSrlK+G0gSMNIb8wl6jiF+fUOj90kr9pTTTFWFL
 aJIPErrhl33sQ==
Date: Fri, 4 Jun 2021 17:15:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YLrCG/3e0xPE9P84@google.com>
References: <20210603095038.314949-1-drosen@google.com>
 <20210603095038.314949-3-drosen@google.com>
 <YLlj+h4RiT6FvyK6@sol.localdomain> <YLmv5Ykb3QUzDOlL@google.com>
 <YLmzkzPZwBVYf5LO@sol.localdomain> <YLm8aOs6Sc/CLaAv@google.com>
 <452273b4-b386-3180-9b6e-f060bdbe3802@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <452273b4-b386-3180-9b6e-f060bdbe3802@kernel.org>
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
X-Headers-End: 1lpJyL-0005ga-U9
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
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/05, Chao Yu wrote:
> On 2021/6/4 13:38, Jaegeuk Kim wrote:
> > On 06/03, Eric Biggers wrote:
> > > On Thu, Jun 03, 2021 at 09:45:25PM -0700, Jaegeuk Kim wrote:
> > > > On 06/03, Eric Biggers wrote:
> > > > > On Thu, Jun 03, 2021 at 09:50:38AM +0000, Daniel Rosenberg wrote:
> > > > > > Older kernels don't support encryption with casefolding. This adds
> > > > > > the sysfs entry encrypted_casefold to show support for those combined
> > > > > > features. Support for this feature was originally added by
> > > > > > commit 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > > > > 
> > > > > > Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
> > > > > > Cc: stable@vger.kernel.org # v5.11+
> > > > > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > > > > ---
> > > > > >   fs/f2fs/sysfs.c | 15 +++++++++++++--
> > > > > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > > > > index 09e3f258eb52..6604291a3cdf 100644
> > > > > > --- a/fs/f2fs/sysfs.c
> > > > > > +++ b/fs/f2fs/sysfs.c
> > > > > > @@ -161,6 +161,9 @@ static ssize_t features_show(struct f2fs_attr *a,
> > > > > >   	if (f2fs_sb_has_compression(sbi))
> > > > > >   		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > >   				len ? ", " : "", "compression");
> > > > > > +	if (f2fs_sb_has_casefold(sbi) && f2fs_sb_has_encrypt(sbi))
> > > > > > +		len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > > +				len ? ", " : "", "encrypted_casefold");
> > > > > >   	len += scnprintf(buf + len, PAGE_SIZE - len, "%s%s",
> > > > > >   				len ? ", " : "", "pin_file");
> > > > > >   	len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
> > > > > > @@ -579,6 +582,7 @@ enum feat_id {
> > > > > >   	FEAT_CASEFOLD,
> > > > > >   	FEAT_COMPRESSION,
> > > > > >   	FEAT_TEST_DUMMY_ENCRYPTION_V2,
> > > > > > +	FEAT_ENCRYPTED_CASEFOLD,
> > > > > >   };
> > > > > 
> > > > > Actually looking at it more closely, this patch is wrong.
> > > > > 
> > > > > It only makes sense to declare "encrypted_casefold" as a feature of the
> > > > > filesystem implementation, i.e. /sys/fs/f2fs/features/encrypted_casefold.
> > > > > 
> > > > > It does *not* make sense to declare it as a feature of a particular filesystem
> > > > > instance, i.e. /sys/fs/f2fs/$disk/features, as it is already implied by the
> > > > > filesystem instance having both the encryption and casefold features enabled.
> > > > > 
> > > > > Can we add /sys/fs/f2fs/features/encrypted_casefold only?
> > > > 
> > > > wait.. /sys/fs/f2fs/features/encrypted_casefold is on by
> > > > CONFIG_FS_ENCRYPTION && CONFIG_UNICODE.
> > > > OTOH, /sys/fs/f2fs/$dis/feature_list/encrypted_casefold is on by
> > > > on-disk features: F2FS_FEATURE_ENCRYPT and F2FS_FEATURE_CASEFOLD.
> > > > 
> > > 
> > > Yes, but in the on-disk case, encrypted_casefold is redundant because it simply
> > > means encrypt && casefold.  There is no encrypted_casefold flag on-disk.
> > 
> > I prefer to keep encrypted_casefold likewise kernel feature, which is more
> > intuitive to users.
> 
> encrypted_casefold is a kernel feature support flag, not a disk one, IMO, it's
> not needed to add it in to per-disk feature list, it may mislead user that
> compatible encrypted casefold needs a extra disk layout support while disk has
> already encrypted and casefold feature enabled.

Yeah, I overlooked, and per Ted and Daniel's comments, I already removed it
locally, but couldn't post it yet. :P

> 
> Thanks,
> 
> > 
> > > 
> > > - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
