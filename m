Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2E526072
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 12:59:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npT0p-0002mo-Uy; Fri, 13 May 2022 10:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ritesh.list@gmail.com>) id 1npT0n-0002mf-BN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 10:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=670hcE2fJNGTjVHjkhPxwd9sqgqL5UB9w/AupduhwRI=; b=eGU6UnK7U3bY/6qCB25mdCgFgj
 QLSGa3yTkLZzGD74xIduLyguJZvNQbOT7x7ndadJUEz3+uZZhg8H5KtPDLmyB3/zoJ2FaaXN3E5W/
 taQEKReARrZ0411u2FU9/ja3Q5WlNy08dlJTX8ucy8yWzNkKUrsVyTuk7sxAGH/n1C68=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=670hcE2fJNGTjVHjkhPxwd9sqgqL5UB9w/AupduhwRI=; b=WHqDidEjgdOhcAWrUAY0sviaJn
 EhjedF5Y4eAEF+O1vBjI2M/uo3ZqQ2wSqnSuGmP127MNA9XBHQExRgRvz2hpNmbRJvg6rtQIsC/wi
 G67l/NFgzJ2b13VxWRZZjyCMFmjpIiLWSGU+d+On4SXI0SkFPDNQx1ry0aJ0DrzmmwuA=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npT0i-0002g4-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 10:59:08 +0000
Received: by mail-pl1-f175.google.com with SMTP id c11so7562666plg.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 May 2022 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=670hcE2fJNGTjVHjkhPxwd9sqgqL5UB9w/AupduhwRI=;
 b=ftN0kv6VoGPs94xZoXK6CrFIdgCyMxHHdDYC/VGuagRTWfNjV11qMM5iZrCMOCZbaP
 ibeOa/R/5pFi3HsOJFBUNTlW00Vv9pZ8mRm1mjj7ooZeXNWskJ2IeCtzqChhxeHfjBAK
 b0akZLATKZfkGhqzS0cs/S9EzD+Do375mFcbmBUJaaeGH2OwAggEDz6noqkkhevjtR34
 j5x2mb4uAzebXeKlaxid2uh0lz560tM3tgDkzLB5ATjVTuu4NX4uYZOYrLdM7g2ZLmAM
 YuGjHEfFuWFCk2RWshLi5IQVizgqgKuyJpWZOdQ8Chx2uD9HOumt0onlIdb5AtIrw6SA
 7/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=670hcE2fJNGTjVHjkhPxwd9sqgqL5UB9w/AupduhwRI=;
 b=Wbrjc017lO73ZsioRGjpMucQJCmgJx3XaSPcJKv7HzwbQrGk10sbMW3r3VcDPPlN3A
 SW2vIdbBEWP86AFGsyqxcOPmE4X2MfBotn7i50JZhg8UsdOTzizdermLDDlvc6kb1ukL
 +8eweglHavJgWQ33LTjkV0cA2LVBv2dOi00+SkhlqJzRFEycLflbiZX2B5ENGvePI70f
 Lsf2Om1DF+jlaXfN3bMe3WMLYKoiIFpiz416Z/juVvkKTDZwdga8s11/hS/9ygwvmJwG
 S94Te5doUpZ60joW39AarshqAjzMbrxWe0xh/0Pl/cym7Kvvaa1asAiMeBD5a1JXEFCG
 3jZg==
X-Gm-Message-State: AOAM533oRlOnnXMrjcxbPQB/YIlGDCykkG45JM34/V7LjTkezLRZELog
 gMC3gMkuaeVCQIL+M5vMbBU=
X-Google-Smtp-Source: ABdhPJwKTYkxXDl1r01LTMdFkfTSkql8+KXT3A0OBgS/YZRo35yOTeWGHL33ZRmPYEsuLvh70ySkPw==
X-Received: by 2002:a17:90b:3a86:b0:1dc:2343:2429 with SMTP id
 om6-20020a17090b3a8600b001dc23432429mr4340346pjb.206.1652439539190; 
 Fri, 13 May 2022 03:58:59 -0700 (PDT)
Received: from localhost ([2406:7400:63:532d:c4bb:97f7:b03d:2c53])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a63f846000000b003c14af5060asm1377045pgj.34.2022.05.13.03.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 03:58:58 -0700 (PDT)
Date: Fri, 13 May 2022 16:28:53 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220513105853.v7iw2mbi3ycg2rqg@riteshh-domain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
 <Ynmma+tkA2myRvz6@sol.localdomain>
 <20220511175433.inua5nj6l7qtlywq@riteshh-domain>
 <Ynv6dRdf3vZH7v2W@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ynv6dRdf3vZH7v2W@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 22/05/11 06:03PM, Eric Biggers wrote: > On Wed, May 11,
 2022 at 11:24:33PM +0530, Ritesh Harjani wrote: > > On 22/05/09 04:40PM,
 Eric Biggers wrote: > > > A couple corrections I'll include in the n [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ritesh.list[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1npT0i-0002g4-Rz
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

