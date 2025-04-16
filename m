Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A32D4A8AE72
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Apr 2025 05:34:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4tXg-0005mz-QQ;
	Wed, 16 Apr 2025 03:34:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4tXf-0005mt-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 03:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvbJZtdH8z6ZtcQ/cw+zCAq6MwAFOHhUHOH+omxW6g0=; b=NmdId4UTApcUiwxxbl6b+nBHlS
 p0bOM6bG/1FarPTjQhcbq/wxhLe89B0TDEGsvfhpdzZEcZh9PdLFtY2csIDwAK/JyP2hZrFswwjsx
 En504pJjzCeZqUPhhmeacS8h4Krfdcu7UuVOWNeMJ3zTJ0vbZTzz8lB/jxFKEj/G52bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvbJZtdH8z6ZtcQ/cw+zCAq6MwAFOHhUHOH+omxW6g0=; b=ZOgg+xgOp2nyYkPKu1MlkxXcuk
 fBBquBdrRMuLH+ZXOAGX1f9pLS42k0S3xIqS7NH5DBuLApncI5SQeGCQ+F9TXMuPL/M8cwFmjKhAw
 dPWNQqiE+jIExsISdfYnO/loyhkJ6cnSPoK/pqUHW33Y4RHPoGaKvs4bpYvG9xUsovo0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4tXP-0007wE-7f for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Apr 2025 03:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A2C46115F;
 Wed, 16 Apr 2025 03:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E74CC4CEE2;
 Wed, 16 Apr 2025 03:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744774440;
 bh=SQ8HLnKSp9IPYd8T8k0xX/+oXuS4WzIWfJjl4rqPonE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GEFnlkUnsMBDoeUdl4sbHI3S01kcWcrrpM2j33Fm3i4CF1bV6eMxLpHaLDVrxNy25
 XIAAEdmeJRAViHwqdzcku4EzQRuAWtT/FsMROvXEE59PkHZrJ393hJoaq3oggzCoZG
 Jqzdv47gz0Du0GHduWkbDpnsk3JjfTQs9SR+rnkXXIk1vNkx3GvpZSHdA/bQAlS/ed
 PcRaPOJrRnPIrHQRDZOgUaOGouzbTgtAqrGvEvUgZyGxTBeX1l9fTePgAL4IKImI2t
 44laqskv35lcAOxH1KIOH1/zRsv0bmSjA9tWyaoEw2hORk/B+IbTfMiBADF3F70tgs
 1ZrjDnmosq/AA==
Message-ID: <a51be7d3-ba69-4361-9d01-ea58df86b89c@kernel.org>
Date: Wed, 16 Apr 2025 11:33:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>, uplinkr@airmail.cc
References: <20250414111141.735081-1-chao@kernel.org>
 <CAD14+f0fFTOqjNL3pwi+Ucx2dR2UDhrF15-HgwbaM=Zid5Ge=Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f0fFTOqjNL3pwi+Ucx2dR2UDhrF15-HgwbaM=Zid5Ge=Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/16/25 03:28, Juhyung Park wrote: > Hm. > > Would this
 be what @uplinkr might have encountered? Maybe, :) @uplinkr, previously,
 if you used '-s' parameter while expand-resizing, that could be the reason
 it corrupted your partition. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4tXP-0007wE-7f
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: fix to always change metadata
 for expand resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xNi8yNSAwMzoyOCwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+IEhtLgo+IAo+IFdvdWxkIHRo
