Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82068523C34
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 20:03:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noqgf-0004Or-9b; Wed, 11 May 2022 18:03:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1noqgd-0004Ok-DX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 18:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MVSjvSpeI6WFOCbyOpC8jb/RGS6p4c+YeD1z8/egVsw=; b=aWZajzRoucWyhYej5TfNRot9Ew
 rbe+1R941MRG6oVn8fDDbXJNK6/iXd1UspjS5A+IWwGjnivmBuWrsoX5nB5tr+2CNmtWE8ukaUHZs
 iSBlli076/Nd6iPW1BDZiNkQpC07AkhIFP5j6903O/C6AgL05TZsVvbJuPjnFedJhHbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MVSjvSpeI6WFOCbyOpC8jb/RGS6p4c+YeD1z8/egVsw=; b=Nf1ETOvI/RYi5kR1pTWeKRizxE
 TvgFZ2L1zsZYv6jGmD6/s7T7rI7jHQ1WB3qFL9/gOWw5jZD0XNkht3JzS2EJo8Tn3oYTHOTgE1OCJ
 cH2EzW4teX6VoIYOO5ChYn6OeIzAYjyzvMrN7jwhrGzZwHbExFvDJvsU5uE35/+JwbZQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noqga-0003dS-1n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 18:03:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 573C661CD6;
 Wed, 11 May 2022 18:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92029C34113;
 Wed, 11 May 2022 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652292214;
 bh=2U0jTmIfaPDRASsGiVi/9tx1zQUG8XISqj4Eqy8cSfA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQSphQiQ7SqP2mcfeck+Gm2sNcIvv7mu4RwTZOQMar7+BSJRbc0dZ6wqNxQGmiNSL
 TCChQBZm7XZidPrNYwH6poMS1CI/RzANnTic9ViQlOStMLBbzafZAdU/jYYSz1zlFG
 k6ESFISDuR/M4x23DoweT5vTaXVs8rWVo1ze5rjEwxImjlwexEGNkptituO75bzh1s
 /QJFy93be2dIyeOVuM4cT8H/AW9bvBMoIH2HqgNPgfN7qL0QIXrkDoTxJDw+t9HW09
 5trxJ4QrXLj6cfDga2B6YlhMf5tnIKeJdUgtbZ3wnb94iP754fB3fS6aSmUGyBKsLO
 bhd+FJk3Fxesg==
Date: Wed, 11 May 2022 18:03:33 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Message-ID: <Ynv6dRdf3vZH7v2W@gmail.com>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
 <Ynmma+tkA2myRvz6@sol.localdomain>
 <20220511175433.inua5nj6l7qtlywq@riteshh-domain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511175433.inua5nj6l7qtlywq@riteshh-domain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 11:24:33PM +0530,
 Ritesh Harjani wrote:
 > On 22/05/09 04:40PM, Eric Biggers wrote: > > A couple corrections I'll
 include in the next version: > > Need few clarifications. Could [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noqga-0003dS-1n
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

On Wed, May 11, 2022 at 11:24:33PM +0530, Ritesh Harjani wrote:
> On 22/05/09 04:40PM, Eric Biggers wrote:
> > A couple corrections I'll include in the next version:
> 
> Need few clarifications. Could you please help explain what am I missing here?
> 
> >
> > On Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote:
> > > +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> > > +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> > > +						 &ctx->dummy_enc_policy))
> > > +			return 0;
> > >  		ext4_msg(NULL, KERN_WARNING,
> > > -			 "Can't set test_dummy_encryption on remount");
> > > +			 "Can't set or change test_dummy_encryption on remount");
> > >  		return -EINVAL;
> > >  	}
> >
> > I think this needs to be 'fc->purpose == FS_CONTEXT_FOR_RECONFIGURE ||
> > fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)', since ext4 can parse
> > mount options from both s_mount_opts and the regular mount options.
> 
> Sorry, I am missing something here. Could you please help me understand why
> do we need the other OR case which you mentioned above i.e.
> "|| fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)"
> 
> So maybe to put it this way, when will it be the case where
> fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy) is true and it is not a
> FS_CONTEXT_FOR_RECONFIGURE case?

The case where test_dummy_encryption is present in both the mount options stored
in the superblock and in the regular mount options.  See how __ext4_fill_super()
parses and applies each source of options separately.

> Also just in case if I did miss something that also means the comment after this
> case will not be valid anymore?
> i.e.
> 		/*
>          * fscrypt_add_test_dummy_key() technically changes the super_block, so
>          * it technically should be delayed until ext4_apply_options() like the
>          * other changes.  But since we never get here for remounts (see above),
>          * and this is the last chance to report errors, we do it here.
>          */
>         err = fscrypt_add_test_dummy_key(sb, &ctx->dummy_enc_policy);
>         if (err)
>                 ext4_msg(NULL, KERN_WARNING,
>                          "Error adding test dummy encryption key [%d]", err);
>         return err;

That comment will still be correct.

> 
> >
> > > +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> > > +                                            struct super_block *sb)
> > > +{
> > > +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> > > +		return;
> >
> > To handle remounts correctly, this needs to be
> > '!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
> > fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy)'.
> 
> Why?
> Isn't it true that in remount we should update EXT4_SB(sb)->s_dummy_enc_policy
> only when ctx->dummy_enc_policy is set. If EXT4_SB(sb)->s_dummy_enc_policy is
> already set and ctx->dummy_enc_policy is not set, that means it's a remount case with no mount
> opts in which case ext4 should continue to have the same value of EXT4_SB(sb)->s_dummy_enc_policy?

struct fscrypt_dummy_policy includes dynamically allocated memory, so
overwriting it without first freeing it would be a memory leak.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
