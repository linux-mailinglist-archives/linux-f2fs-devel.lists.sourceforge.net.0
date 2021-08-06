Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2733E234E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 08:35:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBtSQ-0000BE-AI; Fri, 06 Aug 2021 06:35:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hare@suse.de>) id 1mBtSP-0000B1-0F
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2bB2yS4V99IZITU8iThfrjPKq0hHxHHv8PEmoSddKs8=; b=k1L6oXandEwrdGxURb3o7aGZK8
 1e6hmNGW/lcgV4dxD+rnKWYuvz1sO5BPa0PlRpJrNKo1ZDNoSzRhF1txnCskawm1VumyCpNTJ08N+
 af3kvyOEMqL8uKUsLcm6yqhVQkBYwrXLMV/KJYPVt3DgnIxiVaZz+07iz9ZwBum6hirY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2bB2yS4V99IZITU8iThfrjPKq0hHxHHv8PEmoSddKs8=; b=S61nZVzhZAlPF8rhyrSEEtDLJv
 sdGiQhDfGKoLos0JHQaPSHkLFnUGXqKrwckwP0CXONA05H+4EtWYFuuqSLq/Wy4h8EibnssL1rOYE
 UJc09e9odjRlqDvAKKR0DxrEtfP5DzAY/bqJ+pkW+GGQFKOn0K+1dY+c8e9SbtczsRfQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mBtSI-00EKGJ-2K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 06:35:48 +0000
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8006223A4;
 Fri,  6 Aug 2021 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628231735; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bB2yS4V99IZITU8iThfrjPKq0hHxHHv8PEmoSddKs8=;
 b=0rCSLgq5KvGNjxZe18T2x5As53FS/n5fQp9veSlBx0+OPJdqpRLMD672cYYOPBcrbbmp8Y
 GAYr97WXrTyXD2281MY7gByTLM5i+y8xa5I5jUu/6kv3acI6UwVac59y1/YELI4owV9OV0
 fxIQhyZ1RNVER61kFXbXr3VUKaQrjRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628231735;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bB2yS4V99IZITU8iThfrjPKq0hHxHHv8PEmoSddKs8=;
 b=gLVAygpStWv47ae+zEEjzvGahnv/RLLhjFwGwMQFIsXVKlYhT8KjAF1PlAoSLE1OlN6Yk6
 3fJC57KQ6dz3cVCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 845DC136D9;
 Fri,  6 Aug 2021 06:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id riq/HjfYDGEOBgAAGKfGzw
 (envelope-from <hare@suse.de>); Fri, 06 Aug 2021 06:35:35 +0000
To: Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
 <20210806051140.301127-3-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <6fdc9b02-d03f-a63f-cefb-1d00ac42b885@suse.de>
