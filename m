Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D62B763A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 07:23:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAbKzIPuCB3NUb8fIB/98uMwx3XSd9wsfCrf0jZFl/A=; b=PuOuIBeabaTwyBKvCV7O20w+XY
	0wjoCLYbZqo7Ie8W3nXooc//zBpvYsjsslJDD/hEo5hQ8hvtjTlnN4114VMlGIFqd/p2tsPMDghFM
	aa6df8vUQBSA5jGodhFOCqza75VbE0Rlc0q4JuEWv1gSqzxu7NBJyWgMZfXfjXmr694Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfGrp-0005Sa-Ro; Wed, 18 Nov 2020 06:22:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1kfGro-0005SF-C3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=; b=MnWSmO0pzg/DbrXU4t5lxkzQ+V
 8Ftw0C3V+6dETrWmlnJfdb89WpR0xVSGcuHWNJcRcYpl/hJjZY2ZROck7EXxSaQYVrUp/jv5u7Dq1
 sHDqSiuisR6jmuQEcQbYqdqoswm6/2Zk600mBt3nVYZLSXMRzMNgpHmqbEnhRssxPy+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=; b=GM8xOjc+9L6uEk/7NpkoZV6yl9
 Ctm+PadnJ13ytv40J9MnMP8gOp8LTXVryc3nHylFRvfALJHKrfGoQZv+O5mjk0gwiY7XyULBYUaQV
 BNrliabacZyznCsza4jPaVJ0Ol9I5PmFr/I7sArXKSF+VWRqeI/BmHalO4u0feENwGXM=;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfGrk-00CSr9-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:22:56 +0000
Received: by mail-ot1-f65.google.com with SMTP id n11so734185ota.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 22:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=;
 b=s/0gcm/nu0ykiimxR8WdTqn9/oRW/XbyL4w3MNEAnCfzuYkMI3OFhwyBJe63/t0URk
 MF/eQSENFOP4uuanpMx/bVQmSBCMt9205j/XRDkg2inxeNJhKoi7iACS4a6LKhzYyyPq
 qa4dNN1q0jLGZrs5Lrn7jSqxzCJiOKKH3hQaT5DpJF7rkZje9PEQmxHX/SUM+QIQdrko
 eTsEfmyf6ZOcB2cirE8P2cFHN4xZybxLcNtsGeHE28KzS3mQ7JEffWMaUWI2FOczvsSz
 zEPr9p1knwW2aa2cMoNyVRYTr6BAKJgMrSjOb12HfcwQQj2g7+qML5P4PBXcJLFoIouH
 gSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=;
 b=of/Ftu3BvQNmrP+WyU9YhQ8GoRM9k4Jqw81ktNVgBByLl8MfXnn1AqckzDBBMr3Aaf
 9QQzcfuosQxJeZPoRNa3ZatCY/vd42TPWpsjUGzIGPhkDldKwuxMUz3v3gtxQ+YvgCeD
 mlU3KRFZTZn3GO792Jw0MivPYJkZ4xe+kYk7XN4ghWiyLWNoO8TzifrwkLyPUq7+7z8i
 YG/CKup3iift1opubZILyQ0ciCVAmoB5xi1px9g7Ysfo5uYaun/IIskrgq9pX2+QqGeE
 ryHFpNt+NB5kRXMNfIMThmmdQILFbe20BUZ8ZOtDZI3YsWuACwjzgM8WCi1CnVWYf4AS
 MyEw==
X-Gm-Message-State: AOAM531wuxRS1H6YXzWfIB17P+c6OJHo4PETzd4zNV7OaV/nHy2affvM
 p1l4WBFA0kuRTG04V/y5R3aqBJJjniOChiHlbry7kA==
X-Google-Smtp-Source: ABdhPJwWgllZCVW/lRnluvAChVjMF1TDf/msIQVY0NfyaYFdNqL1Ed/ZnJAgja+VBlqEUAJ7Jx61VEi4QbR1tg0v1Z0=
X-Received: by 2002:a9d:8ee:: with SMTP id 101mr5606894otf.93.1605680559385;
 Tue, 17 Nov 2020 22:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-4-drosen@google.com>
 <X7QbX9Q4xzhg+5UU@sol.localdomain>
In-Reply-To: <X7QbX9Q4xzhg+5UU@sol.localdomain>
Date: Tue, 17 Nov 2020 22:22:28 -0800
Message-ID: <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.65 listed in wl.mailspike.net]
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
X-Headers-End: 1kfGrk-00CSr9-Fx
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: Handle casefolding with
 Encryption
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 10:50 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
>
> What is the assignment to dentry_page supposed to be accomplishing?  It looks
> like it's meant to pass up errors from f2fs_find_target_dentry(), but it doesn't
> do that.

Woops. Fixed that for the next version.

>
> > @@ -222,14 +250,20 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
> >                * fall back to treating them as opaque byte sequences.
> >                */
> >               if (sb_has_strict_encoding(sb) || name->len != entry.len)
> > -                     return false;
> > -             return !memcmp(name->name, entry.name, name->len);
> > +                     res = 0;
> > +             else
> > +                     res = memcmp(name->name, entry.name, name->len) == 0;
> > +     } else {
> > +             /* utf8_strncasecmp_folded returns 0 on match */
> > +             res = (res == 0);
> >       }
>
> The following might be easier to understand:
>
>         /*
>          * In strict mode, ignore invalid names.  In non-strict mode, fall back
>          * to treating them as opaque byte sequences.
>          */
>         if (res < 0 && !sb_has_strict_encoding(sb)) {
>                 res = name->len == entry.len &&
>                       memcmp(name->name, entry.name, name->len) == 0;
>         } else {
>                 /* utf8_strncasecmp_folded returns 0 on match */
>                 res = (res == 0);
>         }
>
Thanks, that is a fair bit nicer.

> > @@ -273,10 +308,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> >                       continue;
> >               }
> >
> > -             if (de->hash_code == fname->hash &&
> > -                 f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > -                                 le16_to_cpu(de->name_len)))
> > -                     goto found;
> > +             if (de->hash_code == fname->hash) {
> > +                     res = f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > +                                 le16_to_cpu(de->name_len));
> > +                     if (res < 0)
> > +                             return ERR_PTR(res);
> > +                     else if (res)
> > +                             goto found;
> > +             }
>
> Overly long line here.  Also 'else if' is unnecessary, just use 'if'.
>
> - Eric
The 0 case is important, since that reflects that the name was not found.
-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
