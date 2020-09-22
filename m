Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C40273AD0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 08:24:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvDkjicZM5Q5Icrj644gMdN5zccCl78j7BVOsf/RvxE=; b=JXPki9EZwW813EAxxQh2DIK6eA
	pl8bkTZBwmrb0RVZ5NRCUOUGshZLT5eKXyv/3fWT2SG4G5fvLw7U+oaqf+cloKdYBKt1viuOchLkO
	Nl2LDR1nD7jJJP2Z6Qg3gvdvFQ2QzXlyRNLB6adO4+0ZYo1CNK9tHN1qIiIP0PNRvgdw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKbj4-0005SC-57; Tue, 22 Sep 2020 06:24:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1kKbj2-0005S4-8D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 06:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=THG6vXPDgMK2k7M4yyjWTbzR9oGicsRPw9gT2Zgg6Sk=; b=YrZ4kBetSXVdaNC/kYv7GvBal7
 FglOVsawEssseiCVOYBx/Itz9EBX2dJwCIC/T86ZBT/43Vv2A8Ye9obviMLGzwlCyuYoqtbdyOdXI
 6odFp40192+K3FT38pLotqNi85qXrVQ0NBJ2PaGfvWrg7fYs9UgdzrE+ogg8IsD2ePmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=THG6vXPDgMK2k7M4yyjWTbzR9oGicsRPw9gT2Zgg6Sk=; b=eZprpcBKYClYooP3YaZkWoPKn9
 ZQOqDloOlgB8CpH+XlE5gCJbDzmTQW5vssUzeeLnFSixrKc/65pRnjligORxbGCJ8AId3pgzG31W2
 CuWD3pt6LyqOM6nvbt6vuZAcmr9o84ZR4jd3h6gLszOwHRG+4+ZphAfBR7pVJ5r4I6EQ=;
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKbiw-002q5b-Re
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Sep 2020 06:24:28 +0000
Received: by mail-ot1-f68.google.com with SMTP id y5so14628690otg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Sep 2020 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THG6vXPDgMK2k7M4yyjWTbzR9oGicsRPw9gT2Zgg6Sk=;
 b=Qd4Tdn1whmgSMaYeHJVAjI8lu/OUqAsaY6nMEildJ5Wcz+HOxT7jXMUD03tm9yR8G/
 vDzyb+d1lGxQNLYIXQnFVhKqaG73yC0TaoNUjzC++ozwpShucs6pqMzhnsZxjr1Nzb4h
 K1wCeilU3Fa+351ZL8SHv8tnUER/5ayy20tGJ+Jy3mcBP4iSlxPb6pgoN1jPd4Q3Eeam
 ayKBIA93D2dJaa8PMAJ4fCf08YI7Tow7I09AS1hKl6PGi/YEqKRGKJf0D0x+YgzKHRdo
 /qbO9M29ylVanv5qWiyLs/g4pHmvhvUZPxJXOAOkBlwa6w0235QHuMaIfR4oJF8EDJME
 vaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THG6vXPDgMK2k7M4yyjWTbzR9oGicsRPw9gT2Zgg6Sk=;
 b=lMzwiJFmRitnghtFhUIH+xiXPujoA1mIRmZCYiEg94+oL4MQnJaYtdvK8OwQTqcZOu
 6La3ahCaZtVvayk+gyrh1FoDjXkmty9TOGtRVxZoqjRavvX9X4XCRgzRKuYUEFE0Og5l
 DrkOmbrBuzjPh0JyIYtTopZlllZ5axg9rUa6U2YBZ1BvG+JHfoR21z6NFI9zcINBXnOG
 iTuVLQr2993M3jiWh5u5B1u8BmsDSXICWD0pO0X1IcKf2Kw4c+xZAKX3l8tZfTdlTeO8
 qp5LpcdamlTSgsiPeCp4BH4b/QhO/Ip+Mv5Gb0AzwDLGwIVkuNttWYXnLFavi3T2AJdQ
 +xIw==
