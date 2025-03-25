Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF52A6EAF5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 09:01:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twzDy-00020I-JX;
	Tue, 25 Mar 2025 08:01:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1twzDw-0001zs-Ty
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1zu+/5FMlttrKomw8rMGjbiIcXxo8uHvLd5IJScR1HY=; b=RMF4ygr/o+kJiWMynrwfAthomL
 ZjkawTW5z9Xiy6k2rtC14ZNPZ8OaDG7/5+Dr8XxgCZGoUOIeo1ZkY+Bf7kRjMHPUSLjucxQSU+xb5
 PFy5LnxlIimCIJPwA7yTZFGgngDWSX73uCxnTpCxW1IVQN3Biu156jy1uODtXkierOXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1zu+/5FMlttrKomw8rMGjbiIcXxo8uHvLd5IJScR1HY=; b=L1E7J9eozQIblavoLgTfYFepTQ
 alhzU0CfJ5AM6WdlQf6lR05cS+8WIjtZp2aG+EzxfjTzJpMYuQUAvrynWkHisGPl+bCJZ4QgeMWzj
 MS77Fdbg8UOB3hAzgJE7FJTCFJNDEFg3szcte1LpDKMJzCwjLJnFsvNLStn15iyvCWxk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1twzDr-0000OB-GD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 08:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96F78A4A5D4;
 Tue, 25 Mar 2025 07:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B15CC4CEE4;
 Tue, 25 Mar 2025 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742889673;
 bh=nBzODTaNJWiJV4/XWp0uU9JMHDqmhaxlxmuw1FZbtrk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jOytFZy0qGEH9OQiN6+BWoYbhCsUJFebsk2njokSsMb7U49sLONdDcaZ3FuSxTpK/
 G7qzX2xJ4YNHJffaZH9vXknSR2ygFBQaCCzJ2ncA+jjyvUmurg/nG6oWcam+lKTabz
 4+RjQ2vCRBP+6WOZRj/MS8gUSVXvaT6du67LFbUGv70Wuku/jdFaUuVJ6ZMuvoaBqH
 oaKl0W6/+MLrb+Rr+cUPrwQwdPhTOW39E1KupY3frQMIN87JAnliQNL7oPJIYS4xOo
 3d4A184mjPQ/ZI2vnNFXN2yB0eVIx7mUlpCJVm2CTXzq9AS3wZ9z5gapRTaqBAxlEd
 DmAnd2wDZplYg==
