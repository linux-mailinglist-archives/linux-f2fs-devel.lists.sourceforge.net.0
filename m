Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45583A8A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2019 22:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU+EWeBcbMDr8cwonDCM66evdyTCn3M7TaKXYD7+j3I=; b=fTu9BELgwIU0oReNMvWMzG48Dp
	+FT4oyDm3D73LCEF05yiWi0vvWbcHTJTf8oxA5a4a0UWxehDon1dB9c301DJ1J556/B8zwBb7CAV6
	gla9wlRgaF0GhnIGnS3RvdUlc51NHi80IcVPplWcEX+ZbItWMA9aZ5aEr6nm8Dhnnz7Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hv6JD-0001sQ-LA; Tue, 06 Aug 2019 20:43:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <paulcrowley@google.com>) id 1hv6JC-0001sJ-CY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 20:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=; b=bh7OO5FfJOijX3ewlUhg/vPqxU
 YdKM5O1H45wHlk0A98oqfUJQxjvzRGQspKxj2wtF5cku2IAu7J/MQokI0H4AshUOoOmNgMKRGUp4k
 IcO09nOcmsHbJMoOHtSksFNBGGT5HdgplB+ZLueSAZjJYC/GC834uP7Isn2qDaCEm7Sw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=; b=j1io6hhM8O7McFxNNRcuPx8gtx
 Tn2IwUu4E7LPaeLWtOO7FCZSBDzS23DDccsPP5XDAFj5RZkuhNohViE7BIohvhDc4j+5hl/m6m8BZ
 ry/nISX5VdUW68xDt9NMPRQl0cuVJuhSKVrs0AS7JISVH5rmz7H3dd+Dm6srNlYoynT4=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hv6J8-00DPV8-OP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Aug 2019 20:43:50 +0000
Received: by mail-lf1-f66.google.com with SMTP id c19so62285080lfm.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Aug 2019 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=;
 b=Jcbiz/rlCveea1uGbs0To2AG2Fqr3qcVJByaj30biSJ6IGaZQU269n7UhHiJIq60zt
 F6m/iDUTKUaAxcfbj3aNcS1UVKWh0iBATpSeFcB2HZZd4zuUH74H+0AsiAw/3vHblfhG
 rGmoqX4hHVQvNh1Mo2WC3G6d946cIGSfRxOUfOJyomX+NAcaChMCm9wTSq80UpIDDyVy
 Wsy0W1UJUtub0zWt+iqZy9h9oHmBFsihiepiuxbUw6MWvMUQg0sLWv0bFV1e+nhfBD57
 VYDaUrEm2FkddHey3B0zSP911OVgsWvOlf8N8vWL7OUIPVuLGhouTH4qcL5ZHCc7EUMj
 /u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VR5feK3MwIDa28M66pr8cZaax0HRBgUIy/YXtAlUVAg=;
 b=YLpOxtVxIbR/Pwkpc00JoFPwjQgkX3w8tHyZdWhl2mr0WNMav8LH9pEWA4y5v8I3Eo
 5qdbw20rMtRk4xqb3IpTClAWCWzBW/RhXMWdwgMcOFfRYuh2EmiWG1kX8CKFAIvy3k45
 mgZAP2Vqr1J36niBXCg2RJtkhGnKAIq0lOgwHYkjBG44ST8/rLzVHF4q5C+Sj7c+5btC
 jMeg+F4tX72NQzQ3WWSNiU7hW4CjgwoCCX0b42OX/QfYy/Q/EHBg7Hpdi7ftaGYUI+2q
 pUioen96nsWCfcmOZO/CaYiT2eFjaGXMdn+zIXCmbzFbI7/dQzriv624B5EzbI0Q6+pI
 5hug==
X-Gm-Message-State: APjAAAU8gK5+njqPpkNNq3Nucn6xkedyR/bl8/m/gvw9T5Uv9WHfEGWH
 na8ejH3wvvW8f0z1u4kL4MaPkKg6RaDsF+DUm0B9BA==
X-Google-Smtp-Source: APXvYqzWZs8IRpgox1WFTKnJpGnBDG26DorCdtZJQD2tgXVD7zBJA6DxGWkpIBTAdKDEhuxqp2JLjofjJIxta57O938=
X-Received: by 2002:a19:6f4b:: with SMTP id n11mr3649844lfk.163.1565124219457; 
 Tue, 06 Aug 2019 13:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-13-ebiggers@kernel.org>
In-Reply-To: <20190805162521.90882-13-ebiggers@kernel.org>
Date: Tue, 6 Aug 2019 13:43:27 -0700
Message-ID: <CA+_SqcBkR_8Z9EUTpK-dEW4PN+9P5OgJnqYDHtOhG+P1LjotPA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
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
X-Headers-End: 1hv6J8-00DPV8-OP
Subject: Re: [f2fs-dev] [PATCH v8 12/20] fscrypt: add an HKDF-SHA512
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
From: Paul Crowley via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Paul Crowley <paulcrowley@google.com>
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 5 Aug 2019 at 09:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add an implementation of HKDF (RFC 5869) to fscrypt, for the purpose of
> deriving additional key material from the fscrypt master keys for v2
> encryption policies.  HKDF is a key derivation function built on top of
> HMAC.  We choose SHA-512 for the underlying unkeyed hash, and use an
> "hmac(sha512)" transform allocated from the crypto API.
>
> We'll be using this to replace the AES-ECB based KDF currently used to
> derive the per-file encryption keys.  While the AES-ECB based KDF is
> believed to meet the original security requirements, it is nonstandard
> and has problems that don't exist in modern KDFs such as HKDF:
>
> 1. It's reversible.  Given a derived key and nonce, an attacker can
>    easily compute the master key.  This is okay if the master key and
>    derived keys are equally hard to compromise, but now we'd like to be
>    more robust against threats such as a derived key being compromised
>    through a timing attack, or a derived key for an in-use file being
>    compromised after the master key has already been removed.
>
> 2. It doesn't evenly distribute the entropy from the master key; each 16
>    input bytes only affects the corresponding 16 output bytes.
>
> 3. It isn't easily extensible to deriving other values or keys, such as
>    a public hash for securely identifying the key, or per-mode keys.
>    Per-mode keys will be immediately useful for Adiantum encryption, for
>    which fscrypt currently uses the master key directly, introducing
>    unnecessary usage constraints.  Per-mode keys will also be useful for
>    hardware inline encryption, which is currently being worked on.
>
> HKDF solves all the above problems.
>
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Paul Crowley <paulcrowley@google.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
