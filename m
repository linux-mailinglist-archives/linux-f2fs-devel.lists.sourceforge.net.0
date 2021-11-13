Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E6E44F1B1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Nov 2021 06:58:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlm3k-00030m-K1; Sat, 13 Nov 2021 05:58:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mlm3i-00030b-HP; Sat, 13 Nov 2021 05:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1iM48WVnyE7qdbQeaA5Aiqosaltkjxs25xFJ9BRwoY=; b=F9TFzcK+UJvOOthRyHobAFmH30
 Nh9gZV5J1a++ljMNNG1SiXB4MTJUPcs+iMwd2F1JLe2e9ykLIgnvLMlcq8MiGsEfTO9twkxa993cN
 orVZV36kMv/nDRzGHjzuLyrtsKe8N4dnvA36xOloIp+gMC35xcsuTAfapbSnBvoqqzuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1iM48WVnyE7qdbQeaA5Aiqosaltkjxs25xFJ9BRwoY=; b=OBr1UjVidw+gb+ToKrlh15VMlD
 3Rf20TduxCyJbGu/dCj2kgmfjwu26qClRJ1npEqvVqHMJYKfEj+tUj8/e6G0MnCY7MENl3YAN+YkP
 VLMr/Be3882+b++hAhihIpfSxm+skGJV455NHTjLQduG9AIl+g9AK9zdOS/91CjtWAkY=;
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mlm3h-00BSUd-VV; Sat, 13 Nov 2021 05:58:39 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1mllna-0008U5-Tf; Sat, 13 Nov 2021 13:41:58 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mllnI-0005S4-Mh; Sat, 13 Nov 2021 13:41:40 +0800
Date: Sat, 13 Nov 2021 13:41:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nick Terrell <terrelln@fb.com>
Message-ID: <20211113054140.GA20916@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7A1FF8B7-CB5B-415A-9203-1A0DAA1FDD9B@fb.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
Organization: Core
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Nick Terrell <terrelln@fb.com> wrote: > > 2. Reaching out
   to Herbert Xu—because the first zstd version went through the > crypto tree—and
    other relevant maintainers who have been > involved, and t [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FAKE_REPLY_C           No description available.
X-Headers-End: 1mlm3h-00BSUd-VV
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Cc: oleksandr@natalenko.name, linux-kernel@vger.kernel.org, tseewald@gmail.com,
 clm@fb.com, jd.girard@sysnux.pf, sfr@canb.auug.org.au, paul@pauljones.id.au,
 nickrterrell@gmail.com, cyan@fb.com, hch@infradead.org, Kernel-team@fb.com,
 ebiggers@kernel.org, squashfs-devel@lists.sourceforge.net,
 mirq-linux@rere.qmqm.pl, sedat.dilek@gmail.com, rdunlap@infradead.org,
 dsterba@suse.cz, linux-f2fs-devel@lists.sourceforge.net, oss@malat.biz,
 linux-crypto@vger.kernel.org, felixh@fb.com, torvalds@linux-foundation.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IHdyb3RlOgo+Cj4gMi4gUmVhY2hpbmcgb3V0
IHRvIEhlcmJlcnQgWHXigJRiZWNhdXNlIHRoZSBmaXJzdCB6c3RkIHZlcnNpb24gd2VudCB0aHJv
dWdoIHRoZQo+ICAgIGNyeXB0byB0cmVl4oCUYW5kIG90aGVyIHJlbGV2YW50IG1haW50YWluZXJz
IHdobyBoYXZlIGJlZW4KPiAgICBpbnZvbHZlZCwgYW5kIHRyeWluZyB0byBnZXQgYSB3b3JkIG9m
IHN1cHBvcnQgZm9yIGFkZGluZyBtZSBhcyB0aGUgbWFpbnRhaW5lcgo+ICAgIG9mIGxpYi96c3Rk
IGluIHRoaXMgdGhyZWFkLgoKQWN0dWFsbHkgSSBkb24ndCB0aGluayBJIGV2ZXIgbWVyZ2VkIGxp
Yi96c3RkLiAgSSBkaWQgdGFrZQpjcnlwdG8venN0ZCB0aG91Z2ggd2hpY2ggaXMgdGhlIENyeXB0
byBBUEkgd3JhcHBlciBhcm91bmQgdGhlCmxpYi96c3RkIGNvZGUuCgpTaW5jZSB0aGUgY3VycmVu
dCBjb250ZW50aW9uIGlzIHdpdGggbGliL3pzdGQgSSB0aGluayBpdCBwcm9iYWJseQptYWtlcyBz
ZW5zZSBmb3IgTGludXMgdG8gdGFrZSBpdCBkaXJlY3RseS4KCkkgdGhpbmsgeW91IHNob3VsZCBj
ZXJ0YWlubHkgYmUgdGhlIG1haW50YWluZXIgb2YgbGliL3pzdGQgc2luY2UKaXQgd2FzIGFkZGVk
IGJ5IHlvdSBhbmQgbW9zdGx5IHVzZWQgYnkgeW91IHRvbyA6KQoKVGhhbmtzLAotLSAKRW1haWw6
IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRw
Oi8vZ29uZG9yLmFwYW5hLm9yZy5hdS9+aGVyYmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5h
cGFuYS5vcmcuYXUvfmhlcmJlcnQvcHVia2V5LnR4dAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
