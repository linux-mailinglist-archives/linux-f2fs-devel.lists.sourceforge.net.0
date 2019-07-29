Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 205B8799F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 22:30:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsCHS-0000Y4-2C; Mon, 29 Jul 2019 20:30:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hsCHQ-0000Xl-VX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 20:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ByJiHPJNYBI2ORziCi8B1eL/dGIYT86p+Gi5vc1wQEU=; b=A/0As5px+56Gyc38TCPLyj/yLS
 TiIs3GJqgR8elhP9UPhD3Yu+bOl3B+jJMheeASuRmD0pj2kHvI2wCUZkth66zOXogs8YE0AGB8tVc
 LmycSKabhStxiURcjotr5KF2lpw1BQAofjPCk0CKcarIkUZqllifweBCTJzcK82+oLKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ByJiHPJNYBI2ORziCi8B1eL/dGIYT86p+Gi5vc1wQEU=; b=Y4uAFJujJWD3PhRLb3OdCLw/8u
 RAUc/ort2fYWRWKspnAyVlp4kvAhPu6SxUbPTt/9qymiVSWem9Sl3QuF0GvjkjZre568jh4EOZWkV
 QsWySfCv2AKyJVq71dR+l026qGmus86Q0kx1M5FjO4iHFTekTW5pWLaAGnnUI+fD6X7I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsCHP-00FvJi-Jm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 20:30:00 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2FB620679;
 Mon, 29 Jul 2019 20:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564432194;
 bh=7LK4u/xXVtAq5xQMkemCjB4sBIVdQGteWvKYNQ+TBCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DPew4TPf3PkKUXWtCLWWIQsryuZDmRsZW9HWBPCFmul6GOPKrMhWsOP2j0s6E1587
 pPpWGjXg0oLEblY9YgIrbRyuoJDVlQC0LdMHo0X3YE5xtPBbo3Oz6TZzJnytmQbINO
 1di8FZ/AmOwFvTEDEuqxMDphn/LIvGf9Grr0aIA8=
Date: Mon, 29 Jul 2019 13:29:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190729202951.GG169027@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-10-ebiggers@kernel.org>
 <20190728193949.GI6088@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728193949.GI6088@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsCHP-00FvJi-Jm
Subject: Re: [f2fs-dev] [PATCH v7 09/16] fscrypt: add an HKDF-SHA512
 implementation
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jul 28, 2019 at 03:39:49PM -0400, Theodore Y. Ts'o wrote:
> On Fri, Jul 26, 2019 at 03:41:34PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add an implementation of HKDF (RFC 5869) to fscrypt, for the purpose of
> > deriving additional key material from the fscrypt master keys for v2
> > encryption policies.  HKDF is a key derivation function built on top of
> > HMAC.  We choose SHA-512 for the underlying unkeyed hash, and use an
> > "hmac(sha512)" transform allocated from the crypto API.
> > 
> > We'll be using this to replace the AES-ECB based KDF currently used to
> > derive the per-file encryption keys.  While the AES-ECB based KDF is
> > believed to meet the original security requirements, it is nonstandard
> > and has problems that don't exist in modern KDFs such as HKDF:
> > 
> > 1. It's reversible.  Given a derived key and nonce, an attacker can
> >    easily compute the master key.  This is okay if the master key and
> >    derived keys are equally hard to compromise, but now we'd like to be
> >    more robust against threats such as a derived key being compromised
> >    through a timing attack, or a derived key for an in-use file being
> >    compromised after the master key has already been removed.
> > 
> > 2. It doesn't evenly distribute the entropy from the master key; each 16
> >    input bytes only affects the corresponding 16 output bytes.
> > 
> > 3. It isn't easily extensible to deriving other values or keys, such as
> >    a public hash for securely identifying the key, or per-mode keys.
> >    Per-mode keys will be immediately useful for Adiantum encryption, for
> >    which fscrypt currently uses the master key directly, introducing
> >    unnecessary usage constraints.  Per-mode keys will also be useful for
> >    hardware inline encryption, which is currently being worked on.
> > 
> > HKDF solves all the above problems.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Unless I missed something there's nothing here which is fscrypt
> specific.  Granted that it's somewhat unlikely that someone would want
> to implement (the very bloated) IKE from IPSEC in the kernel, I wonder
> if there might be other users of HKDF, and whether this would be
> better placed in lib/ or crypto/ instead of fs/crypto?
> 

This is standard HKDF-SHA512; only the choice of parameters is fscrypt-specific.
So it could indeed use a common implementation of HKDF if one were available.

However, I don't think there are any other HKDF users in the kernel currently.
Also, while there was a patch to support HKDF via the crypto_rng API, there was
no consensus about whether this was actually the best way to add KDF support:
https://lore.kernel.org/linux-crypto/2423373.Zd5ThvQH5g@positron.chronox.de

So for now, to avoid unnecessarily blocking this patchset I think we should just
go with this implementation in fs/crypto/.  It can always be changed later, once
we decide on the best way to add KDFs to the crypto API.

[To be clear: this patch already uses "hmac(sha512)" from the crypto API.  It's
only the actual HKDF part that we're talking about here.

Also, its correctness is tested by the ciphertext verification xfstests.]

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
