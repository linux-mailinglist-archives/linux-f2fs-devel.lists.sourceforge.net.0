Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB4523C02
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 19:54:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noqXv-0005rs-8T; Wed, 11 May 2022 17:54:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ritesh.list@gmail.com>) id 1noqXu-0005rm-5O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 17:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J+H2eREGCzjVdGRqmS4JDyzDPJtfmSBWsZPvnxjv1yA=; b=BSUPSSeYBrBCKMAeFwl1jk+X6+
 dmkf+YNe/A64sySQM10kIGIbk7ih/RNBT0PdCGrrUKoqc7pgWPNB9zVbQsU2grZDmF3WCugy3ofQk
 iavQRYSCNmppIDZ/FzXjF92DWW7kFUB4wrP1gxBVjNLe1DiJOsdem6Jr7LmNV0tK5dNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+H2eREGCzjVdGRqmS4JDyzDPJtfmSBWsZPvnxjv1yA=; b=JWVL0QcZbvzC//fLn/edU16Rah
 EyMW/9mnlT4MrrssFCV/QPSd4MuPI4cDfWAhyDzrhHM6z0CmmInNtvoYxYyJIfJhe2NGS4HNW3Q/A
 kEs6Bby01d2MC4Euono+KQoDW3zUjGpAp/PiMgqeSPtkzOr9ta8VK47Q6NE+O/+Go/+c=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1noqXs-0003FB-Hl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 17:54:46 +0000
Received: by mail-pf1-f171.google.com with SMTP id p12so2670316pfn.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J+H2eREGCzjVdGRqmS4JDyzDPJtfmSBWsZPvnxjv1yA=;
 b=S0K6rWZb7mLzND2OpG/CC1vNDwR8YX+Ah+Ft+6ZO1tNEJhPOY6o/DOrg5srbSP3Vhh
 5fg8sQNM3+Ku+gWvtSOQFLgPTf+iuXpfGeY3t/C4fG6d2ThfkOd/RTq42jS3fEMOQ+VK
 Vg9s6LMxW2NFwMu5J0g9lKuGNhP+I+m0ZIZV6DnVFH6/4WdnVgup8yLxMFdxbQ9+F/nz
 PjiynERLyp6CNCGzbK3wSjwqCAEgZfoD6hfIu/7GYw1O7On2ay7njeYK0H4xctLWORmR
 qBIskGqpvSYvp9S9ur+QW7lErELqeUwuXJnfJFVwNdwERxiWfVWXz07VRFJAsRTG7zNx
 eCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J+H2eREGCzjVdGRqmS4JDyzDPJtfmSBWsZPvnxjv1yA=;
 b=l/i68x1RdBXkWCXh40Oz1ivden8QOr/OuVw7b+9jmVHi5E3kjMjEt/u5kQCg5w2Pp9
 sT1o8yEcEfCelucCX0dlKIcuGTSqMDIqeuJpKHchupPsxVqsn5MfjZbS/CvEahNI8q2l
 tXCSDHf/qwPEn/2mqawk2ed12kiLhX6ZGs1Xpe7/7ZhGGqFqeQQNh7WXQT/W5m8C1a0Z
 rGojqtgxnQ0v0TTgslsr6PJuz2S26v8eXZLbTi9rq6hAuVh3nDxjfgKbm1BQK9ruUVpp
 SdEw1K83ydbOb3LKnEZogPlYhufdD/OB3yTO6Gdri6pecWPw7kxfr2IHhmERm2qI4BJo
 Za9Q==
X-Gm-Message-State: AOAM533miXWIX/akXyX78xb60xAP7/6bWN9tXdcYTAQ71LbWLQBNWV2Z
 xq8yrQjP3C9849sRscDox7Q=
X-Google-Smtp-Source: ABdhPJxvTf7YfIyNEzGmZv/p1CMMuoWqTVhS2Szz6fyjTb/de3Oxd3yWrBoy/3+eAgFG3Hq18uptpw==
X-Received: by 2002:a63:4549:0:b0:3db:5130:d269 with SMTP id
 u9-20020a634549000000b003db5130d269mr1087854pgk.101.1652291678910; 
 Wed, 11 May 2022 10:54:38 -0700 (PDT)
Received: from localhost ([2406:7400:63:532d:c4bb:97f7:b03d:2c53])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090331cb00b0015e8d4eb1dfsm2146273ple.41.2022.05.11.10.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 10:54:38 -0700 (PDT)
Date: Wed, 11 May 2022 23:24:33 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220511175433.inua5nj6l7qtlywq@riteshh-domain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
 <Ynmma+tkA2myRvz6@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ynmma+tkA2myRvz6@sol.localdomain>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 22/05/09 04:40PM,
 Eric Biggers wrote: > A couple corrections
 I'll include in the next version: Need few clarifications. Could you please
 help explain what am I missing here? > > On Sat, Apr 30, 2022 at 10:08:55PM
 -0700, Eric Biggers wrote: > > + if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE)
 { > > + if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy, > > +
 &ctx->du [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ritesh.list[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1noqXs-0003FB-Hl
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

On 22/05/09 04:40PM, Eric Biggers wrote:
> A couple corrections I'll include in the next version:

Need few clarifications. Could you please help explain what am I missing here?

>
> On Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote:
> > +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> > +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> > +						 &ctx->dummy_enc_policy))
> > +			return 0;
> >  		ext4_msg(NULL, KERN_WARNING,
> > -			 "Can't set test_dummy_encryption on remount");
> > +			 "Can't set or change test_dummy_encryption on remount");
> >  		return -EINVAL;
> >  	}
>
> I think this needs to be 'fc->purpose == FS_CONTEXT_FOR_RECONFIGURE ||
> fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)', since ext4 can parse
> mount options from both s_mount_opts and the regular mount options.

Sorry, I am missing something here. Could you please help me understand why
do we need the other OR case which you mentioned above i.e.
"|| fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)"

So maybe to put it this way, when will it be the case where
fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy) is true and it is not a
FS_CONTEXT_FOR_RECONFIGURE case?

Also just in case if I did miss something that also means the comment after this
case will not be valid anymore?
i.e.
		/*
         * fscrypt_add_test_dummy_key() technically changes the super_block, so
         * it technically should be delayed until ext4_apply_options() like the
         * other changes.  But since we never get here for remounts (see above),
         * and this is the last chance to report errors, we do it here.
         */
        err = fscrypt_add_test_dummy_key(sb, &ctx->dummy_enc_policy);
        if (err)
                ext4_msg(NULL, KERN_WARNING,
                         "Error adding test dummy encryption key [%d]", err);
        return err;

>
> > +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> > +                                            struct super_block *sb)
> > +{
> > +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> > +		return;
>
> To handle remounts correctly, this needs to be
> '!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
> fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy)'.

Why?
Isn't it true that in remount we should update EXT4_SB(sb)->s_dummy_enc_policy
only when ctx->dummy_enc_policy is set. If EXT4_SB(sb)->s_dummy_enc_policy is
already set and ctx->dummy_enc_policy is not set, that means it's a remount case with no mount
opts in which case ext4 should continue to have the same value of EXT4_SB(sb)->s_dummy_enc_policy?

Did I miss any case here?


-ritesh

>
> - Eric
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
