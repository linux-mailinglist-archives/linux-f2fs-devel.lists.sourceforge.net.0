Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9E2DB854
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 02:15:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpLPF-0006vj-GZ; Wed, 16 Dec 2020 01:15:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1kpLPC-0006vX-TN; Wed, 16 Dec 2020 01:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HD0Zot3DWuNXzI7hPHhf3p7iN+M92KY77dzsXnm9qtE=; b=bs/WgXezj0G/DVV+tny1RvzvwG
 mEW0iSCe8TOPUDXCWo1vgJG1D59RJo1/Nkk0HesBjyWloWy/9V1Gp6VCeb/WkwKlGjAVmFL2/ZfUR
 PnLPlmV94UVfRMmH4mG7I4wu8Gczdq7DzCnoh3ATM83ZIjZH7SGiNTKp4C/EDx730Zo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HD0Zot3DWuNXzI7hPHhf3p7iN+M92KY77dzsXnm9qtE=; b=T0h+C+NgwA7IA/nGWwYmSKme9l
 qEFhYrbtbTS6sNTxKc8dQXHaCN/cOKzNA2Gx8+T8mWksFisQvEfDCFgnjjfHBSQiu0qi2KFyiVfBF
 yelVfn1Gp1UblYBjLJJ2vHsLtGd7+kev7wPGq0mtKLzp9L8PFpg1uDGQ27dFCzgV9gIo=;
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpLP7-00Fqt7-TO; Wed, 16 Dec 2020 01:15:02 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kpL8p-00049r-2J; Wed, 16 Dec 2020 11:58:08 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 16 Dec 2020 11:58:07 +1100
Date: Wed, 16 Dec 2020 11:58:07 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20201216005806.GA26841@gondor.apana.org.au>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
 <DF6B2E26-2D6E-44FF-89DB-93A37E2EA268@fb.com>
 <X9lOHkAE67EP/sXo@sol.localdomain>
 <B3F00261-E977-4B85-84CD-66B07DA79D9D@fb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B3F00261-E977-4B85-84CD-66B07DA79D9D@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: apana.org.au]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kpLP7-00Fqt7-TO
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
Cc: Christoph Hellwig <hch@infradead.org>, Petr Malat <oss@malat.biz>,
 "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Eric Biggers <ebiggers@kernel.org>,
 Chris Mason <clm@fb.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBEZWMgMTYsIDIwMjAgYXQgMTI6NDg6NTFBTSArMDAwMCwgTmljayBUZXJyZWxsIHdy
b3RlOgo+Cj4gVGhhbmtzIGZvciB0aGUgYWR2aWNlISBUaGUgZmlyc3QgenN0ZCBwYXRjaGVzIHdl
bnQgdGhyb3VnaCBIZXJiZXJ04oCZcyB0cmVlLCB3aGljaCBpcwo+IHdoeSBJ4oCZdmUgc2VudCB0
aGVtIHRoaXMgd2F5LgoKU29ycnksIGJ1dCBJJ20gbm90IHRvdWNoIHRoZXNlIHBhdGNoZXMgYXMg
Q2hyaXN0b3BoJ3Mgb2JqZWN0aW9ucwpkb24ndCBzZWVtIHRvIGhhdmUgYmVlbiBhZGRyZXNzZWQu
CgpDaGVlcnMsCi0tIApFbWFpbDogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3Jn
LmF1PgpIb21lIFBhZ2U6IGh0dHA6Ly9nb25kb3IuYXBhbmEub3JnLmF1L35oZXJiZXJ0LwpQR1Ag
S2V5OiBodHRwOi8vZ29uZG9yLmFwYW5hLm9yZy5hdS9+aGVyYmVydC9wdWJrZXkudHh0CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
