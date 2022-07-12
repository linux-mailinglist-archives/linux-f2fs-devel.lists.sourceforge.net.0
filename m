Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF910570FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jul 2022 03:43:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oB4vy-0004tr-LU; Tue, 12 Jul 2022 01:43:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oB4vy-0004tl-28
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 01:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKO8M5mMQQTegAlR+gKLMYQS8ChdcrJI9+DqNrODY8Y=; b=H8U9y1Jkj2Fe+XE/+xWNa/CvVc
 rPk/B9evuQirvJihAoriYHNyIYjYnGKapD3bIL3tT/LJqZSvIYH9EQiy077H4r+Efgbs8OANfw7i5
 y7VW3J96io3AUoSMwWE6CLa/bQ7diquFygm6Cv6wEnkY4l5lW3DUOEPbmMijXHi03a1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wKO8M5mMQQTegAlR+gKLMYQS8ChdcrJI9+DqNrODY8Y=; b=k2R5DAyI6leQxhQABAiwtmflcx
 qWiD7YtTs1vbbxKp9EprgGGzh+hq4hKOxtBFVh+WN4EulLZuE3sEoWFYIdr/xvuT7pvzt5iTPyK52
 o7HxQDdwWf0V8kmO21gXywtyKeSeWHUvJ/Tst8MySUSzc++iJoR8kMEHqmWPMFuuSKfA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oB4vv-00EI33-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 01:43:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9C75B815EB;
 Tue, 12 Jul 2022 01:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E4AC34115;
 Tue, 12 Jul 2022 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657590190;
 bh=NTy2qoljQdyoHW8dSLRVcJnstddAXapdmicQhHBW9I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OC62gfly16u8cPQWb/qgfMuwQN+FrjtQG+er2MwDauC38wMz8t3LA4S6ZfM4xu5Fu
 4qJyGikSUhgtaxP4CZJEidjp7tUff9AkOFbhuWXl/+ZIJxjiIkv4mdRSZaoFSAVwuB
 29FkaGWA46NqSX5ujtQmx+m8ilVEZnGZtW1r9V04DWNbhzXuVajr9+jwruYV/4P1Rv
 nLy7PFY5GiQ+dQfC8YPvEunhmnLqc4KifC1bfdHKnUOZ6IyHdmkcgY0ZfZl2YIqzdp
 fp0FpHHE6Zi/BxgzXy5hZNFlchil/3tUwWGaSLtzU+Iv7qkLirKbS5pqwVfck1Xj7N
 WRnG5/+PzzEWw==
