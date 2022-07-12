Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C31571A7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jul 2022 14:51:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oBFMM-0001EP-1k; Tue, 12 Jul 2022 12:51:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oBFMJ-0001EJ-Ti
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 12:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O3QdK5JFPq4Iyp0Jb088r24wGz4iExwv12QQIMEaJfo=; b=CuyoE+BLqu5FriWUCBMV2MilK4
 T0C2GdpmItsStCzgtyHtESwS9XdPXUQ8kDXmboWcmS1L8f/WG1M14HOpfbLoZHXq2d5Ik2WSUiv1i
 R3pjn2jtyCHQvb0uD9E0SOOBwXAp3S/1WxLPpUuWMfHiNCK7aEFZu5xoqX59ps6VM3bk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3QdK5JFPq4Iyp0Jb088r24wGz4iExwv12QQIMEaJfo=; b=BvS2YtO+3trGvdmCUlSlV2+Dqi
 rzgmVHzJw3f9ZFza2ec5ljYJHneNgRvpDGwe4MOaGY0IMCGAx63kWd7ScXJtorvVJNg4lu/tTjgeh
 RM3hHUal1EGC9qyyu7ID9t+H6h6UkSCfI+D1qNImqE76A/8GwZjQJpVdoHXv7MGq91+U=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oBFMG-0003YS-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 12:51:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87083B817B0;
 Tue, 12 Jul 2022 12:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8DBC385A2;
 Tue, 12 Jul 2022 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657630268;
 bh=gf3Kh9mGjGhhDRkCSjil3HxV2z0Hza6K7hRiT1t8UU0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eICNQS0eU6+uLjgcbP0KlGBORCgUlRVgfXxIqlvx9aunc2ermkOqca6ZEGo/u20DZ
 h/v/s7zMewE8b4/YXDmX2qFt8jNfPXAUHozEtGhDtg9Kbk/zFmNCJ/u1kw48nhI+XN
 89FmgjoZBM2njZdtglGmjm8xxSOq+c+yqvMhJAMJ1AW80MzO4V3qSsdufxDEh0EbFg
 9RjhETP0qv+HL9EtYW+TrWMpuAiVU/yA9NO8NrZU+nazgbStMbH0ZYei1JXG32dVZ0
 pZjGnCbB4j6Q+XIzgVe+KFP9//lv08FB6Rz2ZKt6Q83zTmcgb8BrAVvP35MvhojOk4
 p0GBbQ/MxfdbA==
