Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0CA858BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:03:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3BEY-00016z-4p;
	Fri, 11 Apr 2025 10:03:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3BES-00016h-5m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bZnl69TpqjAVCm+qEeQyhRqaA5VfKqR42WmysqOlun0=; b=ALLxdRIU1pLs/UZ2MdnTC9jhaC
 XtYgCiDTPcHOTPaYaMC4231K8sbKZnv87JkG6IhW0zG33+ZpXSGo5mE7dxjYsxVOdNv/CoEdw4Gu8
 x9ZPpao8Oni3TyCHG6t1IPjdpEujbDwY9FBJB0h0SXkknyQyYZdjSUBX3i8o+KpaW/sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bZnl69TpqjAVCm+qEeQyhRqaA5VfKqR42WmysqOlun0=; b=KQmAkTIfPG/HPpQxz2Fjf5gkf5
 C0ciI8SLSvTcXJYjw+Hemr6nBxA3kpwqzSDHNhPMMad6RUHCgc9N4XJtxfrppcDJrp2ukbL/0U2OG
 KzubTlDglBknD1zfS0gCASHe+D3OHyFgeBf5Ooajr2d4geYmlvTVmvC3UZuyQEDiNR4k=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BEC-00012d-JP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4740AA48624;
 Fri, 11 Apr 2025 09:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988D0C4CEEC;
 Fri, 11 Apr 2025 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744365790;
 bh=Y4ZNu59EFuIF97AsaGVQ4fQfTamRypZj1ZO42vwHAg0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QLmN4eAKE3AQa2PwfcQ1hbT7ynAW7Ro9VgJqVfYuYi6gpuYdh8fXygA4YkqoX06DH
 TMlpbqjiqJO55V1s2UpmRcdXryo4xrN8p1/DF3JwtqAGIfbTaXcIgqke/OxPvZmcF2
 gKpPQCwCw3sqwCjfT9JnY6xnx1d0IFfXAYhViBs1UOzgOt00ULECVzC0GzrxvB4zW1
 9te8BvG17G94HvY9lRMxIwzbbAzh11/8adUx/SbuDPlNaEB2f0P4HR3QsMbOvwjG2f
 hT0rQanv5lZmjg8XGAPx9SdznrbDO4OEyOBS4XZq8b9REdel8/cp3ojDo22rRLRI2i
 DGEYRiAE7fjWw==
