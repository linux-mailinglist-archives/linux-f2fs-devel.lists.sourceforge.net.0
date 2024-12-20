Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB19F931A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2024 14:25:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tOd0n-00062g-Ia;
	Fri, 20 Dec 2024 13:25:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tOd0V-00062J-FT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X0fqqiv5emevvchjtc8+ty18Ta3BK3W1HWXIHmoNezs=; b=JKircOtjdLUFcTc7iHs0sguElh
 IpxaDmpVx5LVE+a4fcJiYOJP9d103lx9cOC7gl6M8C7q4V9fg4yfL7/7hZUIBqbt1igOqwH5SINqv
 mcyVQYSYLLDBQCOyyYvXRAg8CoetoMoRYDNUT4dtP5eEbbaZcCZZUhjxzlM1M2PIvX24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X0fqqiv5emevvchjtc8+ty18Ta3BK3W1HWXIHmoNezs=; b=B3aOBbg+gMK9FXSOvb2HX22dz2
 2e114IqlLKn9tS6+p0GpMvnkX13XkATgJqjSz3UWdWKQLH6VP3Qv9uYw3XW8WssC6LMivgEqm1hsB
 WthnLzffo/mL+C1YSIOdEg2gt2AqEaZTa+QZg5XIb61ACMFrEjVhTSNhMDce0dMWyrS4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tOd0V-0005wZ-2M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Dec 2024 13:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C739BA40692;
 Fri, 20 Dec 2024 13:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8CDC4CECD;
 Fri, 20 Dec 2024 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734701124;
 bh=Yta87VUwMia1CrtIoX6FjmRqr7P9ZH2m5Vj3eUSeHko=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=J7LY4loSMvmhosnx8BN9T+BBdTXpex8kGTxzS1TceB6MvMyiEgxMzWRsAxkhEKZEe
 Gj8oq7ca4lJF+gJyHsOe0eXEXCOrVdaomgSlvqfxVSFDRy5PZeOcYVCWXdExqvJb+R
 pXNVV2jVHRKkvLcwF0a1yxxgeMfJ40Y53txLUkt4vCO37zs7iFUt5WbysmJuaRYf8A
 ASrMYn1ZMr6RgNpBCN+TL24TtmDj8adAJu9rO9QU0gFJ4dhV71IfHktiRlwG3Ikr+i
 Y/CKPi+oZyRanPlQ0ypy1I4k0T/+3/pCC3mwcjKuGWCHSWNWOZvj1YDPrHE9z9tG/Q
 c+WZnaOVXGiXQ==
