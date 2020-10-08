Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89004286C14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 02:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=59LGUzigjgV6AUiYWZBMwawvrzEHMB8CjPTnVTTKSXk=; b=ll52t0SP94NP/Q2CVm56Y9377
	CCHzupt7a8+bri77/LbPEW2/I9KGFvBIivT9dLA82xMgwAL6GyA7R4CtxTSqdnhy2ANf7GoEtQvot
	EGZfSmFnTGE7/8MAWQ+lLqlZAd+VBUyyoEnIGIDBpjUZVDvN7uDkE0xUW4Mc8eKVVDDBI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQJqN-0001pJ-H5; Thu, 08 Oct 2020 00:31:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kQJqM-0001p5-BC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 00:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uo0iV9T76AdXJrYK1sOUICbto9AV6/Gfz8QYpmAsbzA=; b=hsinbn23xXBBCr3orIbgZN0AiI
 C4Pz7jYRwsE9WDQx6kRs23KMKtpPY9CIqUhBBWgVaZu2++ctsrECIxkNjsHiXGJnRNkPM7n856dBS
 G8itnEGzA2K9Mqxq2y3lPorrViLKSqXyOD+Yldp8z0n0LPbHEFxAPqFxu9Jcf53ZP/qE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uo0iV9T76AdXJrYK1sOUICbto9AV6/Gfz8QYpmAsbzA=; b=Fq4sGFc4lZCKun2kOx8b3r0s+X
 +YaTX8rGiTP8oohghcWthpqNX1TuvZ6M4fi0QZoRE7Km0oFuh046i9LnTulF3KHRLC0YS5en1yZKD
 EmiHedNT1tESpsGaOPAyjst1ij/fblVxlV8aUtY19N0Xp8hehoO+Wb4bO/5oO40MyEW0=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQJqI-002bGu-0Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 00:31:38 +0000
Received: by mail-pf1-f195.google.com with SMTP id l126so2534103pfd.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Oct 2020 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uo0iV9T76AdXJrYK1sOUICbto9AV6/Gfz8QYpmAsbzA=;
 b=iuRJmTXMrEcCiTQJzRJ+xHPK/FIX/Smbxcz6lUEsLtQTqD1bylglJvZIKM6NWBBnCw
 gJBlfgpgBh2CvDZ2ewzog8oGkgvvgKciAdjoP2em5jX1h2Avt609vwyILJzh0H4yFzO3
 9LoseArWp1iwO8Z6Vh7Gb6/iaX3OnSh2r50HIsabeSmk9tXI/WwTiooIRll+M5WewLWG
 inrWzP0KMQvE0xxAuaeK9uBrVjkRDKauUOnQQQ7tW+i5cfslfeR9+xr5JLNKlFnFcHXn
 dAeiQJ2uI2E0JcAvgXMd/Vr9cwHczfeOftYqdoWSZ3mLWSHB+02EMjnYJNJ9AQ11krAo
 gaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uo0iV9T76AdXJrYK1sOUICbto9AV6/Gfz8QYpmAsbzA=;
 b=nvq/y8IMs36gMCEZfkY9nVdWgv1BJnH7PmJ2u+Zoy3P6JkKaBU+apObLvTVLdJ2WJy
 Tx4bUTMAJ0YnRjGqzyHuDBGB+GJP7l+GD7XF1QVxZtm7wZnH1Kdo1tjTkqfNViQOhMCd
 d9tKFBLfKquSx0JHGa9Fea1UxRygz0FUEQvu+TY3BN1HEJgUprRY4S7DpW1E6yE3gguo
 v6KLGShsx+sQwd8jaaW4wHdAyMKeX+X4+cYL+tan/6PEYtbKowLXwQQZYl9cJMTx3IRB
 gisLPKK+mHdGT1uv7NeIVvXFeYeTQiSFXQURF2Vjt5tsR+G2s51Gd82OyioDQUCPWpBP
 FnWA==
X-Gm-Message-State: AOAM532n5Meh8+eM3g1pA5E6fvnodYheZ3WIuNMB/ZvQl2cSp8LQmALj
 ovJ671xUazIHUEsI05D9i7km/w==
