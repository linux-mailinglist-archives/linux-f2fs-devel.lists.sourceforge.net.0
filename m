Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901F887711
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Mar 2024 05:27:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnsyG-00061A-71;
	Sat, 23 Mar 2024 04:27:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rnsyE-000611-UA
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Mar 2024 04:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fDobeJ1Q8yo+RbPEMeiHtYxH1H8ClCKf9HbBmOgnCkQ=; b=dm7/2JOyMJbogdxSGDZAYbslFl
 YnAAUvGv0u49gaLn63Nbr4m/Xp69Xt+zKXSNsIn3Bqeazq4h9DctJRYP+QKs3/uaxiuPLpgUdsZCM
 R6inXIZGAqAiXAyHWg9zrDgdLpMX5+2IZwPJj0RMCURbE0JuiO8uiVLM/wQWI5HJcVbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDobeJ1Q8yo+RbPEMeiHtYxH1H8ClCKf9HbBmOgnCkQ=; b=cqP5WHghAbRZsuVWYENh1wYpKW
 vCNNODD5FvC436MFrjCQ8AOWkkVnMDkgNE3q4x5P98mz94BJv50iu2FHTk+B/oq+0lJjctreBrhBr
 BxhLv8dWnPI49nqEVD5ISpjsT5NJ6fYPs09V5bvVC25mLHJtBE7FEtL1UYsqrGw82fq8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnsyA-0008D2-QP for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Mar 2024 04:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D3EE60277;
 Sat, 23 Mar 2024 04:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DB7C433F1;
 Sat, 23 Mar 2024 04:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711168007;
 bh=yK8dDTZSWtZlDKKXpzS7heTkO7u+N3dxFz037MPPjsU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SLle9KSsmR+UuzL9V1wpIGnLAEh6nUthenpr4LTm++VcCDQ3VPOL/8KE97NgOEaxp
 k/BF1+XW4zUT4nt+M3vneuwQjuAMGdQPxUanXr+jYRPTrdE9iSgcnn6rHb3ug5MvUv
 nPuOpBVlMzOgfcCpThNznSTTfKiTozyX5AgF664SRCPs3Qz/pTbHwUtZsQnMJQXorn
 1nwovNsFO4RPZkcv8ImDu6ALT4+VN/fndWa7JyfF7ogns+q27NVLMSgxRJqb2/R+kC
 jjQUB2mxBUKQtuxVlcAaMNGZ1nVNP5GZCskD1ftXaaZyFV/MKBEuUvH8x1ewioaSkk
 oCc5CCilLFTxw==
