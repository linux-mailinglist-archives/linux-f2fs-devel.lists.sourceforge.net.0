Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A235E8608E7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 03:39:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdLSj-0000hs-1y;
	Fri, 23 Feb 2024 02:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rdLSh-0000hl-KL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 02:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTJdxqSglxV22XtaxXWtaDqv6y/baXRZ6sajmFRMbwQ=; b=R7mP9Pych6w1xoff9BbIYUmPPm
 qaYpVsXjk4J7bwZFBTVdLH+pNyFzcrzEgq0r3okMeXizpxFRvfqfm5dfqXKHKA82BD3eM+zcNpFAj
 Jgv4B4JemjA75BYOUd9sT+SzK6SHjQCNE+N47ubSNrcon8eTZ+BvTBUxjrEVFUAiq06w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTJdxqSglxV22XtaxXWtaDqv6y/baXRZ6sajmFRMbwQ=; b=aYkUmG7zFA0oHX1a6ubCWqACpr
 3vygSUhCbbPFRkoyMjEEPvtVAGLXpovWViKpu+U7HvUEZiDMfgenJLfaO1aWWCzJf//IvpD14Fwd+
 lZSWxhxYeASaOWTkpqi5QsmCbxSZQ4iiQ+2tg2Kc1ci6tbKeoBwQaZGghSSYEW+04k90=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdLSc-0003cC-OF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 02:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA59061F79;
 Fri, 23 Feb 2024 02:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B60C433F1;
 Fri, 23 Feb 2024 02:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708655921;
 bh=u4CAj8sqPpsO1plOvaGWAsNP8nAL9KNoDdlV99PxpRk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CB3OS1l5TfQmtklsN35xYI83P6r24Ec8ZrO1IHQ2xyfzlH5BYLoMd9yeXUwOK42Q9
 y7iXT9xHM/84XrAhKauLE04M362XjtnY9v6E1OU2QReHVPLHrhVsviSDAOXUD24pB3
 YRXwcdm3IE7ITmFjLub3N6mTPCue6I40cisN+bFI2jUeeFvMmMWUvcLFuQ+udSJWQo
 3Gl5b5nYdRQnUXOnnpkuHYrzqbougwQx8KB/gH80v9MNNqmXp4w9ZsHSlOEM8p8gMO
 JNrjWIT+YI+OKRAIRUXgmJ+eT226EfjPwSjHAsRwf/mouF77shN57XIXgy+YAJp+uW
 H9r6X6jqn/ZVA==