Message-ID: <c49403fb-119c-f363-8a67-a5f1f535bb1c@kernel.org>
Date: Tue, 12 Jul 2022 20:51:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Guowei Du <duguoweisz@gmail.com>
References: <20220706020615.29938-1-duguoweisz@gmail.com>
 <YszRrHHqLk4My3vO@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YszRrHHqLk4My3vO@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/12 9:43, Jaegeuk Kim wrote: > On 07/06, Guowei Du
 wrote: >> From: duguowei <duguowei@xiaomi.com> >> >> There are two ways to
 show meta segment information, >> one is by dump.f2fs, another is [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oBFMG-0003YS-KJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: add some sysfs nodes for segment
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
Cc: linux-kernel@vger.kernel.org, duguowei <duguowei@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi83LzEyIDk6NDMsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDA3LzA2LCBHdW93ZWkg
RHUgd3JvdGU6Cj4+IEZyb206IGR1Z3Vvd2VpIDxkdWd1b3dlaUB4aWFvbWkuY29tPgo+Pgo+PiBU
aGVyZSBhcmUgdHdvIHdheXMgdG8gc2hvdyBtZXRhIHNlZ21lbnQgaW5mb3JtYXRpb24sCj4+IG9u
ZSBpcyBieSBkdW1wLmYyZnMsIGFub3RoZXIgaXMgYnkgc3lzZnMgbm9kZS4gQnV0LAo+PiBzb21l
dGltZXMgZHVtcCBuZWVkcyByb290IHByaXZpbGVnZSxTbyBhZGRpbmcgYQo+PiBmZXcgc3lzZnMg
bm9kZXMuCgpJZiB0aGlzIGlzIHVzZWQgZm9yIGRlYnVnLCBob3cgYWJvdXQgY2hlY2tpbmcgL3N5
cy9rZXJuZWwvZGVidWcvZjJmcy9zdGF0dXM/CgpUaGFua3MsCgo+Pgo+PiBUaGUgZ2VuZXJpYyBw
ZXJtaXNzaW9uIG9mIG5vZGUgaXMgMDQ0NChTX0lSVUdPKS4KPj4KPj4gJCBjZCAvc3lzL2ZzL2Yy
ZnMvREVWSUNFLy4uLgo+PiAkIGxzIC1sCj4+IC4uLgo+PiAtci0tci0tci0tIDEgcm9vdCByb290
IDQwOTYgN+aciCAgIDUgMjM6MjEgcmVzZXJ2ZWRfc2VnbWVudHMKPj4gLXItLXItLXItLSAxIHJv
b3Qgcm9vdCA0MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnQKPj4gLXItLXItLXItLSAx
IHJvb3Qgcm9vdCA0MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnRfY2twdAo+PiAtci0t
ci0tci0tIDEgcm9vdCByb290IDQwOTYgN+aciCAgIDUgMjM6MjEgc2VnbWVudF9jb3VudF9tYWlu
Cj4+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiA35pyIICAgNSAyMzoyMSBzZWdtZW50X2Nv
dW50X25hdAo+PiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgN+aciCAgIDUgMjM6MjEgc2Vn
bWVudF9jb3VudF9zaXQKPj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0MDk2IDfmnIggICA1IDIz
OjIxIHNlZ21lbnRfY291bnRfc3NhCj4+IC4uLgo+Pgo+PiAkIHN1ZG8gZHVtcC5mMmZzIC1kIDEg
REVWSUNFCj4+IC4uLgo+PiBTdXBlciBibG9jawo+PiBzZWdtZW50X2NvdW50ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWzB4ICAgICAgMjYgOiAzOF0KPj4gc2VnbWVudF9jb3VudF9ja3B0ICAg
ICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0KPj4gc2VnbWVudF9jb3VudF9zaXQg
ICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0KPj4gc2VnbWVudF9jb3VudF9u
YXQgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0KPj4gc2VnbWVudF9jb3Vu
dF9zc2EgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAxIDogMV0KPj4gc2VnbWVudF9j
b3VudF9tYWluICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgIDFmIDogMzFdCj4+IC4uLgo+
PiBDaGVja3BvaW50Cj4+IHJzdmRfc2VnbWVudF9jb3VudCAgICAgICAgICAgICAgICAgICAgICBb
MHggICAgICAgZSA6IDE0XQo+PiAuLi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogZHVndW93ZWkgPGR1
Z3Vvd2VpQHhpYW9taS5jb20+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvc3lzZnMuYyB8IDYzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNm
cy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4+IGluZGV4IDRjNTBhZWRkNTE0NC4uMDUzNTBiYmEyYzgz
IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPj4gKysrIGIvZnMvZjJmcy9zeXNmcy5j
Cj4+IEBAIC02OTcsNiArNjk3LDU1IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfc2JfZmVhdHVyZV9z
aG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+ICAgCXJldHVybiBzcHJpbnRmKGJ1ZiwgInVuc3Vw
cG9ydGVkXG4iKTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgc3NpemVfdCBzZWdtZW50X2NvdW50
X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBjaGFyICpidWYpCj4+ICt7Cj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKPj4g
KwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlZ21lbnRfY291
bnQpKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3Qgc2VnbWVudF9jb3VudF9ja3B0X3No
b3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBj
aGFyICpidWYpCj4+ICt7Cj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKPj4gKwkJ
CSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlZ21lbnRfY291bnRf
Y2twdCkpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3NpemVfdCBzZWdtZW50X2NvdW50X3NpdF9z
aG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+ICsJCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
Y2hhciAqYnVmKQo+PiArewo+PiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsCj4+ICsJ
CQkodW5zaWduZWQgbG9uZyBsb25nKShGMkZTX1JBV19TVVBFUihzYmkpLT5zZWdtZW50X2NvdW50
X3NpdCkpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3NpemVfdCBzZWdtZW50X2NvdW50X25hdF9z
aG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+ICsJCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
Y2hhciAqYnVmKQo+PiArewo+PiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsCj4+ICsJ
CQkodW5zaWduZWQgbG9uZyBsb25nKShGMkZTX1JBV19TVVBFUihzYmkpLT5zZWdtZW50X2NvdW50
X25hdCkpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3NpemVfdCBzZWdtZW50X2NvdW50X3NzYV9z
aG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4+ICsJCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwg
Y2hhciAqYnVmKQo+PiArewo+PiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsCj4+ICsJ
CQkodW5zaWduZWQgbG9uZyBsb25nKShGMkZTX1JBV19TVVBFUihzYmkpLT5zZWdtZW50X2NvdW50
X3NzYSkpOwo+PiArfQo+PiArCj4+ICtzdGF0aWMgc3NpemVfdCBzZWdtZW50X2NvdW50X21haW5f
c2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+PiArCQlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IGNoYXIgKmJ1ZikKPj4gK3sKPj4gKwlyZXR1cm4gc3ByaW50ZihidWYsICIlbGx1XG4iLAo+PiAr
CQkJKHVuc2lnbmVkIGxvbmcgbG9uZykoRjJGU19SQVdfU1VQRVIoc2JpKS0+c2VnbWVudF9jb3Vu
dF9tYWluKSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBzc2l6ZV90IHJlc2VydmVkX3NlZ21lbnRz
X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPj4gKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBjaGFyICpidWYpCj4+ICt7Cj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKPj4g
KwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKHJlc2VydmVkX3NlZ21lbnRzKHNiaSkpKTsKPj4gK30K
PiAKPiBDYW4gd2UgY3JlYXRlIGEgbWFjcm8gdG8gZG8gdGhlIGFib3ZlIGZ1bmN0aW9ucz8KPiAK
Pj4gKwo+PiAgICNkZWZpbmUgRjJGU19TQl9GRUFUVVJFX1JPX0FUVFIoX25hbWUsIF9mZWF0KQkJ
CVwKPj4gICBzdGF0aWMgc3RydWN0IGYyZnNfYXR0ciBmMmZzX2F0dHJfc2JfIyNfbmFtZSA9IHsJ
CVwKPj4gICAJLmF0dHIgPSB7Lm5hbWUgPSBfX3N0cmluZ2lmeShfbmFtZSksIC5tb2RlID0gMDQ0
NCB9LAlcCj4+IEBAIC04MDEsNiArODUwLDEzIEBAIEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVk
X2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPj4gICBGMkZTX0dFTkVSQUxfUk9fQVRUUihtb3ZlZF9ibG9j
a3NfZm9yZWdyb3VuZCk7Cj4+ICAgRjJGU19HRU5FUkFMX1JPX0FUVFIoYXZnX3ZibG9ja3MpOwo+
PiAgICNlbmRpZgo+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIoc2VnbWVudF9jb3VudCk7Cj4+ICtG
MkZTX0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50X2NrcHQpOwo+PiArRjJGU19HRU5FUkFM
X1JPX0FUVFIoc2VnbWVudF9jb3VudF9zaXQpOwo+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIoc2Vn
bWVudF9jb3VudF9uYXQpOwo+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIoc2VnbWVudF9jb3VudF9z
c2EpOwo+PiArRjJGU19HRU5FUkFMX1JPX0FUVFIoc2VnbWVudF9jb3VudF9tYWluKTsKPj4gK0Yy
RlNfR0VORVJBTF9ST19BVFRSKHJlc2VydmVkX3NlZ21lbnRzKTsKPj4gICAKPj4gICAjaWZkZWYg
Q09ORklHX0ZTX0VOQ1JZUFRJT04KPj4gICBGMkZTX0ZFQVRVUkVfUk9fQVRUUihlbmNyeXB0aW9u
KTsKPj4gQEAgLTkzNCw2ICs5OTAsMTMgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYyZnNf
YXR0cnNbXSA9IHsKPj4gICAJQVRUUl9MSVNUKGdjX3JlY2xhaW1lZF9zZWdtZW50cyksCj4+ICAg
CUFUVFJfTElTVChtYXhfZnJhZ21lbnRfY2h1bmspLAo+PiAgIAlBVFRSX0xJU1QobWF4X2ZyYWdt
ZW50X2hvbGUpLAo+PiArCUFUVFJfTElTVChzZWdtZW50X2NvdW50KSwKPj4gKwlBVFRSX0xJU1Qo
c2VnbWVudF9jb3VudF9ja3B0KSwKPj4gKwlBVFRSX0xJU1Qoc2VnbWVudF9jb3VudF9zaXQpLAo+
PiArCUFUVFJfTElTVChzZWdtZW50X2NvdW50X25hdCksCj4+ICsJQVRUUl9MSVNUKHNlZ21lbnRf
Y291bnRfc3NhKSwKPj4gKwlBVFRSX0xJU1Qoc2VnbWVudF9jb3VudF9tYWluKSwKPj4gKwlBVFRS
X0xJU1QocmVzZXJ2ZWRfc2VnbWVudHMpLAo+PiAgIAlOVUxMLAo+PiAgIH07Cj4+ICAgQVRUUklC
VVRFX0dST1VQUyhmMmZzKTsKPj4gLS0gCj4+IDIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
