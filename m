Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B03C54A4A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 22:42:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x29G2+wL1xBpPU19T6KtXu+C+gYlUtEEFXzboPcsss=; b=CEcjGAjVgDUhXZ5hNAVjMD7n6T
	sz4Cb70HkJjPGkjAFj/O4hrHJMd1zMATNapc0kGoYnHoFK2SBv3Ka6LVyRhINs8sI9oWO2/zP/rPD
	aFlzgnkrZF8Ys737G2rYqkEZkJ1AH4GKYV76MA5Q7J8wI0B7cfbTB+vyLGABHtVMVnd0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJIbY-0005jM-RJ;
	Wed, 12 Nov 2025 21:42:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vJIbW-0005jE-1o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 21:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TfwQj1hXv0PiCAS4tf7LQ/P55M4/iLVzBC9fsoU05eM=; b=cCh6fBui6cyh7jj326ivdzZMYw
 8Y9oD9foiNTxlo9K52iYIX34Cjk80lflTFfv+5f/3b7jzsTJlKtMV2B4YV09oqDMFolWcNWQzjeed
 2RQ9oAbq5PAX/ZsmG4Ws6xmT9wFLgkAMZyqtQD3WMhYpOdX53fX5fn/tAAQVnHaFgN/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TfwQj1hXv0PiCAS4tf7LQ/P55M4/iLVzBC9fsoU05eM=; b=Unf9wCi82JjbDf5yor1DrkVm5j
 GLkitXZUzGNyIMaDvHwsTtaoXdYwV/p4Y2kNc5wKBf9QHQ3f2ChKNltafZmn4pgMX7tH6BzxWz9ce
 CFAqppNPl0VSQimz6bylyWMOnc8VflLDJ9i06SEiQDT6y0DusF8fZZuiMMIUuK8gX3tY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJIbV-0005qG-Ha for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 21:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B8B943275;
 Wed, 12 Nov 2025 21:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA28C4CEF1;
 Wed, 12 Nov 2025 21:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762983723;
 bh=VD4P19UaxKvtlLkhlFIu6WSgVhQ2KEmIETkH+oHGGyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pU3D42Fsb1pzSJFT5IN7Knb8h6A4a1jlYMmNLaN8eJtYIb3PvX1nnOv88U6GmpFkF
 AiViUq2ediS+w/R++D6LD0Ek9u41RuwYGS24tGRM/so6xMLrCYxvhIVQKkzsVS1Zj+
 bhBRhPOcqAGbDqV2sHSKC7ZCbcgZdfrlvT8cHSgo4a73SA7fZaB7Wqu1/gSPxVTd/L
 PWYuC35bB8hIzZtfvoYFQmT3Ib2iqAQdxhQU1DTJF1/WQCeqZFpppvoQliRFOmFkF7
 JGE82kRribVvfrYybreXHnOW54/kwY8z5UhnWNF153WuHwSXkbZFbkEEuBMSHoz0If
 K4Y9s4KV9HiYQ==