Message-ID: <9799a430-c1d9-4f04-9a8c-ad88fade8351@kernel.org>
Date: Fri, 20 Dec 2024 21:25:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>
References: <20241217075552.1167994-1-chullee@google.com>
 <31e9c60b-0fd1-4d98-baf9-cf02e44c367d@kernel.org>
 <CALBjLoBxtMQjKQXdzyt8x75--mT9nJZnoEpDArL56fg8JRPdTg@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CALBjLoBxtMQjKQXdzyt8x75--mT9nJZnoEpDArL56fg8JRPdTg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/12/20 12:59, Daniel Lee wrote: > On Thu, Dec 19, 2024
    at 5:29 AM Chao Yu <chao@kernel.org> wrote: >> >> Hi Daniel, >> >> On 2024/12/17
    15:55, Daniel Lee wrote: >>> This patch addresses an is [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tOd0V-0005wZ-2M
Subject: Re: [f2fs-dev] [PATCH] f2fs: Introduce linear search for dentries
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMi8yMCAxMjo1OSwgRGFuaWVsIExlZSB3cm90ZToKPiBPbiBUaHUsIERlYyAxOSwg
MjAyNCBhdCA1OjI54oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
SGkgRGFuaWVsLAo+Pgo+PiBPbiAyMDI0LzEyLzE3IDE1OjU1LCBEYW5pZWwgTGVlIHdyb3RlOgo+
Pj4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgYW4gaXNzdWUgd2hlcmUgc29tZSBmaWxlcyBpbiBjYXNl
LWluc2Vuc2l0aXZlCj4+PiBkaXJlY3RvcmllcyBiZWNvbWUgaW5hY2Nlc3NpYmxlIGR1ZSB0byBj
aGFuZ2VzIGluIGhvdyB0aGUga2VybmVsIGZ1bmN0aW9uLAo+Pj4gdXRmOF9jYXNlZm9sZCgpLCBn
ZW5lcmF0ZXMgY2FzZS1mb2xkZWQgc3RyaW5ncyBmcm9tIHRoZSBjb21taXQgNWMyNmQyZjFkM2Y1
Cj4+PiAoInVuaWNvZGU6IERvbid0IHNwZWNpYWwgY2FzZSBpZ25vcmFibGUgY29kZSBwb2ludHMi
KS4KPj4+Cj4+PiBGMkZTIHVzZXMgdGhlc2UgY2FzZS1mb2xkZWQgbmFtZXMgdG8gY2FsY3VsYXRl
IGhhc2ggdmFsdWVzIGZvciBsb2NhdGluZwo+Pj4gZGVudHJpZXMgYW5kIHN0b3JlcyB0aGVtIG9u
IGRpc2suIFNpbmNlIHV0ZjhfY2FzZWZvbGQoKSBjYW4gcHJvZHVjZQo+Pj4gZGlmZmVyZW50IG91
dHB1dCBhY3Jvc3Mga2VybmVsIHZlcnNpb25zLCBzdG9yZWQgaGFzaCB2YWx1ZXMgYW5kIG5ld2x5
Cj4+PiBjYWxjdWxhdGVkIGhhc2ggdmFsdWVzIG1heSBkaWZmZXIuIFRoaXMgcmVzdWx0cyBpbiBh
ZmZlY3RlZCBmaWxlcyBubwo+Pj4gbG9uZ2VyIGJlaW5nIGZvdW5kIHZpYSB0aGUgaGFzaC1iYXNl
ZCBsb29rdXAuCj4+Pgo+Pj4gVG8gcmVzb2x2ZSB0aGlzLCB0aGUgcGF0Y2ggaW50cm9kdWNlcyBh
IGxpbmVhciBzZWFyY2ggZmFsbGJhY2suCj4+PiBJZiB0aGUgaW5pdGlhbCBoYXNoLWJhc2VkIHNl
YXJjaCBmYWlscywgRjJGUyB3aWxsIHNlcXVlbnRpYWxseSBzY2FuIHRoZQo+Pj4gZGlyZWN0b3J5
IGVudHJpZXMuCj4+Pgo+Pgo+PiBOZWVkIGEgZml4ZXMgbGluZT8KPiAKPiBUaGFua3MuIEkgd2ls
bCBhZGQgdGhlIGNvbW1pdCA1YzI2ZDJmMWQzZjUgdG8gdGhlIEZpeGVzOgo+IAo+Pgo+Pj4gTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTk1ODYKPj4+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+
Pj4gICAgZnMvZjJmcy9kaXIuYyAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tCj4+PiAgICBmcy9mMmZzL2YyZnMuaCAgIHwgIDYgKysrKy0tCj4+PiAgICBmcy9m
MmZzL2lubGluZS5jIHwgIDUgKysrLS0KPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGly
LmMgYi9mcy9mMmZzL2Rpci5jCj4+PiBpbmRleCA0N2E1YzgwNmNmMTYuLmE4NWQxOWI0ZTE3OCAx
MDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGlyLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGlyLmMKPj4+
IEBAIC0xNzUsNyArMTc1LDggQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZGlyX2Jsb2NrX2luZGV4
KHVuc2lnbmVkIGludCBsZXZlbCwKPj4+ICAgIHN0YXRpYyBzdHJ1Y3QgZjJmc19kaXJfZW50cnkg
KmZpbmRfaW5fYmxvY2soc3RydWN0IGlub2RlICpkaXIsCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHBhZ2UgKmRlbnRyeV9wYWdlLAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmMmZzX2ZpbGVuYW1lICpmbmFtZSwKPj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAqbWF4X3Nsb3RzKQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW50ICptYXhfc2xvdHMsCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVjdCBm
MmZzX2RlbnRyeV9ibG9jayAqZGVudHJ5X2JsazsKPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kZW50
cnlfcHRyIGQ7Cj4+PiBAQCAtMTgzLDcgKzE4NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZjJmc19kaXJf
ZW50cnkgKmZpbmRfaW5fYmxvY2soc3RydWN0IGlub2RlICpkaXIsCj4+PiAgICAgICAgZGVudHJ5
X2JsayA9IChzdHJ1Y3QgZjJmc19kZW50cnlfYmxvY2sgKilwYWdlX2FkZHJlc3MoZGVudHJ5X3Bh
Z2UpOwo+Pj4KPj4+ICAgICAgICBtYWtlX2RlbnRyeV9wdHJfYmxvY2soZGlyLCAmZCwgZGVudHJ5
X2Jsayk7Cj4+PiAtICAgICByZXR1cm4gZjJmc19maW5kX3RhcmdldF9kZW50cnkoJmQsIGZuYW1l
LCBtYXhfc2xvdHMpOwo+Pj4gKyAgICAgcmV0dXJuIGYyZnNfZmluZF90YXJnZXRfZGVudHJ5KCZk
LCBmbmFtZSwgbWF4X3Nsb3RzLCB1c2VfaGFzaCk7Cj4+PiAgICB9Cj4+Pgo+Pj4gICAgc3RhdGlj
IGlubGluZSBpbnQgZjJmc19tYXRjaF9uYW1lKGNvbnN0IHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4g
QEAgLTIwOCw3ICsyMDksOCBAQCBzdGF0aWMgaW5saW5lIGludCBmMmZzX21hdGNoX25hbWUoY29u
c3Qgc3RydWN0IGlub2RlICpkaXIsCj4+PiAgICB9Cj4+Pgo+Pj4gICAgc3RydWN0IGYyZnNfZGly
X2VudHJ5ICpmMmZzX2ZpbmRfdGFyZ2V0X2RlbnRyeShjb25zdCBzdHJ1Y3QgZjJmc19kZW50cnlf
cHRyICpkLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmMmZzX2ZpbGVu
YW1lICpmbmFtZSwgaW50ICptYXhfc2xvdHMpCj4+PiArICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLCBpbnQgKm1heF9zbG90cywKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVj
dCBmMmZzX2Rpcl9lbnRyeSAqZGU7Cj4+PiAgICAgICAgdW5zaWduZWQgbG9uZyBiaXRfcG9zID0g
MDsKPj4+IEBAIC0yMzEsNyArMjMzLDcgQEAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmMmZzX2Zp
bmRfdGFyZ2V0X2RlbnRyeShjb25zdCBzdHJ1Y3QgZjJmc19kZW50cnlfcHRyICpkLAo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4+ICAgICAgICAgICAgICAgIH0KPj4+Cj4+
PiAtICAgICAgICAgICAgIGlmIChkZS0+aGFzaF9jb2RlID09IGZuYW1lLT5oYXNoKSB7Cj4+PiAr
ICAgICAgICAgICAgIGlmICghdXNlX2hhc2ggfHwgZGUtPmhhc2hfY29kZSA9PSBmbmFtZS0+aGFz
aCkgewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICByZXMgPSBmMmZzX21hdGNoX25hbWUoZC0+
aW5vZGUsIGZuYW1lLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZC0+ZmlsZW5hbWVbYml0X3Bvc10sCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShkZS0+bmFtZV9sZW4pKTsKPj4+IEBAIC0y
NTgsMTEgKzI2MCwxMiBAQCBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF90YXJnZXRf
ZGVudHJ5KGNvbnN0IHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4+PiAgICBzdGF0aWMgc3Ry
dWN0IGYyZnNfZGlyX2VudHJ5ICpmaW5kX2luX2xldmVsKHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxldmVs
LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlKQo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlLAo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKQo+Pj4gICAgewo+Pj4gICAg
ICAgIGludCBzID0gR0VUX0RFTlRSWV9TTE9UUyhmbmFtZS0+ZGlza19uYW1lLmxlbik7Cj4+PiAg
ICAgICAgdW5zaWduZWQgaW50IG5idWNrZXQsIG5ibG9jazsKPj4+IC0gICAgIHVuc2lnbmVkIGlu
dCBiaWR4LCBlbmRfYmxvY2s7Cj4+PiArICAgICB1bnNpZ25lZCBpbnQgYmlkeCwgZW5kX2Jsb2Nr
LCBidWNrZXRfbm87Cj4+PiAgICAgICAgc3RydWN0IHBhZ2UgKmRlbnRyeV9wYWdlOwo+Pj4gICAg
ICAgIHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZGUgPSBOVUxMOwo+Pj4gICAgICAgIHBnb2ZmX3Qg
bmV4dF9wZ29mczsKPj4+IEBAIC0yNzIsOCArMjc1LDExIEBAIHN0YXRpYyBzdHJ1Y3QgZjJmc19k
aXJfZW50cnkgKmZpbmRfaW5fbGV2ZWwoc3RydWN0IGlub2RlICpkaXIsCj4+PiAgICAgICAgbmJ1
Y2tldCA9IGRpcl9idWNrZXRzKGxldmVsLCBGMkZTX0koZGlyKS0+aV9kaXJfbGV2ZWwpOwo+Pj4g
ICAgICAgIG5ibG9jayA9IGJ1Y2tldF9ibG9ja3MobGV2ZWwpOwo+Pj4KPj4+ICsgICAgIGJ1Y2tl
dF9ubyA9IHVzZV9oYXNoID8gbGUzMl90b19jcHUoZm5hbWUtPmhhc2gpICUgbmJ1Y2tldCA6IDA7
Cj4+PiArCj4+PiArc3RhcnRfZmluZF9idWNrZXQ6Cj4+PiAgICAgICAgYmlkeCA9IGRpcl9ibG9j
a19pbmRleChsZXZlbCwgRjJGU19JKGRpciktPmlfZGlyX2xldmVsLAo+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBsZTMyX3RvX2NwdShmbmFtZS0+aGFzaCkgJSBuYnVja2V0KTsKPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVja2V0X25vKTsKPj4+ICAgICAgICBlbmRf
YmxvY2sgPSBiaWR4ICsgbmJsb2NrOwo+Pj4KPj4+ICAgICAgICB3aGlsZSAoYmlkeCA8IGVuZF9i
bG9jaykgewo+Pj4gQEAgLTI5MCw3ICsyOTYsNyBAQCBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2Vu
dHJ5ICpmaW5kX2luX2xldmVsKHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICB9Cj4+PiAgICAgICAgICAgICAgICB9Cj4+Pgo+Pj4gLSAgICAgICAgICAgICBkZSA9
IGZpbmRfaW5fYmxvY2soZGlyLCBkZW50cnlfcGFnZSwgZm5hbWUsICZtYXhfc2xvdHMpOwo+Pj4g
KyAgICAgICAgICAgICBkZSA9IGZpbmRfaW5fYmxvY2soZGlyLCBkZW50cnlfcGFnZSwgZm5hbWUs
ICZtYXhfc2xvdHMsIHVzZV9oYXNoKTsKPj4+ICAgICAgICAgICAgICAgIGlmIChJU19FUlIoZGUp
KSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICpyZXNfcGFnZSA9IEVSUl9DQVNUKGRlKTsK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgZGUgPSBOVUxMOwo+Pj4gQEAgLTMwNyw2ICszMTMs
OSBAQCBzdGF0aWMgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpmaW5kX2luX2xldmVsKHN0cnVjdCBp
bm9kZSAqZGlyLAo+Pj4gICAgICAgICAgICAgICAgYmlkeCsrOwo+Pj4gICAgICAgIH0KPj4+Cj4+
PiArICAgICBpZiAoIXVzZV9oYXNoICYmICFkZSAmJiArK2J1Y2tldF9ubyA8IG5idWNrZXQpCj4+
PiArICAgICAgICAgICAgIGdvdG8gc3RhcnRfZmluZF9idWNrZXQ7Cj4+PiArCj4+PiAgICAgICAg
aWYgKCFkZSAmJiByb29tICYmIEYyRlNfSShkaXIpLT5jaGFzaCAhPSBmbmFtZS0+aGFzaCkgewo+
Pgo+PiBEbyB3ZSBuZWVkIHRvIGF2b2lkIGFjY2Vzc2luZyBvciBhc3NpZ25pbmcgaGFzaCBpZiB1
c2VfaGFzaCBpcyBmYWxzZT8KPj4KPiAKPiBJcyBpdCBzdGlsbCB3b3J0aCBrZWVwaW5nIHRoZSBo
YXNoIGZvciB0aGUgY3JlYXRpb24gaWYgYm90aCBoYXNoLWJhc2VkCj4gYW5kIGxpbmVhciBzZWFy
Y2hlcyBmYWlsZWQ/CgpJdCBuZWVkcyB0byBiZSBrZXB0IGZvciBoYXNoLWJhc2VkIHNlYXJjaGlu
ZyBmYWlsdXJlPyBzaW5jZSBpdCB3YXMgYWRkZWQgdG8KZW5oYW5jZSBwZXJmb3JtYW5jZSBvZiBm
aWxlIGNyZWF0aW9uOgotIG9wZW4oLi4uLCBPX0NSRUFUKQogIC0gZjJmc19sb29rdXAKICA6IGRp
ZG4ndCBmaW5kIHRhcmdldCBkaXJlbnQsIHRoZW4sIHJlY29yZCBsYXN0IGNoYXNoICYgY2xldmVs
CiAgLSBmMmZzX2NyZWF0ZQogIDogY3JlYXRlIGRpcmVudCBpbiBjbGV2ZWwgYnVja2V0IG9uY2Ug
Y2hhc2ggbWF0Y2hlcwoKVGhhbmtzLAoKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4gICAgICAgICAgICAg
ICAgRjJGU19JKGRpciktPmNoYXNoID0gZm5hbWUtPmhhc2g7Cj4+PiAgICAgICAgICAgICAgICBG
MkZTX0koZGlyKS0+Y2xldmVsID0gbGV2ZWw7Cj4+PiBAQCAtMzIzLDExICszMzIsMTMgQEAgc3Ry
dWN0IGYyZnNfZGlyX2VudHJ5ICpfX2YyZnNfZmluZF9lbnRyeShzdHJ1Y3QgaW5vZGUgKmRpciwK
Pj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmRlID0gTlVMTDsKPj4+ICAgICAgICB1
bnNpZ25lZCBpbnQgbWF4X2RlcHRoOwo+Pj4gICAgICAgIHVuc2lnbmVkIGludCBsZXZlbDsKPj4+
ICsgICAgIGJvb2wgdXNlX2hhc2ggPSB0cnVlOwo+Pj4KPj4+ICAgICAgICAqcmVzX3BhZ2UgPSBO
VUxMOwo+Pj4KPj4+ICtzdGFydF9maW5kX2VudHJ5Ogo+Pj4gICAgICAgIGlmIChmMmZzX2hhc19p
bmxpbmVfZGVudHJ5KGRpcikpIHsKPj4+IC0gICAgICAgICAgICAgZGUgPSBmMmZzX2ZpbmRfaW5f
aW5saW5lX2RpcihkaXIsIGZuYW1lLCByZXNfcGFnZSk7Cj4+PiArICAgICAgICAgICAgIGRlID0g
ZjJmc19maW5kX2luX2lubGluZV9kaXIoZGlyLCBmbmFtZSwgcmVzX3BhZ2UsIHVzZV9oYXNoKTsK
Pj4+ICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Pj4gICAgICAgIH0KPj4+Cj4+PiBAQCAtMzQz
LDExICszNTQsMTggQEAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpfX2YyZnNfZmluZF9lbnRyeShz
dHJ1Y3QgaW5vZGUgKmRpciwKPj4+ICAgICAgICB9Cj4+Pgo+Pj4gICAgICAgIGZvciAobGV2ZWwg
PSAwOyBsZXZlbCA8IG1heF9kZXB0aDsgbGV2ZWwrKykgewo+Pj4gLSAgICAgICAgICAgICBkZSA9
IGZpbmRfaW5fbGV2ZWwoZGlyLCBsZXZlbCwgZm5hbWUsIHJlc19wYWdlKTsKPj4+ICsgICAgICAg
ICAgICAgZGUgPSBmaW5kX2luX2xldmVsKGRpciwgbGV2ZWwsIGZuYW1lLCByZXNfcGFnZSwgdXNl
X2hhc2gpOwo+Pj4gICAgICAgICAgICAgICAgaWYgKGRlIHx8IElTX0VSUigqcmVzX3BhZ2UpKQo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+ICAgICAgICB9Cj4+PiArCj4+PiAg
ICBvdXQ6Cj4+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX1VOSUNPREUpCj4+PiArICAgICBpZiAo
SVNfQ0FTRUZPTERFRChkaXIpICYmICFkZSAmJiB1c2VfaGFzaCkgewo+Pj4gKyAgICAgICAgICAg
ICB1c2VfaGFzaCA9IGZhbHNlOwo+Pj4gKyAgICAgICAgICAgICBnb3RvIHN0YXJ0X2ZpbmRfZW50
cnk7Cj4+PiArICAgICB9Cj4+PiArI2VuZGlmCj4+PiAgICAgICAgLyogVGhpcyBpcyB0byBpbmNy
ZWFzZSB0aGUgc3BlZWQgb2YgZjJmc19jcmVhdGUgKi8KPj4+ICAgICAgICBpZiAoIWRlKQo+Pj4g
ICAgICAgICAgICAgICAgRjJGU19JKGRpciktPnRhc2sgPSBjdXJyZW50Owo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+IGluZGV4IGY1MjNkZDMwMmJm
Ni4uMWFmZWJiOWM0MDYxIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBi
L2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtMzU4OCw3ICszNTg4LDggQEAgaW50IGYyZnNfcHJlcGFy
ZV9sb29rdXAoc3RydWN0IGlub2RlICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwKPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lKTsKPj4+ICAg
IHZvaWQgZjJmc19mcmVlX2ZpbGVuYW1lKHN0cnVjdCBmMmZzX2ZpbGVuYW1lICpmbmFtZSk7Cj4+
PiAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF90YXJnZXRfZGVudHJ5KGNvbnN0
IHN0cnVjdCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4+PiAtICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLCBpbnQgKm1heF9zbG90cyk7Cj4+PiArICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLCBpbnQg
Km1heF9zbG90cywKPj4+ICsgICAgICAgICAgICAgICAgICAgICBib29sIHVzZV9oYXNoKTsKPj4+
ICAgIGludCBmMmZzX2ZpbGxfZGVudHJpZXMoc3RydWN0IGRpcl9jb250ZXh0ICpjdHgsIHN0cnVj
dCBmMmZzX2RlbnRyeV9wdHIgKmQsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBzdGFydF9wb3MsIHN0cnVjdCBmc2NyeXB0X3N0ciAqZnN0cik7Cj4+PiAgICB2b2lkIGYy
ZnNfZG9fbWFrZV9lbXB0eV9kaXIoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGlub2RlICpw
YXJlbnQsCj4+PiBAQCAtNDIyNCw3ICs0MjI1LDggQEAgaW50IGYyZnNfd3JpdGVfaW5saW5lX2Rh
dGEoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZvbGlvICpmb2xpbyk7Cj4+PiAgICBpbnQg
ZjJmc19yZWNvdmVyX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdl
ICpucGFnZSk7Cj4+PiAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmluZF9pbl9pbmxp
bmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJlc19wYWdlKTsK
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBhZ2UgKipy
ZXNfcGFnZSwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCB1
c2VfaGFzaCk7Cj4+PiAgICBpbnQgZjJmc19tYWtlX2VtcHR5X2lubGluZV9kaXIoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGlub2RlICpwYXJlbnQsCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBwYWdlICppcGFnZSk7Cj4+PiAgICBpbnQgZjJmc19hZGRfaW5saW5lX2VudHJ5
KHN0cnVjdCBpbm9kZSAqZGlyLCBjb25zdCBzdHJ1Y3QgZjJmc19maWxlbmFtZSAqZm5hbWUsCj4+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbmxpbmUuYyBiL2ZzL2YyZnMvaW5saW5lLmMKPj4+IGlu
ZGV4IGNiZDJhMGQzNDgwNC4uM2UzYzM1ZDRjOThiIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9p
bmxpbmUuYwo+Pj4gKysrIGIvZnMvZjJmcy9pbmxpbmUuYwo+Pj4gQEAgLTM1Miw3ICszNTIsOCBA
QCBpbnQgZjJmc19yZWNvdmVyX2lubGluZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVj
dCBwYWdlICpucGFnZSkKPj4+Cj4+PiAgICBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYyZnNfZmlu
ZF9pbl9pbmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGYyZnNfZmlsZW5hbWUgKmZuYW1lLAo+
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqKnJl
c19wYWdlKQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cGFnZSAqKnJlc19wYWdlLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBib29sIHVzZV9oYXNoKQo+Pj4gICAgewo+Pj4gICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSA9IEYyRlNfU0IoZGlyLT5pX3NiKTsKPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19kaXJfZW50
cnkgKmRlOwo+Pj4gQEAgLTM2OSw3ICszNzAsNyBAQCBzdHJ1Y3QgZjJmc19kaXJfZW50cnkgKmYy
ZnNfZmluZF9pbl9pbmxpbmVfZGlyKHN0cnVjdCBpbm9kZSAqZGlyLAo+Pj4gICAgICAgIGlubGlu
ZV9kZW50cnkgPSBpbmxpbmVfZGF0YV9hZGRyKGRpciwgaXBhZ2UpOwo+Pj4KPj4+ICAgICAgICBt
YWtlX2RlbnRyeV9wdHJfaW5saW5lKGRpciwgJmQsIGlubGluZV9kZW50cnkpOwo+Pj4gLSAgICAg
ZGUgPSBmMmZzX2ZpbmRfdGFyZ2V0X2RlbnRyeSgmZCwgZm5hbWUsIE5VTEwpOwo+Pj4gKyAgICAg
ZGUgPSBmMmZzX2ZpbmRfdGFyZ2V0X2RlbnRyeSgmZCwgZm5hbWUsIE5VTEwsIHVzZV9oYXNoKTsK
Pj4+ICAgICAgICB1bmxvY2tfcGFnZShpcGFnZSk7Cj4+PiAgICAgICAgaWYgKElTX0VSUihkZSkp
IHsKPj4+ICAgICAgICAgICAgICAgICpyZXNfcGFnZSA9IEVSUl9DQVNUKGRlKTsKPj4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
