Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E3866A45
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 07:48:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reUmw-00021v-Vh;
	Mon, 26 Feb 2024 06:48:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reUmu-00021m-VN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 06:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LR/7L7nEpWJ+YfECk+UFWBTTWSmi4ubljdQi8MEsqMs=; b=Zbokr9d7HRcDViAeidqBlr4LH2
 M39qsxd8Mdfmvl7Uped8J/9pam0BulGl4sL19I1UtkwZu+k+QTBbW7sn0+KdOl34FYENl0vVuNrJj
 X/83SzclJm8uBO69L/NJQd1YzcQTNZbIWYQaRuvkX7Fb4NfgQL3eGS7Z2SvfSx4yfD2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LR/7L7nEpWJ+YfECk+UFWBTTWSmi4ubljdQi8MEsqMs=; b=l/GbwVLcgm66SW/81Clxax9VA+
 EPHrrpzmOfvYKQWGTnpPFrPP3CKZfqPybQqLbPHb+BdniwwuDzDBYX20bau02pFXk8EW37qpTbzhL
 u/0bZElJwMcVgXajBprVzFRWVbUsRKuKlKgJ/gdCDtQMghY/IyYKm40uIVVe2e8E/55I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reUmq-0001XW-CB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 06:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9CB2C60F00;
 Mon, 26 Feb 2024 06:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37527C433F1;
 Mon, 26 Feb 2024 06:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708930102;
 bh=FNhLB11u49PkDdPAlymv79Dni35HVKGs4cgtYI0JOd8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RtaDjU+q2AGjbskrExrHxJCKsfi4cDqvPObSm94Gmn4YFYjl7dyuSMHcW5BQDuuRs
 86Xa98gyNVCR4uaXyIIxFs5gteN5osYJR72sNDgxyC8KEPQ8nS/Inw4k8GKc/UtF+u
 SsYUINlmOo7FpTaZBCzVvIdG5dMfHB+zaEPqUPmDKzE6AG16zjG3m4jTRJIZntWOa3
 RX+XJlChhUBelWhY77a7V1OUxZe5WfvYDh4y6fFjwdZxgPBrkZeJNB7He3VdzNgsX1
 lnOtVVrrhvtqwbrsMrrn7gWoJfAPjMgSW4TmiAffwjf4rgGRctEQpqlGjElW8vIdX3
 GbWwkJ/s+WIKg==
