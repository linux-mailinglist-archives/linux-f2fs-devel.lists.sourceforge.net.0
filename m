Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B258E21105C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 18:14:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqfNe-000489-UP; Wed, 01 Jul 2020 16:14:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqfNd-00047k-7L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tX5DuodYHSWFkAywxYYltqtctPYXgv+2Jf9xFYjwEso=; b=J//AdgllBwszt3x81tG75mJdr9
 XjIXGEnkb/WX4y/YLuQ6Bo5XqVlGk+YcGr970VoSrGg3Rc+Up4PQcPQiir+7dOVxyH7VIXCfyFgoK
 jnB3gSjtMQeCFvP3pX9y8GmdgfCtTm5U7WyhFu3yvYU50og6fXpYIVp7LJnPRMLRZG7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tX5DuodYHSWFkAywxYYltqtctPYXgv+2Jf9xFYjwEso=; b=FSsQXg4rTiLVKGi8F8TU6VLPM1
 /XbDj2OyAS3h+fY3OIUoDhGsdeg7ntnhpjBh5YSK3fxbBeD/q6C1unbIilyFVgltzxvKHE06e11i9
 wDFL/aEJEm+3yJ0my020Q9d8ES37/QW5eTfj9hgOcpujFN0Aablcka4Iup0MRvI2XM7Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqfNb-004BR7-SU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:14:37 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A38B207FB;
 Wed,  1 Jul 2020 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593620069;
 bh=2TWjWcBOdWkh1PkJpBcH2H9+m+ze9nMuqw5lH2ZVuK0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=QRgPYJk/XijGeI9UguT9sCw0ics6U013OjmRO2k7KAAVGO/fivH+8vmNXjqJy2BDv
 /zc4dJXjwwDyA2rV2IVEGXmtExOT4Z2MYzyYidq7VOcmsP3Y6tzE2W1rfWdiUx9XPf
 2agg5PLwN0DXvHj0L69G3o+KUVh0e0Z5qZtrDL9k=