X-Gm-Message-State: AOAM531khiqp47SGnLxOgbZKZfqWLt/RcKvZ87zgPdgnFwWxFUJqisYs
 MnizPQ3qhg6PAioaXWKoV1HtV9f8UmIxTtBUkHJ1nBhke7f3GkjP
X-Google-Smtp-Source: ABdhPJwiYGOeLvLhGoogpy5gPNwnvC+JJiMwI4f1hoq32kpb9NOx05Ev2dELtbD9Mb/3dVl5K4CX6bx+/hBa8I6MKSY=
X-Received: by 2002:a4a:5258:: with SMTP id d85mr1950472oob.72.1600755507994; 
 Mon, 21 Sep 2020 23:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200708091237.3922153-1-drosen@google.com>
 <20200708091237.3922153-5-drosen@google.com>
 <87lfh4djdq.fsf@collabora.com> <20200921182948.GA885472@gmail.com>
In-Reply-To: <20200921182948.GA885472@gmail.com>
Date: Mon, 21 Sep 2020 23:18:17 -0700
Message-ID: <CA+PiJmQU-bupmSTHbW2MPzDxfO+3f2bu+7aKzBL1VF2D8mvqZQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kKbiw-002q5b-Re
Subject: Re: [f2fs-dev] [PATCH v12 4/4] ext4: Use generic casefolding support
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Theodore Ts'o <tytso@mit.edu>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 21, 2020 at 11:29 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Sep 20, 2020 at 09:10:57PM -0400, Gabriel Krisman Bertazi wrote:
> > Daniel Rosenberg <drosen@google.com> writes:
> >
> > > This switches ext4 over to the generic support provided in
> > > the previous patch.
> > >
> > > Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> > > the maintenance burden by unifying them, and any optimizations will
> > > immediately apply to both.
> > >
> > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > Reviewed-by: Eric Biggers <ebiggers@google.com>
> > >
> > >  #ifdef CONFIG_UNICODE
> > > -   if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
> > > +   if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
> > >             if (fname->cf_name.name) {
> > >                     struct qstr cf = {.name = fname->cf_name.name,
> > >                                       .len = fname->cf_name.len};
> > > @@ -2171,9 +2171,6 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
> > >     struct buffer_head *bh = NULL;
> > >     struct ext4_dir_entry_2 *de;
> > >     struct super_block *sb;
> > > -#ifdef CONFIG_UNICODE
> > > -   struct ext4_sb_info *sbi;
> > > -#endif
> > >     struct ext4_filename fname;
> > >     int     retval;
> > >     int     dx_fallback=0;
> > > @@ -2190,9 +2187,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
> > >             return -EINVAL;
> > >
> > >  #ifdef CONFIG_UNICODE
> > > -   sbi = EXT4_SB(sb);
> > > -   if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
> > > -       sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
> > > +   if (sb_has_strict_encoding(sb) && IS_CASEFOLDED(dir) &&
> > > +       sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
> > >             return -EINVAL;
> >
> > hm, just noticed the sb->s_encoding check here is superfluous, since the
> > has_strict_mode() cannot be true if !s_encoding.  Not related to this
> > patch though.
> >
> > Daniel, are you still working on getting this upstream?  The fscrypt
> > support would be very useful for us. :)
> >
> > In the hope this will get upstream, as its been flying for a while and
> > looks correct.
> >
> > Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> We couldn't get a response from Ted, so instead Jaegeuk has applied patches 1-3
> to f2fs/dev for 5.10.  Hopefully Ted will take the ext4 patch for 5.11.
>
> I believe that Daniel is planning to resend the actual encryption+casefolding
> support soon, but initially only for f2fs since that will be ready first.
>
> - Eric

Yes, planning to send them shortly. Just checking that I've not missed
anything. For the sb_has_strict_encoding, I don't think that's
actually checking s_encoding, though it does check s_encoding_flags.
I'm planning to resend this one with that set, since it's not queued
in the f2fs tree.

-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
