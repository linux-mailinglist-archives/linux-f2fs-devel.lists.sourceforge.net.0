Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E993BB0E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 05:02:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWok1-0000o8-9n;
	Thu, 25 Jul 2024 03:02:05 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWojz-0000nq-Cs
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dinahWWNWKVgxUr2QQ8r5vtDMN47K5jpbrU4x04fZmQ=; b=gl3Bjd1qM83h0Wl9iQnNSY6FXs
 OFVKY2Gm+jeCflNZcRRIQ/t4NP+wcxpR0XkowiDqaN8j1qVu6qtdq6jkGmk0pAJiN/8G5bVSQVJDo
 6kwBlI2cOD09FpbnAo7MoSUWXWBU7msgX0oGcKt+UNhWqg6HyqOfEF2ZrIpws+f7lRGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dinahWWNWKVgxUr2QQ8r5vtDMN47K5jpbrU4x04fZmQ=; b=Aiq+XifXe92xnApB4+FPBMWeJC
 JCRLiJ8Y22oX1ziMmPBukHJ9j7whDTBJRgypOZT+DOwej74FtMz4DHABa3fMyG37GO0GYvDGbM1jz
 ipuYTmAzd/y22XRcX6Pk500qYzz09SXbQ/8eT5WXCi0k4Q8+Fb6OVnTX60noIBq+5+ks=;
