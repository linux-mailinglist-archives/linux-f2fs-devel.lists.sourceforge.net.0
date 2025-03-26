Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A859A7164D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Mar 2025 13:11:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txPb5-0003Ve-7G;
	Wed, 26 Mar 2025 12:11:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1txPb2-0003VP-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 12:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hV2+SCnRFbQUIJMz1Qi5d2UHoR5l7JcLeJjMl/c5zlY=; b=l2pn0iTA+xBAoOsR6QGO2fZlok
 wrcnBOQvspxb+c5OUMU67JVkuq2jrrlRP/iyJNls+AmRl/lkNNWbzNNBnhG/ClM+1nzzFE/XvQVBD
 mUR7KRnJqykgC/q3emfObrp6wFn0XfhL/vacH17BcIfj0Vovr5Ct0ORrah7Qi4CvkuJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hV2+SCnRFbQUIJMz1Qi5d2UHoR5l7JcLeJjMl/c5zlY=; b=R3TF9FNaDiaFAM6/EFH2zravU2
 LE4Bf8Fju0SrC0TGbpR59OeHgKiqT4dL4N7xmeM2jSlaId5IM36pS/V77a3ql9eMR+mXfkrH8MXrJ
 nB8QVd7lHG5SxoiwWhRcVUplc2c1KRphmWd89jLcb9l55N45sW0SG5BpAPUv2JNn2ar8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1txPaw-0008KT-DW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Mar 2025 12:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B69F1A41105;
 Wed, 26 Mar 2025 12:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D32C4CEEA;
 Wed, 26 Mar 2025 12:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742991048;
 bh=4ZIa5R+hLRKNLLa+f5ExAc1PekNs6AAe+hmDktSX6fY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y/8F9qsykijVDCBysLKBo/2uRXwbgP4qAo5atqcTLs88ubalJCvnk3mAQa41fPUUb
 CVN+sC/Sakb6dDSOmqXyM7Dml4uwkjCCrQjjSP2ywOHSd1keJCLLQ4wLZJS21oIMIZ
 tu7QedmFr8Ou9irWGEWDJ6vBAOITGE1BaM4qJiU6MvCpndqRmENH2s06Fy0yf5MHGA
 OLx5FAfdRzLlE4HL2LwCFFes+e8pAAoDUQTkSb85qmwzYs83DuQC+hzJUu8MwKcdzJ
 mfHniUHpEHuj55dgL0VrLaYTWtPWABd+QBQ9IPiYohZDe6g3vl/PjBequN2plVupEb
 zs+bxNFHLRecA==