aXMgYmUgd2hhdCBAdXBsaW5rciBtaWdodCBoYXZlIGVuY291bnRlcmVkPwoKTWF5YmUsIDopCgpA
dXBsaW5rciwgcHJldmlvdXNseSwgaWYgeW91IHVzZWQgJy1zJyBwYXJhbWV0ZXIgd2hpbGUgZXhw
YW5kLXJlc2l6aW5nLAp0aGF0IGNvdWxkIGJlIHRoZSByZWFzb24gaXQgY29ycnVwdGVkIHlvdXIg
cGFydGl0aW9uLgoKVGhhbmtzLAoKPiAKPiBPbiBNb24sIEFwciAxNCwgMjAyNSBhdCA0OjEz4oCv
QU0gQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbAo+IDxsaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldD4gd3JvdGU6Cj4+Cj4+IHcvIGJlbG93IHRlc3RjYXNlLCByZXNpemUg
d2lsbCBnZW5lcmF0ZSBhIGNvcnJ1cHRlZCBpbWFnZSB3aGljaAo+PiBjb250YWlucyBpbmNvbnNp
c3RlbnQgbWV0YWRhdGE6Cj4+Cj4+IHRvdWNoIGltZwo+PiB0cnVuY2F0ZSAtcyAkKCg1MTIqMTAy
NCoxMDI0KjEwMjQpKSBpbWcKPj4gbWtmcy5mMmZzIC1mIGltZyAkKCgyNTYqMTAyNCoxMDI0KSkK
Pj4gcmVzaXplLmYyZnMgLXMgaW1nIC10ICQoKDEwMjQqMTAyNCoxMDI0KSkKPj4gbW91bnQgaW1n
IC9tbnQvZjJmcwo+Pgo+PiBbICAgMzEuNzI1MjAwXSBGMkZTLWZzIChsb29wMCk6IFdyb25nIGJp
dG1hcCBzaXplOiBzaXQ6IDE5Miwgc2l0X2Jsa19jbnQ6NDc2Mgo+PiBbICAgMzEuNzI4NDQxXSBG
MkZTLWZzIChsb29wMCk6IEZhaWxlZCB0byBnZXQgdmFsaWQgRjJGUyBjaGVja3BvaW50Cj4+Cj4+
IFRoZSByb290IGNhdXNlIGlzIHNhZmUgbW9kZSAodmlhIC1zIG9wdGlvbikgaXMgbm90IGNvbXBh
dGlibGUKPj4gdy8gZXhwYW5kIHJlc2l6ZSwgZHVlIHRvIGluIHNhZmUgbW9kZSwgd2Ugd2lsbCBr
ZWVwIGFsbCBwYXJhbWV0ZXJzCj4+IHJlbGF0ZWQgdG8gTkFULCBTSVQsIFNTQSBhcmVhLCBlLmcu
IHNpdF9iaXRtYXBfc2l6ZSwgaG93ZXZlciwgd2UKPj4gd2lsbCB1cGRhdGUgc2VnbWVudF9jb3Vu
dF9tYWluIGFjY29yZGluZyBuZXcgcGFydGl0aW9uIHNpemUsIHJlc3VsdAo+PiBpbiB0aGVyZSBp
cyBubyBlbm91Z2ggc2l0X2JpdG1hcCBhbmQgU0lUIGJsb2NrcyB0byBhZGRyZXNzIHRoZQo+PiBl
bnRpcmUgYmxvY2sgYWRkcmVzcyBvZiBuZXcgcGFydGl0aW9uLgo+Pgo+PiBBZGRpbmcgYSBjaGVj
ayBjb25kaXRpb24gdG8gYXZvaWQgZXhwYW5kaW5nIHBhcnRpdGlvbiBpbiBzYWZlCj4+IG1vZGUs
IGFuZCBjaGFuZ2UgbWFudWFsIGFjY29yZGluZ2x5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFv
IFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgZnNjay9yZXNpemUuYyAgICAgfCAxMiAr
KysrKysrKy0tLS0KPj4gIG1hbi9yZXNpemUuZjJmcy44IHwgIDIgKy0KPj4gIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnNjay9yZXNpemUuYyBiL2ZzY2svcmVzaXplLmMKPj4gaW5kZXggMWFiN2Q3NS4uNTg5MTRlYyAx
MDA2NDQKPj4gLS0tIGEvZnNjay9yZXNpemUuYwo+PiArKysgYi9mc2NrL3Jlc2l6ZS5jCj4+IEBA
IC03NTYsMTggKzc1NiwyMiBAQCBpbnQgZjJmc19yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpKQo+Pgo+PiAgICAgICAgIC8qIG1heSBkaWZmZXJlbnQgc2VjdG9yIHNpemUgKi8KPj4gICAg
ICAgICBpZiAoKGMudGFyZ2V0X3NlY3RvcnMgKiBjLnNlY3Rvcl9zaXplID4+Cj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPCBnZXRfc2IoYmxvY2tfY291
bnQpKQo+PiArICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpIDwg
Z2V0X3NiKGJsb2NrX2NvdW50KSkgewo+PiAgICAgICAgICAgICAgICAgaWYgKCFjLnNhZmVfcmVz
aXplKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIk5vdGhpbmcgdG8g
cmVzaXplLCBub3cgb25seSBzdXBwb3J0cyByZXNpemluZyB3aXRoIHNhZmUgcmVzaXplIGZsYWdc
biIpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4+ICAgICAgICAgICAg
ICAgICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZjJmc19yZXNp
emVfc2hyaW5rKHNiaSk7Cj4+ICAgICAgICAgICAgICAgICB9Cj4+IC0gICAgICAgZWxzZSBpZiAo
KChjLnRhcmdldF9zZWN0b3JzICogYy5zZWN0b3Jfc2l6ZSA+Pgo+PiArICAgICAgIH0gZWxzZSBp
ZiAoKChjLnRhcmdldF9zZWN0b3JzICogYy5zZWN0b3Jfc2l6ZSA+Pgo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpID4gZ2V0X3NiKGJsb2NrX2NvdW50KSkg
fHwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYy5pZ25vcmVfZXJyb3IpCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGMuaWdub3JlX2Vycm9yKSB7Cj4+ICsgICAgICAgICAgICAgICBpZiAo
Yy5zYWZlX3Jlc2l6ZSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBBU1NFUlRfTVNHKCJF
eHBhbmRpbmcgcmVzaXplIGRvZXNuJ3Qgc3VwcG9ydCBzYWZlIHJlc2l6ZSBmbGFnIik7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4g
ICAgICAgICAgICAgICAgIHJldHVybiBmMmZzX3Jlc2l6ZV9ncm93KHNiaSk7Cj4+IC0gICAgICAg
ZWxzZSB7Cj4+ICsgICAgICAgfSBlbHNlIHsKPj4gICAgICAgICAgICAgICAgIE1TRygwLCAiTm90
aGluZyB0byByZXNpemUuXG4iKTsKPj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiAgICAg
ICAgIH0KPj4gZGlmZiAtLWdpdCBhL21hbi9yZXNpemUuZjJmcy44IGIvbWFuL3Jlc2l6ZS5mMmZz
LjgKPj4gaW5kZXggYmRkYTRmZC4uNWI2ZGFmNSAxMDA2NDQKPj4gLS0tIGEvbWFuL3Jlc2l6ZS5m
MmZzLjgKPj4gKysrIGIvbWFuL3Jlc2l6ZS5mMmZzLjgKPj4gQEAgLTY5LDcgKzY5LDcgQEAgU2tp
cCBjYXV0aW9uIGRpYWxvZ3VlIGFuZCByZXNpemUgcGFydGl0aW9uIGRpcmVjdGx5Lgo+PiAgU3Bl
Y2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4+ICAuVFAKPj4gIC5CSSBcLXMKPj4gLUVuYWJsZSBz
YWZlIHJlc2l6ZS4KPj4gK0VuYWJsZSBzYWZlIHJlc2l6ZSwgaXQgY2FuIG9ubHkgYmUgdXNlZCB3
LyBzaHJpbmsgcmVzaXplLgo+PiAgLlRQCj4+ICAuQkkgXC1WCj4+ICBQcmludCB0aGUgdmVyc2lv
biBudW1iZXIgYW5kIGV4aXQuCj4+IC0tCj4+IDIuNDkuMAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