Date: Wed, 1 Jul 2020 09:14:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200701161429.GA1724572@google.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com>
 <20200629202720.GA230664@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629202720.GA230664@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqfNb-004BR7-SU
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: avoid readahead race condition
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CkZyb20gMzYzNDg2NDA5NWJkMWFhZmJiNjBmZjQ5ZGFjN2QxM2NlMTU3YjY1OCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KRGF0
ZTogTW9uLCAyMiBKdW4gMjAyMCAyMzowMTowNSAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIGYyZnM6
IGF2b2lkIHJlYWRhaGVhZCByYWNlIGNvbmRpdGlvbgpNSU1FLVZlcnNpb246IDEuMApDb250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGlu
ZzogOGJpdAoKSWYgdHdvIHJlYWRhaGVhZCB0aHJlYWRzIGhhdmluZyBzYW1lIG9mZnNldCBlbnRl
ciBpbiByZWFkcGFnZXMsIGV2ZXJ5IHJlYWQKSU9zIGFyZSBzcGxpdCBhbmQgaXNzdWVkIHRvIHRo
ZSBkaXNrIHdoaWNoIGdpdmluZyBsb3dlciBiYW5kd2lkdGguCgpUaGlzIHBhdGNoIHRyaWVzIHRv
IGF2b2lkIHJlZHVuZGFudCByZWFkYWhlYWQgY2FsbHMuCgpGaXhlcyBvbmUgYnVpbGQgZXJyb3Ig
cmVwb3J0ZWQgYnkgUmFuZHkuCkZpeCBidWlsZCBlcnJvciB3aGVuIEYyRlNfRlNfQ09NUFJFU1NJ
T04gaXMgbm90IHNldC9lbmFibGVkLgpUaGlzIGxhYmVsIGlzIG5lZWRlZCBpbiBlaXRoZXIgY2Fz
ZS4KCi4uL2ZzL2YyZnMvZGF0YS5jOiBJbiBmdW5jdGlvbiDigJhmMmZzX21wYWdlX3JlYWRwYWdl
c+KAmToKLi4vZnMvZjJmcy9kYXRhLmM6MjMyNzo1OiBlcnJvcjogbGFiZWwg4oCYbmV4dF9wYWdl
4oCZIHVzZWQgYnV0IG5vdCBkZWZpbmVkCiAgICAgZ290byBuZXh0X3BhZ2U7CgpSZXZpZXdlZC1i
eTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtp
bSA8amFlZ2V1a0BrZXJuZWwub3JnPgotLS0KIHY0OgogIC0gZml4IG1pc3NpbmcgdW5sb2NrX3Bh
Z2UKIHYzOgogIC0gdXNlIFJFQUR8V1JJVEVfT05DRQogdjI6CiAgIC0gYWRkIG1pc3NpbmcgY29k
ZSB0byBieXBhc3MgcmVhZAoKIGZzL2YyZnMvZGF0YS5jICB8IDIwICsrKysrKysrKysrKysrKysr
KysrCiBmcy9mMmZzL2YyZnMuaCAgfCAgMSArCiBmcy9mMmZzL3N1cGVyLmMgfCAgMiArKwogMyBm
aWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCA5OTVjZjc4YjIzYzVlLi4wNjZkMjk5MzhjMDNhIDEw
MDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEuYwpAQCAtMjI5Niw2
ICsyMjk2LDcgQEAgc3RhdGljIGludCBmMmZzX21wYWdlX3JlYWRwYWdlcyhzdHJ1Y3QgaW5vZGUg
Kmlub2RlLAogCXVuc2lnbmVkIG5yX3BhZ2VzID0gcmFjID8gcmVhZGFoZWFkX2NvdW50KHJhYykg
OiAxOwogCXVuc2lnbmVkIG1heF9ucl9wYWdlcyA9IG5yX3BhZ2VzOwogCWludCByZXQgPSAwOwor
CWJvb2wgZHJvcF9yYSA9IGZhbHNlOwogCiAJbWFwLm1fcGJsayA9IDA7CiAJbWFwLm1fbGJsayA9
IDA7CkBAIC0yMzA2LDEwICsyMzA3LDI2IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFn
ZXMoc3RydWN0IGlub2RlICppbm9kZSwKIAltYXAubV9zZWdfdHlwZSA9IE5PX0NIRUNLX1RZUEU7
CiAJbWFwLm1fbWF5X2NyZWF0ZSA9IGZhbHNlOwogCisJLyoKKwkgKiBUd28gcmVhZGFoZWFkIHRo
cmVhZHMgZm9yIHNhbWUgYWRkcmVzcyByYW5nZSBjYW4gY2F1c2UgcmFjZSBjb25kaXRpb24KKwkg
KiB3aGljaCBmcmFnbWVudHMgc2VxdWVudGlhbCByZWFkIElPcy4gU28gbGV0J3MgYXZvaWQgZWFj
aCBvdGhlci4KKwkgKi8KKwlpZiAocmFjICYmIHJlYWRhaGVhZF9jb3VudChyYWMpKSB7CisJCWlm
IChSRUFEX09OQ0UoRjJGU19JKGlub2RlKS0+cmFfb2Zmc2V0KSA9PSByZWFkYWhlYWRfaW5kZXgo
cmFjKSkKKwkJCWRyb3BfcmEgPSB0cnVlOworCQllbHNlCisJCQlXUklURV9PTkNFKEYyRlNfSShp
bm9kZSktPnJhX29mZnNldCwKKwkJCQkJCXJlYWRhaGVhZF9pbmRleChyYWMpKTsKKwl9CisKIAlm
b3IgKDsgbnJfcGFnZXM7IG5yX3BhZ2VzLS0pIHsKIAkJaWYgKHJhYykgewogCQkJcGFnZSA9IHJl
YWRhaGVhZF9wYWdlKHJhYyk7CiAJCQlwcmVmZXRjaHcoJnBhZ2UtPmZsYWdzKTsKKwkJCWlmIChk
cm9wX3JhKSB7CisJCQkJZjJmc19wdXRfcGFnZShwYWdlLCAxKTsKKwkJCQljb250aW51ZTsKKwkJ
CX0KIAkJfQogCiAjaWZkZWYgQ09ORklHX0YyRlNfRlNfQ09NUFJFU1NJT04KQEAgLTIzNzIsNiAr
MjM4OSw5IEBAIHN0YXRpYyBpbnQgZjJmc19tcGFnZV9yZWFkcGFnZXMoc3RydWN0IGlub2RlICpp
bm9kZSwKIAl9CiAJaWYgKGJpbykKIAkJX19zdWJtaXRfYmlvKEYyRlNfSV9TQihpbm9kZSksIGJp
bywgREFUQSk7CisKKwlpZiAocmFjICYmIHJlYWRhaGVhZF9jb3VudChyYWMpICYmICFkcm9wX3Jh
KQorCQlXUklURV9PTkNFKEYyRlNfSShpbm9kZSktPnJhX29mZnNldCwgLTEpOwogCXJldHVybiBy
ZXQ7CiB9CiAKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKaW5k
ZXggNmE2NTVlZGViNTIyZi4uZTZlNDc2MThhMzU3NiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9mMmZz
LmgKKysrIGIvZnMvZjJmcy9mMmZzLmgKQEAgLTgwOSw2ICs4MDksNyBAQCBzdHJ1Y3QgZjJmc19p
bm9kZV9pbmZvIHsKIAlzdHJ1Y3QgbGlzdF9oZWFkIGlubWVtX3BhZ2VzOwkvKiBpbm1lbW9yeSBw
YWdlcyBtYW5hZ2VkIGJ5IGYyZnMgKi8KIAlzdHJ1Y3QgdGFza19zdHJ1Y3QgKmlubWVtX3Rhc2s7
CS8qIHN0b3JlIGlubWVtb3J5IHRhc2sgKi8KIAlzdHJ1Y3QgbXV0ZXggaW5tZW1fbG9jazsJLyog
bG9jayBmb3IgaW5tZW1vcnkgcGFnZXMgKi8KKwlwZ29mZl90IHJhX29mZnNldDsJCS8qIG9uZ29p
bmcgcmVhZGFoZWFkIG9mZnNldCAqLwogCXN0cnVjdCBleHRlbnRfdHJlZSAqZXh0ZW50X3RyZWU7
CS8qIGNhY2hlZCBleHRlbnRfdHJlZSBlbnRyeSAqLwogCiAJLyogYXZvaWQgcmFjaW5nIGJldHdl
ZW4gZm9yZWdyb3VuZCBvcCBhbmQgZ2MgKi8KZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBi
L2ZzL2YyZnMvc3VwZXIuYwppbmRleCA3MzI2NTIyMDU3Mzc4Li44MGNiN2NkMzU4Zjg0IDEwMDY0
NAotLS0gYS9mcy9mMmZzL3N1cGVyLmMKKysrIGIvZnMvZjJmcy9zdXBlci5jCkBAIC0xMDE1LDYg
KzEwMTUsOCBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpmMmZzX2FsbG9jX2lub2RlKHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IpCiAJLyogV2lsbCBiZSB1c2VkIGJ5IGRpcmVjdG9yeSBvbmx5ICovCiAJ
ZmktPmlfZGlyX2xldmVsID0gRjJGU19TQihzYiktPmRpcl9sZXZlbDsKIAorCWZpLT5yYV9vZmZz
ZXQgPSAtMTsKKwogCXJldHVybiAmZmktPnZmc19pbm9kZTsKIH0KIAotLSAKMi4yNy4wLjIxMi5n
ZThiYTFjYzk4OC1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
