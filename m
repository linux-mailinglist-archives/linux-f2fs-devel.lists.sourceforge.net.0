Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E826745E586
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 03:58:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqRRS-0007A8-A7; Fri, 26 Nov 2021 02:58:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mqRRQ-0007A0-GO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TmUukXLtwE9kg4Kd/d7M7C6F2rTbhsj/057UqO2U04w=; b=FX7WZ+ubqMe6iATZAy3jBHXP2I
 qtxTk7GUKxceJSDatLzEIp58pW02nOtrbm80E8BQUYw3iLOrphSraXkh7ZCL3dYCoLuGRU7MXLYRm
 0xKvKVac6YDi90QzNiNOhsVF1mDhEsKhsWSD9+KDNl56NXh5SibXW0BHQ3a3blT8CDlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TmUukXLtwE9kg4Kd/d7M7C6F2rTbhsj/057UqO2U04w=; b=m4d2L2Fu5KPEQF/gvRPWqJwTHB
 j796HfOYMXYd8k0FYJQSP0wlE+3VLl+zJrrkJHK87QKpxQRk2905B95E6uDbejCMUd1/wOxobflCK
 TcTltiZ7dPuy1CdOG4ylInglyUacrNg4arksbh5bDLs+NGkTCTj45o/dUzibMwBijx+c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqRRP-009YaS-PC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:58:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9190860F42;
 Fri, 26 Nov 2021 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637895498;
 bh=MEuZPQ7Y4I/DY3QT22mh5y7ixNGkaiyc3E3ZDuP19QA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ddGJU2xzl9V35P2oYQ+H5KtWfSGeYW7ZlURFctjRV9E9nmXld1gvuzdgeicryHfSq
 vOZ4EHrwLF6CRCGY2JnsTweppyY9QshYWRtGYnbk1iZrVBrQpxBkX4lhlZ9U+lEALP
 ijQCVEvx6743gW7JuNVJcUwfOzelb+KgUTgg83BVF9aJrwXdsTyeBIxi/vn7axFWap
 CDjlzdM6kpdAiLH57LSpoInw9CtK/6VhsVoVoAbrtcKV0Z0AG1QXHxM/5XgtqhAQJd
 VnJEiEGQuJo2VmeuseczqI9alJ03FLKXLbLJztGA+yHUgJnA3BDoqw9qP69XV1t0lg
 mf8DB+uGNOtgg==
