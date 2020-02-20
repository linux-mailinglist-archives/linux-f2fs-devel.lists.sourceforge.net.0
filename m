Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4659D16550C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Feb 2020 03:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BlbRUTcPjwurCCbsNRMkgK3m4AKlNqdntHJl5zWoBY=; b=A6PQkrO5dNnhsMw/Kw/5lgNwDt
	qlqLZpxRAKFImowIFgwhfaGqmmoZJ/Ma3X6CBID5kTXUygPF8Tee1huD1nYvIQC4Am3pJjJ/HkzJF
	hi3r6iRUeVpY9xww9wpiYdNS/TjBYcKuOiy0LVSRu7Xws0ciFcN2nKJyXGYnaZqRvvUM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4bYx-00008i-0v; Thu, 20 Feb 2020 02:27:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1j4bYv-00008R-DS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 02:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=; b=bq57EYf1BhC9zCTREDI++zqrkT
 kQHxFm1Cr4iOhadwlpC74fqRKnTZpttffqQr2n1B8hnxvLkWHUjOiCqjRRTh01DxSr72JypX9FLL9
 7LxISjNrySQypxQv/S66TEWoIojxkvz0paus0/uC8L/WeguNVInuJvGtVggswb2Uo1pA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=; b=jdE5loREwslZijtZIVNB0RySba
 BbUmPDQz7wo1TD2aM/AR8t5PZTMkSxCbY1xiSDIvGrGYryygEOWR00zm7RLgEl0v57WxUI/kjc9hu
 geo43cHaYbhrj6aBpRh9Ksx4Tdo6PFs3nRo1TzKzxo1vYX7mZ5XRvE4hazKP/kKpjIME=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j4bYt-008Dpt-UD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Feb 2020 02:27:37 +0000
Received: by mail-lf1-f68.google.com with SMTP id 7so287583lfz.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Feb 2020 18:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=;
 b=HuesXzqrMwl5FNOeLlSDpflwNsgmCskzweQrWPKSAAxSCw7lHW66AFscJTMdsIwTfM
 jGiq6RpnOPaB5Oyh2lOyEHyuTv6NINI8z9tC0O74kkXNN/1S0DYEYEQUa8h2V/dm0VDo
 keHC2RRk+b6r2swD/RwtYXIMxjyjo6GlOu9gB+dUg2p6qefC+T1P4UZIm91Uo85LA+Rv
 8G03jtGxUTJfvgq8RG9MYFoubld2O9BsSsn+sfVhyCNC5XE59suWdHa3oI9hlsR9Dp3B
 GPuDBZymMhE77jVkDqjzwPoCAdP4mi7yBzI9bHOB2pq77Qnr4eN2rvsvew1j0jZvfkPA
 bB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6R9oDs43e49OHId2T3Say1GnAm1Sa9Cij9vjtGqns0w=;
 b=PhsVRXvTMFVOQ/HqogamCJg5GUe12p7Ex9AntLd3PHwxLD+8SCHlF/tC27EfLsbxIw
 VT99cl6EuLFgL9iAnv78/7+Bez0U5cF1Hp3Ycvw63DNJMCT4P1mnIrS5ARCE+454kBvn
 ee94cwLpbItwZI7ZjPiqOoKSXbkJO7ORr78Jdy3mCP1g8DMXktR6uFh1tvWAgQWMAi0t
 08EUpEUO6OjfOhJaCztgQgN4CJ/nsp+PXqZwS6Lmff9KBGzBTvL7d+hTXzupXfYbyZoQ
 NCx57rZb6EaHx6P0kGjROB5JJmH+zpLLIeu14CpVw7y8dE+Cr6RgS1GzSPB4IgsV4kEn
 GH+A==
X-Gm-Message-State: APjAAAU8ycsfn3+0VSoFhCjEH1ly7kIMPtRY7ifI4mprr+a6CRLUdGGB
 koXskvDBc8MlCcTrMb/NVpfC6/aRZ7w/jtkaT/20YQ==
X-Google-Smtp-Source: APXvYqxXpLX+dEvOT5j7tpgmTqUeHQ8fFVlo3960ntu34jaP3dDFM5jPLMUuGTmSmVlcfqf9AGyYlOtPMi7izdaPUmg=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr15671398lfp.203.1582165648799; 
 Wed, 19 Feb 2020 18:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk>
 <20200212063440.GL870@sol.localdomain>
 <20200212065734.GA157327@sol.localdomain>
In-Reply-To: <20200212065734.GA157327@sol.localdomain>
Date: Wed, 19 Feb 2020 18:27:17 -0800
Message-ID: <CA+PiJmRX1tBVqdAgHwk62rGqEQg28B3j5mEsaDBm3UV9_fzDEQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
 Gabriel Krisman Bertazi <krisman@collabora.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1j4bYt-008Dpt-UD
Subject: Re: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 11, 2020 at 10:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Or (just throwing another idea out there) the dentry's name could be copied to a
> temporary buffer in ->d_compare().  The simplest version would be:
>
>         u8 _name[NAME_MAX];
>
>         memcpy(_name, name, len);
>         name = _name;
>
> Though, 255 bytes is a bit large for a stack buffer (so for long names it may
> need kmalloc with GFP_ATOMIC), and technically it would need a special version
> of memcpy() to be guaranteed safe from compiler optimizations (though I expect
> this would work in practice).
>
> Alternatively, take_dentry_name_snapshot() kind of does this already, except
> that it takes a dentry and not a (name, len) pair.
>
> - Eric

If we want to use take_dentry_name_snapshot, we'd need to do it before
calling the dentry op, since we get the dentry as a const. It would do
exactly what we want, in that it either takes a reference on the long
name, or copies the short name, although it does so under a spinlock.
I'm guessing we don't want to add that overhead for all
d_compare/d_hash's. I suppose it could just take a snapshot if it
falls under needs_casefold, but that feels a bit silly to me.

i don't think utf8cursor/utf8byte could be modified to be RCU safe
apart from a copy. As part of normalization there's some sorting that
goes on to ensure that different encodings of the same characters can
be matched, and I think those can technically be arbitrarily long, so
we'd possibly end up needing the copy anyways.

So, I see two possible fixes.
1. Use take_dentry_name_snapshot along the RCU paths to calling d_hash
and d_compare, at least when needs_casefold is true.
2. Within d_hash/d_compare, create a copy of the name if it is a short name.

For 1, it adds some overhead in general, which I'm sure we'd want to avoid.
For 2, I don't think we know we're in RCU mode, so we'd need to always
copy short filenames. I'm also unsure if it's valid to assume that
name given is stable if it is not the same as dentry->d_iname. If it
is, we only need to worry about copying DNAME_INLINE_LEN bytes at max
there. For memcpy, is there a different version that we'd want to use
for option 2?

-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
