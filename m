Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF22230E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 03:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tH9hxX0A8uWuc5luOuJ0OZ7jhjZCYWY7z1oLaSnxSzQ=; b=CGVaOjxDGTJxE8AxWH8PgmaJa
	ie37CN1mgKrdMo0+Bz33+mevG9G3FqICgDOF7Mce9XwYPG1uXaI5Kw5Tnc2x5n8jVY8iTJPbqKKt1
	DnFkFxmUFLSyUTOnLYMTKIrYWDjiOMaRwaztmmEmk503RR5oyECX90yagGiAcbtmypeqE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFcD-00036V-LY; Fri, 17 Jul 2020 01:56:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1jwFcB-00036I-5x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsRBKN8QLdPNyhcwSV+uq9z8S14OK4+shsMWXoSHano=; b=PlU0DPv6P0bneKyNY9vB1ga2Bo
 YNQXG13BRYN7iFTMlHUneeha3DIg0lcvZ75EoYXsPU0mpXN9+U21Qj+IR9SZ26ek+LQTPj7E9rYDn
 DWvKjWvBBvbTRHfTDFwunGwcS1mU8cTY6KuIl5+wMH53qaZ6lKkoJ5rbNnUWX7oUaCb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsRBKN8QLdPNyhcwSV+uq9z8S14OK4+shsMWXoSHano=; b=k5OHMqB07+eCQfckTdKmS0sasd
 KgOF/Mq4GvgPftWKxdr9swuFD6H/5gUgMMrEbvhJbH/2/JWjk23UzFFl3bQz9zyFZBpI7fgaqxQoH
 zLmT0l6zBJKru/3hEKc/sCs2FltD+V81wz1XGzbuZ+/tSmRZZLADrfzDbH8cBuA46qpA=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFc5-003m8m-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 01:56:43 +0000
Received: by mail-pf1-f195.google.com with SMTP id a24so4616449pfc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qsRBKN8QLdPNyhcwSV+uq9z8S14OK4+shsMWXoSHano=;
 b=fF8SXmuJ5dp+F3PTM2our2J4E+hDhHA0p3iDcnB/O91rUNgrshAnIKppEVbLV9YzFA
 4QV6KsmrWTalXlq6RfGoNa2i6J0lQkPm1oQS9mrzp5Iem/XFthEytoyzvTkpI8bk1neF
 ktTuLqsJ+g/DIvPLl/T+rEzFialug4jEbUek8pxOaE5o+AQKkHtPIHzgZoJ2YQGJmKhm
 uM82+Ak3HfxCJGEq8acmRO6w2zJLKq7xc3J9NI1zbXTRnM+AN/FMNGvvYJ17dAE0RFPy
 e1OIEHs7M7VC04J+vLieQoy1BO54eelNvQbGd9zmkoJ4+YAeR2fTBZi1H3+0AXZDoStB
 JYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qsRBKN8QLdPNyhcwSV+uq9z8S14OK4+shsMWXoSHano=;
 b=DsaA6Foux2821tx04QUnCVzyDoyjv1xFZBdSfZwt4yVxtAz1D+PfBWlfoJJGxAhcYe
 UVcau+xbx74tqqvZvfpxFpf3kbT6MfnA9Fw82qjKLuto184rJV6jOZHMLjxZUnfzocuh
 v0KWEWpc0m6DUphRY4fRvuLdX/CIxBCmyIp8XHxLwR+zRTdbgDEDlw1gLXw4r8rIVKiy
 HdhgQwNfOzGDHGaC47obZ88QlpzWwHM/iQiM4Xda+kHBtroJvdbpYHMdoX1N1vbhJOn3
 Z2f6w24Hr2rVJfJ6ZXSx9/Kcka/T6EbTs/7zohMAmHKZyBfyhl4Ljz0dkbmX/BXnz5E3
 5iUQ==
X-Gm-Message-State: AOAM532/JFlhpMdc6dJnvPe6BwXTndjCdPs5vTXO9bmWDXi2l8OEwKof
 ZKOud4FN5taVaAgvRXpHqrUxdw==
X-Google-Smtp-Source: ABdhPJw8pEBcXlCRGQ2zK0krljhxRjXz/nER5WspRB+U1hDcSxVBK7VwJySfVnXQhiryBo/CryuPIQ==
X-Received: by 2002:a63:f90f:: with SMTP id h15mr6578417pgi.53.1594950991806; 
 Thu, 16 Jul 2020 18:56:31 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
 [35.199.190.124])
 by smtp.gmail.com with ESMTPSA id d9sm5835817pfd.133.2020.07.16.18.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 18:56:31 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:56:27 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200717015627.GA82163@google.com>
References: <20200709194751.2579207-1-satyat@google.com>
 <20200709194751.2579207-3-satyat@google.com>
 <20200710053406.GA25530@infradead.org>
 <20200713183619.GC722906@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713183619.GC722906@gmail.com>
X-Spam-Score: -16.1 (----------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFc5-003m8m-Ix
Subject: Re: [f2fs-dev] [PATCH 2/5] direct-io: add support for fscrypt using
 blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 13, 2020 at 11:36:19AM -0700, Eric Biggers wrote:
> On Fri, Jul 10, 2020 at 06:34:06AM +0100, Christoph Hellwig wrote:
> > On Thu, Jul 09, 2020 at 07:47:48PM +0000, Satya Tangirala wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > Set bio crypt contexts on bios by calling into fscrypt when required,
> > > and explicitly check for DUN continuity when adding pages to the bio.
> > > (While DUN continuity is usually implied by logical block contiguity,
> > > this is not the case when using certain fscrypt IV generation methods
> > > like IV_INO_LBLK_32).
> > 
> > I know it is asking you for more work, but instead of adding more
> > features to the legacy direct I/O code, could you just switch the user
> > of it (I guess this is for f2f2?) to the iomap one?
> 
> Eventually we should do that, as well as convert f2fs's fiemap, bmap, and llseek
> to use iomap.  However there's a nontrivial barrier to entry, at least for
> someone who isn't an expert in iomap, especially since f2fs currently doesn't
> use iomap at all and thus doesn't have an iomap_ops implementation.  And using
> ext4 as an example, there will be some subtle cases that need to be handled.
> 
> Satya says he's looking into it; we'll see what he can come up with and what the
> f2fs developers say.
> 
> If it turns out to be difficult and people think this patchset is otherwise
> ready, we probably shouldn't hold it up on that.  This is a very small patch,
> and Satya and I have to maintain it for years in downstream kernels anyway, so
> it will be used and tested regardless.  It would also be nice to allow userspace
> (e.g. xfstests) to assume that if the inlinecrypt mount option is supported,
> then direct I/O is supported too, without having to handle intermediate kernel
> releases where inlinecrypt was supported but not direct I/O.
> 
As Eric pointed out, it doesn't seem to be completely straightforward to
move f2fs to using iomap - I'm still looking into it, but for now I've
sent out v2 (and v3 just because I forgot to add a changelog to v2) with
the changes to fs/direct-io.c as is from v1, but (again, for the reasons
Eric points out) I think it'd be better not to hold this patch up for that.
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