On 22/05/11 06:03PM, Eric Biggers wrote:
> On Wed, May 11, 2022 at 11:24:33PM +0530, Ritesh Harjani wrote:
> > On 22/05/09 04:40PM, Eric Biggers wrote:
> > > A couple corrections I'll include in the next version:
> >
> > Need few clarifications. Could you please help explain what am I missing here?
> >
> > >
> > > On Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote:
> > > > +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> > > > +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> > > > +						 &ctx->dummy_enc_policy))
> > > > +			return 0;
> > > >  		ext4_msg(NULL, KERN_WARNING,
> > > > -			 "Can't set test_dummy_encryption on remount");
> > > > +			 "Can't set or change test_dummy_encryption on remount");
> > > >  		return -EINVAL;
> > > >  	}
> > >
> > > I think this needs to be 'fc->purpose == FS_CONTEXT_FOR_RECONFIGURE ||
> > > fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)', since ext4 can parse
> > > mount options from both s_mount_opts and the regular mount options.
> >
> > Sorry, I am missing something here. Could you please help me understand why
> > do we need the other OR case which you mentioned above i.e.
> > "|| fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)"
> >
> > So maybe to put it this way, when will it be the case where
> > fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy) is true and it is not a
> > FS_CONTEXT_FOR_RECONFIGURE case?
>
> The case where test_dummy_encryption is present in both the mount options stored
> in the superblock and in the regular mount options.  See how __ext4_fill_super()
> parses and applies each source of options separately.

Ok, thanks for clarifying. So this says that
1. in case of mount; if test_dummy_encryption is already set with some policy in
   the disk superblock and if the user is trying to change the mount option in
   options string, then that is not allowed.
2. Similarly if while remounting we try to change the mount option from the
   previous mount option, then again this is not allowed.


>
> > Also just in case if I did miss something that also means the comment after this
> > case will not be valid anymore?
> > i.e.
> > 		/*
> >          * fscrypt_add_test_dummy_key() technically changes the super_block, so
> >          * it technically should be delayed until ext4_apply_options() like the
> >          * other changes.  But since we never get here for remounts (see above),
> >          * and this is the last chance to report errors, we do it here.
> >          */
> >         err = fscrypt_add_test_dummy_key(sb, &ctx->dummy_enc_policy);
> >         if (err)
> >                 ext4_msg(NULL, KERN_WARNING,
> >                          "Error adding test dummy encryption key [%d]", err);
> >         return err;
>
> That comment will still be correct.
>
> >
> > >
> > > > +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> > > > +                                            struct super_block *sb)
> > > > +{
> > > > +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> > > > +		return;
> > >
> > > To handle remounts correctly, this needs to be
> > > '!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
> > > fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy)'.
> >
> > Why?
> > Isn't it true that in remount we should update EXT4_SB(sb)->s_dummy_enc_policy
> > only when ctx->dummy_enc_policy is set. If EXT4_SB(sb)->s_dummy_enc_policy is
> > already set and ctx->dummy_enc_policy is not set, that means it's a remount case with no mount
> > opts in which case ext4 should continue to have the same value of EXT4_SB(sb)->s_dummy_enc_policy?
>
> struct fscrypt_dummy_policy includes dynamically allocated memory, so
> overwriting it without first freeing it would be a memory leak.

Ok yes. Since this is dynamic memory allocation. Hence
I see that ext4_apply_test_dummy_encryption() can be called from
parse_apply_sb_mount_options(), __ext4_fill_super() and __ext4_remount().

Case 1: when this mount option is set in superblock
1. So in parse_apply_sb_mount_options(), this mount option will get set the
   first time if it is also set in superblock field.

2. So if we also have a same mount option set in regular mount,
   or during remount both will have sbi->s_dummy_enc_policy already set (from
   step 1 above), so we should do nothing here.

Case 2: when this mount option is passed as regular mount
1. parse_apply_sb_mount_options() won't set this.
2. __ext4_fill_super() will set this mount option in sbi and hence __ext4_remount
   should not set this again.

And as I see you are cleverly setting memset &ctx->dummy_enc_policy to 0
in case where we applied the parsed mount option to sbi. So that the actual
policy doesn't get free when you call __ext4_fc_free() after ext4_apply_options()
in parse_apply_sb_mount_options(). And in other cases where this mount option was
not applied to sbi mount opt, in that case we anyway want this policy to get
free.

This somehow looks very confusing to me. But I guess with parse, check and apply
mount APIs and with mount options in superblock, regular and remount path, this
couldn't be avoided (although I am no expert in this area).

Thanks for explaining. I hope I got this right ;)

-ritesh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
