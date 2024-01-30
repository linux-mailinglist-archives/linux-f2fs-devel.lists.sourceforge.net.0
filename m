Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB158426EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 15:29:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUp7O-0008Ne-Il;
	Tue, 30 Jan 2024 14:29:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUp7N-0008NY-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 14:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1pvV2bEyvE5kqXxxvVm66SvlKih+lITCLcVZXn3Ykp0=; b=XIqMgjPVuDddpNBtePDLR3dUqX
 GAFfdz4dmtdD6BKCQ9sb8v+xm41dUxt/08XDdrNh7/p8y6FQ3MdFIfWRpkOmJwHaghvtCP3RoAr1E
 0SOlY1OUS5kqZP7Y2/pM1jL3os0IQa46Fq75sRmoE9RUJTy/Es10kpBPtC7XD092FrHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1pvV2bEyvE5kqXxxvVm66SvlKih+lITCLcVZXn3Ykp0=; b=L+X2JXOdE+KgkG3I0F6/b8koY+
 cHvaXArC7m9LTTNdpv2DdPeTuXGtGkq1l92FYqJUKhucQ4yzLDdeNcxLbJ0/sZz69QJfVG0NNEhYd
 rprW/ZA01DaqqKilLx18DeAe1wyDjsufhcXFrZiO983Wagod4p0xgmpKG2VOgc8Tq3/0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUp7M-0002iH-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 14:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1458CCE18D0;
 Tue, 30 Jan 2024 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B756C433F1;
 Tue, 30 Jan 2024 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706624973;
 bh=KnPGMMxaf6TMJMYT3i9Zl9SSMDr+33/RimwM+rsX9rs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gdKdehbEQY9Okls+GpFDmjtaa+626FfhvMX+7nKHmRMPLswzaTX0GV8ip8cvVNmGT
 6+igRmtgtwVsA104YSN7ypCJDu/jaCjjmyUVkdHQuZVZPFZcxe+LDFkaAG3KHILsQY
 fSK9D8YCPGCGL37uT7VTlVXMTVfOfUNIvifWBpxshYH0As6u/rzpapTy2GLqOOe+K0
 AJ+WXOeoDEJzQmjxaiWWChkpHiFgsUQIyUE2ebJUaDFdb66F8a6AWvAzCU/7I0EpSD
 aPvuyYPBuVOB7MSikE9mvLkV3mEsuzZCaRadlxqZ0aDxuVfmQW28NS/xipXgxXx1jS
 zI5DAbV2K0Uzw==
