Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B41A8FC26C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jun 2024 05:48:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEhdJ-0004lp-TO;
	Wed, 05 Jun 2024 03:48:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sEhdI-0004lj-DY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 03:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MPlyXlGNtJ8DqBOs3JbeYB+ZQeEyb3iiMScIBPFV66w=; b=YRKL3nKjH6Uf9dDIZNpooBcKLW
 Ux6A4TmXmAOTAZ9KBKQt5pTvt9GVY8I1Vqtif5GfRdXxrP5ytZ4+3hwile7n41dXZNS7UC0/mNtFq
 mUDtWRAuFHXnS7afxX28lIYyJSLxN8YohGQNCzovrBOAbYES0V5hGR+BWydWSVbYYmY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MPlyXlGNtJ8DqBOs3JbeYB+ZQeEyb3iiMScIBPFV66w=; b=gv/b7q9P4iu3CUOBmvmBxBwQAD
 Ygp/c7k8UuubnlKKibAaAm+2zD+5CodZG1oCgxLOCG68DiErdgtWFGwRSXlm1WjH7tJRQjCwaNjtS
 2dt3TUu1Oaz/A0ZHDGcE2uNPVp/GfcuTADASYITNEEQsJo02cge630+nLFS8JgqKjgVA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEhdI-0005Yl-DS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Jun 2024 03:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9681ECE115A;
 Wed,  5 Jun 2024 03:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6609AC32781;
 Wed,  5 Jun 2024 03:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717559287;
 bh=T9eP4KI3K8OSMVEJQuECiUhIO0oRZGwaLX6wcUtW6O0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QkHAnDYYzNhfdAFgKa8tvoJde9rehpQUo9MYFmj0/5gN2VrnnPhGsKhFA0FZEXZpe
 Y8TiIjeqcV53PIYUqx2f5OVSdpZQ08OGdLxH9RBJtn0APk2aQOlGZqdexwmfKG/FW0
 qEazDguZ6GsAVej4GUMK27oLOjQSC48s/kpU7Y9mw93vp4dVGVC3w6b6M+nsw0AQoY
 nEQWrrhUshCZjMDfm4A7ZfdqruWIKFMy2udMPmLFWvR455I2fXnQ/llKUw4E42Mf0w
 xIA9dja/+i994wwdqA2XilSwxuj1TIiCXodMp0WvF7ce5JqZIK4Dr8H2TQzMpPR+6T
 QpYex2czrdb3Q==
