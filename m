Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7279BAD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 23:58:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsDfJ-0004DA-20; Mon, 29 Jul 2019 21:58:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <James.Bottomley@HansenPartnership.com>)
 id 1hsDfI-0004D2-6d
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 21:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Mime-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MiZjZD4wU2EXzdhff7NYyIlUBZjVebM58sGlpiLLItI=; b=VWv3yKozjcamstqAfP4OY/HTN8
 qJApjgr31uNz/mJPXKvdULyfDgLQwONkxuVURQvT4Dxx2Bp839thQHgYqX9XLYvz5Z1L8Zh9Al42i
 wdA4Hvl7ZQtVXjS0cU+UnYXoAxl5DEVFhPu5yXpJ7z0dc4HxNULQIw4aFfwyzDDVZ/p8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Mime-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MiZjZD4wU2EXzdhff7NYyIlUBZjVebM58sGlpiLLItI=; b=VB6q/lmldAqQomWwXjwfe15pzE
 Xxjj7KL1+OkBg+k+PI1b7i012hF74M7VoPOCGsW5zcxaVNHyYQG/VwXRnrOYtiEfBYIJyiGiJVkD6
 GOaQJoBcL9eazrKl4wMoD6T+N6OMIxNHnyjBm9MhcY/ZVsDJ61hFFOqkxC0D1VQrHAoM=;
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsDfF-003m3m-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 21:58:44 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 08EF38EE128;
 Mon, 29 Jul 2019 14:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1564436558;
 bh=O9+94053nXIdaYjX0KWz3Uph5DqmEC5747H6+EU/Zj4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=lHLpYWO34joaWpbbHUhSuzCeIS+wzLPt/o74sdOPpx/41Uwx9X+LCpSavRxIQLAmS
 GLtxTKlvIqHG34IA+ti/PeDOb4qmIWbvG7PMgBTtkvJ87tJeUu3JH7H70BpJimBUbs
 Vq44Zx03MEmLllgHt1oMT30KL5EcjHaTsW99PNUM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 5Z_AzM2cI4iM; Mon, 29 Jul 2019 14:42:37 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 5319E8EE116;
 Mon, 29 Jul 2019 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1564436557;
 bh=O9+94053nXIdaYjX0KWz3Uph5DqmEC5747H6+EU/Zj4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XBkskcBS+6ULfJ0Mmli/fO9I4Gh6vlIYhaMvx29RfACbNfsJHrN2Vg9eEb8GBTKfZ
 L0mqQVtElU/FyAX9I84kahiqjaV7j4AqSdTvv35kvCXsh+HgK0jtpTDtFzLL6rJMHZ
 oJ/v0RFNO74FKRJTPQjojHnhiruRm+54OdND5jTU=
Message-ID: <1564436554.12726.38.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>
Date: Mon, 29 Jul 2019 14:42:34 -0700
In-Reply-To: <20190729202951.GG169027@gmail.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-10-ebiggers@kernel.org>
 <20190728193949.GI6088@mit.edu> <20190729202951.GG169027@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [66.63.167.143 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hsDfF-003m3m-GQ
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

On Mon, 2019-07-29 at 13:29 -0700, Eric Biggers wrote:
> On Sun, Jul 28, 2019 at 03:39:49PM -0400, Theodore Y. Ts'o wrote:
> > On Fri, Jul 26, 2019 at 03:41:34PM -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
[...]
> > > HKDF solves all the above problems.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Unless I missed something there's nothing here which is fscrypt
> > specific.  Granted that it's somewhat unlikely that someone would
> > want to implement (the very bloated) IKE from IPSEC in the kernel,
> > I wonder if there might be other users of HKDF, and whether this
> > would be better placed in lib/ or crypto/ instead of fs/crypto?
> 
> This is standard HKDF-SHA512; only the choice of parameters is
> fscrypt-specific. So it could indeed use a common implementation of
> HKDF if one were available.
> 
> However, I don't think there are any other HKDF users in the kernel
> currently.

Well, I'm still trying to add the TPM ones, but they're based on SP800-
108 for arbitrary keys and SP800-56A for elliptic curve ones.  These
are similar to the RFC5869 except that they do extract/expand in a
single operation.  Plus, of course, the TPM mandates we use the name
algorithm (usually sha256, which is what I hardcoded) as the hash.

Note: since you don't use the extract step either in your
implementation, effectively you're equivalent to SP800-108 as well. 
This is effectively the same reason as the TPM: we need deterministic
keys, so we've nowhere to get the salt from that would persist.

> Also, while there was a patch to support HKDF via the crypto_rng API,
> there was no consensus about whether this was actually the best way
> to add KDF support:
> https://lore.kernel.org/linux-crypto/2423373.Zd5ThvQH5g@positron.chro
> nox.de
> 
> So for now, to avoid unnecessarily blocking this patchset I think we
> should just go with this implementation in fs/crypto/.  It can always
> be changed later, once we decide on the best way to add KDFs to the
> crypto API.
> 
> [To be clear: this patch already uses "hmac(sha512)" from the crypto
> API.  It's only the actual HKDF part that we're talking about here.

Right, once you have the hmac + hash available, the rest is easy, so
this is what we have for the TPM KDFa:

static void KDFa(u8 *key, int keylen, const char *label, u8 *u,
		 u8 *v, int bytes, u8 *out)
{
	u32 counter;
	const __be32 bits = cpu_to_be32(bytes * 8);

	for (counter = 1; bytes > 0; bytes -= SHA256_DIGEST_SIZE, counter++,
		     out += SHA256_DIGEST_SIZE) {
		SHASH_DESC_ON_STACK(desc, sha256_hash);
		__be32 c = cpu_to_be32(counter);

		hmac_init(desc, key, keylen);
		crypto_shash_update(desc, (u8 *)&c, sizeof(c));
		crypto_shash_update(desc, label, strlen(label)+1);
		crypto_shash_update(desc, u, SHA256_DIGEST_SIZE);
		crypto_shash_update(desc, v, SHA256_DIGEST_SIZE);
		crypto_shash_update(desc, (u8 *)&bits, sizeof(bits));
		hmac_final(desc, key, keylen, out);
	}
}

I honestly think these things are so simplistic with the correct hmac
that it would make it more confusing to try to produce a general KDF
than it would simply to hard code them where we need them.

James




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
