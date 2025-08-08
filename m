Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98480B1E12D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 06:15:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PTPP5Sphztc8EslRG6cOgG+IYbih2FF8R8hBvmXvBE=; b=fB689c0lYZBXsXIkyw9qL6tLGu
	M/1f9fDR+49ai0nIX1jDRyUIK8OCJ3y8JPuWYsrqn10IMvgj3MqYS846alUJpxrPPpk8F4WxfgPb3
	mkBHlRZmt5FIuuDEunXncDsA6R/S960cf/5ZEOXfwUFLMs9FvCXV0BoSjXOSVVNJ4r+E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukEV1-0005tJ-Mf;
	Fri, 08 Aug 2025 04:14:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ukEUz-0005tA-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5dBQ24sv926qfmCOYNRPYr5T9paG9I87s2kFmpFELnI=; b=JNDnK7K5Nf1xwu35nypBf+HsjZ
 Tcw47Bz4jY4SuPqASKr5BunCqIGYMPlvRpL4JSDsb+xYZCb0E10KT1woW5QKzpHGu6H2yi56LjcG8
 pUW8L1xjSThYj6tLi+U0fo+bcsu05q/33YuevkWbDgzM8qETLv+Yi+YDdQWzVYtsbPLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5dBQ24sv926qfmCOYNRPYr5T9paG9I87s2kFmpFELnI=; b=mmXybv40p6c0W2zDOeIQucZchQ
 /TdpdvbcmYzXZNqW7uXExhENEw38akBArp6nO7ddb30fHDGxjx/ENNZNin9sh1wR8Wru2+0A4Ks50
 2bXDiUtOZadk1wwnAit5YE1NYZdqBJAmNdzUbMkR1ee2z9yX/stkoBf+xTIkpbXRQMQQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukEUz-00028c-FE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E0A344A5F;
 Fri,  8 Aug 2025 04:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E66C4CEF0;
 Fri,  8 Aug 2025 04:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754626463;
 bh=qwItsFMa5Kny4Eyf0BZSWka4fDemBGqbeTxFKDyzF4g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cefhYgqvhjIpva0JgTGw439CdjsWRREGzopAdDBjKayN/+R+qMZlL65J+sZ5KDdH7
 EPFOgpKeIitMDBH9qsE88CuhcFz8BfmxpLuTlBLWaogA70iyWvxMYPNvRP25tpEAi9
 qP7clfynnZAj5WuPPwMFc/ruQ3F2ps7c+1yS7rQ/V/GTM/1k01mlUFsptC4vyyZ2md
 Dcoe2osedqi9VLULO6lpTRGF8pv5gebuGTvqfCWTylL97k2rNFyITti8rhfGk0ic/V
 pV8mdAuNE9Up1beOrVek80bqYIeBgGds2ZDrkdPftIHrHmKnTHrUdRRdjpYv/eN16q
 Mrd8dg87d+VoQ==