Message-ID: <8b841ec1-cb43-462a-9e87-aecdb0755318@kernel.org>
Date: Wed, 5 Jun 2024 11:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1716204978-29455-1-git-send-email-zhiguo.niu@unisoc.com>
 <446c7e4a-2a1e-402d-8238-2eee7cdfd5c2@kernel.org>
 <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J2NkSfVTEcpxR+n3CjtywMxxEDMg4cLSL=8UOX8KcM+Q@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/6/3 17:05, Zhiguo Niu wrote: > On Mon, Jun 3, 2024
    at 3:41 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/5/20 19:36, Zhiguo
    Niu wrote: >>> Now atgc can be enabled based on the following [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [145.40.73.55 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEhdI-0005Yl-DS
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable atgc if atgc_age_threshold from
 user is less than elapsed_time
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzMgMTc6MDUsIFpoaWd1byBOaXUgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMywgMjAy
NCBhdCAzOjQx4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24g
MjAyNC81LzIwIDE5OjM2LCBaaGlndW8gTml1IHdyb3RlOgo+Pj4gTm93IGF0Z2MgY2FuIGJlIGVu
YWJsZWQgYmFzZWQgb24gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgo+Pj4gLUFUR0MgbW91bnQg
b3B0aW9uIGlzIHNldAo+Pj4gLWVsYXBzZWRfdGltZSBpcyBtb3JlIHRoYW4gYXRnY19hZ2VfdGhy
ZXNob2xkIGFscmVhZHkKPj4+IGJ1dCB0aGVzZSBjb25kaXRpb25zIGFyZSBjaGVjayB3aGVuIHVt
b3VudGVkLT5tb3VudGVkIGRldmljZSBhZ2Fpbi4KPj4+IElmIHRoZSBkZXZpY2UgaGFzIG5vdCBi
ZSB1bW91bnRlZC0+bW91bnRlZCBmb3IgYSBsb25nIHRpbWUsIGF0Z2MgY2FuCj4+PiBub3Qgd29y
ayBldmVuIHRoZSBhYm92ZSBjb25kaXRpb25zIG1ldC4KPj4+Cj4+PiBJdCBpcyBiZXR0ZXIgdG8g
ZW5hYmxlIGF0Z2MgZHluYW1pY2xseSB3aGVuIHVzZXIgY2hhbmdlIGF0Z2NfYWdlX3RocmVzaG9s
ZAo+Pj4gbWVhbndoaWxlIHRoaXMgdmFsZSBpcyBsZXNzIHRoYW4gZWxhcHNlZF90aW1lIGFuZCBB
VEdDIG1vdW50IG9wdGlvbiBpcyBvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1
IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZjJmcy5oICAg
IHwgIDEgKwo+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAgOSArKysrLS0tLS0KPj4+ICAgIGZz
L2YyZnMvc3lzZnMuYyAgIHwgMTYgKysrKysrKysrKysrKysrKwo+Pj4gICAgMyBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBpbmRleCAxOTc0YjZhLi5lNDQx
ZDJkIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJm
cy5oCj4+PiBAQCAtMzY5NCw2ICszNjk0LDcgQEAgdm9pZCBmMmZzX2NsZWFyX3ByZWZyZWVfc2Vn
bWVudHMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgaW50IGYyZnNfaW5pdF9pbm1l
bV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4+ICAgIHZvaWQgZjJmc19zYXZl
X2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+Pj4gICAgdm9pZCBmMmZz
X3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+PiAraW50
IGYyZnNfaW5pdF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+Pj4gICAg
aW50IGYyZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgaW50IHR5cGUsCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgc3RhcnQsIHVuc2lnbmVkIGludCBlbmQpOwo+Pj4gICAgaW50IGYyZnNf
YWxsb2NhdGVfbmV3X3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwg
Ym9vbCBmb3JjZSk7Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZz
L3NlZ21lbnQuYwo+Pj4gaW5kZXggNzFkYzgwNDIuLjQ0OTIzZDQgMTAwNjQ0Cj4+PiAtLS0gYS9m
cy9mMmZzL3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IEBAIC0yOTMx
LDE0ICsyOTMxLDExIEBAIHN0YXRpYyBpbnQgZ2V0X2F0c3NyX3NlZ21lbnQoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwKPj4+ICAgICAgICByZXR1cm4gcmV0Owo+Pj4gICAgfQo+
Pj4KPj4+IC1zdGF0aWMgaW50IF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSkKPj4+ICtpbnQgZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSkKPj4+ICAgIHsKPj4+ICAgICAgICBzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNl
ZyA9IENVUlNFR19JKHNiaSwgQ1VSU0VHX0FMTF9EQVRBX0FUR0MpOwo+Pj4gICAgICAgIGludCBy
ZXQgPSAwOwo+Pj4KPj4+IC0gICAgIGlmICghc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4+PiAtICAg
ICAgICAgICAgIHJldHVybiAwOwo+Pj4gLQo+Pj4gICAgICAgIGYyZnNfZG93bl9yZWFkKCZTTV9J
KHNiaSktPmN1cnNlZ19sb2NrKTsKPj4+Cj4+PiAgICAgICAgbXV0ZXhfbG9jaygmY3Vyc2VnLT5j
dXJzZWdfbXV0ZXgpOwo+Pj4gQEAgLTI5NTUsNyArMjk1Miw5IEBAIHN0YXRpYyBpbnQgX19mMmZz
X2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gICAgfQo+Pj4g
ICAgaW50IGYyZnNfaW5pdF9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+
Pj4gICAgewo+Pj4gLSAgICAgcmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7Cj4+
PiArICAgICBpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkKQo+Pj4gKyAgICAgICAgICAgICByZXR1
cm4gMDsKPj4+ICsgICAgIHJldHVybiBmMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKTsKPj4+ICAg
IH0KPj4+Cj4+PiAgICBzdGF0aWMgdm9pZCBfX2YyZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5
c2ZzLmMgYi9mcy9mMmZzL3N5c2ZzLmMKPj4+IGluZGV4IDA5ZDNlY2YuLjcyNjc2YzUgMTAwNjQ0
Cj4+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+Pj4g
QEAgLTY3Myw2ICs2NzMsMjIgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0IGYy
ZnNfYXR0ciAqYSwKPj4+ICAgICAgICAgICAgICAgIHJldHVybiBjb3VudDsKPj4+ICAgICAgICB9
Cj4+Pgo+Pj4gKyAgICAgaWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAiYXRnY19hZ2VfdGhyZXNo
b2xkIikpIHsKPj4+ICsgICAgICAgICAgICAgaWYgKHQgPCAwKQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgICAgICAgICBzYmktPmFtLmFnZV90aHJl
c2hvbGQgPSB0Owo+Pj4gKyAgICAgICAgICAgICBpZiAoc2JpLT5hbS5hdGdjX2VuYWJsZWQpCj4+
PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+Pj4gKwo+Pj4gKyAgICAgICAg
ICAgICBpZiAodGVzdF9vcHQoc2JpLCBBVEdDKSAmJgo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
IGxlNjRfdG9fY3B1KHNiaS0+Y2twdC0+ZWxhcHNlZF90aW1lKSA+PSB0KSB7Cj4+Cj4gSGkgQ2hh
bywKPj4gT2gsIEkgZ3Vlc3MgeW91IHdhbnQgdG8gZml4IHRoaXM6Cj4gWWVzLCAgU29ycnkgZm9y
IG5vdCBtYWtpbmcgaXQgY2xlYXIgYmVmb3JlLgo+Pgo+PiBzdGF0aWMgdm9pZCBpbml0X2F0Z2Nf
bWFuYWdlbWVudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+IHsKPj4gLi4uCj4+ICAgICAg
ICAgIGlmICh0ZXN0X29wdChzYmksIEFUR0MpICYmCj4+ICAgICAgICAgICAgICAgICAgU0lUX0ko
c2JpKS0+ZWxhcHNlZF90aW1lID49IERFRl9HQ19USFJFQURfQUdFX1RIUkVTSE9MRCkKPj4gICAg
ICAgICAgICAgICAgICBhbS0+YXRnY19lbmFibGVkID0gdHJ1ZTsKPj4KPj4gV2hhdCBhYm91dCBl
bmFibGluZyBhdGdjX2VuYWJsZWQgZHVyaW5nIGNoZWNrcG9pbnQgb25jZSBlbGFwc2VkIHRpbWUg
aXMKPj4gc2F0aXNmZWQgdy8gdGhlIGNvbmRpdGlvbj8gSSBndWVzcyB0aGlzIGNhbiBnaXZlIGFu
b3RoZXIgY2hhbmNlIHdoZW5ldmVyCj4+IENQIGlzIGJlZW4gdHJpZ2dlcmVkLCBhbmQgaXQgY2Fu
IGF2b2lkIHRoZSByYWNpbmcgY29uZGl0aW9uIGFzIHdlbGwuCj4gMS4gSSdtIG5vdCBzdXJlIGlm
IHRoaXMgd2lsbCBpbmNyZWFzZSBjaGVja3BvaW50IHRpbWUgY29uc3VtcHRpb24/CgpTaW5jZSBp
dCB3b24ndCBpbmNyZWFzZSBhbnkgSU8gdGltZSwgSSBndWVzcyBpdCdzIGZpbmUgdG9sZXJhdGUg
dGltZSBjb25zdW1lZApieSBpbml0aWFsaXphdGlvbiBvZiBhdGdjIGN1cnNlZy4KCj4gMi4gZHlu
YW1pY2FsbHkgZW5hYmxpbmcgYXRnYyBtYXkgaGF2ZSBvdGhlciBwcm9ibGVtcy4gSXMgdGhpcyBj
b25maXJtZWQ/CgpJIHRoaW5rIHNvLCBjaGVja3BvaW50IGhhcyBhdm9pZGVkIG1vc3QgcmFjZSBj
YXNlcy4KClNvLCBob3cgZG8geW91IHRoaW5rIG9mIGJlbG93IGRpZmY6CgotLS0KICBmcy9mMmZz
L2NoZWNrcG9pbnQuYyB8ICAyICsrCiAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgMSArCiAgZnMv
ZjJmcy9zZWdtZW50LmMgICAgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKy0tLQogIDMgZmls
ZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9mcy9mMmZzL2NoZWNrcG9pbnQuYyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCmluZGV4IDU1ZDQ0
NGJlYzVjMC4uNGE3M2JkNDgxYTI1IDEwMDY0NAotLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwor
KysgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYwpAQCAtMTcxOCw2ICsxNzE4LDggQEAgaW50IGYyZnNf
d3JpdGVfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250
cm9sICpjcGMpCiAgCX0KCiAgCWYyZnNfcmVzdG9yZV9pbm1lbV9jdXJzZWcoc2JpKTsKKwlmMmZz
X3JlaW5pdF9hdGdjX2N1cnNlZyhzYmkpOworCiAgCXN0YXRfaW5jX2NwX2NvdW50KHNiaSk7CiAg
c3RvcDoKICAJdW5ibG9ja19vcGVyYXRpb25zKHNiaSk7CmRpZmYgLS1naXQgYS9mcy9mMmZzL2Yy
ZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCmluZGV4IDk2ODhkZjMzMjE0Ny4uOGQzODVhMWM3NWFkIDEw
MDY0NAotLS0gYS9mcy9mMmZzL2YyZnMuaAorKysgYi9mcy9mMmZzL2YyZnMuaApAQCAtMzY5Myw2
ICszNjkzLDcgQEAgdm9pZCBmMmZzX3JlbGVhc2VfZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmkpOwogIGludCBmMmZzX25wYWdlc19mb3Jfc3VtbWFyeV9mbHVzaChzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZm9yX3JhKTsKICBib29sIGYyZnNfc2VnbWVudF9oYXNf
ZnJlZV9zbG90KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHNlZ25vKTsKICBpbnQgZjJm
c19pbml0X2lubWVtX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOworaW50IGYyZnNf
cmVpbml0X2F0Z2NfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7CiAgdm9pZCBmMmZz
X3NhdmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7CiAgdm9pZCBmMmZz
X3Jlc3RvcmVfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7CiAgaW50IGYy
ZnNfYWxsb2NhdGVfc2VnbWVudF9mb3JfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
aW50IHR5cGUsCmRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVu
dC5jCmluZGV4IGJkYzIyNDczODdlOC4uNmQ0MjczZmFmMDYxIDEwMDY0NAotLS0gYS9mcy9mMmZz
L3NlZ21lbnQuYworKysgYi9mcy9mMmZzL3NlZ21lbnQuYwpAQCAtMjk0OSwxMiArMjk0OSwxMiBA
QCBzdGF0aWMgaW50IGdldF9hdHNzcl9zZWdtZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
aW50IHR5cGUsCiAgCXJldHVybiByZXQ7CiAgfQoKLXN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRn
Y19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQorc3RhdGljIGludCBfX2YyZnNfaW5p
dF9hdGdjX2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZm9yY2UpCiAgewog
IAlzdHJ1Y3QgY3Vyc2VnX2luZm8gKmN1cnNlZyA9IENVUlNFR19JKHNiaSwgQ1VSU0VHX0FMTF9E
QVRBX0FUR0MpOwogIAlpbnQgcmV0ID0gMDsKCi0JaWYgKCFzYmktPmFtLmF0Z2NfZW5hYmxlZCkK
KwlpZiAoIXNiaS0+YW0uYXRnY19lbmFibGVkICYmICFmb3JjZSkKICAJCXJldHVybiAwOwoKICAJ
ZjJmc19kb3duX3JlYWQoJlNNX0koc2JpKS0+Y3Vyc2VnX2xvY2spOwpAQCAtMjk3MSw5ICsyOTcx
LDI5IEBAIHN0YXRpYyBpbnQgX19mMmZzX2luaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKQogIAlmMmZzX3VwX3JlYWQoJlNNX0koc2JpKS0+Y3Vyc2VnX2xvY2spOwogIAly
ZXR1cm4gcmV0OwogIH0KKwogIGludCBmMmZzX2luaXRfaW5tZW1fY3Vyc2VnKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSkKICB7Ci0JcmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSk7
CisJcmV0dXJuIF9fZjJmc19pbml0X2F0Z2NfY3Vyc2VnKHNiaSwgZmFsc2UpOworfQorCitpbnQg
ZjJmc19yZWluaXRfYXRnY19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQoreworCWlu
dCByZXQ7CisKKwlpZiAoIXRlc3Rfb3B0KHNiaSwgQVRHQykpCisJCXJldHVybiAwOworCWlmIChz
YmktPmFtLmF0Z2NfZW5hYmxlZCkKKwkJcmV0dXJuIDA7CisJaWYgKFNJVF9JKHNiaSktPmVsYXBz
ZWRfdGltZSA8IHNiaS0+YW0uYWdlX3RocmVzaG9sZCkKKwkJcmV0dXJuIDA7CisKKwlyZXQgPSBf
X2YyZnNfaW5pdF9hdGdjX2N1cnNlZyhzYmksIHRydWUpOworCWlmICghcmV0KSB7CisJCXNiaS0+
YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKKwkJZjJmc19pbmZvKHNiaSwgInJlZW5hYmxlZCBhZ2Ug
dGhyZXNob2xkIEdDIik7CisJfQorCXJldHVybiByZXQ7CiAgfQoKICBzdGF0aWMgdm9pZCBfX2Yy
ZnNfc2F2ZV9pbm1lbV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSkK
LS0gCjIuNDAuMQoKPiB0aGFua3PvvIEKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgIGlmIChmMmZzX2luaXRfYXRnY19jdXJzZWcoc2JpKSkKPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIHNiaS0+YW0uYXRnY19lbmFibGVkID0gdHJ1ZTsKPj4+ICsgICAgICAgICAgICAgfQo+Pj4g
KyAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4+PiArICAgICB9Cj4+PiArCj4+PiAgICAgICAg
aWYgKCFzdHJjbXAoYS0+YXR0ci5uYW1lLCAiZ2Nfc2VnbWVudF9tb2RlIikpIHsKPj4+ICAgICAg
ICAgICAgICAgIGlmICh0IDwgTUFYX0dDX01PREUpCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
IHNiaS0+Z2Nfc2VnbWVudF9tb2RlID0gdDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