Message-ID: <6b130bed-a18c-4786-bb7f-3588dc8742ab@kernel.org>
Date: Tue, 25 Mar 2025 16:01:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20250324114935.3087821-1-chao@kernel.org>
 <CACOAw_zQ1+yMknJ76B+H2-N=BfY4a85Yjwicip5UTQu9GLZQdA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_zQ1+yMknJ76B+H2-N=BfY4a85Yjwicip5UTQu9GLZQdA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/25/25 04:49, Daeho Jeong wrote: > On Mon, Mar 24, 2025
    at 4:54 AM Chao Yu via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
    wrote: >> >> A zoned device can has both conventional z [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1twzDr-0000OB-GD
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8yNS8yNSAwNDo0OSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMjQsIDIw
MjUgYXQgNDo1NOKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwKPiA8bGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdyb3RlOgo+Pgo+PiBBIHpvbmVkIGRldmlj
ZSBjYW4gaGFzIGJvdGggY29udmVudGlvbmFsIHpvbmVzIGFuZCBzZXF1ZW50aWFsIHpvbmVzLAo+
PiBzbyB3ZSBzaG91bGQgbm90IHRyZWF0IGZpcnN0IHNlZ21lbnQgb2Ygem9uZWQgZGV2aWNlIGFz
IGZpcnN0X3pvbmVkX3NlZ25vLAo+PiBpbnN0ZWFkLCB3ZSBuZWVkIHRvIGNoZWNrIHpvbmUgdHlw
ZSBmb3IgZWFjaCB6b25lIGR1cmluZyB0cmF2ZXJzaW5nIHpvbmVkCj4+IGRldmljZSB0byBmaW5k
IGZpcnN0X3pvbmVkX3NlZ25vLgo+Pgo+PiBPdGhlcndpc2UsIGZvciBiZWxvdyBjYXNlLCBmaXJz
dF96b25lZF9zZWdubyB3aWxsIGJlIDAsIHdoaWNoIGNvdWxkIGJlCj4+IHdyb25nLgo+Pgo+PiBj
cmVhdGVfbnVsbF9ibGsgNTEyIDIgMTAyNCAxMDI0Cj4+IG1rZnMuZjJmcyAtbSAvZGV2L251bGxi
MAo+Pgo+PiBGaXhlczogOTcwM2Q2OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5pbmcg
Zm9yIHpvbmVkIGRldmljZXMiKQo+PiBDYzogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xl
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0K
Pj4gIGZzL2YyZnMvZjJmcy5oICAgIHwgMTggKysrKysrKysrKysrKy0tLS0tCj4+ICBmcy9mMmZz
L3NlZ21lbnQuYyB8ICAyICstCj4+ICBmcy9mMmZzL3N1cGVyLmMgICB8IDMyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9m
cy9mMmZzL2YyZnMuaAo+PiBpbmRleCBjYTg4NGUzOWE1ZmYuLjNkZWEwMzdmYWE1NSAxMDA2NDQK
Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4gQEAgLTQ2
MzAsMTIgKzQ2MzAsMTYgQEAgRjJGU19GRUFUVVJFX0ZVTkNTKHJlYWRvbmx5LCBSTyk7Cj4+ICBG
MkZTX0ZFQVRVUkVfRlVOQ1MoZGV2aWNlX2FsaWFzLCBERVZJQ0VfQUxJQVMpOwo+Pgo+PiAgI2lm
ZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgZjJmc19ibGt6
X2lzX3NlcShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpLAo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja190IGJsa2FkZHIpCj4+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgZjJmc196b25lX2lzX3NlcShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBk
ZXZpLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCB6b25lKQo+PiAgewo+PiAtICAgICAgIHVuc2lnbmVkIGludCB6
bm8gPSBibGthZGRyIC8gc2JpLT5ibG9ja3NfcGVyX2Jsa3o7Cj4+ICsgICAgICAgcmV0dXJuIHRl
c3RfYml0KHpvbmUsIEZERVYoZGV2aSkuYmxrel9zZXEpOwo+PiArfQo+Pgo+PiAtICAgICAgIHJl
dHVybiB0ZXN0X2JpdCh6bm8sIEZERVYoZGV2aSkuYmxrel9zZXEpOwo+PiArc3RhdGljIGlubGlu
ZSBib29sIGYyZnNfYmxrel9pc19zZXEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2
aSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJsb2NrX3QgYmxrYWRkcikKPj4gK3sKPj4gKyAgICAgICByZXR1cm4gZjJm
c196b25lX2lzX3NlcShzYmksIGRldmksIGJsa2FkZHIgLyBzYmktPmJsb2Nrc19wZXJfYmxreik7
Cj4+ICB9Cj4+ICAjZW5kaWYKPj4KPj4gQEAgLTQ3MTEsOSArNDcxNSwxMyBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgZjJmc192YWxpZF9waW5uZWRfYXJlYShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2NrX3QgYmxr
YWRkcikKPj4gIHsKPj4gICAgICAgICBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkgewo+
PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+ICAgICAgICAgICAgICAgICBpbnQgZGV2
aSA9IGYyZnNfdGFyZ2V0X2RldmljZV9pbmRleChzYmksIGJsa2FkZHIpOwo+Pgo+PiAtICAgICAg
ICAgICAgICAgcmV0dXJuICFiZGV2X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldik7Cj4+ICsgICAg
ICAgICAgICAgICByZXR1cm4gIWYyZnNfYmxrel9pc19zZXEoc2JpLCBkZXZpLCBibGthZGRyKTsK
Pj4gKyNlbHNlCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gKyNlbmRpZgo+PiAg
ICAgICAgIH0KPj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gIH0KPj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gaW5kZXggMzk2ZWY3MWY0MWUz
Li5kYzM2MGI0YjA1NjkgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+ICsrKyBi
L2ZzL2YyZnMvc2VnbWVudC5jCj4+IEBAIC0zMzExLDcgKzMzMTEsNyBAQCBpbnQgZjJmc19hbGxv
Y2F0ZV9waW5uaW5nX3NlY3Rpb24oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pgo+PiAgICAg
ICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGVyciA9PSAtRUFHQUlOICYmIGdj
X3JlcXVpcmVkKSB7Cj4+ICAgICAgICAgICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJnNiaS0+Z2Nf
bG9jayk7Cj4+IC0gICAgICAgICAgICAgICBlcnIgPSBmMmZzX2djX3JhbmdlKHNiaSwgMCwgR0VU
X1NFR05PKHNiaSwgRkRFVigwKS5lbmRfYmxrKSwKPj4gKyAgICAgICAgICAgICAgIGVyciA9IGYy
ZnNfZ2NfcmFuZ2Uoc2JpLCAwLCBzYmktPmZpcnN0X3pvbmVkX3NlZ25vIC0gMSwKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCBaT05FRF9QSU5fU0VDX1JFUVVJUkVEX0NP
VU5UKTsKPj4gICAgICAgICAgICAgICAgIGYyZnNfdXBfd3JpdGUoJnNiaS0+Z2NfbG9jayk7Cj4+
Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4gaW5k
ZXggMDExOTI1ZWU1NGY4Li5iMjM0MjM2NjAyMGEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3Vw
ZXIuYwo+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4gQEAgLTQzMDcsMTIgKzQzMDcsMjYgQEAg
c3RhdGljIHZvaWQgZjJmc19yZWNvcmRfZXJyb3Jfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCj4+Cj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZXRfZmlyc3Rfem9uZWRfc2Vn
bm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiAgewo+PiAtICAgICAgIGludCBkZXZpOwo+
PiArI2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4+ICsgICAgICAgdW5zaWduZWQgaW50IHNl
Z25vOwo+PiArICAgICAgIGludCBkZXZpLCBpOwo+Pgo+PiAtICAgICAgIGZvciAoZGV2aSA9IDA7
IGRldmkgPCBzYmktPnNfbmRldnM7IGRldmkrKykKPj4gLSAgICAgICAgICAgICAgIGlmIChiZGV2
X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikpCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBHRVRfU0VHTk8oc2JpLCBGREVWKGRldmkpLnN0YXJ0X2Jsayk7Cj4+IC0gICAgICAgcmV0
dXJuIDA7Cj4+ICsgICAgICAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIE5VTExfU0VHTk87Cj4+ICsKPj4gKyAgICAgICBmb3IgKGRldmkg
PSAwOyBkZXZpIDwgc2JpLT5zX25kZXZzOyBkZXZpKyspIHsKPj4gKyAgICAgICAgICAgICAgIGlm
ICghYmRldl9pc196b25lZChGREVWKGRldmkpLmJkZXYpKQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPj4gKwo+PiArICAgICAgICAgICAgICAgc2Vnbm8gPSBHRVRfU0VHTk8o
c2JpLCBGREVWKGRldmkpLnN0YXJ0X2Jsayk7Cj4+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAw
OyBpIDwgRkRFVihkZXZpKS50b3RhbF9zZWdtZW50czsgaSsrKSB7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmIChmMmZzX3pvbmVfaXNfc2VxKHNiaSwgZGV2aSwKPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBHRVRfWk9ORV9GUk9NX1NFRyhzYmksIHNlZ25vICsgaSkpKQo+
IAo+IE1heWJlIHdlIGNhbiBjaGVjayBpdCB3aXRoIGEgem9uZSB1bml0PwoKWWVhaCwgYmV0dGVy
LCBsZXQgbWUgdXBkYXRlIGl0IGluIHYyLgoKVGhhbmtzLAoKPiAKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gc2Vnbm8gKyBpOwo+PiArICAgICAgICAgICAgICAgfQo+
PiArICAgICAgIH0KPj4gKyNlbmRpZgo+PiArICAgICAgIHJldHVybiBOVUxMX1NFR05POwo+PiAg
fQo+Pgo+PiAgc3RhdGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCj4+IEBAIC00MzQ5LDYgKzQzNjMsMTQgQEAgc3RhdGljIGludCBmMmZzX3NjYW5fZGV2
aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+ICAjZW5kaWYKPj4KPj4gICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgbWF4X2RldmljZXM7IGkrKykgewo+PiArICAgICAgICAgICAgICAgaWYg
KG1heF9kZXZpY2VzID09IDEpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgRkRFVihpKS50
b3RhbF9zZWdtZW50cyA9Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUzMl90
b19jcHUocmF3X3N1cGVyLT5zZWdtZW50X2NvdW50X21haW4pOwo+PiArICAgICAgICAgICAgICAg
ICAgICAgICBGREVWKGkpLnN0YXJ0X2JsayA9IDA7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IEZERVYoaSkuZW5kX2JsayA9IEZERVYoaSkudG90YWxfc2VnbWVudHMgKgo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCTEtTX1BFUl9TRUcoc2JpKTsK
Pj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiAgICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgRkRFVigwKS5iZGV2X2ZpbGUgPSBzYmktPnNiLT5z
X2JkZXZfZmlsZTsKPj4gICAgICAgICAgICAgICAgIGVsc2UgaWYgKCFSREVWKGkpLnBhdGhbMF0p
Cj4+IC0tCj4+IDIuNDguMQo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