Date: Fri, 6 Aug 2021 08:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806051140.301127-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.6 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1mBtSI-00EKGJ-2K
Subject: Re: [f2fs-dev] [PATCH v2 2/4] block: fix ioprio interface
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC82LzIxIDc6MTEgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IEFuIGlvY2IgYWlvX3Jl
cXByaW8gZmllbGQgaXMgMTYtYml0cyAodTE2KSBidXQgb2Z0ZW4gaGFuZGxlZCBhcyBhbiBpbnQK
PiBpbiB0aGUgYmxvY2sgbGF5ZXIuIEUuZy4gaW9wcmlvX2NoZWNrX2NhcCgpIHRha2VzIGFuIGlu
dCBhcyBhcmd1bWVudC4KPiBXaXRoIHN1Y2ggaW1wbGljaXQgaW50IGNhc3RpbmcgZnVuY3Rpb24g
Y2FsbHMsIHRoZSB1cHBlciAxNi1iaXRzIG9mIHRoZQo+IGludCBhcmd1bWVudCBtYXkgYmUgbGVm
dCB1bmluaXRpYWxpemVkIGJ5IHRoZSBjb21waWxlciwgcmVzdWx0aW5nIGluCj4gaW52YWxpZCB2
YWx1ZXMgZm9yIHRoZSBJT1BSSU9fUFJJT19DTEFTUygpIG1hY3JvIChnYXJiYWdlIHVwcGVyIGJp
dHMpCj4gYW5kIGluIGFuIGVycm9yIHJldHVybiBmb3IgZnVuY3Rpb25zIHN1Y2ggYXMgaW9wcmlv
X2NoZWNrX2NhcCgpLgo+IAo+IEZpeCB0aGlzIGJ5IG1hc2tpbmcgdGhlIHJlc3VsdCBvZiB0aGUg
c2hpZnQgYnkgSU9QUklPX0NMQVNTX1NISUZUIGJpdHMKPiBpbiB0aGUgSU9QUklPX1BSSU9fQ0xB
U1MoKSBtYWNyby4gVGhlIG5ldyBtYWNybyBJT1BSSU9fQ0xBU1NfTUFTSwo+IGRlZmluZXMgdGhl
IDMtYml0cyBtYXNrIGZvciB0aGUgcHJpb3JpdHkgY2xhc3MuCj4gCj4gV2hpbGUgYXQgaXQsIGNs
ZWFudXAgdGhlIGZvbGxvd2luZzoKPiAqIEFwcGx5IHRoZSBtYXNrIElPUFJJT19QUklPX01BU0sg
dG8gdGhlIGRhdGEgYXJndW1lbnQgb2YgdGhlCj4gICAgSU9QUklPX1BSSU9fVkFMVUUoKSBtYWNy
byB0byBpZ25vcmUgdXBwZXIgYml0cyBvZiB0aGUgZGF0YSB2YWx1ZS4KPiAqIFJlbW92ZSB1bm5l
Y2Vzc2FyeSBwYXJlbnRoZXNpcyBhcm91bmQgZml4ZWQgdmFsdWVzIGluIHRoZSBtYWNybwo+ICAg
IGRlZmluaXRpb25zIGluIGluY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaC4KPiAqIFVwZGF0ZSB0
aGUgb3V0ZGF0ZWQgbWVudGlvbiBvZiBDRlEgaW4gdGhlIGNvbW1lbnQgZGVzY3JpYmluZyBwcmlv
cml0eQo+ICAgIGNsYXNzZXMgYW5kIGluc3RlYWQgbWVudGlvbiBCRlEgYW5kIG1xLWRlYWRsaW5l
Lgo+ICogQ2hhbmdlIHRoZSBhcmd1bWVudCBuYW1lIG9mIHRoZSBJT1BSSU9fUFJJT19DTEFTUygp
IGFuZAo+ICAgIElPUFJJT19QUklPX0RBVEEoKSBtYWNyb3MgZnJvbSAibWFzayIgdG8gImlvcHJp
byIgdG8gcmVmbGVjdCB0aGUgZmFjdAo+ICAgIHRoYXQgYW4gSU8gcHJpb3JpdHkgdmFsdWUgc2hv
dWxkIGJlIHBhc3NlZCByYXRoZXIgdGhhbiBhIG1hc2suCj4gKiBDaGFuZ2UgdGhlIGlvcHJpb192
YWxpZCgpIG1hY3JvIGludG8gYW4gaW5saW5lIGZ1bmN0aW9uLCBhZGRpbmcgYQo+ICAgIGNoZWNr
IG9uIHRoZSBtYXhpbXVtIHZhbHVlIG9mIHRoZSBjbGFzcyBvZiBhIHByaW9yaXR5IHZhbHVlIGFz
Cj4gICAgZGVmaW5lZCBieSB0aGUgSU9QUklPX0NMQVNTX01BWCBlbnVtIHZhbHVlLiBNb3ZlIHRo
aXMgZnVuY3Rpb24gdG8KPiAgICB0aGUga2VybmVsIHNpZGUgaW4gaW5jbHVkZS9saW51eC9pb3By
aW8uaC4KPiAqIFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgImVsc2UiIGFmdGVyIHRoZSByZXR1cm4g
c3RhdGVtZW50cyBpbgo+ICAgIHRhc2tfbmljZV9pb2NsYXNzKCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KPiAtLS0KPiAgIGluY2x1
ZGUvbGludXgvaW9wcmlvLmggICAgICB8IDE1ICsrKysrKysrKysrKy0tLQo+ICAgaW5jbHVkZS91
YXBpL2xpbnV4L2lvcHJpby5oIHwgMTkgKysrKysrKysrKystLS0tLS0tLQo+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9pb3ByaW8uaCBiL2luY2x1ZGUvbGludXgvaW9wcmlvLmgKPiBpbmRl
eCBlZjlhZDRmYjI0NWYuLjliM2E2ZDgxNzJiNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2lvcHJpby5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9pb3ByaW8uaAo+IEBAIC04LDYgKzgsMTYg
QEAKPiAgIAo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvaW9wcmlvLmg+Cj4gICAKPiArLyoKPiAr
ICogQ2hlY2sgdGhhdCBhIHByaW9yaXR5IHZhbHVlIGhhcyBhIHZhbGlkIGNsYXNzLgo+ICsgKi8K
PiArc3RhdGljIGlubGluZSBib29sIGlvcHJpb192YWxpZCh1bnNpZ25lZCBzaG9ydCBpb3ByaW8p
CgpXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gdXNlICd1MTYnIGhlcmUgYXMgdHlwZSwgYXMgd2Un
cmUgcmVseWluZyBvbiB0aGUgCm51bWJlciBvZiBiaXRzPwoKPiArewo+ICsJdW5zaWduZWQgc2hv
cnQgY2xhc3MgPSBJT1BSSU9fUFJJT19DTEFTUyhpb3ByaW8pOwo+ICsKPiArCXJldHVybiBjbGFz
cyA+IElPUFJJT19DTEFTU19OT05FICYmIGNsYXNzIDwgSU9QUklPX0NMQVNTX01BWDsKPiArfQo+
ICsKPiAgIC8qCj4gICAgKiBpZiBwcm9jZXNzIGhhcyBzZXQgaW8gcHJpb3JpdHkgZXhwbGljaXRs
eSwgdXNlIHRoYXQuIGlmIG5vdCwgY29udmVydAo+ICAgICogdGhlIGNwdSBzY2hlZHVsZXIgbmlj
ZSB2YWx1ZSB0byBhbiBpbyBwcmlvcml0eQo+IEBAIC0yNSwxMCArMzUsOSBAQCBzdGF0aWMgaW5s
aW5lIGludCB0YXNrX25pY2VfaW9jbGFzcyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2spCj4gICB7
Cj4gICAJaWYgKHRhc2stPnBvbGljeSA9PSBTQ0hFRF9JRExFKQo+ICAgCQlyZXR1cm4gSU9QUklP
X0NMQVNTX0lETEU7Cj4gLQllbHNlIGlmICh0YXNrX2lzX3JlYWx0aW1lKHRhc2spKQo+ICsJaWYg
KHRhc2tfaXNfcmVhbHRpbWUodGFzaykpCj4gICAJCXJldHVybiBJT1BSSU9fQ0xBU1NfUlQ7Cj4g
LQllbHNlCj4gLQkJcmV0dXJuIElPUFJJT19DTEFTU19CRTsKPiArCXJldHVybiBJT1BSSU9fQ0xB
U1NfQkU7Cj4gICB9Cj4gICAKPiAgIC8qCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51
eC9pb3ByaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaAo+IGluZGV4IDc3YjE3ZTA4
YjBkYS4uYWJjNDA5NjVhYTk2IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9pb3By
aW8uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaAo+IEBAIC01LDEyICs1LDE1
IEBACj4gICAvKgo+ICAgICogR2l2ZXMgdXMgOCBwcmlvIGNsYXNzZXMgd2l0aCAxMy1iaXRzIG9m
IGRhdGEgZm9yIGVhY2ggY2xhc3MKPiAgICAqLwo+IC0jZGVmaW5lIElPUFJJT19DTEFTU19TSElG
VAkoMTMpCj4gKyNkZWZpbmUgSU9QUklPX0NMQVNTX1NISUZUCTEzCj4gKyNkZWZpbmUgSU9QUklP
X0NMQVNTX01BU0sJMHgwNwo+ICAgI2RlZmluZSBJT1BSSU9fUFJJT19NQVNLCSgoMVVMIDw8IElP
UFJJT19DTEFTU19TSElGVCkgLSAxKQo+ICAgCj4gLSNkZWZpbmUgSU9QUklPX1BSSU9fQ0xBU1Mo
bWFzaykJKChtYXNrKSA+PiBJT1BSSU9fQ0xBU1NfU0hJRlQpCj4gLSNkZWZpbmUgSU9QUklPX1BS
SU9fREFUQShtYXNrKQkoKG1hc2spICYgSU9QUklPX1BSSU9fTUFTSykKPiAtI2RlZmluZSBJT1BS
SU9fUFJJT19WQUxVRShjbGFzcywgZGF0YSkJKCgoY2xhc3MpIDw8IElPUFJJT19DTEFTU19TSElG
VCkgfCBkYXRhKQo+ICsjZGVmaW5lIElPUFJJT19QUklPX0NMQVNTKGlvcHJpbykJXAo+ICsJKCgo
aW9wcmlvKSA+PiBJT1BSSU9fQ0xBU1NfU0hJRlQpICYgSU9QUklPX0NMQVNTX01BU0spCj4gKyNk
ZWZpbmUgSU9QUklPX1BSSU9fREFUQShpb3ByaW8pCSgoaW9wcmlvKSAmIElPUFJJT19QUklPX01B
U0spCj4gKyNkZWZpbmUgSU9QUklPX1BSSU9fVkFMVUUoY2xhc3MsIGRhdGEpCVwKPiArCSgoKGNs
YXNzKSA8PCBJT1BSSU9fQ0xBU1NfU0hJRlQpIHwgKChkYXRhKSAmIElPUFJJT19QUklPX01BU0sp
KQo+ICAgCj4gICAvKgo+ICAgICogVGhlc2UgYXJlIHRoZSBpbyBwcmlvcml0eSBncm91cHMgYXMg
aW1wbGVtZW50ZWQgYnkgQ0ZRLiBSVCBpcyB0aGUgcmVhbHRpbWUKPiBAQCAtMjMsMTQgKzI2LDE0
IEBAIGVudW0gewo+ICAgCUlPUFJJT19DTEFTU19SVCwKPiAgIAlJT1BSSU9fQ0xBU1NfQkUsCj4g
ICAJSU9QUklPX0NMQVNTX0lETEUsCj4gLX07Cj4gICAKPiAtI2RlZmluZSBpb3ByaW9fdmFsaWQo
bWFzaykJKElPUFJJT19QUklPX0NMQVNTKChtYXNrKSkgIT0gSU9QUklPX0NMQVNTX05PTkUpCj4g
KwlJT1BSSU9fQ0xBU1NfTUFYLAo+ICt9Owo+ICAgCj4gICAvKgo+ICAgICogOCBiZXN0IGVmZm9y
dCBwcmlvcml0eSBsZXZlbHMgYXJlIHN1cHBvcnRlZAo+ICAgICovCj4gLSNkZWZpbmUgSU9QUklP
X0JFX05SCSg4KQo+ICsjZGVmaW5lIElPUFJJT19CRV9OUgk4Cj4gICAKPiAgIGVudW0gewo+ICAg
CUlPUFJJT19XSE9fUFJPQ0VTUyA9IDEsCj4gQEAgLTQxLDYgKzQ0LDYgQEAgZW51bSB7Cj4gICAv
Kgo+ICAgICogRmFsbGJhY2sgQkUgcHJpb3JpdHllQHN1Cj4gICAgKi8KPiAtI2RlZmluZSBJT1BS
SU9fTk9STQkoNCkKPiArI2RlZmluZSBJT1BSSU9fTk9STQk0Cj4gICAKPiAgICNlbmRpZiAvKiBf
VUFQSV9MSU5VWF9JT1BSSU9fSCAqLwo+IApPdGhlciB0aGFuIHRoYXQ6CgpSZXZpZXdlZC1ieTog
SGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBI
YW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0Cmhh
cmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJ
bWVuZMO2cmZmZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