Message-ID: <03f16549-fdbf-4050-888a-b9e27e2b2dff@kernel.org>
Date: Mon, 26 Feb 2024 14:48:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
 <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/26 11:25, Zhiguo Niu wrote: > Dear Chao, > > On
   Fri, Feb 23, 2024 at 10:38 AM Chao Yu <chao@kernel.org> wrote: >> >> On
   2024/2/23 10:01, Zhiguo Niu wrote: >>> >>> >>> On Thu, Feb 22, 2024 [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reUmq-0001XW-CB
Subject: Re: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small
 capacity device
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8yLzI2IDExOjI1LCBaaGlndW8gTml1IHdyb3RlOgo+IERlYXIgQ2hhbywKPiAKPiBP
biBGcmksIEZlYiAyMywgMjAyNCBhdCAxMDozOOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4+Cj4+IE9uIDIwMjQvMi8yMyAxMDowMSwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+
Cj4+Pgo+Pj4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgODozMOKAr1BNIENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZyA8bWFpbHRvOmNoYW9Aa2VybmVsLm9yZz4+IHdyb3RlOgo+Pj4KPj4+ICAgICAg
T24gMjAyNC8yLzcgMTA6MDEsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiAgICAgICA+IEEgcGFuaWMg
aXNzdWUgaGFwcGVuZWQgaW4gYSByZWJvb3QgdGVzdCBpbiBzbWFsbCBjYXBhY2l0eSBkZXZpY2UK
Pj4+ICAgICAgID4gYXMgZm9sbG93aW5nOgo+Pj4gICAgICAgPiAxLlRoZSBkZXZpY2Ugc2l6ZSBp
cyA2NE1CLCBhbmQgbWFpbiBhcmVhIGhhcyAyNCBzZWdtZW50cywgYW5kCj4+PiAgICAgICA+IENP
TkZJR19GMkZTX0NIRUNLX0ZTIGlzIG5vdCBlbmFibGVkLgo+Pj4gICAgICAgPiAyLlRoZXJlIGlz
IG5vIGFueSBmcmVlIHNlZ21lbnRzIGxlZnQgc2hvd24gaW4gZnJlZV9zZWdtYXBfaW5mbywKPj4+
ICAgICAgID4gdGhlbiBhbm90aGVyIHdyaXRlIHJlcXVlc3QgY2F1c2UgZ2V0X25ld19zZWdtZW50
IGdldCBhIG91dC1vZi1ib3VuZAo+Pj4gICAgICAgPiBzZWdtZW50IHdpdGggc2Vnbm8gMjQuCj4+
PiAgICAgICA+IDMucGFuaWMgaGFwcGVuIGluIHVwZGF0ZV9zaXRfZW50cnkgYmVjYXVzZSBhY2Nl
c3MgaW52YWxpZCBiaXRtYXAKPj4+ICAgICAgID4gcG9pbnRlci4KPj4+Cj4+PiAgICAgIFpoaWd1
bywKPj4+Cj4+PiAgICAgIENhbiB5b3UgcGxlYXNlIHRyeSBiZWxvdyBwYXRjaCB0byBzZWUgd2hl
dGhlciBpdCBjYW4gZml4IHlvdXIgcHJvYmxlbT8KPj4+Cj4+PiAgICAgIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDAyMjIxMjE4NTEuODgzMTQxLTMtY2hhb0Br
ZXJuZWwub3JnIDxodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQw
MjIyMTIxODUxLjg4MzE0MS0zLWNoYW9Aa2VybmVsLm9yZz4KPj4+Cj4+PiAgICAgIFRoYW5rcywK
Pj4+Cj4+Pgo+Pj4gRGVhciBDaGFvLAo+Pj4gSSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhlIHRlc3Rp
bmcgcmVzb3VyY2VzLiBUaGUgcHJldmlvdXMgdGVzdGluZyBoYXMgYmVlbiBzdG9wcGVkIGJlY2F1
c2UgaXQgd2FzIGZpeGVkIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2guIEluIGFkZGl0aW9uLCB0aGlz
IHJlcXVpcmVzIHN0YWJpbGl0eSB0ZXN0aW5nIHRvIHJlcHJvZHVjZSwgc28gaXQgd2lsbCB0YWtl
IGEgY2VydGFpbiBhbW91bnQgb2YgdGltZS4gSWYgdGhlcmUgaXMgYW55IHNpdHVhdGlvbiwgSSB3
aWxsIHRlbGwgeW91IGluIHRpbWUuCj4+Cj4+IFpoaWd1bywgdGhhbmsgeW91IQo+IAo+IFdlIHRl
c3RlZCB0aGlzIHBhdGNoICB0aGlzIHdlZWtlbmQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gd2l0
aAo+IHByb2JsZW0sIGFuZCBpdCBjYW4gbm90IHJlcHJvZHVjZSBwYW5pYyBpc3N1ZXMsCj4gc28g
dGhpcyBwYXRjaCBzaG91bGQgZml4IHRoZSBvcmlnaW5hbCBpc3N1ZS4KClpoaWd1bywKClRoYW5r
cyBhIGxvdCBmb3IgdGhlIHRlc3QhCgpEbyB5b3UgbWluZCByZXBseWluZyB0byBvcmlnaW5hbCBw
YXRjaCBiZWxvdyB0YWc/CgpUZXN0ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29j
LmNvbT4KClRoYW5rcywKCj4gdGhhbmtz77yBCj4gCj4+Cj4+IEJUVywgSSd2ZSB0ZXN0ZWQgdGhp
cyBwYXRjaCBmb3IgYSB3aGlsZSwgYW5kIGl0IGxvb2tzIHRoZXJlIGlzIG5vIGlzc3VlIHcvCj4+
IEZBVUxUX05PX1NFR01FTlQgZmF1bHQgaW5qZWN0aW9uIGlzIG9uLgo+Pgo+Pj4gYnR3LCBXaHkg
Y2Fu4oCZdCBJIHNlZSB0aGlzIHBhdGNoIG9uIHlvdXIgYnJhbmNoXl4/Cj4+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cv
P2g9ZGV2LXRlc3QgPGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2NoYW8vbGludXguZ2l0L2xvZy8/aD1kZXYtdGVzdD4KPj4KPj4gVG9vIGxhenkgdG8gcHVz
aCBwYXRjaGVzIGluIHRpbWUsIHdpbGwgZG8gaXQgaW4gdGhpcyB3ZWVrZW5kLiA6UAo+Pgo+Pj4g
dGhhbmtz77yBCj4+Pgo+Pj4KPj4+ICAgICAgID4KPj4+ICAgICAgID4gTW9yZSBkZXRhaWwgc2hv
d24gaW4gZm9sbG93aW5nIHBhdGNoIHNldHMuCj4+PiAgICAgICA+IFRoZSB0aHJlZSBwYXRjaGVz
IGFyZSBzcGxpdGVkIGhlcmUgYmVjYXVzZSB0aGUgbW9kaWZpY2F0aW9ucyBhcmUKPj4+ICAgICAg
ID4gcmVsYXRpdmVseSBpbmRlcGVuZGVudCBhbmQgbW9yZSByZWFkYWJsZS4KPj4+ICAgICAgID4K
Pj4+ICAgICAgID4gLS0tCj4+PiAgICAgICA+IENoYW5nZXMgb2YgdjI6IHN0b3AgY2hlY2twb2lu
dCB3aGVuIGdldCBhIG91dC1vZi1ib3VuZCBzZWdtZW50Cj4+PiAgICAgICA+IC0tLQo+Pj4gICAg
ICAgPgo+Pj4gICAgICAgPiBaaGlndW8gTml1ICg0KToKPj4+ICAgICAgID4gICAgZjJmczogY29y
cmVjdCBjb3VudGluZyBtZXRob2RzIG9mIGZyZWVfc2VnbWVudHMgaW4gX19zZXRfaW51c2UKPj4+
ICAgICAgID4gICAgZjJmczogZml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkKPj4+
ICAgICAgID4gICAgZjJmczogZW5oYW5jZSBqdWRnbWVudCBjb25kaXRpb25zIG9mIEdFVF9TRUdO
Two+Pj4gICAgICAgPiAgICBmMmZzOiBzdG9wIGNoZWNrcG9pbnQgd2hlbiBnZXQgYSBvdXQtb2Yt
Ym91bmRzIHNlZ21lbnQKPj4+ICAgICAgID4KPj4+ICAgICAgID4gICBmcy9mMmZzL2ZpbGUuYyAg
ICAgICAgICB8ICA3ICsrKysrKy0KPj4+ICAgICAgID4gICBmcy9mMmZzL3NlZ21lbnQuYyAgICAg
ICB8IDIxICsrKysrKysrKysrKysrKystLS0tLQo+Pj4gICAgICAgPiAgIGZzL2YyZnMvc2VnbWVu
dC5oICAgICAgIHwgIDcgKysrKy0tLQo+Pj4gICAgICAgPiAgIGluY2x1ZGUvbGludXgvZjJmc19m
cy5oIHwgIDEgKwo+Pj4gICAgICAgPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPj4+ICAgICAgID4KPj4+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
