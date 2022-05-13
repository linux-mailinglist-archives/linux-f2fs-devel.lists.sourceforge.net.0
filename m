Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08546526CE9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 00:25:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npdih-0006dJ-Hi; Fri, 13 May 2022 22:25:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npdig-0006dD-6X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 22:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/JeOvad8YyJ+qPQC28JKnNdC32tsDQZgCGATg6Uw674=; b=d/xNdi1O5pPWdpi6q/ODBztNZP
 nPFBpaSoSX1XsCFF8qH1p/q+ENo/cJofNrEtFDj8BT4Rv7RPS2/2VNqfz+HciW6tWug1/o9QOPrwc
 EFyMVbF678lLHSVa0ASOWdQTRQxeOpZMJghpm/gOq163U8WA8Fcx8ujYW0aVvASf9CHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/JeOvad8YyJ+qPQC28JKnNdC32tsDQZgCGATg6Uw674=; b=mrrR6UdHPoKFZoyz0GZZMbHL8u
 k363h6b5lqBBmVmJ+E+WvNTm2f9BN5Bcb7IcbAvwiS8DOmbEADZ1Z/uBxv01lYhcrE/euVbHSfc7w
 p1AqkQhGZhEDNzSutxl6s1njRn8+Dycus2HVo/3U8KWUlyGVGprT91xMjNjubuVtWXso=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npdid-00BLv9-AJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 22:25:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF26460BDB;
 Fri, 13 May 2022 22:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E611C34100;
 Fri, 13 May 2022 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652480701;
 bh=46ZzQ9/zVtNlgN+LdM8tnWys31361tuY+hidkQ0ImP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RpBhmK2/TGlaJdEdw3TWS5xktiUrwki+rbQQ32EqLFipxVl2+95NoNoz0G4TUi1Uh
 hc6ew21GRzxAL1iDmyQqoLm/yhap52l6fcXezJJqUt6+InjhQZa4exTuTK/qPpWFsD
 9+A2snKtp0lAFDIGyeYcXeeyZmY9wDvzdWxCMWsofO2WwjKA2jXiHruCuoa9Bwx5dm
 K5xVoHFogQOZHEcyliQ3QIBvHxkbeyCP4iOi+mwOxgGKGDrZSRM676Uk+hFhpbH1mD
 oi50rwjuREDAD3C+HphLzfcP5UI5+fAgsWnVKNBSKAE9A2IER7R53Xfup31xincwy3
 Jkv12aSmqrPyQ==
Date: Fri, 13 May 2022 15:24:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Message-ID: <Yn7au5Pckn5T0iTm@sol.localdomain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
 <Ynmma+tkA2myRvz6@sol.localdomain>
 <20220511175433.inua5nj6l7qtlywq@riteshh-domain>
 <Ynv6dRdf3vZH7v2W@gmail.com>
 <20220513105853.v7iw2mbi3ycg2rqg@riteshh-domain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513105853.v7iw2mbi3ycg2rqg@riteshh-domain>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13, 2022 at 04:28:53PM +0530,
 Ritesh Harjani wrote:
 > On 22/05/11 06:03PM, Eric Biggers wrote: > > On Wed, May 11,
 2022 at 11:24:33PM
 +0530, Ritesh Harjani wrote: > > > On 22/05/09 04:40PM [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npdid-00BLv9-AJ
Subject: Re: [f2fs-dev] [PATCH v2 5/7] ext4: fix up test_dummy_encryption
 handling for new mount API
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Lukas Czerner <lczerner@redhat.com>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 04:28:53PM +0530, Ritesh Harjani wrote:
> On 22/05/11 06:03PM, Eric Biggers wrote:
> > On Wed, May 11, 2022 at 11:24:33PM +0530, Ritesh Harjani wrote:
> > > On 22/05/09 04:40PM, Eric Biggers wrote:
> > > > A couple corrections I'll include in the next version:
> > >
> > > Need few clarifications. Could you please help explain what am I missing here?
> > >
> > > >
> > > > On Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote:
> > > > > +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> > > > > +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> > > > > +						 &ctx->dummy_enc_policy))
> > > > > +			return 0;
> > > > >  		ext4_msg(NULL, KERN_WARNING,
> > > > > -			 "Can't set test_dummy_encryption on remount");
> > > > > +			 "Can't set or change test_dummy_encryption on remount");
> > > > >  		return -EINVAL;
> > > > >  	}
> > > >
> > > > I think this needs to be 'fc->purpose == FS_CONTEXT_FOR_RECONFIGURE ||
> > > > fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)', since ext4 can parse
> > > > mount options from both s_mount_opts and the regular mount options.
> > >
> > > Sorry, I am missing something here. Could you please help me understand why
> > > do we need the other OR case which you mentioned above i.e.
> > > "|| fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)"
> > >
> > > So maybe to put it this way, when will it be the case where
> > > fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy) is true and it is not a
> > > FS_CONTEXT_FOR_RECONFIGURE case?
> >
> > The case where test_dummy_encryption is present in both the mount options stored
> > in the superblock and in the regular mount options.  See how __ext4_fill_super()
> > parses and applies each source of options separately.
> 
> Ok, thanks for clarifying. So this says that
> 1. in case of mount; if test_dummy_encryption is already set with some policy in
>    the disk superblock and if the user is trying to change the mount option in
>    options string, then that is not allowed.
> 2. Similarly if while remounting we try to change the mount option from the
>    previous mount option, then again this is not allowed.
> 