X-Google-Smtp-Source: ABdhPJwqoUNOA2OHE0VxNnVVVWX8tG0+JADgtjufctSYqlXuRglsK3npH1UDJ8p70IswpST9h5sqVw==
X-Received: by 2002:a17:90a:43:: with SMTP id 3mr5410408pjb.55.1602117080992; 
 Wed, 07 Oct 2020 17:31:20 -0700 (PDT)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id q4sm4380148pjl.28.2020.10.07.17.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 17:31:20 -0700 (PDT)
Date: Thu, 8 Oct 2020 00:31:16 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201008003116.GA2556065@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201005073606.1949772-4-satyat@google.com>
 <20201007212052.GC1530638@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007212052.GC1530638@gmail.com>
X-Spam-Score: -15.6 (---------------)
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
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kQJqI-002bGu-0Y
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: Add metadata encryption support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 07, 2020 at 02:20:52PM -0700, Eric Biggers wrote:
> On Mon, Oct 05, 2020 at 07:36:06AM +0000, Satya Tangirala wrote:
> > Wire up metadata encryption support with the fscrypt metadata crypt
> > additions.
> > 
> > Introduces a new mount option for metadata encryption -
> > metadata_crypt_key=%s. The argument to this option is the key descriptor of
> > the metadata encryption key in hex. 
> 
> It's unclear what "key descriptor in hex" means in this context.  Keys in the
> Linux keyrings subsystem can be specified either by an integer ID or by a string
> "description".
> 
> fscrypt_policy_v1 has an 8-byte binary master_key_descriptor, which specifies a
> keyring key with description "fscrypt:" + ToHex(master_key_descriptor).  So I'm
> guessing that's where this terminology is coming from.
> 
> However, here the value passed to metadata_crypt_key is just a key description
> that's passed directly to the Linux keyrings subsystem.  I don't see why it has
> to be a hex string (and it fact, it seems it's not enforced?).
Yeah, I really meant "string description". Also I'll be putting the
key identifier in the superblock so this mount option will be going
away.
> 
> The current proposal is also missing any sort of key verification.  The
> filesystem will use any key that is provided, even if a different key was used
> at format time.
>
I was relying on the validate_checkpoint() to fail when it tries to
verify the checkpoint checksum if an incorrect key is provided, but that
does sound bad to rely on from a design perspective. I'll do what you
mentioned below.
> In "fscrypt v2", we solved the equivalent problem by making the keys be
> specified by a HKDF-derived master_key_identifier.
> 
> How about doing something similar for the metadata encryption key?  I.e. the
> metadata encryption key could be used as input to HKDF to derive two subkeys:
> metadata_key_identifier and the real metadata encryption key.  Then
> metadata_key_identifier could be stored in the superblock.  Then the filesystem
> could request the keyring key "fscrypt:" + ToHex(metadata_key_identifier) at
> mount time, which would eliminate the need for a mount option.
> 
> > Direct I/O with metadata encryption is also not supported for now.
> > Attempts to do direct I/O on a metadata encrypted F2FS filesystem will fall
> > back to using buffered I/O (just as attempts to do direct I/O on fscrypt
> > encrypted files also fall back to buffered I/O).
> 
> What would it take to get direct I/O working?
> 
I think we'd first need to get the direct I/O with fscrypt via
blk-crypto patches in (i.e. the patch series at

https://lore.kernel.org/linux-fscrypt/20200724184501.1651378-1-satyat@google.com/
)

At least for single device filesystems, it shouldn't be much extra work to
support metadata encryption with the above patch in, especially once I make
fscrypt_set_bio_crypt_ctx() handle setting both the metadata encryption
and file encryption keys as you suggested in the previous patch - For
multi device filesystems, we'd need the offset of the block from the
start of the FS rather than offset of the block from the start of the
device that block belongs to (through my cursory glance at
dio_bio_alloc() where the above patch calls fscrypt_set_bio_crypt_ctx(),
I can see that the latter is readily available as first_sector, but I'm
not sure about the former - I'd imagine we can get that from the
dio->inode or something like that, or maybe some extra plumbing is
required).

> > +#ifdef CONFIG_FS_ENCRYPTION_METADATA
> > +	if (metadata_crypt_alg &&
> > +	    !fscrypt_metadata_crypted(sb)) {
> > +		f2fs_err(sbi, "Filesystem has metadata encryption. Please provide metadata encryption key to mount filesystem");
> > +		return -EINVAL;
> > +	}
> > +#endif
> 
> Please try to avoid #ifdefs.  It looks like some of these could be replaced with
> IS_ENABLED() or the use of stub functions.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