Message-ID: <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
Date: Fri, 23 Feb 2024 10:38:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/2/23 10:01, Zhiguo Niu wrote: > > > On Thu, Feb 22,
    2024 at 8:30 PM Chao Yu <chao@kernel.org <mailto:chao@kernel.org>> wrote:
    > > On 2024/2/7 10:01, Zhiguo Niu wrote: > > A panic issue happe [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rdLSc-0003cC-OF
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

T24gMjAyNC8yLzIzIDEwOjAxLCBaaGlndW8gTml1IHdyb3RlOgo+IAo+IAo+IE9uIFRodSwgRmVi
IDIyLCAyMDI0IGF0IDg6MzDigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmcgPG1haWx0bzpj
aGFvQGtlcm5lbC5vcmc+PiB3cm90ZToKPiAKPiAgICAgT24gMjAyNC8yLzcgMTA6MDEsIFpoaWd1
byBOaXUgd3JvdGU6Cj4gICAgICA+IEEgcGFuaWMgaXNzdWUgaGFwcGVuZWQgaW4gYSByZWJvb3Qg
dGVzdCBpbiBzbWFsbCBjYXBhY2l0eSBkZXZpY2UKPiAgICAgID4gYXMgZm9sbG93aW5nOgo+ICAg
ICAgPiAxLlRoZSBkZXZpY2Ugc2l6ZSBpcyA2NE1CLCBhbmQgbWFpbiBhcmVhIGhhcyAyNCBzZWdt
ZW50cywgYW5kCj4gICAgICA+IENPTkZJR19GMkZTX0NIRUNLX0ZTIGlzIG5vdCBlbmFibGVkLgo+
ICAgICAgPiAyLlRoZXJlIGlzIG5vIGFueSBmcmVlIHNlZ21lbnRzIGxlZnQgc2hvd24gaW4gZnJl
ZV9zZWdtYXBfaW5mbywKPiAgICAgID4gdGhlbiBhbm90aGVyIHdyaXRlIHJlcXVlc3QgY2F1c2Ug
Z2V0X25ld19zZWdtZW50IGdldCBhIG91dC1vZi1ib3VuZAo+ICAgICAgPiBzZWdtZW50IHdpdGgg
c2Vnbm8gMjQuCj4gICAgICA+IDMucGFuaWMgaGFwcGVuIGluIHVwZGF0ZV9zaXRfZW50cnkgYmVj
YXVzZSBhY2Nlc3MgaW52YWxpZCBiaXRtYXAKPiAgICAgID4gcG9pbnRlci4KPiAKPiAgICAgWmhp
Z3VvLAo+IAo+ICAgICBDYW4geW91IHBsZWFzZSB0cnkgYmVsb3cgcGF0Y2ggdG8gc2VlIHdoZXRo
ZXIgaXQgY2FuIGZpeCB5b3VyIHByb2JsZW0/Cj4gCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDAyMjIxMjE4NTEuODgzMTQxLTMtY2hhb0BrZXJuZWwu
b3JnIDxodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMjIyMTIx
ODUxLjg4MzE0MS0zLWNoYW9Aa2VybmVsLm9yZz4KPiAKPiAgICAgVGhhbmtzLAo+IAo+IAo+IERl
YXIgQ2hhbywKPiBJIG5lZWQgdG8gY29vcmRpbmF0ZSB0aGUgdGVzdGluZyByZXNvdXJjZXMuIFRo
ZSBwcmV2aW91cyB0ZXN0aW5nIGhhcyBiZWVuIHN0b3BwZWQgYmVjYXVzZSBpdCB3YXMgZml4ZWQg
d2l0aCB0aGUgY3VycmVudCBwYXRjaC4gSW4gYWRkaXRpb24sIHRoaXMgcmVxdWlyZXMgc3RhYmls
aXR5IHRlc3RpbmcgdG8gcmVwcm9kdWNlLCBzbyBpdCB3aWxsIHRha2UgYSBjZXJ0YWluIGFtb3Vu
dCBvZiB0aW1lLiBJZiB0aGVyZSBpcyBhbnkgc2l0dWF0aW9uLCBJIHdpbGwgdGVsbCB5b3UgaW4g
dGltZS4KClpoaWd1bywgdGhhbmsgeW91IQoKQlRXLCBJJ3ZlIHRlc3RlZCB0aGlzIHBhdGNoIGZv
ciBhIHdoaWxlLCBhbmQgaXQgbG9va3MgdGhlcmUgaXMgbm8gaXNzdWUgdy8KRkFVTFRfTk9fU0VH
TUVOVCBmYXVsdCBpbmplY3Rpb24gaXMgb24uCgo+IGJ0dywgV2h5IGNhbuKAmXQgSSBzZWUgdGhp
cyBwYXRjaCBvbiB5b3VyIGJyYW5jaF5ePwo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NoYW8vbGludXguZ2l0L2xvZy8/aD1kZXYtdGVzdCA8aHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hhby9saW51eC5naXQv
bG9nLz9oPWRldi10ZXN0PgoKVG9vIGxhenkgdG8gcHVzaCBwYXRjaGVzIGluIHRpbWUsIHdpbGwg
ZG8gaXQgaW4gdGhpcyB3ZWVrZW5kLiA6UAoKPiB0aGFua3PvvIEKPiAKPiAKPiAgICAgID4KPiAg
ICAgID4gTW9yZSBkZXRhaWwgc2hvd24gaW4gZm9sbG93aW5nIHBhdGNoIHNldHMuCj4gICAgICA+
IFRoZSB0aHJlZSBwYXRjaGVzIGFyZSBzcGxpdGVkIGhlcmUgYmVjYXVzZSB0aGUgbW9kaWZpY2F0
aW9ucyBhcmUKPiAgICAgID4gcmVsYXRpdmVseSBpbmRlcGVuZGVudCBhbmQgbW9yZSByZWFkYWJs
ZS4KPiAgICAgID4KPiAgICAgID4gLS0tCj4gICAgICA+IENoYW5nZXMgb2YgdjI6IHN0b3AgY2hl
Y2twb2ludCB3aGVuIGdldCBhIG91dC1vZi1ib3VuZCBzZWdtZW50Cj4gICAgICA+IC0tLQo+ICAg
ICAgPgo+ICAgICAgPiBaaGlndW8gTml1ICg0KToKPiAgICAgID7CoCDCoCBmMmZzOiBjb3JyZWN0
IGNvdW50aW5nIG1ldGhvZHMgb2YgZnJlZV9zZWdtZW50cyBpbiBfX3NldF9pbnVzZQo+ICAgICAg
PsKgIMKgIGYyZnM6IGZpeCBwYW5pYyBpc3N1ZSBpbiB1cGRhdGVfc2l0X2VudHJ5Cj4gICAgICA+
wqAgwqAgZjJmczogZW5oYW5jZSBqdWRnbWVudCBjb25kaXRpb25zIG9mIEdFVF9TRUdOTwo+ICAg
ICAgPsKgIMKgIGYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1vZi1ib3VuZHMg
c2VnbWVudAo+ICAgICAgPgo+ICAgICAgPsKgIMKgZnMvZjJmcy9maWxlLmPCoCDCoCDCoCDCoCDC
oCB8wqAgNyArKysrKystCj4gICAgICA+wqAgwqBmcy9mMmZzL3NlZ21lbnQuY8KgIMKgIMKgIMKg
fCAyMSArKysrKysrKysrKysrKysrLS0tLS0KPiAgICAgID7CoCDCoGZzL2YyZnMvc2VnbWVudC5o
wqAgwqAgwqAgwqB8wqAgNyArKysrLS0tCj4gICAgICA+wqAgwqBpbmNsdWRlL2xpbnV4L2YyZnNf
ZnMuaCB8wqAgMSArCj4gICAgICA+wqAgwqA0IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMo
KyksIDkgZGVsZXRpb25zKC0pCj4gICAgICA+Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