Received: from out-188.mta1.migadu.com ([95.215.58.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWojx-0003vm-OF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:02:03 +0000
Message-ID: <895360e3-97bb-4188-a91d-eaca3302bd43@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721876510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dinahWWNWKVgxUr2QQ8r5vtDMN47K5jpbrU4x04fZmQ=;
 b=t0bnRmiksgMcuV2n4/X74UTpJITvS5MrnJV4M93S6NWIOs2XsMr+6Kz8W7etk9BqNLgiLm
 WyW+SnXPb9G/KKg4743QNI4cw/8+OwX72AkIF3GAqZwoNi6QNrEMZbnhD9k/VEF+m8nY7q
 VR/2e2/7phjKq6pM1GTTV0CvBfSEfNI=
Date: Thu, 25 Jul 2024 11:01:33 +0800
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
References: <20240723083239.41533-1-youling.tang@linux.dev>
 <20240723083239.41533-2-youling.tang@linux.dev>
 <Zp-_RDk5n5431yyh@infradead.org>
 <0a63dfd1-ead3-4db3-a38c-2bc1db65f354@linux.dev>
 <ZqEhMCjdFwC3wF4u@infradead.org>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <ZqEhMCjdFwC3wF4u@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 24/07/2024 23:43, Christoph Hellwig wrote: > On Wed, Jul
 24, 2024 at 09:57:05AM +0800,
 Youling Tang wrote: >> module_init(initfn)/module_exit(exitfn)
 has two definitions (via MODULE): >> - buindin: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [95.215.58.188 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.188 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.188 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWojx-0003vm-OF
Subject: Re: [f2fs-dev] [PATCH 1/4] module: Add module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-f2fs-devel@lists.sourceforge.net, tytso@mit.edu,
 Arnd Bergmann <arnd@arndb.de>, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-btrfs@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjQvMDcvMjAyNCAyMzo0MywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gV2VkLCBK
dWwgMjQsIDIwMjQgYXQgMDk6NTc6MDVBTSArMDgwMCwgWW91bGluZyBUYW5nIHdyb3RlOgo+PiBt
b2R1bGVfaW5pdChpbml0Zm4pL21vZHVsZV9leGl0KGV4aXRmbikgaGFzIHR3byBkZWZpbml0aW9u
cyAodmlhIE1PRFVMRSk6Cj4+IC0gYnVpbmRpbjogdXNlcyBkb19pbml0Y2FsbHMoKSB0byBpdGVy
YXRlIG92ZXIgdGhlIGNvbnRlbnRzIG9mIHRoZSBzcGVjaWZpZWQKPj4gIMKgIHNlY3Rpb24gYW5k
IGV4ZWN1dGVzIGFsbCBpbml0Zm4gZnVuY3Rpb25zIGluIHRoZSBzZWN0aW9uIGluIHRoZSBvcmRl
ciBpbgo+PiAgwqAgd2hpY2ggdGhleSBhcmUgc3RvcmVkIChleGl0Zm4gaXMgbm90IHJlcXVpcmVk
KS4KPj4KPj4gLSBrbzogcnVuIGRvX2luaXRfbW9kdWxlKG1vZCktPmRvX29uZV9pbml0Y2FsbCht
b2QtPmluaXQpIHRvIGV4ZWN1dGUgaW5pdGZuCj4+ICDCoCBvZiB0aGUgc3BlY2lmaWVkIG1vZHVs
ZS4KPj4KPj4gSWYgd2UgY2hhbmdlIG1vZHVsZV9zdWJpbml0IHRvIHNvbWV0aGluZyBsaWtlIHRo
aXMsIG5vdCBjYWxsZWQgaW4KPj4gbW9kdWxlX2luaXQsCj4+IE5vdCBvbmx5IGRvIHdlIHdhbnQg
dG8gZW5zdXJlIHRoYXQgZXhpdCBpcyBleGVjdXRlZCBpbiByZXZlcnNlIG9yZGVyIG9mCj4+IGlu
aXQsIGJ1dCB3ZSBhbHNvIHdhbnQgdG8gZW5zdXJlIHRoZSBvcmRlciBvZiBpbml0Lgo+IFllcy4K
Pgo+PiBUaGlzIGRvZXMgbm90IGd1YXJhbnRlZSB0aGUgb3JkZXIgaW4gd2hpY2ggaW5pdCB3aWxs
IGJlIGV4ZWN1dGVkIChhbHRob3VnaAo+PiB0aGUgaW5pdC9leGl0IG9yZGVyIHdpbGwgcmVtYWlu
IHRoZSBzYW1lKQo+IEhtbSwgc28gdGhlIG5vcm1hbCBidWlsdC1pbiBpbml0Y2FsbHMgZGVwZW5k
IG9uIHRoZSBsaW5rIG9yZGVyLCBidXQgd2hlbgo+IHRoZXkgYXJlIGluIHRoZSBzYW1lIGZpbGUs
IHRoZSBjb21waWxlciBjYW4gcmVvcmRlciB0aGVtIGJlZm9yZSB3ZSBldmVuCj4gZ2V0IHRvIHRo
ZSBsaW5rZXIuCj4KPiBJIHdvbmRlciB3aGF0IGEgZ29vZCBzeW50YXggd291bGQgYmUgdG8gc3Rp
bGwgYXZvaWQgdGhlIGJvaWxlcnBsYXRlCj4gY29kZS4gIFdlJ2QgcHJvYmFibHkgbmVlZCBvbmUg
bWFjcm8gdG8gYWN0dWFsbHkgZGVmaW5lIHRoZSBpbml0L2V4aXQKPiB0YWJsZSBpbiBhIHNpbmds
ZSBzdGF0ZW1lbnQgc28gdGhhdCBpdCBjYW4ndCBiZSByZW9yZGVyZWQsIGJ1dCB0aGF0Cj4gd291
bGQgbG9zZSB0aGUgYWJpbGl0eSB0byBhY3R1YWxseSBkZWNsYXJlIHRoZSBtb2R1bGUgc3ViaW5p
dC9leGl0Cj4gaGFuZGxlcnMgaW4gbXVsdGlwbGUgZmlsZXMsIHdoaWNoIHJlYWxseSBpcyB0aGUg
YmlnZ2VzdCB3aW4gb2YgdGhpcwo+IHNjaGVtZSBhcyBpdCBhbGxvd3MgdG8ga2VlcCB0aGUgZnVu
Y3Rpb25zIHN0YXRpYyBpbnN0ZWFkIG9mIGV4cG9zaW5nCj4gdGhlbSB0byBvdGhlciBjb21waWxh
dGlvbiB1bml0cy4KPgo+IEFuZCBpbiBmYWN0IGV2ZW4gaW4geW91ciB0aHJlZSBjb252ZXJ0ZWQg
ZmlsZSBzeXN0ZW1zLCBtb3N0Cj4gc3ViaW5pdC9leGl0IGhhbmRsZXIgYXJlIGluIHNlcGFyYXRl
IGZpbGVzLCBzbyBtYXliZSBpbnN0ZWFkCj4gZW5mb3JjaW5nIHRoYXQgdGhlcmUgaXMganVzdCBv
bmUgcGVyIGZpbGUgYW5kIHNsaWdodGx5IHJlZmFjdG9yaW5nCj4gdGhlIGNvZGUgc28gdGhhdCB0
aGlzIGlzIHRoZSBjYXNlIG1pZ2h0IGJlIHRoZSBiZXN0IG9wdGlvbj8KLSBJdCBkb2Vzbid0IGZl
ZWwgZ29vZCB0byBoYXZlIG9ubHkgb25lIHN1YmluaXQvZXhpdCBpbiBhIGZpbGUuCiDCoCBBc3N1
bWluZyB0aGF0IHRoZXJlIGlzIG9ubHkgb25lIGZpbGUgaW4gZWFjaCBmaWxlLCBob3cgZG8gd2UK
IMKgIGVuc3VyZSB0aGF0IHRoZSBmaWxlcyBhcmUgbGlua2VkIGluIG9yZGVyPyhJcyBpdCBzb3J0
ZWQgYnkgKi5vCiDCoCBpbiB0aGUgTWFrZWZpbGU/KQoKLSBFdmVuIGlmIHRoZSBvcmRlciBvZiBl
YWNoIGluaXQgaXMgbGlua2VkIGNvcnJlY3RseSwgdGhlbiB0aGUKIMKgIHJ1bnRpbWUgd2lsbCBi
ZSBpdGVyYXRlZCB0aHJvdWdoIHRoZSAuc3ViaW5pdGNhbGwuaW5pdCBzZWN0aW9uLAogwqAgd2hp
Y2ggZXhlY3V0ZXMgZWFjaCBpbml0Zm4gaW4gc2VxdWVuY2UgKHNpbWlsYXIgdG8gZG9faW5pdGNh
bGxzKSwKIMKgIHdoaWNoIG1lYW5zIHRoYXQgbm8gb3RoZXIgY29kZSBjYW4gYmUgaW5zZXJ0ZWQg
YmV0d2VlbiBlYWNoIHN1YmluaXQuCgoKSWYgbW9kdWxlX3N1YmluaXQgaXMgY2FsbGVkIGluIG1v
ZHVsZV9pbml0LCBvdGhlciBjb2RlIGNhbiBiZSBpbnNlcnRlZApiZXR3ZWVuIHN1YmluaXQsIHNp
bWlsYXIgdG8gdGhlIGZvbGxvd2luZzoKCmBgYApzdGF0aWMgaW50IF9faW5pdCBpbml0X2V4YW1w
bGUodm9pZCkKewogwqDCoCDCoG1vZHVsZV9zdWJpbml0KGluaXRhLCBleGl0YSk7CgogwqDCoCDC
oG90aGVydGhpbmcuLi4KCiDCoMKgIMKgbW9kdWxlX3N1YmluaXQoaW5pdGIsIGV4aXRiKTsKCiDC
oMKgIMKgcmV0dXJuIDA7Cn0KCm1vZHVsZV9pbml0KGluaXRfZXhhbXBsZSk7CmBgYAoKSU1ITywg
bW9kdWxlX3N1YmluaXQoKSBtaWdodCBiZSBiZXR0ZXIgY2FsbGVkIGluIG1vZHVsZV9pbml0KCku
CgpUaGFua3MsCllvdWxpbmcuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