Message-ID: <c65cc502-3448-4627-8245-6cba07945183@kernel.org>
Date: Tue, 30 Jan 2024 22:29:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20240117230032.2312067-1-daeho43@gmail.com>
 <df9645d9-1e9a-4bd2-88bb-26425cf45811@kernel.org>
 <CACOAw_yjEuGSvo_qyoA13U0HwOr3gOzGtNf2Twhes01SNSGQeg@mail.gmail.com>
 <b18c286a-cc72-439c-b373-98e0d6504618@kernel.org>
 <CACOAw_yqrtEhq4wtJbs7CVn260h7iZyC7koCWH1iMyeQo5140g@mail.gmail.com>
 <e879da72-4c4f-4aed-8081-784f2de5c887@kernel.org>
 <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <CACOAw_xDDoOQEHOAXkG+8PF8yD0MtUAW4J04tYcPCh3VMp7FGQ@mail.gmail.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/1/29 23:47, Daeho Jeong wrote: > On Sun, Jan 28, 2024
    at 5:27 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2024/1/27 2:17, Daeho
    Jeong wrote: >>> On Thu, Jan 25, 2024 at 5:27 PM Chao Yu <c [...] 
 
 Content analysis details:   (-3.8 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUp7M-0002iH-EJ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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

T24gMjAyNC8xLzI5IDIzOjQ3LCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBTdW4sIEphbiAyOCwg
MjAyNCBhdCA1OjI34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNC8xLzI3IDI6MTcsIERhZWhvIEplb25nIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMjUs
IDIwMjQgYXQgNToyN+KAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4K
Pj4+PiBPbiAyMDI0LzEvMjYgMDoyNSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwg
SmFuIDI0LCAyMDI0IGF0IDc6MzTigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pj4+Pj4KPj4+Pj4+ICtDYyBZb25ncGVuZyBZYW5nCj4+Pj4+Pgo+Pj4+Pj4gRGFlaG8sCj4+
Pj4+Pgo+Pj4+Pj4gWW9uZ3BlbmcgcmVwb3J0cyBhIHBvdGVudGlhbCBpc3N1ZTogaWYgYy5kZXZp
Y2VzWzBdLnRvdGFsX3NlZ21lbnRzIGlzCj4+Pj4+PiBsYXJnZXIgdGhhbiBzZWdtZW50cyBvZiBt
YWluYXJlYSwgYy5jdXJfc2VnW0NVUlNFR19IT1RfTk9ERV0gd2lsbCBleGNlZWQKPj4+Pj4+IGVu
ZCBib3VuZGFyeSBvZiBtYWluYXJlYS4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB0aGF0PyB0aG91
Z2ggaXQncyBhIGNvcm5lcgo+Pj4+Pj4gY2FzZS4KPj4+Pj4KPj4+Pj4gQ2FuIHlvdSBlbGFib3Jh
dGUgbW9yZT8KPj4+Pgo+Pj4+IFNpbmNlIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIGlzIGFu
IG9mZnNldCBzdGFydGVkIGZyb20gbWFpbl9ibGthZGRyLgo+Pj4KPj4+IE9oLCBHb3QgaXQuCj4+
PiBUaGVuLCBob3cgYWJvdXQgdGhpcz8KPj4+Cj4+PiAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJT
RUdfSE9UX05PREVdID0gYy56b25lZF9tb2RlbCA9PSBGMkZTX1pPTkVEX0hNID8KPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIChjLmRldmljZXNbMV0uc3RhcnRfYmxrYWRkciAtCj4+PiBn
ZXRfc2IobWFpbl9ibGthZGRyKSkgLyBjLmJsa3NfcGVyX3NlZyA6IDA7Cj4+Cj4+IEJldHRlciwg
YnV0IGxvZyBoZWFkZXIgc2hvdWxkIGFsaWduIHRvIHN0YXJ0IGJsa2FkZHIgb2Ygem9uZT8KPiAK
PiBJdCdzIGFscmVhZHkgYWxpZ25lZCBoZXJlLgoKQWgsIHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0
aW9uLiA6KQoKVGhhbmtzLAoKPiAKPiAgICAgICAgICBpZiAoYy56b25lZF9tb2RlICYmIGMubmRl
dnMgPiAxKQo+ICAgICAgICAgICAgICAgICAgem9uZV9hbGlnbl9zdGFydF9vZmZzZXQgKz0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1swXS50b3RhbF9zZWN0b3JzICogYy5z
ZWN0b3Jfc2l6ZSkgJQo+IHpvbmVfc2l6ZV9ieXRlczsKPiAKPiAuLi4KPiAKPiAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgYy5uZGV2czsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgICBpZiAoaSA9
PSAwKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpXS50b3RhbF9zZWdt
ZW50cyA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGMuZGV2aWNlc1tpXS50
b3RhbF9zZWN0b3JzICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjLnNlY3Rv
cl9zaXplIC0gem9uZV9hbGlnbl9zdGFydF9vZmZzZXQpIC8KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzZWdtZW50X3NpemVfYnl0ZXM7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIGMuZGV2aWNlc1tpXS5zdGFydF9ibGthZGRyID0gMDsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgYy5kZXZpY2VzW2ldLmVuZF9ibGthZGRyID0gYy5kZXZpY2VzW2ldLnRvdGFsX3NlZ21l
bnRzICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Yy5ibGtzX3Blcl9zZWcgLSAxICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc2ItPnNlZ21lbnQwX2Jsa2FkZHI7Cj4gICAgICAgICAgICAgICAgICB9
IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgICBjLmRldmljZXNbaV0udG90YWxfc2Vn
bWVudHMgPQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpXS50
b3RhbF9zZWN0b3JzIC8KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoYy5zZWN0
b3JzX3Blcl9ibGsgKiBjLmJsa3NfcGVyX3NlZyk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGMuZGV2aWNlc1tpXS5zdGFydF9ibGthZGRyID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMuZGV2aWNlc1tpIC0gMV0uZW5kX2Jsa2FkZHIgKyAxOwo+IAo+IC4u
Lgo+IAo+ICAgICAgICAgIHRvdGFsX21ldGFfem9uZXMgPSBaT05FX0FMSUdOKHRvdGFsX21ldGFf
c2VnbWVudHMgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjLmJsa3NfcGVyX3NlZyk7Cj4gCj4gICAgICAgICAgc2V0X3NiKG1haW5fYmxrYWRkciwg
Z2V0X3NiKHNlZ21lbnQwX2Jsa2FkZHIpICsgdG90YWxfbWV0YV96b25lcyAqCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYy5zZWdzX3Blcl96b25lICogYy5ibGtzX3Blcl9zZWcp
Owo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4+IElmIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05P
REVdIHdhcyBhc3NpZ25lZCB3LyBjLmRldmljZXNbMF0udG90YWxfc2VnbWVudHMsCj4+Pj4gYW5k
IGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyBpcyBsYXJnZXIgdGhhbiBzZWdtZW50cyBvZiBt
YWluYXJlLAo+Pj4+IGMuY3VyX3NlZ1tDVVJTRUdfSE9UX05PREVdIHdpbGwgZXhjZWVkIHRoZSBl
bmQgYm91bmRhcnkgb2YgbWFpbmFyZWEuCj4+Pj4KPj4+PiAgICAgICAgICAgYy5jdXJfc2VnW0NV
UlNFR19IT1RfTk9ERV0gPSBjLnpvbmVkX21vZGVsID09IEYyRlNfWk9ORURfSE0gPwo+Pj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYy5kZXZpY2VzWzBdLnRvdGFsX3NlZ21lbnRzIDogMDsK
Pj4+Pgo+Pj4+PiBJbiB0aGUgY2FzZSBvZiBGMkZTX1pPTkVEX0hNLCB3ZSBoYXZlIHRoZSBkZXZp
Y2VzWzFdLgo+Pj4+PiBEbyB5b3UgbWVhbiB0aGUgY2FzZSB3ZSBmb3JtYXQgdGhlIGZpbGVzeXN0
ZW0gaW50ZW50aW9uYWxseSBzbWFsbGVyCj4+Pj4+IHRoYW4gd2hhdCBkZXZpY2VzIGhhdmU/Cj4+
Pj4KPj4+PiBJIG1lYW4gYmxldyBjYXNlOgo+Pj4+IGRldmljZVswXTogY29udmVudGlvbmFsIGRl
dmljZSBzaXplID0gMTAyNDAgTUIKPj4+PiBkZXZpY2VbMV06IHpvbmUgZGV2aWNlIHNpemUgPSAy
IE1CCj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAyMDI0LzEv
MTggNzowMCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IE1ha2UgdG8gYWxsb2NhdGUgbG9n
cyBhZnRlciBjb252ZW50aW9uYWwgYXJlYSBmb3IgSE0gem9uZWQgZGV2aWNlcyB0bwo+Pj4+Pj4+
IHNwYXJlIHRoZW0gZm9yIGZpbGUgcGlubmluZyBzdXBwb3J0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+PiAt
LS0KPj4+Pj4+PiAgICAgIG1rZnMvZjJmc19mb3JtYXQuYyB8IDMgKystCj4+Pj4+Pj4gICAgICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pj4KPj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvbWtmcy9mMmZzX2Zvcm1hdC5jIGIvbWtmcy9mMmZzX2Zvcm1hdC5j
Cj4+Pj4+Pj4gaW5kZXggZjI4NDBjOC4uOTFhN2Y0YiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9ta2Zz
L2YyZnNfZm9ybWF0LmMKPj4+Pj4+PiArKysgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPj4+Pj4+PiBA
QCAtNTU3LDcgKzU1Nyw4IEBAIHN0YXRpYyBpbnQgZjJmc19wcmVwYXJlX3N1cGVyX2Jsb2NrKHZv
aWQpCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0NPTERfREFUQV0g
PSAwOwo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgYy5jdXJfc2VnW0NVUlNFR19XQVJNX0RBVEFd
ID0gbmV4dF96b25lKENVUlNFR19DT0xEX0RBVEEpOwo+Pj4+Pj4+ICAgICAgICAgIH0gZWxzZSBp
ZiAoYy56b25lZF9tb2RlKSB7Cj4+Pj4+Pj4gLSAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VH
X0hPVF9OT0RFXSA9IDA7Cj4+Pj4+Pj4gKyAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX0hP
VF9OT0RFXSA9IGMuem9uZWRfbW9kZWwgPT0gRjJGU19aT05FRF9ITSA/Cj4+Pj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGMuZGV2aWNlc1swXS50b3RhbF9zZWdtZW50cyA6IDA7Cj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICBjLmN1cl9zZWdbQ1VSU0VHX1dBUk1fTk9ERV0gPSBuZXh0X3pvbmUo
Q1VSU0VHX0hPVF9OT0RFKTsKPj4+Pj4+PiAgICAgICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJT
RUdfQ09MRF9OT0RFXSA9IG5leHRfem9uZShDVVJTRUdfV0FSTV9OT0RFKTsKPj4+Pj4+PiAgICAg
ICAgICAgICAgICAgIGMuY3VyX3NlZ1tDVVJTRUdfSE9UX0RBVEFdID0gbmV4dF96b25lKENVUlNF
R19DT0xEX05PREUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
