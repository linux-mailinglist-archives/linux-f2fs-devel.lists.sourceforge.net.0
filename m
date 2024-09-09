Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639D9711AB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 10:19:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snZbn-00031L-KR;
	Mon, 09 Sep 2024 08:18:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snZbi-00031D-J6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 08:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3+ZLKVXjJZEXL3iA9RjJzFAHfdxisCzNU1mEkx9SY0A=; b=h8nqqtq2oO+K6oJg5TdTswcEHj
 vnFyvO2U5I07993VZ+xzP6IAH7RH5WphqxFA7TuQPZ63WzqwAVroCsG8XMOOWRncShXn9kZMHgJqN
 AuwszOUAFPitO7tb4g72W5qSEgut1/h9GGmCWOZhCq4xn4BMZNidbwXiOgH5AdAO52pE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3+ZLKVXjJZEXL3iA9RjJzFAHfdxisCzNU1mEkx9SY0A=; b=d6rLBIA8AN0XUTckUGx7PLbAyv
 N32cBuogxVbnDaHJddTU4KqkU7evXVRclIURcMmBJnWrPl1XnRSEreIECScW50BCFSicHV9L5EgpO
 kYcricjlodGoRVqxxGYHbaBguWCgFIWNWiWIXJmt1J8SKEVf7r8nXwt0FL0D8rlWWgIQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snZbh-0007Co-2G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 08:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C0E1CA42862;
 Mon,  9 Sep 2024 08:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E770C4CEC5;
 Mon,  9 Sep 2024 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725869913;
 bh=6pIhKBMX99ed6ZhOuprT0MWJ+i/32rCsFoA36gmoqC4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YJmCaXTz9zqdihJDqbF7BWQPA7eMOtVvg7N4NoTsQcHTVt0kfD2AMqIh4gXJqgsIw
 ObbXUku90wH2+Z2EN5p+q+PZ2XWEq0mnI9wXE3IROvgq3OCjdPepGKiO8g4fy8aduv
 iq6bxkjnzw9cy3jQri1xxue64Wwym2Z+tH5d9B25CmrZBd/Zde2OZljRpAzVJAX5lS
 yXMdd2y2QqBBsI6FgpLERDUchAGIbZTiPdr3RSIyQf7QRwG3s+sAYDRkts4unqZvkq
 Ebw/aD2uUV+5673peA79lFatZlT4gJEO+cxj0YXZIPQCLb86gt1mH72p2Y5AC7csv4
 xMnDysPg7MOAQ==