Message-ID: <975e93fb-ef24-4372-91fc-c6d1c7bba28f@kernel.org>
Date: Fri, 11 Apr 2025 18:03:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <20250411085655.3645-1-chao@kernel.org>
 <CAD14+f1vhq-8VdC2FC2j4yJiQJaUZ-s963h5hb2YM5-XeJc=zg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f1vhq-8VdC2FC2j4yJiQJaUZ-s963h5hb2YM5-XeJc=zg@mail.gmail.com>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/11 17:04, Juhyung Park wrote: > Doesn't it simply
 remove the flag and proceed? > > What happens if large nat bitmap is required
 (e.g., a lot of inodes)? > > Sounds like we should actively de [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BEC-00012d-JP
Subject: Re: [f2fs-dev] [PATCH] Revert "resize.f2fs: add option for
 large_nat_bitmap feature"
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDE3OjA0LCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gRG9lc24ndCBpdCBzaW1w
bHkgcmVtb3ZlIHRoZSBmbGFnIGFuZCBwcm9jZWVkPwo+IAo+IFdoYXQgaGFwcGVucyBpZiBsYXJn
ZSBuYXQgYml0bWFwIGlzIHJlcXVpcmVkIChlLmcuLCBhIGxvdCBvZiBpbm9kZXMpPwo+IAo+IFNv
dW5kcyBsaWtlIHdlIHNob3VsZCBhY3RpdmVseSBkZXRlY3QgaXQgYW5kIHN0b3AgaXQgZnJvbSBw
cm9jZWVkaW5nLAo+IG5vdCBqdXN0IGRpc2NhcmRpbmcgdGhlIGZsYWcuCgpJZiB0aGUgZmxhZyBl
eGlzdGVkIGluIG9sZCBpbWFnZSwgaXQgd29uJ3QgZGlzY2FyZCBpdCBkdXJpbmcgcmVzaXplLCB0
aGlzIHBhdGNoCm9ubHkgYXZvaWQgZW5hYmxpbmcgbGFyZ2UgbmF0IGJpdG1hcCBvbiBpbWFnZSBk
dXJpbmcgcmVzaXplIHZpYSAtaSBvcHRpb24uCgpUaGFua3MsCgo+IAo+IE9uIEZyaSwgQXByIDEx
LCAyMDI1IGF0IDE6NTfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+
PiBUaGlzIHJldmVydHMgY29tbWl0IGRhYTBmOGI5ZTliMWVlYTZjODVlNWMxNjliODA5MjU0ZDlk
NzA3NGUuCj4+Cj4+IEFzIEp1aHl1bmcgcmVwb3J0ZWQgaW4gWzFdOgo+Pgo+PiBIZXJlJ3Mgd2hh
dCBJIGRpZDoKPj4gMS4gUmVtb3VudGVkIHRvIGNoZWNrcG9pbnQ9ZGlzYWJsZQo+PiAyLiBDcmVh
dGUgYSBkbS1zbmFwc2hvdCBvZiB0aGUgY3VycmVudCByb290IGRldmljZQo+PiAzLiBNb3VudCBz
bmFwc2hvdCB0byByZXBsYXkgdGhlIGxvZwo+PiA0LiBVbm1vdW50Cj4+IDUuIFJlc2l6ZSBzZWN0
b3IgNDg3MjQ4ODk2IHRvIDQ4NjUzOTI2NAo+PiAvLyAuL3Jlc2l6ZS5mMmZzIC1kIDMgLXMgLWkg
L2Rldi9tYXBwZXIvc25hcCAtdCA0ODY1MzkyNjQKPj4KPj4gTGF0ZXN0IGYyZnMtdG9vbHMgd2Fz
IHVzZWQ6Cj4+IDMzYzViOTUzOWFmMiBmMmZzX2lvOiBhZGQgZnJhZ3JlYWQgY29tbWFuZCB0byBl
dmFsdWF0ZSBmcmFnbWVudGVkCj4+IGJ1ZmZlciBmb3IgcmVhZHMKPj4KPj4gVGhpcyByZXByb2R1
Y2VkIHRoZSBtb3VudCBhbmQgZnNjayBmYWlsdXJlLgo+Pgo+PiBNb3VudCBsb2c6Cj4+IFs0NDI0
MzEuMDIwNTk0XSBGMkZTLWZzIChkbS0yKTogaW52YWxpZCBjcmNfb2Zmc2V0OiAwCj4+IFs0NDI0
MzEuMTMwMDU1XSBGMkZTLWZzIChkbS0yKTogU0lUIGlzIGNvcnJ1cHRlZCBub2RlIyAxMzYxNTIw
MSB2cyAxMzYxNjI5MAo+PiBbNDQyNDMxLjEzOTY4NF0gRjJGUy1mcyAoZG0tMik6IEZhaWxlZCB0
byBpbml0aWFsaXplIEYyRlMgc2VnbWVudCBtYW5hZ2VyICgtMTE3KQo+Pgo+PiBJIGNoZWNrZWQg
YmVsb3cgdGVzdGNhc2VzOgo+Pgo+PiB0cnVuY2F0ZSAtcyAkKCg1MTIqMTAyNCoxMDI0KjEwMjQp
KSBpbWcKPj4gbWtmcy5mMmZzIC1mIGltZyAkKCgyNTYqMTAyNCoxMDI0KSkKPj4KPj4gRGVzY3Jp
cHRpb24gICAgICAgICAgICAgVGVzdCBjb21tYW5kICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRlNDSyBvdXRwdXQKPj4gYSkgc2hyaW5rIHcvIC1zICAgICAgICAgcmVzaXplLmYy
ZnMgLXMgLWkgaW1nIC10ICQoKDEyOCoxMDI0KjEwMjQpKSAgICAgRmluZQo+PiBiKSBleHBhbmQg
dy8gLXMgICAgICAgICByZXNpemUuZjJmcyAtcyAtaSBpbWcgLXQgJCgoMTAyNCoxMDI0KjEwMjQp
KSAgICBDb3JydXB0ZWQKPj4gYykgc2hyaW5rIHcvbyAtcyAgICAgICAgcmVzaXplLmYyZnMgLWkg
aW1nIC10ICQoKDEyOCoxMDI0KjEwMjQpKSAgICAgICAgTm8gcnVuCj4+IGQpIGV4cGFuZCB3L28g
LXMgICAgICAgIHJlc2l6ZS5mMmZzIC1pIGltZyAtdCAkKCgxMDI0KjEwMjQqMTAyNCkpICAgICAg
IEZpbmUKPj4KPj4gT3V0cHV0IGZyb20gYik6Cj4+IFtBU1NFUlRdIChjaGVja19ibG9ja19jb3Vu
dDoyMjk5KSAgLS0+IFdyb25nIFNJVCB2YWxpZCBibG9ja3M6IHNlZ25vPTB4Mjk0MDAsIDAgdnMu
IDEzCj4+Cj4+IFRoZSByb290IGNhdXNlIGlzOiBzYWZlIG1vZGUgKC1zIG9wdGlvbikgaXMgY29u
ZmxpY3Qgdy8gbGFyZ2UgbmF0IGJpdG1hcCBmZWF0dXJlCj4+ICgtaSBvcHRpb24pLCBzaW5jZSBv
bmNlIHdlIGVuYWJsZSBsYXJnZSBuYXQgYml0bWFwLCBsYXlvdXQgb2YgY2hlY2twb2ludCB3aWxs
IGJlCj4+IGNoYW5nZWQgWzJdLCB3ZSBtdXN0IHJlbG9jYXRlIG5hdC9zaXRfYml0bWFwIHRvIHRo
ZSBlbmQgb2YgbmV3IGxvY2F0aW9uIG9mCj4+IGNwX2NoZWNrc3VtLCBob3dldmVyIGluIHNhZmUg
bW9kZSwgd2Ugd29uJ3QgY2hhbmdlIG1ldGFkYXRhIG9mIGNoZWNrcG9pbnQsIHNvIHdlCj4+IG5l
ZWQgdG8ga2VlcCBuYXQvc2l0X2JpdG1hcCBhcyBpdCBpcywgd2hpY2ggaW5jbHVkZXMgY2hlY2tz
dW0gZGF0YSBpbiBpdHMgb2xkCj4+IGxvY2F0aW9uLgo+Pgo+PiBMZXQncyByZXZlcnQgLWkgc3Vw
cG9ydCBmb3IgcmVzaXplLmYyZnMgZmlyc3QsIGFuZCB0aGVuIHJlZW5hYmxlIGl0IGFmdGVyCj4+
IGZpeCBhbmQgd2VsbCB0ZXN0ZWQuCj4+Cj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIGhlbHAgZnJv
bSBKdWh5dW5nLCBpbmNsdWRpbmcgcHJvdmlkaW5nIHJlcHJvZHVjZXIgYW5kCj4+IGhpbnRzLgo+
Pgo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC9DQUQxNCtm
M0Q2aVBPQnhFZ2taeHhUc1hDZndSS2I5cGg2OEp0VWszSDljbjhvdkx0OXdAbWFpbC5nbWFpbC5j
b20vCj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMTkw
NTE0MDkzMzQwLjQwMjE3LTIteXVjaGFvMEBodWF3ZWkuY29tLwo+Pgo+PiBGaXhlczogZGFhMGY4
YiAoInJlc2l6ZS5mMmZzOiBhZGQgb3B0aW9uIGZvciBsYXJnZV9uYXRfYml0bWFwIGZlYXR1cmUi
KQo+PiBSZXBvcnRlZC1ieTogSnUgSHl1bmcgUGFyayA8cWtyd25ndWQ4MjVAZ21haWwuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgIGZz
Y2svbWFpbi5jICAgfCA2ICstLS0tLQo+PiAgIGZzY2svcmVzaXplLmMgfCAzIC0tLQo+PiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFpbi5jCj4+IGluZGV4IDUyNGRiYjEuLmFmNDA2
MTMgMTAwNjQ0Cj4+IC0tLSBhL2ZzY2svbWFpbi5jCj4+ICsrKyBiL2ZzY2svbWFpbi5jCj4+IEBA
IC0xNDEsNyArMTQxLDYgQEAgdm9pZCByZXNpemVfdXNhZ2UoKQo+PiAgICAgICAgICBNU0coMCwg
IltvcHRpb25zXTpcbiIpOwo+PiAgICAgICAgICBNU0coMCwgIiAgLWQgZGVidWcgbGV2ZWwgW2Rl
ZmF1bHQ6MF1cbiIpOwo+PiAgICAgICAgICBNU0coMCwgIiAgLUggc3VwcG9ydCB3cml0ZSBoaW50
XG4iKTsKPj4gLSAgICAgICBNU0coMCwgIiAgLWkgZXh0ZW5kZWQgbm9kZSBiaXRtYXAsIG5vZGUg
cmF0aW8gaXMgMjAlJSBieSBkZWZhdWx0XG4iKTsKPj4gICAgICAgICAgTVNHKDAsICIgIC1vIG92
ZXJwcm92aXNpb24gcGVyY2VudGFnZSBbZGVmYXVsdDphdXRvXVxuIik7Cj4+ICAgICAgICAgIE1T
RygwLCAiICAtcyBzYWZlIHJlc2l6ZSAoRG9lcyBub3QgcmVzaXplIG1ldGFkYXRhKVxuIik7Cj4+
ICAgICAgICAgIE1TRygwLCAiICAtdCB0YXJnZXQgc2VjdG9ycyBbZGVmYXVsdDogZGV2aWNlIHNp
emVdXG4iKTsKPj4gQEAgLTYwMiw3ICs2MDEsNyBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhp
bnQgYXJnYywgY2hhciAqYXJndltdKQo+PiAgICNlbmRpZgo+PiAgICAgICAgICB9IGVsc2UgaWYg
KCFzdHJjbXAoInJlc2l6ZS5mMmZzIiwgcHJvZykpIHsKPj4gICAjaWZkZWYgV0lUSF9SRVNJWkUK
Pj4gLSAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm9wdGlvbl9zdHJpbmcgPSAiZDpmSHN0Omlv
OlYiOwo+PiArICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3B0aW9uX3N0cmluZyA9ICJkOmZI
c3Q6bzpWIjsKPj4KPj4gICAgICAgICAgICAgICAgICBjLmZ1bmMgPSBSRVNJWkU7Cj4+ICAgICAg
ICAgICAgICAgICAgd2hpbGUgKChvcHRpb24gPSBnZXRvcHQoYXJnYywgYXJndiwgb3B0aW9uX3N0
cmluZykpICE9IEVPRikgewo+PiBAQCAtNjM3LDkgKzYzNiw2IEBAIHZvaWQgZjJmc19wYXJzZV9v
cHRpb25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gc3NjYW5mKG9wdGFyZywgIiUiUFJJeDY0IiIsCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZj
LnRhcmdldF9zZWN0b3JzKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2knOgo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGMubGFyZ2VfbmF0X2JpdG1hcCA9IDE7Cj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBj
YXNlICdvJzoKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5uZXdfb3ZlcnBy
b3Zpc2lvbiA9IGF0b2Yob3B0YXJnKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4+IGRpZmYgLS1naXQgYS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNpemUuYwo+
PiBpbmRleCA5YjNiMDcxLi4yNjgxYjlmIDEwMDY0NAo+PiAtLS0gYS9mc2NrL3Jlc2l6ZS5jCj4+
ICsrKyBiL2ZzY2svcmVzaXplLmMKPj4gQEAgLTUzMSw5ICs1MzEsNiBAQCBzdGF0aWMgdm9pZCBy
ZWJ1aWxkX2NoZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pgo+PiAgICAgICAg
ICAvKiB1cGRhdGUgbmF0X2JpdHMgZmxhZyAqLwo+PiAgICAgICAgICBmbGFncyA9IHVwZGF0ZV9u
YXRfYml0c19mbGFncyhuZXdfc2IsIGNwLCBnZXRfY3AoY2twdF9mbGFncykpOwo+PiAtICAgICAg
IGlmIChjLmxhcmdlX25hdF9iaXRtYXApCj4+IC0gICAgICAgICAgICAgICBmbGFncyB8PSBDUF9M
QVJHRV9OQVRfQklUTUFQX0ZMQUc7Cj4+IC0KPj4gICAgICAgICAgaWYgKGZsYWdzICYgQ1BfQ09N
UEFDVF9TVU1fRkxBRykKPj4gICAgICAgICAgICAgICAgICBmbGFncyAmPSB+Q1BfQ09NUEFDVF9T
VU1fRkxBRzsKPj4gICAgICAgICAgaWYgKGZsYWdzICYgQ1BfTEFSR0VfTkFUX0JJVE1BUF9GTEFH
KQo+PiAtLQo+PiAyLjQwLjEKPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