Date: Mon, 11 Jul 2022 18:43:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Guowei Du <duguoweisz@gmail.com>
Message-ID: <YszRrHHqLk4My3vO@google.com>
References: <20220706020615.29938-1-duguoweisz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706020615.29938-1-duguoweisz@gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/06,
 Guowei Du wrote: > From: duguowei <duguowei@xiaomi.com>
 > > There are two ways to show meta segment information, > one is by dump.f2fs,
 another is by sysfs node. But, > sometimes dump needs [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oB4vv-00EI33-Ou
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDcvMDYsIEd1b3dlaSBEdSB3cm90ZToKPiBGcm9tOiBkdWd1b3dlaSA8ZHVndW93ZWlAeGlh
b21pLmNvbT4KPiAKPiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gc2hvdyBtZXRhIHNlZ21lbnQgaW5m
b3JtYXRpb24sCj4gb25lIGlzIGJ5IGR1bXAuZjJmcywgYW5vdGhlciBpcyBieSBzeXNmcyBub2Rl
LiBCdXQsCj4gc29tZXRpbWVzIGR1bXAgbmVlZHMgcm9vdCBwcml2aWxlZ2UsU28gYWRkaW5nIGEK
PiBmZXcgc3lzZnMgbm9kZXMuCj4gCj4gVGhlIGdlbmVyaWMgcGVybWlzc2lvbiBvZiBub2RlIGlz
IDA0NDQoU19JUlVHTykuCj4gCj4gJCBjZCAvc3lzL2ZzL2YyZnMvREVWSUNFLy4uLgo+ICQgbHMg
LWwKPiAuLi4KPiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgN+aciCAgIDUgMjM6MjEgcmVz
ZXJ2ZWRfc2VnbWVudHMKPiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgN+aciCAgIDUgMjM6
MjEgc2VnbWVudF9jb3VudAo+IC1yLS1yLS1yLS0gMSByb290IHJvb3QgNDA5NiA35pyIICAgNSAy
MzoyMSBzZWdtZW50X2NvdW50X2NrcHQKPiAtci0tci0tci0tIDEgcm9vdCByb290IDQwOTYgN+ac
iCAgIDUgMjM6MjEgc2VnbWVudF9jb3VudF9tYWluCj4gLXItLXItLXItLSAxIHJvb3Qgcm9vdCA0
MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnRfbmF0Cj4gLXItLXItLXItLSAxIHJvb3Qg
cm9vdCA0MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnRfc2l0Cj4gLXItLXItLXItLSAx
IHJvb3Qgcm9vdCA0MDk2IDfmnIggICA1IDIzOjIxIHNlZ21lbnRfY291bnRfc3NhCj4gLi4uCj4g
Cj4gJCBzdWRvIGR1bXAuZjJmcyAtZCAxIERFVklDRQo+IC4uLgo+IFN1cGVyIGJsb2NrCj4gc2Vn
bWVudF9jb3VudCAgICAgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgIDI2IDogMzhdCj4g
c2VnbWVudF9jb3VudF9ja3B0ICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAyIDogMl0K
PiBzZWdtZW50X2NvdW50X3NpdCAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDIgOiAy
XQo+IHNlZ21lbnRfY291bnRfbmF0ICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMiA6
IDJdCj4gc2VnbWVudF9jb3VudF9zc2EgICAgICAgICAgICAgICAgICAgICAgIFsweCAgICAgICAx
IDogMV0KPiBzZWdtZW50X2NvdW50X21haW4gICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAg
MWYgOiAzMV0KPiAuLi4KPiBDaGVja3BvaW50Cj4gcnN2ZF9zZWdtZW50X2NvdW50ICAgICAgICAg
ICAgICAgICAgICAgIFsweCAgICAgICBlIDogMTRdCj4gLi4uCj4gCj4gU2lnbmVkLW9mZi1ieTog
ZHVndW93ZWkgPGR1Z3Vvd2VpQHhpYW9taS5jb20+Cj4gLS0tCj4gIGZzL2YyZnMvc3lzZnMuYyB8
IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gaW5kZXggNGM1MGFlZGQ1MTQ0Li4wNTM1MGJi
YTJjODMgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zeXNmcy5jCj4gKysrIGIvZnMvZjJmcy9zeXNm
cy5jCj4gQEAgLTY5Nyw2ICs2OTcsNTUgQEAgc3RhdGljIHNzaXplX3QgZjJmc19zYl9mZWF0dXJl
X3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiAgCXJldHVybiBzcHJpbnRmKGJ1ZiwgInVuc3Vw
cG9ydGVkXG4iKTsKPiAgfQo+ICAKPiArc3RhdGljIHNzaXplX3Qgc2VnbWVudF9jb3VudF9zaG93
KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gKwkJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFy
ICpidWYpCj4gK3sKPiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsCj4gKwkJCSh1bnNp
Z25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSktPnNlZ21lbnRfY291bnQpKTsKPiAr
fQo+ICsKPiArc3RhdGljIHNzaXplX3Qgc2VnbWVudF9jb3VudF9ja3B0X3Nob3coc3RydWN0IGYy
ZnNfYXR0ciAqYSwKPiArCQlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPiAr
ewo+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKPiArCQkJKHVuc2lnbmVkIGxvbmcg
bG9uZykoRjJGU19SQVdfU1VQRVIoc2JpKS0+c2VnbWVudF9jb3VudF9ja3B0KSk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBzc2l6ZV90IHNlZ21lbnRfY291bnRfc2l0X3Nob3coc3RydWN0IGYyZnNfYXR0
ciAqYSwKPiArCQlzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPiArewo+ICsJ
cmV0dXJuIHNwcmludGYoYnVmLCAiJWxsdVxuIiwKPiArCQkJKHVuc2lnbmVkIGxvbmcgbG9uZyko
RjJGU19SQVdfU1VQRVIoc2JpKS0+c2VnbWVudF9jb3VudF9zaXQpKTsKPiArfQo+ICsKPiArc3Rh
dGljIHNzaXplX3Qgc2VnbWVudF9jb3VudF9uYXRfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+
ICsJCXN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgY2hhciAqYnVmKQo+ICt7Cj4gKwlyZXR1cm4g
c3ByaW50ZihidWYsICIlbGx1XG4iLAo+ICsJCQkodW5zaWduZWQgbG9uZyBsb25nKShGMkZTX1JB
V19TVVBFUihzYmkpLT5zZWdtZW50X2NvdW50X25hdCkpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3Np
emVfdCBzZWdtZW50X2NvdW50X3NzYV9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gKwkJc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4gK3sKPiArCXJldHVybiBzcHJpbnRm
KGJ1ZiwgIiVsbHVcbiIsCj4gKwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVS
KHNiaSktPnNlZ21lbnRfY291bnRfc3NhKSk7Cj4gK30KPiArCj4gK3N0YXRpYyBzc2l6ZV90IHNl
Z21lbnRfY291bnRfbWFpbl9zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gKwkJc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBjaGFyICpidWYpCj4gK3sKPiArCXJldHVybiBzcHJpbnRmKGJ1Ziwg
IiVsbHVcbiIsCj4gKwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKEYyRlNfUkFXX1NVUEVSKHNiaSkt
PnNlZ21lbnRfY291bnRfbWFpbikpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgc3NpemVfdCByZXNlcnZl
ZF9zZWdtZW50c19zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gKwkJc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBjaGFyICpidWYpCj4gK3sKPiArCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVc
biIsCj4gKwkJCSh1bnNpZ25lZCBsb25nIGxvbmcpKHJlc2VydmVkX3NlZ21lbnRzKHNiaSkpKTsK
PiArfQoKQ2FuIHdlIGNyZWF0ZSBhIG1hY3JvIHRvIGRvIHRoZSBhYm92ZSBmdW5jdGlvbnM/Cgo+
ICsKPiAgI2RlZmluZSBGMkZTX1NCX0ZFQVRVUkVfUk9fQVRUUihfbmFtZSwgX2ZlYXQpCQkJXAo+
ICBzdGF0aWMgc3RydWN0IGYyZnNfYXR0ciBmMmZzX2F0dHJfc2JfIyNfbmFtZSA9IHsJCVwKPiAg
CS5hdHRyID0gey5uYW1lID0gX19zdHJpbmdpZnkoX25hbWUpLCAubW9kZSA9IDA0NDQgfSwJXAo+
IEBAIC04MDEsNiArODUwLDEzIEBAIEYyRlNfR0VORVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19i
YWNrZ3JvdW5kKTsKPiAgRjJGU19HRU5FUkFMX1JPX0FUVFIobW92ZWRfYmxvY2tzX2ZvcmVncm91
bmQpOwo+ICBGMkZTX0dFTkVSQUxfUk9fQVRUUihhdmdfdmJsb2Nrcyk7Cj4gICNlbmRpZgo+ICtG
MkZTX0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50KTsKPiArRjJGU19HRU5FUkFMX1JPX0FU
VFIoc2VnbWVudF9jb3VudF9ja3B0KTsKPiArRjJGU19HRU5FUkFMX1JPX0FUVFIoc2VnbWVudF9j
b3VudF9zaXQpOwo+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihzZWdtZW50X2NvdW50X25hdCk7Cj4g
K0YyRlNfR0VORVJBTF9ST19BVFRSKHNlZ21lbnRfY291bnRfc3NhKTsKPiArRjJGU19HRU5FUkFM
X1JPX0FUVFIoc2VnbWVudF9jb3VudF9tYWluKTsKPiArRjJGU19HRU5FUkFMX1JPX0FUVFIocmVz
ZXJ2ZWRfc2VnbWVudHMpOwo+ICAKPiAgI2lmZGVmIENPTkZJR19GU19FTkNSWVBUSU9OCj4gIEYy
RlNfRkVBVFVSRV9ST19BVFRSKGVuY3J5cHRpb24pOwo+IEBAIC05MzQsNiArOTkwLDEzIEBAIHN0
YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10gPSB7Cj4gIAlBVFRSX0xJU1QoZ2Nf
cmVjbGFpbWVkX3NlZ21lbnRzKSwKPiAgCUFUVFJfTElTVChtYXhfZnJhZ21lbnRfY2h1bmspLAo+
ICAJQVRUUl9MSVNUKG1heF9mcmFnbWVudF9ob2xlKSwKPiArCUFUVFJfTElTVChzZWdtZW50X2Nv
dW50KSwKPiArCUFUVFJfTElTVChzZWdtZW50X2NvdW50X2NrcHQpLAo+ICsJQVRUUl9MSVNUKHNl
Z21lbnRfY291bnRfc2l0KSwKPiArCUFUVFJfTElTVChzZWdtZW50X2NvdW50X25hdCksCj4gKwlB
VFRSX0xJU1Qoc2VnbWVudF9jb3VudF9zc2EpLAo+ICsJQVRUUl9MSVNUKHNlZ21lbnRfY291bnRf
bWFpbiksCj4gKwlBVFRSX0xJU1QocmVzZXJ2ZWRfc2VnbWVudHMpLAo+ICAJTlVMTCwKPiAgfTsK
PiAgQVRUUklCVVRFX0dST1VQUyhmMmZzKTsKPiAtLSAKPiAyLjM2LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