Date: Wed, 12 Nov 2025 21:42:00 +0000
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
Message-ID: <aRT_KGOSGOGw3S4W@google.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This breaks the device giving 0 open zone which was working.
 Hence, I dropped the change. On 11/10, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > When emulating a ZNS SSD on qemu with
 zoned.max_open set to 0, the > F2FS can still be mounted successfully. The
 sysf [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vJIbV-0005qG-Ha
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

VGhpcyBicmVha3MgdGhlIGRldmljZSBnaXZpbmcgMCBvcGVuIHpvbmUgd2hpY2ggd2FzIHdvcmtp
bmcuIEhlbmNlLCBJIGRyb3BwZWQKdGhlIGNoYW5nZS4KCk9uIDExLzEwLCBZb25ncGVuZyBZYW5n
IHdyb3RlOgo+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+
IAo+IFdoZW4gZW11bGF0aW5nIGEgWk5TIFNTRCBvbiBxZW11IHdpdGggem9uZWQubWF4X29wZW4g
c2V0IHRvIDAsIHRoZQo+IEYyRlMgY2FuIHN0aWxsIGJlIG1vdW50ZWQgc3VjY2Vzc2Z1bGx5LiBU
aGUgc3lzZnMgZW50cnkgc2hvd3MKPiBzYmktPm1heF9vcGVuX3pvbmVzIGFzIFVJTlRfTUFYLgo+
IAo+IHJvb3RAZmVkb3JhLXZtOn4jIGNhdCAvc3lzL2Jsb2NrL252bWUwbjEvcXVldWUvem9uZWQK
PiBob3N0LW1hbmFnZWQKPiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9ibG9jay9udm1lMG4x
L3F1ZXVlL21heF9vcGVuX3pvbmVzCj4gMAo+IHJvb3RAZmVkb3JhLXZtOn4jIG1rZnMuZjJmcyAt
bSAtYyAvZGV2L252bWUwbjEgL2Rldi92ZGEKPiByb290QGZlZG9yYS12bTp+IyBtb3VudCAvZGV2
L3ZkYSAvbW50L2YyZnMvCj4gcm9vdEBmZWRvcmEtdm06fiMgY2F0IC9zeXMvZnMvZjJmcy92ZGEv
bWF4X29wZW5fem9uZXMKPiA0Mjk0OTY3Mjk1Cj4gCj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBz
YmktPm1heF9vcGVuX3pvbmVzIGlzIGluaXRpYWxpemVkIHRvIFVJTlRfTUFYCj4gYW5kIG9ubHkg
dXBkYXRlZCB3aGVuIHRoZSBkZXZpY2XigJlzIG1heF9vcGVuX3pvbmVzIGlzIGdyZWF0ZXIgdGhh
biAwLgo+IEhvd2V2ZXIsIGJvdGggdGhlIHNjc2kgZHJpdmVyIChzZF96YmNfcmVhZF96b25lcyBt
YXkgYXNzaWducyAwIHRvCj4gZGV2aWNlJ3MgbWF4X29wZW5fem9uZXMpIGFuZCB0aGUgbnZtZSBk
cml2ZXIgKG52bWVfcXVlcnlfem9uZV9pbmZvIGRvbid0Cj4gY2hlY2sgbWF4X29wZW5fem9uZXMp
IGFsbG93IG1heF9vcGVuX3pvbmVzIHRvIGJlIDAuCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUg
aXNzdWUgYnkgcHJldmVudGluZyBtb3VudGluZyBvbiB6b25lZCBTU0RzIHdoZW4KPiBtYXhfb3Bl
bl96b25lcyBpcyAwLCB3aGlsZSBzdGlsbCBhbGxvd2luZyBTTVIgSEREcyB0byBiZSBtb3VudGVk
Lgo+IGluaXRfYmxrel9pbmZvKCkgaXMgb25seSBjYWxsZWQgYnkgZjJmc19zY2FuX2RldmljZXMo
KSwgYW5kIHRoZQo+IGJsa3pvbmVkIGZlYXR1cmUgaGFzIGFscmVhZHkgYmVlbiBjaGVja2VkIHRo
ZXJlLiBTbywgdGhpcyBwYXRjaCBhbHNvCj4gcmVtb3ZlIHJlZHVuZGFudCB6b25lZCBkZXZpY2Ug
Y2hlY2tzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4
aWFvbWkuY29tPgo+IC0tLQo+ICBmcy9mMmZzL3N1cGVyLmMgfCAzNiArKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9m
MmZzL3N1cGVyLmMKPiBpbmRleCBkYjdhZmI4MDY0MTEuLjZkYzg5NDVlMjRhZiAxMDA2NDQKPiAt
LS0gYS9mcy9mMmZzL3N1cGVyLmMKPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiBAQCAtNDM1Mywy
MSArNDM1Myw2IEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBpbnQgZGV2aSkKPiAgCXVuc2lnbmVkIGludCBtYXhfb3Blbl96b25lczsKPiAgCWlu
dCByZXQ7Cj4gIAo+IC0JaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+IC0JCXJldHVy
biAwOwo+IC0KPiAtCWlmIChiZGV2X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikpIHsKPiAtCQlt
YXhfb3Blbl96b25lcyA9IGJkZXZfbWF4X29wZW5fem9uZXMoYmRldik7Cj4gLQkJaWYgKG1heF9v
cGVuX3pvbmVzICYmIChtYXhfb3Blbl96b25lcyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+IC0J
CQlzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4gLQkJaWYgKHNiaS0+bWF4
X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4gLQkJCWYyZnNf
ZXJyKHNiaSwKPiAtCQkJCSJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBu
ZWVkIGF0IGxlYXN0ICV1IG9wZW4gem9uZXMiLAo+IC0JCQkJc2JpLT5tYXhfb3Blbl96b25lcywg
RjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4gLQkJCXJldHVybiAtRUlOVkFMOwo+IC0J
CX0KPiAtCX0KPiAtCj4gIAl6b25lX3NlY3RvcnMgPSBiZGV2X3pvbmVfc2VjdG9ycyhiZGV2KTsK
PiAgCWlmIChzYmktPmJsb2Nrc19wZXJfYmxreiAmJiBzYmktPmJsb2Nrc19wZXJfYmxreiAhPQo+
ICAJCQkJU0VDVE9SX1RPX0JMT0NLKHpvbmVfc2VjdG9ycykpCj4gQEAgLTQzNzgsNiArNDM2Mywy
NyBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
aW50IGRldmkpCj4gIAlpZiAobnJfc2VjdG9ycyAmICh6b25lX3NlY3RvcnMgLSAxKSkKPiAgCQlG
REVWKGRldmkpLm5yX2Jsa3orKzsKPiAgCj4gKwltYXhfb3Blbl96b25lcyA9IGJkZXZfbWF4X29w
ZW5fem9uZXMoYmRldik7Cj4gKwlpZiAoIW1heF9vcGVuX3pvbmVzKSB7Cj4gKwkJLyoKPiArCQkg
KiBTU0RzIHJlcXVpcmUgbWF4X29wZW5fem9uZXMgPiAwIHRvIGJlIG1vdW50YWJsZS4KPiArCQkg
KiBGb3IgSEREcywgaWYgbWF4X29wZW5fem9uZXMgaXMgcmVwb3J0ZWQgYXMgMCwgaXQgZG9lc24n
dCBtYXR0ZXIsCj4gKwkJICogc2V0IGl0IHRvIEZERVYoZGV2aSkubnJfYmxrei4KPiArCQkgKi8K
PiArCQlpZiAoYmRldl9ub25yb3QoYmRldikpIHsKPiArCQkJZjJmc19lcnIoc2JpLCAiem9uZWQ6
IFNTRCBkZXZpY2UgJXMgd2l0aG91dCBvcGVuIHpvbmVzIiwgRkRFVihkZXZpKS5wYXRoKTsKPiAr
CQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJfQo+ICsJCW1heF9vcGVuX3pvbmVzID0gRkRFVihkZXZp
KS5ucl9ibGt6Owo+ICsJfQo+ICsJc2JpLT5tYXhfb3Blbl96b25lcyA9IG1pbl90KHVuc2lnbmVk
IGludCwgbWF4X29wZW5fem9uZXMsIHNiaS0+bWF4X29wZW5fem9uZXMpOwo+ICsJaWYgKHNiaS0+
bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4gKwkJZjJm
c19lcnIoc2JpLAo+ICsJCQkiem9uZWQ6IG1heCBvcGVuIHpvbmVzICV1IGlzIHRvbyBzbWFsbCwg
bmVlZCBhdCBsZWFzdCAldSBvcGVuIHpvbmVzIiwKPiArCQkJc2JpLT5tYXhfb3Blbl96b25lcywg
RjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9
Cj4gKwo+ICAJRkRFVihkZXZpKS5ibGt6X3NlcSA9IGYyZnNfa3Z6YWxsb2Moc2JpLAo+ICAJCQkJ
CUJJVFNfVE9fTE9OR1MoRkRFVihkZXZpKS5ucl9ibGt6KQo+ICAJCQkJCSogc2l6ZW9mKHVuc2ln
bmVkIGxvbmcpLAo+IC0tIAo+IDIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