Message-ID: <5f1e5ce8-7a90-8a37-cae2-75f3a140132c@kernel.org>
Date: Fri, 26 Nov 2021 10:58:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211124083929.259433-1-changfengnan@vivo.com>
 <20211124083929.259433-2-changfengnan@vivo.com>
 <AI2AswABE2wldWuXsm4geaoQ.9.1637853316644.Hmail.changfengnan@vivo.com.@PGZmZmE2ZjgyLTIyYTktYjE5ZC01YmMyLTJlNzlmZDE4MjBiN0BrZXJuZWwub3JnPg==>
 <KL1PR0601MB4003860E394F4796A2128C97BB639@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003860E394F4796A2128C97BB639@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/26 10:14, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mqRRP-009YaS-PC
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMS8yNiAxMDoxNCwg5bi45Yek5qWgIHdyb3RlOgo+IAo+IAo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBjaGFuZ2ZlbmduYW5Adml2by5jb20gPGNoYW5nZmVu
Z25hbkB2aXZvLmNvbT4gT24gQmVoYWxmIE9mIENoYW8KPj4gWXUKPj4gU2VudDogVGh1cnNkYXks
IE5vdmVtYmVyIDI1LCAyMDIxIDExOjE1IFBNCj4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25h
bkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZwo+PiBDYzogbGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGYyZnM6IHN1
cHBvcnQgUE9TSVhfRkFEVl9ET05UTkVFRCBkcm9wCj4+IGNvbXByZXNzZWQgcGFnZSBjYWNoZQo+
Pgo+PiBPbiAyMDIxLzExLzI0IDE2OjM5LCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+Pj4gUHJldmlv
dXNseSwgY29tcHJlc3NlZCBwYWdlIGNhY2hlIGRyb3Agd2hlbiBjbGVhbiBwYWdlIGNhY2hlLCBi
dXQKPj4+IFBPU0lYX0ZBRFZfRE9OVE5FRUQgY2FuJ3QgY2xlYW4gY29tcHJlc3NlZCBwYWdlIGNh
Y2hlLCB0aGlzIGNvbW1pdCB0cnkKPj4+IHRvIHN1cHBvcnQgaXQuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdmZW5nbmFuQHZpdm8uY29tPgo+Pj4gLS0tCj4+PiAg
ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxMCArKysrKysrKy0tCj4+PiAgICBmcy9mMmZzL2YyZnMu
aCAgICAgfCAgNyArKysrLS0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3Mu
YyBiL2ZzL2YyZnMvY29tcHJlc3MuYyBpbmRleAo+Pj4gZmI5ZTUxNDlhZjVkLi43ZWM1ZTNjMjU5
MGIgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPj4+ICsrKyBiL2ZzL2YyZnMv
Y29tcHJlc3MuYwo+Pj4gQEAgLTg0Miw3ICs4NDIsNyBAQCB2b2lkIGYyZnNfZW5kX3JlYWRfY29t
cHJlc3NlZF9wYWdlKHN0cnVjdCBwYWdlCj4+ICpwYWdlLCBib29sIGZhaWxlZCwKPj4+ICAgIAkJ
V1JJVEVfT05DRShkaWMtPmZhaWxlZCwgdHJ1ZSk7Cj4+PiAgICAJZWxzZSBpZiAoYmxrYWRkcikK
Pj4+ICAgIAkJZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc2JpLCBwYWdlLAo+Pj4gLQkJCQkJ
ZGljLT5pbm9kZS0+aV9pbm8sIGJsa2FkZHIpOwo+Pj4gKwkJCQkJZGljLCBibGthZGRyKTsKPj4+
Cj4+PiAgICAJaWYgKGF0b21pY19kZWNfYW5kX3Rlc3QoJmRpYy0+cmVtYWluaW5nX3BhZ2VzKSkK
Pj4+ICAgIAkJZjJmc19kZWNvbXByZXNzX2NsdXN0ZXIoZGljKTsKPj4+IEBAIC0xNjU5LDYgKzE2
NTksNyBAQCBzdGF0aWMgdm9pZCBmMmZzX3B1dF9kaWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4
Cj4+ICpkaWMpCj4+PiAgICBzdGF0aWMgdm9pZCBfX2YyZnNfZGVjb21wcmVzc19lbmRfaW8oc3Ry
dWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsIGJvb2wKPj4gZmFpbGVkKQo+Pj4gICAgewo+Pj4g
ICAgCWludCBpOwo+Pj4gKwluaWRfdCBpbm8gPSBkaWMtPmlub2RlLT5pX2lubzsKPj4+Cj4+PiAg
ICAJZm9yIChpID0gMDsgaSA8IGRpYy0+Y2x1c3Rlcl9zaXplOyBpKyspIHsKPj4+ICAgIAkJc3Ry
dWN0IHBhZ2UgKnJwYWdlID0gZGljLT5ycGFnZXNbaV07IEBAIC0xNjY2LDYgKzE2NjcsOSBAQAo+
PiBzdGF0aWMKPj4+IHZvaWQgX19mMmZzX2RlY29tcHJlc3NfZW5kX2lvKHN0cnVjdCBkZWNvbXBy
ZXNzX2lvX2N0eCAqZGljLCBib29sIGZhaWxlZCkKPj4+ICAgIAkJaWYgKCFycGFnZSkKPj4+ICAg
IAkJCWNvbnRpbnVlOwo+Pj4KPj4+ICsJCWlmIChkaWMtPmNwYWdlX2NhY2hlZCkKPj4+ICsJCQlz
ZXRfcGFnZV9wcml2YXRlX2RhdGEocnBhZ2UsIGlubyk7Cj4+Cj4+IEkgZGlkbid0IGdldCB0aGUg
cG9pbnQsIHdoeSBzaG91bGQgd2Ugc2V0IGlubyBpbnRvIHJhdyBwYWdlJ3MgcHJpdmF0ZSBmaWVs
ZD8KPiBZZXMsIGJlY2F1c2UgcmF3IHBhZ2Ugd2lsbCBhZGQgaW50byBwYWdlIGNhY2hlLCBhbmQK
PiBQT1NJWF9GQURWX0RPTlRORUVEOgo+IGludmFsaWRhdGVfbWFwcGluZ19wYWdldmVjCj4gICAg
LT5fX2ludmFsaWRhdGVfbWFwcGluZ19wYWdlcwo+ICAgICAgLT5pbnZhbGlkYXRlX2lub2RlX3Bh
Z2UKPiAgICAgICAgLT5pbnZhbGlkYXRlX2NvbXBsZXRlX3BhZ2UgIC8vIGNhbGwgdHJ5X3RvX3Jl
bGVhc2VfcGFnZSB3aGVuIHBhZ2UgaGFzIHByaXZhdGUgZGF0YQo+IAo+IFNvLCBpZiByYXcgcGFn
ZSBkb24ndCBoYXZlIHByaXZhdGUgZGF0YSwgaXQgd2lsbCBub3QgY2FsbCBmMmZzX2ludmFsaWRh
dGVfY29tcHJlc3NfcGFnZXMuCj4gVGhpcyBjb21taXQgdHJ5IHVzZSBwcml2YXRlIGRhdGEgdG8g
Y29ubmVjdCByYXcgcGFnZSB3aGljaCBjb21wcmVzc2VkIHBhZ2UgaGFzIGJlZW4gY2FjaGVkLgoK
T2gsIHl1cCwgaG93IGFib3V0IGNhbGxpbmcgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2Vz
KCkgZGlyZWN0bHkgaW4gZjJmc19maWxlX2ZhZHZpc2UoKQpmb3IgUE9TSVhfRkFEVl9ET05UTkVF
RCBjYXNlPyBpdCBjYW4gYXZvaWQgdW5uZWVkZWQgdXNlIG9mIHByaXZhdGUgZmllbGQgc3BhY2Uu
CgpUaGFua3MsCgo+ICAgCj4+Cj4+IFRoYW5rcywKPj4KPj4+ICsKPj4+ICAgIAkJLyogUEdfZXJy
b3Igd2FzIHNldCBpZiB2ZXJpdHkgZmFpbGVkLiAqLwo+Pj4gICAgCQlpZiAoZmFpbGVkIHx8IFBh
Z2VFcnJvcihycGFnZSkpIHsKPj4+ICAgIAkJCUNsZWFyUGFnZVVwdG9kYXRlKHJwYWdlKTsKPj4+
IEBAIC0xNzcyLDEwICsxNzc2LDExIEBAIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3Bh
Z2Uoc3RydWN0Cj4+IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpCj4+PiAgICB9
Cj4+Pgo+Pj4gICAgdm9pZCBmMmZzX2NhY2hlX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIHN0cnVjdCBwYWdlCj4+ICpwYWdlLAo+Pj4gLQkJCQkJCW5pZF90IGlubywg
YmxvY2tfdCBibGthZGRyKQo+Pj4gKwkJCQlzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywg
YmxvY2tfdCBibGthZGRyKQo+Pj4gICAgewo+Pj4gICAgCXN0cnVjdCBwYWdlICpjcGFnZTsKPj4+
ICAgIAlpbnQgcmV0Owo+Pj4gKwluaWRfdCBpbm8gPSBkaWMtPmlub2RlLT5pX2lubzsKPj4+Cj4+
PiAgICAJaWYgKCF0ZXN0X29wdChzYmksIENPTVBSRVNTX0NBQ0hFKSkKPj4+ICAgIAkJcmV0dXJu
Owo+Pj4gQEAgLTE4MDQsNiArMTgwOSw3IEBAIHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2VkX3Bh
Z2Uoc3RydWN0Cj4+IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPj4+ICAg
IAl9Cj4+Pgo+Pj4gICAgCXNldF9wYWdlX3ByaXZhdGVfZGF0YShjcGFnZSwgaW5vKTsKPj4+ICsJ
ZGljLT5jcGFnZV9jYWNoZWQgPSB0cnVlOwo+Pj4KPj4+ICAgIAlpZiAoIWYyZnNfaXNfdmFsaWRf
YmxrYWRkcihzYmksIGJsa2FkZHIsCj4+IERBVEFfR0VORVJJQ19FTkhBTkNFX1JFQUQpKQo+Pj4g
ICAgCQlnb3RvIG91dDsKPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oIGluZGV4Cj4+PiBhYzZkZGE2YzRjNWEuLjEyODE5MGIwYzczNyAxMDA2NDQKPj4+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4gQEAgLTE1NTEs
NiArMTU1MSw3IEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCB7Cj4+PiAgICAJICovCj4+PiAg
ICAJcmVmY291bnRfdCByZWZjbnQ7Cj4+Pgo+Pj4gKwlib29sIGNwYWdlX2NhY2hlZDsJCS8qIGlu
ZGljYXRlIGNwYWdlcyBjYWNoZWQgaW4gY29tcHJlc3MKPj4gbWFwcGluZyovCj4+PiAgICAJYm9v
bCBmYWlsZWQ7CQkJLyogSU8gZXJyb3Igb2NjdXJyZWQgYmVmb3JlIGRlY29tcHJlc3Npb24/Cj4+
ICovCj4+PiAgICAJYm9vbCBuZWVkX3Zlcml0eTsJCS8qIG5lZWQgZnMtdmVyaXR5IHZlcmlmaWNh
dGlvbiBhZnRlcgo+PiBkZWNvbXByZXNzaW9uPyAqLwo+Pj4gICAgCXZvaWQgKnByaXZhdGU7CQkJ
LyogcGF5bG9hZCBidWZmZXIgZm9yIHNwZWNpZmllZAo+PiBkZWNvbXByZXNzaW9uIGFsZ29yaXRo
bSAqLwo+Pj4gQEAgLTQwODUsNyArNDA4Niw3IEBAIHZvaWQgZjJmc19kZXN0cm95X2NvbXByZXNz
X2NhY2hlKHZvaWQpOwo+Pj4gICAgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKkNPTVBSRVNTX01BUFBJ
Tkcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4+ICAgIHZvaWQgZjJmc19pbnZhbGlkYXRl
X2NvbXByZXNzX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190Cj4+IGJsa2Fk
ZHIpOwo+Pj4gICAgdm9pZCBmMmZzX2NhY2hlX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksIHN0cnVjdCBwYWdlCj4+ICpwYWdlLAo+Pj4gLQkJCQkJCW5pZF90IGlubywg
YmxvY2tfdCBibGthZGRyKTsKPj4+ICsJCQkJc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMs
IGJsb2NrX3QgYmxrYWRkcik7Cj4+PiAgICBib29sIGYyZnNfbG9hZF9jb21wcmVzc2VkX3BhZ2Uo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgcGFnZQo+PiAqcGFnZSwKPj4+ICAgIAkJ
CQkJCQkJYmxvY2tfdCBibGthZGRyKTsKPj4+ICAgIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXBy
ZXNzX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QKPj4+IGlubyk7IEBAIC00
MTM3LDggKzQxMzgsOCBAQCBzdGF0aWMgaW5saW5lIGludCBfX2luaXQKPj4gZjJmc19pbml0X2Nv
bXByZXNzX2NhY2hlKHZvaWQpIHsgcmV0dXJuIDA7IH0KPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9p
ZCBmMmZzX2Rlc3Ryb3lfY29tcHJlc3NfY2FjaGUodm9pZCkgeyB9Cj4+PiAgICBzdGF0aWMgaW5s
aW5lIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLAo+Pj4gICAgCQkJCWJsb2NrX3QgYmxrYWRkcikgeyB9Cj4+PiAtc3RhdGljIGlubGlu
ZSB2b2lkIGYyZnNfY2FjaGVfY29tcHJlc3NlZF9wYWdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPj4+IC0JCQkJc3RydWN0IHBhZ2UgKnBhZ2UsIG5pZF90IGlubywgYmxvY2tfdCBibGthZGRy
KSB7IH0KPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiBzdHJ1Y3QgcGFnZSAqcGFnZSwKPj4+ICsJCQkJ
c3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsIGJsb2NrX3QgYmxrYWRkcikgeyB9Cj4+PiAg
ICBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19sb2FkX2NvbXByZXNzZWRfcGFnZShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4+PiAgICAJCQkJc3RydWN0IHBhZ2UgKnBhZ2UsIGJsb2NrX3QgYmxr
YWRkcikgeyByZXR1cm4gZmFsc2U7IH0KPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX2lu
dmFsaWRhdGVfY29tcHJlc3NfcGFnZXMoc3RydWN0Cj4+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