Yes.  I assume that the expected behavior of the on-disk mount options is the
same as if they were prepended to the user-specified mount options.  So we
simply aren't allowing conflicting test_dummy_encryption options in the mount
options, regardless of where the mount options came from.

> > > > > +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> > > > > +                                            struct super_block *sb)
> > > > > +{
> > > > > +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> > > > > +		return;
> > > >
> > > > To handle remounts correctly, this needs to be
> > > > '!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
> > > > fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy)'.
> > >
> > > Why?
> > > Isn't it true that in remount we should update EXT4_SB(sb)->s_dummy_enc_policy
> > > only when ctx->dummy_enc_policy is set. If EXT4_SB(sb)->s_dummy_enc_policy is
> > > already set and ctx->dummy_enc_policy is not set, that means it's a remount case with no mount
> > > opts in which case ext4 should continue to have the same value of EXT4_SB(sb)->s_dummy_enc_policy?
> >
> > struct fscrypt_dummy_policy includes dynamically allocated memory, so
> > overwriting it without first freeing it would be a memory leak.
> 
> Ok yes. Since this is dynamic memory allocation. Hence
> I see that ext4_apply_test_dummy_encryption() can be called from
> parse_apply_sb_mount_options(), __ext4_fill_super() and __ext4_remount().
> 
> Case 1: when this mount option is set in superblock
> 1. So in parse_apply_sb_mount_options(), this mount option will get set the
>    first time if it is also set in superblock field.
> 
> 2. So if we also have a same mount option set in regular mount,
>    or during remount both will have sbi->s_dummy_enc_policy already set (from
>    step 1 above), so we should do nothing here.
> 
> Case 2: when this mount option is passed as regular mount
> 1. parse_apply_sb_mount_options() won't set this.
> 2. __ext4_fill_super() will set this mount option in sbi and hence __ext4_remount
>    should not set this again.
> 
> And as I see you are cleverly setting memset &ctx->dummy_enc_policy to 0
> in case where we applied the parsed mount option to sbi. So that the actual
> policy doesn't get free when you call __ext4_fc_free() after ext4_apply_options()
> in parse_apply_sb_mount_options(). And in other cases where this mount option was
> not applied to sbi mount opt, in that case we anyway want this policy to get
> free.
> 
> This somehow looks very confusing to me. But I guess with parse, check and apply
> mount APIs and with mount options in superblock, regular and remount path, this
> couldn't be avoided (although I am no expert in this area).
> 
> Thanks for explaining. I hope I got this right ;)

That's all correct.  I think you're overthinking it a bit.  The important thing
is that if the dummy policy is being set, we must move it into the ext4_sb_info.
Zeroing the old location is just part of transferring ownership of memory in C.
If a dummy policy was already set, we don't support changing it, and we've
checked that any "new" value is consistent with it, so we don't do anything.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