Message-ID: <b8470c47-4fc2-48da-b93d-cb469638fb43@kernel.org>
Date: Fri, 8 Aug 2025 12:14:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250807014836.3780988-1-chao@kernel.org>
 <CAHJ8P3Krr4pCdOmnSJ6mp5bfGLLH4TJqd0FC7Qiw2V3iEL5VEw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3Krr4pCdOmnSJ6mp5bfGLLH4TJqd0FC7Qiw2V3iEL5VEw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 8/8/2025 9:07 AM, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2025年8月7日周四 09:52写道：
    >> >> mount -t f2fs -o checkpoint=disable:10% / [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ukEUz-00028c-FE
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to clear unusable_cap for
 checkpoint=enable
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOC84LzIwMjUgOTowNyBBTSwgWmhpZ3VvIE5pdSB3cm90ZToKPiBDaGFvIFl1IHZpYSBMaW51
eC1mMmZzLWRldmVsIDxsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDk
uo4yMDI15bm0OOaciDfml6Xlkajlm5sgMDk6NTLlhpnpgZPvvJoKPj4KPj4gbW91bnQgLXQgZjJm
cyAtbyBjaGVja3BvaW50PWRpc2FibGU6MTAlIC9kZXYvdmRiIC9tbnQvZjJmcy8KPj4gbW91bnQg
LXQgZjJmcyAtbyByZW1vdW50LGNoZWNrcG9pbnQ9ZW5hYmxlIC9kZXYvdmRiIC9tbnQvZjJmcy8K
Pj4KPj4ga2VybmVsIGxvZzoKPj4gRjJGUy1mcyAodmRiKTogQWRqdXN0IHVudXNhYmxlIGNhcCBm
b3IgY2hlY2twb2ludD1kaXNhYmxlID0gMjA0NDQwIC8gMTAlCj4+Cj4+IElmIHdlIGhhcyBhc3Np
Z25lZCBjaGVja3BvaW50PWVuYWJsZSBtb3VudCBvcHRpb24sIHVudXNhYmxlX2NhcHssX3BlcmN9
Cj4+IHBhcmFtZXRlcnMgb2YgY2hlY2twb2ludD1kaXNhYmxlIHNob3VsZCBiZSByZXNldCwgdGhl
biBjYWxjdWxhdGlvbiBhbmQKPj4gbG9nIHByaW50IGNvdWxkIGJlIGF2b2lkIGluIGFkanVzdF91
bnVzYWJsZV9jYXBfcGVyYygpLgo+Pgo+PiBGaXhlczogMWFlMThmNzFjYjUyICgiZjJmczogZml4
IGNoZWNrcG9pbnQ9ZGlzYWJsZToldSUlIikKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gICBmcy9mMmZzL3N1cGVyLmMgfCA0ICsrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4gaW5kZXggZjM3MDA0NzgwY2UwLi5jMWY0NWRm
OWVmZWMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+PiArKysgYi9mcy9mMmZzL3N1
cGVyLmMKPj4gQEAgLTEwMTQsNiArMTAxNCwxMCBAQCBzdGF0aWMgaW50IGYyZnNfcGFyc2VfcGFy
YW0oc3RydWN0IGZzX2NvbnRleHQgKmZjLCBzdHJ1Y3QgZnNfcGFyYW1ldGVyICpwYXJhbSkKPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgIGN0eF9zZXRfb3B0KGN0eCwgRjJGU19NT1VOVF9ESVNB
QkxFX0NIRUNLUE9JTlQpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICAg
ICAgICAgICAgICAgICAgY2FzZSBPcHRfY2hlY2twb2ludF9lbmFibGU6Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIEYyRlNfQ1RYX0lORk8oY3R4KS51bnVzYWJsZV9jYXBfcGVyYyA9IDA7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+c3BlY19tYXNrIHw9IEYyRlNfU1BFQ19jaGVj
a3BvaW50X2Rpc2FibGVfY2FwX3BlcmM7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIEYyRlNf
Q1RYX0lORk8oY3R4KS51bnVzYWJsZV9jYXAgPSAwOwo+PiArICAgICAgICAgICAgICAgICAgICAg
ICBjdHgtPnNwZWNfbWFzayB8PSBGMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2NhcDsKPiBI
aSBDaGFvLAo+IHdoZW4gZW5hYmxlIGNoZWNrcG9pbnQsIHNob3VkIGl0IGJlOgo+IGN0eC0+c3Bl
Y19tYXNrICY9IH5GMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2NhcF9wZXJjOwo+IGN0eC0+
c3BlY19tYXNrICY9IH5GMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2NhcDsKPiBwbGVhc2Ug
Y29ycmVjdCBtZSBpZiBJIG1pc3VuZGVyc3RhbmRpbmcuCgpaaGlndW8sCgpJTU8sIEYyRlNfU1BF
Q19jaGVja3BvaW50X2Rpc2FibGVfY2FwX3BlcmMgb3IgRjJGU19TUEVDX2NoZWNrcG9pbnRfZGlz
YWJsZV9jYXAKZmxhZ3MgY2FuIGJlIGFkZGVkIHRvIGN0eC0+c3BlY19tYXNrIHRvIGluZGljYXRl
IGN0eC51bnVzYWJsZV9jYXBfcGVyYyBvcgpjdHgudW51c2FibGVfY2FwIGhhcyBiZWVuIHVwZGF0
ZWQsIHRoZW4gd2UgY2FuIHN0b3JlIGxhc3QgcGFyYW1ldGVyIHZhbHVlIGZyb20KY3R4IHRvIHNi
aSBpbiBmMmZzX2FwcGx5X29wdGlvbnMoKSBhcyBiZWxvdzoKCglpZiAoY3R4LT5zcGVjX21hc2sg
JiBGMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2NhcCkKCQlGMkZTX09QVElPTihzYmkpLnVu
dXNhYmxlX2NhcCA9IEYyRlNfQ1RYX0lORk8oY3R4KS51bnVzYWJsZV9jYXA7CglpZiAoY3R4LT5z
cGVjX21hc2sgJiBGMkZTX1NQRUNfY2hlY2twb2ludF9kaXNhYmxlX2NhcF9wZXJjKQoJCUYyRlNf
T1BUSU9OKHNiaSkudW51c2FibGVfY2FwX3BlcmMgPQoJCQkJCUYyRlNfQ1RYX0lORk8oY3R4KS51
bnVzYWJsZV9jYXBfcGVyYzsKCk9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmcgaGVyZT8KClRoYW5r
cywKCj4gdGhhbmtzIQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4X2NsZWFyX29wdChj
dHgsIEYyRlNfTU9VTlRfRElTQUJMRV9DSEVDS1BPSU5UKTsKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyZWFrOwo+PiAgICAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4+IC0tCj4+IDIuNDku
MAo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