Message-ID: <7559a11a-f234-418c-880b-34a0ecd1c9a9@kernel.org>
Date: Mon, 9 Sep 2024 16:18:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-2-daeho43@gmail.com>
 <501416af-b08c-448b-881d-0915575e22f5@kernel.org>
 <CACOAw_wgTOAQGJ3vbvp_Dqi_J0ZEsqWRFny-iczpyMD=kpxG-w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_wgTOAQGJ3vbvp_Dqi_J0ZEsqWRFny-iczpyMD=kpxG-w@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/9/7 4:23, Daeho Jeong wrote: > On Thu, Sep 5, 2024
    at 7:56 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/8/30 5:52, Daeho
    Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> > [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snZbh-0007Co-2G
Subject: Re: [f2fs-dev] [PATCH 2/7] f2fs: read summary blocks with the
 correct amount for migration_granularity
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzcgNDoyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gVGh1LCBTZXAgNSwgMjAy
NCBhdCA3OjU24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24g
MjAyNC84LzMwIDU6NTIsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gRnJvbTogRGFlaG8gSmVvbmcg
PGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Cj4+PiBOb3cgd2UgZG8gcmVhZGFoZWFkIGZvciBh
IGZ1bGwgc2VjdGlvbiBieSBub3QgY29uc2lkZXJpbmcKPj4+IG1pZ3JhdGlvbl9ncmFudWxhcml0
eSBhbmQgaXQgdHJpZ2dlcnMgdW5uZWNlc3NhcnkgcmVhZC4gU28sIG1ha2UgaXQgcmVhZAo+Pj4g
d2l0aCB0aGUgY29ycmVjdCBhbW91bnQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVv
bmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gICAgZnMvZjJmcy9nYy5jIHwg
MzMgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gaW5kZXggNDZlM2JjMjZiNzhhLi5iNWQz
ZmQ0MGIxN2EgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMv
Z2MuYwo+Pj4gQEAgLTE3MDgsMjQgKzE3MDgsMzMgQEAgc3RhdGljIGludCBkb19nYXJiYWdlX2Nv
bGxlY3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgICAgIHN0cnVjdCBibGtfcGx1
ZyBwbHVnOwo+Pj4gICAgICAgIHVuc2lnbmVkIGludCBzZWdubyA9IHN0YXJ0X3NlZ25vOwo+Pj4g
ICAgICAgIHVuc2lnbmVkIGludCBlbmRfc2Vnbm8gPSBzdGFydF9zZWdubyArIFNFR1NfUEVSX1NF
QyhzYmkpOwo+Pj4gKyAgICAgdW5zaWduZWQgaW50IHNlY19lbmRfc2Vnbm87Cj4+PiAgICAgICAg
aW50IHNlZ19mcmVlZCA9IDAsIG1pZ3JhdGVkID0gMDsKPj4+ICAgICAgICB1bnNpZ25lZCBjaGFy
IHR5cGUgPSBJU19EQVRBU0VHKGdldF9zZWdfZW50cnkoc2JpLCBzZWdubyktPnR5cGUpID8KPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1VNX1RZUEVf
REFUQSA6IFNVTV9UWVBFX05PREU7Cj4+PiAgICAgICAgdW5zaWduZWQgY2hhciBkYXRhX3R5cGUg
PSAodHlwZSA9PSBTVU1fVFlQRV9EQVRBKSA/IERBVEEgOiBOT0RFOwo+Pj4gICAgICAgIGludCBz
dWJtaXR0ZWQgPSAwOwo+Pj4KPj4+IC0gICAgIGlmIChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkK
Pj4+IC0gICAgICAgICAgICAgZW5kX3NlZ25vID0gcm91bmRkb3duKGVuZF9zZWdubywgU0VHU19Q
RVJfU0VDKHNiaSkpOwo+Pj4gKyAgICAgaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKSB7Cj4+
PiArICAgICAgICAgICAgIHNlY19lbmRfc2Vnbm8gPSByb3VuZGRvd24oZW5kX3NlZ25vLCBTRUdT
X1BFUl9TRUMoc2JpKSk7Cj4+Pgo+Pj4gLSAgICAgLyoKPj4+IC0gICAgICAqIHpvbmUtY2FwYWNp
dHkgY2FuIGJlIGxlc3MgdGhhbiB6b25lLXNpemUgaW4gem9uZWQgZGV2aWNlcywKPj4+IC0gICAg
ICAqIHJlc3VsdGluZyBpbiBsZXNzIHRoYW4gZXhwZWN0ZWQgdXNhYmxlIHNlZ21lbnRzIGluIHRo
ZSB6b25lLAo+Pj4gLSAgICAgICogY2FsY3VsYXRlIHRoZSBlbmQgc2Vnbm8gaW4gdGhlIHpvbmUg
d2hpY2ggY2FuIGJlIGdhcmJhZ2UgY29sbGVjdGVkCj4+PiAtICAgICAgKi8KPj4+IC0gICAgIGlm
IChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+Pj4gLSAgICAgICAgICAgICBlbmRfc2Vnbm8g
LT0gU0VHU19QRVJfU0VDKHNiaSkgLQo+Pj4gKyAgICAgICAgICAgICAvKgo+Pj4gKyAgICAgICAg
ICAgICAgKiB6b25lLWNhcGFjaXR5IGNhbiBiZSBsZXNzIHRoYW4gem9uZS1zaXplIGluIHpvbmVk
IGRldmljZXMsCj4+PiArICAgICAgICAgICAgICAqIHJlc3VsdGluZyBpbiBsZXNzIHRoYW4gZXhw
ZWN0ZWQgdXNhYmxlIHNlZ21lbnRzIGluIHRoZSB6b25lLAo+Pj4gKyAgICAgICAgICAgICAgKiBj
YWxjdWxhdGUgdGhlIGVuZCBzZWdubyBpbiB0aGUgem9uZSB3aGljaCBjYW4gYmUgZ2FyYmFnZQo+
Pj4gKyAgICAgICAgICAgICAgKiBjb2xsZWN0ZWQKPj4+ICsgICAgICAgICAgICAgICovCj4+PiAr
ICAgICAgICAgICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgIHNlY19lbmRfc2Vnbm8gLT0gU0VHU19QRVJfU0VDKHNiaSkgLQo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc191c2FibGVfc2Vnc19pbl9z
ZWMoc2JpLCBzZWdubyk7Cj4+Pgo+Pj4gKyAgICAgICAgICAgICBpZiAoZ2NfdHlwZSA9PSBCR19H
QykKPj4+ICsgICAgICAgICAgICAgICAgICAgICBlbmRfc2Vnbm8gPSBzdGFydF9zZWdubyArIHNi
aS0+bWlncmF0aW9uX2dyYW51bGFyaXR5Owo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICBpZiAoZW5k
X3NlZ25vID4gc2VjX2VuZF9zZWdubykKPj4+ICsgICAgICAgICAgICAgICAgICAgICBlbmRfc2Vn
bm8gPSBzZWNfZW5kX3NlZ25vOwo+Pj4gKyAgICAgfQo+Pj4gKwo+Pj4gICAgICAgIHNhbml0eV9j
aGVja19zZWdfdHlwZShzYmksIGdldF9zZWdfZW50cnkoc2JpLCBzZWdubyktPnR5cGUpOwo+Pj4K
Pj4+ICAgICAgICAvKiByZWFkYWhlYWQgbXVsdGkgc3NhIGJsb2NrcyB0aG9zZSBoYXZlIGNvbnRp
Z3VvdXMgYWRkcmVzcyAqLwo+Pj4gQEAgLTE3NjIsOSArMTc3MSw2IEBAIHN0YXRpYyBpbnQgZG9f
Z2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Cj4+PiAgICAgICAg
ICAgICAgICBpZiAoZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCBmYWxzZSkgPT0gMCkKPj4+
ICAgICAgICAgICAgICAgICAgICAgICAgZ290byBmcmVlZDsKPj4+IC0gICAgICAgICAgICAgaWYg
KGdjX3R5cGUgPT0gQkdfR0MgJiYgX19pc19sYXJnZV9zZWN0aW9uKHNiaSkgJiYKPj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG1pZ3JhdGVkID49IHNiaS0+bWlncmF0aW9uX2dyYW51
bGFyaXR5KQo+Pgo+PiBJdCBzZWVtcyB3ZSBjaGFuZ2UgdGhlIGxvZ2ljIGZyb20gbWlncmF0aW5n
ICJtaWdyYXRpb25fZ3JhbnVsYXJpdHkiIHNlZ21lbnRzIHdoaWNoCj4+IGhhcyB2YWxpZCBibG9j
a3MgdG8gc2Nhbm5pbmcgIm1pZ3JhdGlvbl9ncmFudWxhcml0eSIgc2VnbWVudHMgYW5kIHRyeSBt
aWdyYXRpbmcKPj4gdmFsaWQgYmxvY2tzIGluIHRob3NlIHNlZ21lbnRzLgo+Pgo+PiBJSVVDLCB3
aGVuIGJhY2tncm91bmQgR0MgcmVjeWNsZSBzcGFyc2Ugem9uZSwgaXQgd2lsbCB0YWtlIGdjIHRo
cmVhZCBtb3JlIHJvdW5kLAo+PiBpdCBzZWVtcyBsb3cgZWZmaWNpZW50LiBIb3cgZG8geW91IHRo
aW5rIG9mIGtlZXBpbmcgcHJldmlvdXMgaW1wbGVtZW50YXRpb24/Cj4gCj4gSSBnb3QgeW91ciBw
b2ludC4gSG93ZXZlciwgd2l0aCB6b25lZCBkZXZpY2VzIGhhdmluZyAxR0Igc2VjdGlvbnMsIHBl
cgo+IGV2ZXJ5IHJvdW5kLCB3ZSBzaG91bGQKPiB0b3VjaCBhbG1vc3QgMk1CIHNpemUgb2Ygc3Nh
IGJsb2NrIHBhZ2VzLCBldmVuIHRob3VnaCB3ZSBkaWRuJ3QgbmVlZAo+IHRvIGRvIGl0LiBNYXli
ZSwgd2UgY2FuIGludHJvZHVjZQoKWWVzLCBvciBjYW4gd2U6CmEpIGp1c3QgcmVhZCBTU0EgYmxv
Y2sgZm9yIHNlZ21lbnQgd2hpY2ggaGFzIHZhbGlkIGJsb2NrczsKYikgbGltaXQgcmVhZGFoZWFk
IHNpemUgdG8gYSB0aHJlc2hvbGQgYXMgeW91IHByb3Bvc2VkLgoKVGhhbmtzLAoKPiBhbm90aGVy
IHN5c2ZzIG5vZGUgbGlrZSBtaWdyYXRpb25fd2luZG93X2xpbWl0LCB3aGljaCBjYW4gYmUgc2V0
IGFzCj4gZG91YmxlIGFzIG1pZ3JhdGlvbl9ncmFudWFsaXR5IGJ5IGRlZmF1bHQsCj4gbGltaXRp
bmcgdGhlIHNpemUgb2Ygc2Nhbm5pbmcuCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+IC0gICAgICAg
ICAgICAgICAgICAgICBnb3RvIHNraXA7Cj4+PiAgICAgICAgICAgICAgICBpZiAoIVBhZ2VVcHRv
ZGF0ZShzdW1fcGFnZSkgfHwgdW5saWtlbHkoZjJmc19jcF9lcnJvcihzYmkpKSkKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBza2lwOwo+Pj4KPj4+IEBAIC0xODAzLDcgKzE4MDksOCBA
QCBzdGF0aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4+Pgo+Pj4gICAgICAgICAgICAgICAgaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tnY190eXBlXSA9Cj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc2Vnbm8gKyAxIDwgZW5kX3NlZ25vKSA/
IHNlZ25vICsgMSA6IE5VTExfU0VHTk87Cj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoc2Vnbm8gKyAxIDwgc2VjX2VuZF9zZWdubykgPwo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzZWdubyArIDEgOiBOVUxMX1NFR05POwo+Pj4gICAgc2tpcDoKPj4+
ICAgICAgICAgICAgICAgIGYyZnNfcHV0X3BhZ2Uoc3VtX3BhZ2UsIDApOwo+Pj4gICAgICAgIH0K
Pj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