Message-ID: <8a72691e-28ef-4b6b-a855-62fd6c2743dc@kernel.org>
Date: Wed, 26 Mar 2025 20:10:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
 <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
 <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/26/25 18:51, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年3月26日周三 17:26写道： >> >> On 3/26/25 16:46, Zhiguo Niu
    wrote: >>> Commit fccaa81de87e ("f2fs: prevent atomic file f [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [147.75.193.91 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1txPaw-0008KT-DW
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
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
Cc: daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMy8yNi8yNSAxODo1MSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjXlubQz5pyIMjbml6XlkajkuIkgMTc6MjblhpnpgZPvvJoKPj4KPj4gT24g
My8yNi8yNSAxNjo0NiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+IENvbW1pdCBmY2NhYTgxZGU4N2Ug
KCJmMmZzOiBwcmV2ZW50IGF0b21pYyBmaWxlIGZyb20gYmVpbmcgZGlydGllZCBiZWZvcmUgY29t
bWl0IikKPj4+IGFkZHMgdGhlIHByb2Nlc3Npbmcgb2YgRklfQVRPTUlDX0RJUlRJRUQgaW4gdGhl
IGZvbGxvd2luZyB0d28gcG9zaXRpb25zLAo+Pj4gWzFdCj4+PiBmMmZzX2NvbW1pdF9hdG9taWNf
d3JpdGUKPj4+ICAtIF9fZjJmc19jb21taXRfYXRvbWljX3dyaXRlCj4+PiAgIC0gc2JpLT5jb21t
aXR0ZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+Pj4gICAtIHNldF9p
bm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKTsKPj4+ICAgLSBpZiAoaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+Pj4gICAtICAgIGNsZWFy
X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4+ICAgLSAgICBmMmZzX21h
cmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+PiAgIC0gfQo+Pj4gWzJdCj4+PiBm
MmZzX2Fib3J0X2F0b21pY193cml0ZQo+Pj4gICAtIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9k
ZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4+PiAgIC0gICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9k
ZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+Pj4gICAtICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9z
eW5jKGlub2RlLCB0cnVlKTsKPj4+ICAgLSB9Cj4+Pgo+Pj4gYnV0IFsxXSBzZWVtcyB0byBiZSBy
ZWR1bmRhbnQ6Cj4+PiBUaGUgYXRvbWljIGZpbGUgZmxhZyBGSV9BVE9NSUNfRklMRSBpcyBzdGls
bCBzZXQgaGVyZSwgc28gZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMKPj4+IHN0aWxsIGRvZXMg
bm90IHNldCB0aGUgZGlydHkgc3RhdGUgdG8gdmZzLiBJZiBGSV9BVE9NSUNfRElSVElFRCB3YXMg
b3JpZ2luYWxseSBzZXQKPj4+IHdoZW4gYXRvbWljIGZpbGUgaXMgY29tbWl0dGluZywgdGhlbiBG
SV9BVE9NSUNfRElSVElFRCBpcyBqdXN0IGNsZWFyZWQgaGVyZSwgYW5kCj4+PiB0aGVuIGRvIHRo
ZSByZXBlYXRpbmcgYWN0aW9uIG9mIHNldHRpbmcgRklfQVRPTUlDX0RJUlRJRUQ/Cj4+PiBTbyBp
cyBpdCBlbm91Z2ggdG8gZG8gdGhpcyBvbmx5IGluIFsyXT8KPj4KPj4gSGkgWmhpZ3VvLAo+Pgo+
PiBJIGNoZWNrZWQgdGhlIGNvZGUgYWdhaW4sIGZpbmFsbHksIEkgZ290IHRoaXMsIGNvdWxkIHlv
dSBwbGVhc2UgdGFrZQo+PiBhIGxvb2s/Cj4+Cj4+IFBpbmcgRGFlaG8gYXMgd2VsbC4KPj4KPj4g
U3ViamVjdDogW1BBVENIXSBmMmZzOiBmaXggdG8gc2V0IGF0b21pYyB3cml0ZSBzdGF0dXMgbW9y
ZSBjbGVhcgo+Pgo+PiAxLiBBZnRlciB3ZSBzdGFydCBhdG9taWMgd3JpdGUgaW4gYSBkYXRhYmFz
ZSBmaWxlLCBiZWZvcmUgY29tbWl0dGluZwo+PiBhbGwgZGF0YSwgd2UnZCBiZXR0ZXIgbm90IHNl
dCBpbm9kZSB3LyB2ZnMgZGlydHkgc3RhdHVzIHRvIGF2b2lkCj4+IHJlZHVuZGFudCB1cGRhdGVz
LCBpbnN0ZWFkLCB3ZSBvbmx5IHNldCBpbm9kZSB3LyBhdG9taWMgZGlydHkgc3RhdHVzLgo+Pgo+
PiAyLiBBZnRlciB3ZSBjb21taXQgYWxsIGRhdGEsIGJlZm9yZSBjb21taXR0aW5nIG1ldGFkYXRh
LCB3ZSBuZWVkIHRvCj4+IGNsZWFyIGF0b21pYyBkaXJ0eSBzdGF0dXMsIGFuZCBzZXQgdmZzIGRp
cnR5IHN0YXR1cyB0byBhbGxvdyB2ZnMgZmx1c2gKPj4gZGlydHkgaW5vZGUuCj4+Cj4gSGkgQ2hh
bywKPiB0aGVzZSBsb29rcyBtb3JlIGNsZWFyLgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZnMvZjJmcy9pbm9kZS5jICAgfCAgNCArKystCj4+
ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDEwICsrKysrKy0tLS0KPj4gIGZzL2YyZnMvc3VwZXIuYyAg
IHwgIDQgKysrLQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9k
ZS5jCj4+IGluZGV4IDVjODYzNGVhZWY3Yi4uZjU5OTFlODc1MWI5IDEwMDY0NAo+PiAtLS0gYS9m
cy9mMmZzL2lub2RlLmMKPj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4+IEBAIC0zNCw3ICszNCw5
IEBAIHZvaWQgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2RlICppbm9kZSwg
Ym9vbCBzeW5jKQo+PiAgICAgICAgIGlmIChmMmZzX2lub2RlX2RpcnRpZWQoaW5vZGUsIHN5bmMp
KQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Pgo+PiAtICAgICAgIGlmIChmMmZzX2lzX2F0
b21pY19maWxlKGlub2RlKSkKPj4gKyAgICAgICAvKiBvbmx5IGF0b21pYyBmaWxlIHcvIEZJX0FU
T01JQ19DT01NSVRURUQgY2FuIGJlIHNldCB2ZnMgZGlydHkgKi8KPj4gKyAgICAgICBpZiAoZjJm
c19pc19hdG9taWNfZmlsZShpbm9kZSkgJiYKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIWlz
X2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfQ09NTUlUVEVEKSkKPj4gICAgICAgICAg
ICAgICAgIHJldHVybjsKPj4KPj4gICAgICAgICBtYXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUp
Owo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+
PiBpbmRleCBkYzM2MGI0YjA1NjkuLjI4NjU5YTcxODkxYSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJm
cy9zZWdtZW50LmMKPj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gQEAgLTM3NiwxMCArMzc2
LDEyIEBAIHN0YXRpYyBpbnQgX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUoc3RydWN0IGlub2Rl
ICppbm9kZSkKPj4gICAgICAgICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgc2JpLT5jb21t
aXR0ZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+PiAgICAgICAgICAg
ICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpOwo+PiAtICAg
ICAgICAgICAgICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9BVE9NSUNfRElSVElF
RCkpIHsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwg
RklfQVRPTUlDX0RJUlRJRUQpOwo+PiAtICAgICAgICAgICAgICAgICAgICAgICBmMmZzX21hcmtf
aW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+IC0gICAgICAgICAgICAgICB9Cj4+ICsK
Pj4gKyAgICAgICAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgIWlzX2lub2RlX2ZsYWdfc2V0KGlu
b2RlLCBGSV9BVE9NSUNfRElSVElFRCkpOwo+IGJ1dCBGSV9BVE9NSUNfRElSVElFRCBtYXkgIG5v
dCBiZSBzZXQgd2hlbiBhdG9taWMgZmlsZSBpcyBjb21taXR0aW5nPwo+IHRoYW5rcyEKCmluY192
YWxpZF9ibG9ja19jb3VudCgpIHdpbGwgc2V0IEZJX0FUT01JQ19ESVJUSUVEIGZvciBpbm9kZSBh
dCBsZWFzdD8KCi0gX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUKIC0gX19yZXBsYWNlX2F0b21p
Y193cml0ZV9ibG9jawogIC0gaW5jX3ZhbGlkX2Jsb2NrX2NvdW50CiAgIC0gZjJmc19pX2Jsb2Nr
c193cml0ZQogICAgLSBmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYwoKVGhhbmtzLAoKPj4gKwo+
PiArICAgICAgICAgICAgICAgLyogY2xlYXIgYXRvbWljIGRpcnR5IHN0YXR1cyBhbmQgc2V0IHZm
cyBkaXJ0eSBzdGF0dXMgKi8KPj4gKyAgICAgICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWcoaW5v
ZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4gKyAgICAgICAgICAgICAgIGYyZnNfbWFya19pbm9k
ZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPj4gICAgICAgICB9Cj4+Cj4+ICAgICAgICAgX19j
b21wbGV0ZV9yZXZva2VfbGlzdChpbm9kZSwgJnJldm9rZV9saXN0LCByZXQgPyB0cnVlIDogZmFs
c2UpOwo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+
IGluZGV4IDlhNDJhMTMyM2Y0Mi4uYTVjYzlmNmVlMTZhIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZz
L3N1cGVyLmMKPj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4+IEBAIC0xNTMyLDcgKzE1MzIsOSBA
QCBpbnQgZjJmc19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykK
Pj4gICAgICAgICB9Cj4+ICAgICAgICAgc3Bpbl91bmxvY2soJnNiaS0+aW5vZGVfbG9ja1tESVJU
WV9NRVRBXSk7Cj4+Cj4+IC0gICAgICAgaWYgKCFyZXQgJiYgZjJmc19pc19hdG9taWNfZmlsZShp
bm9kZSkpCj4+ICsgICAgICAgLyogaWYgYXRvbWljIHdyaXRlIGlzIG5vdCBjb21taXR0ZWQsIHNl
dCBpbm9kZSB3LyBhdG9taWMgZGlydHkgKi8KPj4gKyAgICAgICBpZiAoIXJldCAmJiBmMmZzX2lz
X2F0b21pY19maWxlKGlub2RlKSAmJgo+PiArICAgICAgICAgICAgICAgICAgICAgICAhaXNfaW5v
ZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+PiAgICAgICAgICAgICAg
ICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4KPj4gICAgICAg
ICByZXR1cm4gcmV0Owo+PiAtLQo+PiAyLjQ4LjEKPj4KPj4KPj4+Cj4+PiBDYzogRGFlaG8gSmVv
bmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IEZpeGVzOiBmY2NhYTgxZGU4N2UgKCJmMmZz
OiBwcmV2ZW50IGF0b21pYyBmaWxlIGZyb20gYmVpbmcgZGlydGllZCBiZWZvcmUgY29tbWl0IikK
Pj4+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPj4+
IC0tLQo+Pj4gIGZzL2YyZnMvc2VnbWVudC5jIHwgNCAtLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQs
IDQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIv
ZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IDM5NmVmNzEuLmQ0ZWEzYWYgMTAwNjQ0Cj4+PiAt
LS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IEBA
IC0zNzYsMTAgKzM3Niw2IEBAIHN0YXRpYyBpbnQgX19mMmZzX2NvbW1pdF9hdG9taWNfd3JpdGUo
c3RydWN0IGlub2RlICppbm9kZSkKPj4+ICAgICAgIH0gZWxzZSB7Cj4+PiAgICAgICAgICAgICAg
IHNiaS0+Y29tbWl0dGVkX2F0b21pY19ibG9jayArPSBmaS0+YXRvbWljX3dyaXRlX2NudDsKPj4+
ICAgICAgICAgICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQp
Owo+Pj4gLSAgICAgICAgICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01J
Q19ESVJUSUVEKSkgewo+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGNsZWFyX2lub2RlX2ZsYWco
aW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKTsKPj4+IC0gICAgICAgICAgICAgICAgICAgICBmMmZz
X21hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4+PiAtICAgICAgICAgICAgIH0K
Pj4+ICAgICAgIH0KPj4+Cj4+PiAgICAgICBfX2NvbXBsZXRlX3Jldm9rZV9saXN0KGlub2RlLCAm
cmV2b2tlX2xpc3QsIHJldCA/IHRydWUgOiBmYWxzZSk7Cj4+CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