Message-ID: <c1fd6c09-0083-439b-a81d-0d2f39cb10d4@kernel.org>
Date: Sat, 23 Mar 2024 12:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240319212316.4193790-1-daeho43@gmail.com>
 <712f380c-68ef-4743-bd9b-7342e838ced7@kernel.org>
 <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_yAWGbx2Bx2or1OyVUUw6HSgTd=fo3e151d1JHU+Op5qQ@mail.gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/3/21 1:42, Daeho Jeong wrote: > On Wed, Mar 20, 2024
    at 2:38 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/3/20 5:23, Daeho
    Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> [...] 
 
 Content analysis details:   (-5.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rnsyA-0008D2-QP
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent writing without fallocate()
 for pinned files
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8zLzIxIDE6NDIsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDIwLCAy
MDI0IGF0IDI6MzjigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBP
biAyMDI0LzMvMjAgNToyMywgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+PiBGcm9tOiBEYWVobyBKZW9u
ZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+Pj4KPj4+IEluIGEgY2FzZSB3cml0aW5nIHdpdGhv
dXQgZmFsbG9jYXRlKCksIHdlIGNhbid0IGd1YXJhbnRlZSBpdCdzIGFsbG9jYXRlZAo+Pj4gaW4g
dGhlIGNvbnZlbnRpb25hbCBhcmVhIGZvciB6b25lZCBzdHJvYWdlLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+PiAtLS0KPj4+IHYy
OiBjb3ZlcmVkIHRoZSBkaXJlY3QgaW8gY2FzZQo+Pj4gdjM6IGNvdmVyZWQgdGhlIG1rd3JpdGUg
Y2FzZQo+Pj4gLS0tCj4+PiAgICBmcy9mMmZzL2RhdGEuYyB8IDE0ICsrKysrKysrKysrKy0tCj4+
PiAgICBmcy9mMmZzL2ZpbGUuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KPj4+ICAgIDIgZmlsZXMg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+IGluZGV4IGMyMWI5MmYx
ODQ2My4uZDNlNWFiMjczNmE2IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsr
KyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBAQCAtMTU4NCw4ICsxNTg0LDExIEBAIGludCBmMmZzX21h
cF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFw
LCBpbnQgZmxhZykKPj4+Cj4+PiAgICAgICAgLyogdXNlIG91dC1wbGFjZS11cGRhdGUgZm9yIGRp
cmVjdCBJTyB1bmRlciBMRlMgbW9kZSAqLwo+Pj4gICAgICAgIGlmIChtYXAtPm1fbWF5X2NyZWF0
ZSAmJgo+Pj4gLSAgICAgICAgIChpc19ob2xlIHx8IChmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxh
ZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pKSkgewo+Pj4gLSAgICAgICAgICAgICBpZiAodW5saWtl
bHkoZjJmc19jcF9lcnJvcihzYmkpKSkgewo+Pj4gKyAgICAgICAgIChpc19ob2xlIHx8IChmMmZz
X2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgIWYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKSkpIHsKPj4+ICsg
ICAgICAgICAgICAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3Ioc2JpKSkgfHwKPj4+ICsgICAg
ICAgICAgICAgICAgIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSAmJiBpc19ob2xlICYmCj4+
PiArICAgICAgICAgICAgICAgICAgZmxhZyAhPSBGMkZTX0dFVF9CTE9DS19QUkVfRElPKSkgewo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBlcnIgPSAtRUlPOwo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIHN5bmNfb3V0Owo+Pj4gICAgICAgICAgICAgICAgfQo+Pj4gQEAgLTMzNzgs
NiArMzM4MSw4IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV93cml0ZV9iZWdpbihzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4+PiAgICAgICAgICAgICAgICBmMmZzX21hcF9sb2NrKHNiaSwgZmxhZyk7
Cj4+PiAgICAgICAgICAgICAgICBsb2NrZWQgPSB0cnVlOwo+Pj4gICAgICAgIH0gZWxzZSBpZiAo
KHBvcyAmIFBBR0VfTUFTSykgPj0gaV9zaXplX3JlYWQoaW5vZGUpKSB7Cj4+PiArICAgICAgICAg
ICAgIGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTzsKPj4+ICAgICAgICAgICAgICAgIGYyZnNfbWFwX2xvY2soc2JpLCBm
bGFnKTsKPj4+ICAgICAgICAgICAgICAgIGxvY2tlZCA9IHRydWU7Cj4+PiAgICAgICAgfQo+Pj4g
QEAgLTM0MDcsNiArMzQxMiwxMSBAQCBzdGF0aWMgaW50IHByZXBhcmVfd3JpdGVfYmVnaW4oc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4KPj4+ICAgICAgICBpZiAoIWYyZnNfbG9va3VwX3Jl
YWRfZXh0ZW50X2NhY2hlX2Jsb2NrKGlub2RlLCBpbmRleCwKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkbi5kYXRhX2Jsa2FkZHIpKSB7Cj4+PiAr
ICAgICAgICAgICAgIGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkgewo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGVyciA9IC1FSU87Cj4+PiArICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4+PiArICAgICAgICAgICAgIH0KPj4+ICsKPj4+ICAgICAgICAgICAgICAgIGlmIChs
b2NrZWQpIHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gZjJmc19yZXNlcnZlX2Js
b2NrKCZkbiwgaW5kZXgpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBpbmRleCA4
MjI3N2U5NWM4OGYuLjRkYjNiMjFjODA0YiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5j
Cj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gQEAgLTU3LDcgKzU3LDcgQEAgc3RhdGljIHZt
X2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4+PiAg
ICAgICAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUodm1mLT52bWEtPnZtX2ZpbGUp
Owo+Pj4gICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7
Cj4+PiAgICAgICAgc3RydWN0IGRub2RlX29mX2RhdGEgZG47Cj4+PiAtICAgICBib29sIG5lZWRf
YWxsb2MgPSB0cnVlOwo+Pj4gKyAgICAgYm9vbCBuZWVkX2FsbG9jID0gIWYyZnNfaXNfcGlubmVk
X2ZpbGUoaW5vZGUpOwo+Pgo+PiBXaWxsIHRoaXMgY2hlY2sgcmFjZXMgdy8gcGluZmlsZSBnZXR8
c2V0Pwo+IAo+IERvIHlvdSBtZWFuICJzZXQvY2xlYXIiIGNhc2U/IEkgYmVsaWV2ZSAic2V0IiBj
YXNlIGlzIG9rYXksIHNpbmNlIHdlCgpZdXAsCgo+IGNhbid0IHNldCBpZiB0aGUgaW5vZGUgYWxy
ZWFkeSBoYXMgYSBkYXRhIGJsb2NrLiBGb3IgImNsZWFyIiBjYXNlLCBJCgpIb3dldmVyLCB3ZSBj
YW4gc2V0IHBpbmZpbGUgb24gd3JpdHRlbiBpbm9kZSBpbiByZWd1bGFyIGJsb2NrIGRldmljZToK
CglpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBGMkZTX0hBU19CTE9DS1MoaW5vZGUp
KSB7CgkJcmV0ID0gLUVGQklHOwoJCWdvdG8gb3V0OwoJfQoKU2hvdWxkIHdlIGFkZCB0aGUgbG9n
aWMgb25seSBpZiBibGt6b25lZCBmZXR1cmUgaXMgZW5hYmxlZD8KCj4gYmVsaWV2ZSBta3dyaXRl
IGZhaWx1cmUgaXMgb2theSBpbiByYWN5IGNvbmRpdGlvbnMgY2F1c2VkIGJ5IGNsZWFyaW5nCj4g
dGhlIHBpbiBmbGFnLiBXaGF0IGRvIHlvdSB0aGluaz8KCk9yIHdlIGNhbiB1c2UgZmlsZW1hcF9p
bnZhbGlkYXRlX2xvY2soKSBpbiBmMmZzX2lvY19zZXRfcGluX2ZpbGUoKSB0bwphdm9pZCB0aGUg
cmFjZSBjb25kaXRpb24/CgpUaGFua3MsCgo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+PiAgICAgICAg
aW50IGVyciA9IDA7Cj4+PiAgICAgICAgdm1fZmF1bHRfdCByZXQ7Cj4+Pgo+Pj4gQEAgLTExNCwx
OSArMTE0LDE1IEBAIHN0YXRpYyB2bV9mYXVsdF90IGYyZnNfdm1fcGFnZV9ta3dyaXRlKHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+Pj4gICAgICAgICAgICAgICAgZ290byBvdXRfc2VtOwo+Pj4gICAg
ICAgIH0KPj4+Cj4+PiArICAgICBzZXRfbmV3X2Rub2RlKCZkbiwgaW5vZGUsIE5VTEwsIE5VTEws
IDApOwo+Pj4gICAgICAgIGlmIChuZWVkX2FsbG9jKSB7Cj4+PiAgICAgICAgICAgICAgICAvKiBi
bG9jayBhbGxvY2F0aW9uICovCj4+PiAtICAgICAgICAgICAgIHNldF9uZXdfZG5vZGUoJmRuLCBp
bm9kZSwgTlVMTCwgTlVMTCwgMCk7Cj4+PiAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2dldF9i
bG9ja19sb2NrZWQoJmRuLCBwYWdlLT5pbmRleCk7Cj4+PiAtICAgICB9Cj4+PiAtCj4+PiAtI2lm
ZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCj4+PiAtICAgICBpZiAoIW5lZWRfYWxsb2Mp
IHsKPj4+IC0gICAgICAgICAgICAgc2V0X25ld19kbm9kZSgmZG4sIGlub2RlLCBOVUxMLCBOVUxM
LCAwKTsKPj4+ICsgICAgIH0gZWxzZSB7Cj4+PiAgICAgICAgICAgICAgICBlcnIgPSBmMmZzX2dl
dF9kbm9kZV9vZl9kYXRhKCZkbiwgcGFnZS0+aW5kZXgsIExPT0tVUF9OT0RFKTsKPj4+ICAgICAg
ICAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7Cj4+PiAgICAgICAgfQo+Pj4gLSNlbmRpZgo+
Pj4gKwo+Pj4gICAgICAgIGlmIChlcnIpIHsKPj4+ICAgICAgICAgICAgICAgIHVubG9ja19wYWdl
KHBhZ2UpOwo+Pj4gICAgICAgICAgICAgICAgZ290byBvdXRfc2VtOwo+Pj4gQEAgLTQ2MTEsNiAr
NDYwNywxMCBAQCBzdGF0aWMgaW50IGYyZnNfcHJlYWxsb2NhdGVfYmxvY2tzKHN0cnVjdCBraW9j
YiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyLAo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmV0Owo+Pj4gICAgICAgIH0KPj4+Cj4+PiArICAgICAvKiBGb3IgcGlubmVkIGZp
bGVzLCBpdCBzaG91bGQgYmUgZmFsbG9jYXRlKCktZWQgaW4gYWR2YW5jZS4gKi8KPj4+ICsgICAg
IGlmIChmMmZzX2lzX3Bpbm5lZF9maWxlKGlub2RlKSkKPj4+ICsgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4+PiArCj4+PiAgICAgICAgLyogRG8gbm90IHByZWFsbG9jYXRlIGJsb2NrcyB0aGF0IHdp
bGwgYmUgd3JpdHRlbiBwYXJ0aWFsbHkgaW4gNEtCLiAqLwo+Pj4gICAgICAgIG1hcC5tX2xibGsg
PSBGMkZTX0JMS19BTElHTihwb3MpOwo+Pj4gICAgICAgIG1hcC5tX2xlbiA9IEYyRlNfQllURVNf
VE9fQkxLKHBvcyArIGNvdW50KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
