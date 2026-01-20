Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 426ABD3BE1C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 05:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqqxBhCirzkzg7fw4x9Yslz5qeiG0UHhRtP9/h0pfpw=; b=l5ZwlV/BblgMUNUUyH0ZFNm0eN
	Ys4SymfxCgWpim1b1jQ8PE/kF2LkpLHJPkg6NtLD7cgoqt97NhcephovbHQrnARxc5heKYGpoxcYV
	YYdqwjggf3sGFwPtCFlvCSFtAKH8lnZhLP/PavuXDxXDxFd2ST6SgQWxKuxgVTCKisjQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi2vQ-0003GL-U8;
	Tue, 20 Jan 2026 04:01:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vi2vP-0003GE-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 04:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQFbbWTepF5c/lv+kHCAnjTtV80HhyZJWYoHmAxLyxw=; b=ieAmRsvRnniRa3IpuO1qzFk1hc
 79LWO1root90743o9Mrf5GnR/do72bQyWphP03FkwQXxSgF0wXmeu3Mcd6D0B2y7rcIcyuLw+F/9B
 ZuuNyYfdTWjFOda8mqP21mqOEme5Vk7jZtcjc1vee04HWtHlydY5uS4OmNKzhHMqQR5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oQFbbWTepF5c/lv+kHCAnjTtV80HhyZJWYoHmAxLyxw=; b=XE603TxCASTK1K+QdseF0khedm
 YlSkSh7w72QkMGBQqBuLHrNigIKe9BJK+wx7RcSNnRSuuxSYkv98nPuCRwBHrrKy7qqMgqisJjGVe
 R7E/4PrDE331CsBx1LxeXiCO0m/aQYXTm5QeTgeM4qaN2GHoMido5QZCnKVsrDqpxVZo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi2vP-0004oC-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 04:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 520B9403F2;
 Tue, 20 Jan 2026 04:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1A5C16AAE;
 Tue, 20 Jan 2026 04:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768881658;
 bh=YauNuqIweUUzHBAG/wxUTwg1vMjI3lqsPMp36RAUaiU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=JOogOcwHYxKDN6t4zVnrKgbWosuUeYhad+mHGRgcN/INhK+XgdOEKnLHjLP7elTar
 1W3vMdXACW+W/2k6Y1SjNA1d110hLQrkW419wfbnsqMmO+OPwLyv0SgDesLuE2WAJi
 2aYXlU/mMw+yUJNAwJJGJLhWwx0nRgbaNpC+kP/ksxCmw9lHysu8xDkWIj7CHFyO+4
 9cuGDLZVrgM/1jFEHWDgR++pBTICM+A4BGE2aPPXPQq8+H4+7dinfQtnJlIuuMfLbS
 0aPjnxiGBWvjmVhhmVn+JoY4PXWFcUokxhvBQcpM8u728bKYSH/OPuA6GypgV8ktQY
 GMGfKzjle1P4Q==
Message-ID: <18070a5f-6fdf-4063-ab99-86b8641bcc97@kernel.org>
Date: Tue, 20 Jan 2026 12:00:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260119133230.16481-1-chao@kernel.org>
 <CAHJ8P3JebPryFL80s+x0gT5JDeaGGpq3MgjLyJATwuNyC2NM7w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3JebPryFL80s+x0gT5JDeaGGpq3MgjLyJATwuNyC2NM7w@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 1/20/2026 7:47 AM, Zhiguo Niu wrote: > Chao Yu via Linux-f2fs-devel
    <linux-f2fs-devel@lists.sourceforge.net> > 于2026年1月19日周一 22:48写道：
    >> >> This patch introduces sbi->nr_pages[F2F [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vi2vP-0004oC-Nm
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: check skipped write in
 f2fs_enable_checkpoint()
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

T24gMS8yMC8yMDI2IDc6NDcgQU0sIFpoaWd1byBOaXUgd3JvdGU6Cj4gQ2hhbyBZdSB2aWEgTGlu
dXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4g
5LqOMjAyNuW5tDHmnIgxOeaXpeWRqOS4gCAyMjo0OOWGmemBk++8mgo+Pgo+PiBUaGlzIHBhdGNo
IGludHJvZHVjZXMgc2JpLT5ucl9wYWdlc1tGMkZTX1NLSVBQRURfV1JJVEVdIHRvIHJlY29yZCBh
bnkKPj4gc2tpcHBlZCB3cml0ZSBkdXJpbmcgZGF0YSBmbHVzaCBpbiBmMmZzX2VuYWJsZV9jaGVj
a3BvaW50KCkuCj4+Cj4+IFNvIGluIHRoZSBsb29wIG9mIGRhdGEgZmx1c2gsIGlmIHRoZXJlIGlz
IGFueSBza2lwcGVkIHdyaXRlIGluIHByZXZpb3VzCj4+IGZsdXNoLCBsZXQncyByZXRyeSBzeW5j
X2lub2RlX3NiKCksIG90aGVyd2lzZSwgYWxsIGRpcnR5IGRhdGEgd3JpdHRlbgo+PiBiZWZvcmUg
ZjJmc19lbmFibGVfY2hlY2twb2ludCgpIHNob3VsZCBoYXZlIGJlZW4gcGVyc2lzdGVkLCB0aGVu
IGJyZWFrCj4+IHRoZSByZXRyeSBsb29wLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiBDaGFuZ2Vsb2c6Cj4+IC0gY29kZSBpcyBiYXNlZCBv
biAnUmV2ZXJ0ICJmMmZzOiBhZGQgdGltZW91dCBpbiBmMmZzX2VuYWJsZV9jaGVja3BvaW50KCki
Jwo+PiAgIGZzL2YyZnMvZGF0YS5jICB8IDEyICsrKysrKysrKysrKwo+PiAgIGZzL2YyZnMvZjJm
cy5oICB8ICAyICsrCj4+ICAgZnMvZjJmcy9zdXBlci5jIHwgMzcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMv
ZjJmcy9kYXRhLmMKPj4gaW5kZXggNWI0ODMyOTU2MTk2Li4wMDEwOGQ1ODgxYWEgMTAwNjQ0Cj4+
IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC0zNTAw
LDYgKzM1MDAsMTUgQEAgc3RhdGljIGlubGluZSB2b2lkIGFjY291bnRfd3JpdGViYWNrKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIGJvb2wgaW5jKQo+PiAgICAgICAgICBmMmZzX3VwX3JlYWQoJkYyRlNf
SShpbm9kZSktPmlfc2VtKTsKPj4gICB9Cj4+Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRl
X3NraXBwZWRfd3JpdGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRy
b2wgKndiYykKPj4gK3sKPj4gKyAgICAgICBsb25nIHNraXBwZWQgPSB3YmMtPnBhZ2VzX3NraXBw
ZWQ7Cj4+ICsKPj4gKyAgICAgICBpZiAoc2tpcHBlZCAmJiBpc19zYmlfZmxhZ19zZXQoc2JpLCBT
QklfRU5BQkxFX0NIRUNLUE9JTlQpKQo+PiArICAgICAgICAgICAgICAgYXRvbWljX2FkZChza2lw
cGVkLCAmc2JpLT5ucl9wYWdlc1tGMkZTX1NLSVBQRURfV1JJVEVdKTsKPj4gK30KPj4gKwo+PiAg
IHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3RydWN0IGFkZHJlc3Nfc3BhY2Ug
Km1hcHBpbmcsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qgd3JpdGViYWNrX2NvbnRyb2wgKndiYywKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaW9zdGF0X3R5cGUgaW9fdHlwZSkK
Pj4gQEAgLTM1NjQsMTAgKzM1NzMsMTMgQEAgc3RhdGljIGludCBfX2YyZnNfd3JpdGVfZGF0YV9w
YWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4gICAgICAgICAgICovCj4+Cj4+
ICAgICAgICAgIGYyZnNfcmVtb3ZlX2RpcnR5X2lub2RlKGlub2RlKTsKPj4gKwo+PiArICAgICAg
IHVwZGF0ZV9za2lwcGVkX3dyaXRlKHNiaSwgd2JjKTsKPiBIaSBDaGFvLAo+IFNvcnJ5LCB3aHkg
ZG8gd2UgbmVlZCB0byB1cGRhdGUgc2tpcHBlZCB3cml0ZSBoZXJlIGFzIHdlbGw/CgpaaGlndW8s
CgpJbiBjYXNlIHdlIGluY3JlYXNlIHBhZ2VzX3NraXBwZWQgaW4gYmVsb3cgcGF0aDoKCi0gX19m
MmZzX3dyaXRlX2RhdGFfcGFnZXMKICAtIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMKICAgLSBmMmZz
X3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UKICAgIC0gZm9saW9fcmVkaXJ0eV9mb3Jfd3JpdGVwYWdl
CiAgICA6IHdiYy0+cGFnZXNfc2tpcHBlZCArPSBucjsKClRoYW5rcywKCj4gdGhhbmtzIQo+PiAg
ICAgICAgICByZXR1cm4gcmV0Owo+Pgo+PiAgIHNraXBfd3JpdGU6Cj4+ICAgICAgICAgIHdiYy0+
cGFnZXNfc2tpcHBlZCArPSBnZXRfZGlydHlfcGFnZXMoaW5vZGUpOwo+PiArICAgICAgIHVwZGF0
ZV9za2lwcGVkX3dyaXRlKHNiaSwgd2JjKTsKPj4gICAgICAgICAgdHJhY2VfZjJmc193cml0ZXBh
Z2VzKG1hcHBpbmctPmhvc3QsIHdiYywgREFUQSk7Cj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAg
IH0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4gaW5k
ZXggMDM1MjM5NzU4ZTMzLi41MmNlYzZiM2VjZjAgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZjJm
cy5oCj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+IEBAIC0xMjM4LDYgKzEyMzgsNyBAQCBlbnVt
IGNvdW50X3R5cGUgewo+PiAgICAgICAgICBGMkZTX1JEX01FVEEsCj4+ICAgICAgICAgIEYyRlNf
RElPX1dSSVRFLAo+PiAgICAgICAgICBGMkZTX0RJT19SRUFELAo+PiArICAgICAgIEYyRlNfU0tJ
UFBFRF9XUklURSwgICAgIC8qIHNraXAgb3IgZmFpbCBkdXJpbmcgZjJmc19lbmFibGVfY2hlY2tw
b2ludCgpICovCj4+ICAgICAgICAgIE5SX0NPVU5UX1RZUEUsCj4+ICAgfTsKPj4KPj4gQEAgLTE0
NzYsNiArMTQ3Nyw3IEBAIGVudW0gewo+PiAgICAgICAgICBTQklfSVNfUkVTSVpFRlMsICAgICAg
ICAgICAgICAgICAgICAgICAgLyogcmVzaXplZnMgaXMgaW4gcHJvY2VzcyAqLwo+PiAgICAgICAg
ICBTQklfSVNfRlJFRVpJTkcsICAgICAgICAgICAgICAgICAgICAgICAgLyogZnJlZXplZnMgaXMg
aW4gcHJvY2VzcyAqLwo+PiAgICAgICAgICBTQklfSVNfV1JJVEFCTEUsICAgICAgICAgICAgICAg
ICAgICAgICAgLyogcmVtb3ZlIHJvIG1vdW50b3B0aW9uIHRyYW5zaWVudGx5ICovCj4+ICsgICAg
ICAgU0JJX0VOQUJMRV9DSEVDS1BPSU5ULCAgICAgICAgICAgICAgICAgIC8qIGluZGljYXRlIGl0
J3MgZHVyaW5nIGYyZnNfZW5hYmxlX2NoZWNrcG9pbnQoKSAqLwo+PiAgICAgICAgICBNQVhfU0JJ
X0ZMQUcsCj4+ICAgfTsKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2Yy
ZnMvc3VwZXIuYwo+PiBpbmRleCA5N2MyMjY0ZWM3ZmUuLjBhZmU5ZjgyOTA1OCAxMDA2NDQKPj4g
LS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+PiBAQCAtMjY5
MCw2ICsyNjkwLDcgQEAgc3RhdGljIGludCBmMmZzX2VuYWJsZV9jaGVja3BvaW50KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4gICAgICAgICAgbG9uZyBsb25nIHN0YXJ0LCB3cml0ZWJhY2ss
IGVuZDsKPj4gICAgICAgICAgaW50IHJldDsKPj4gICAgICAgICAgc3RydWN0IGYyZnNfbG9ja19j
b250ZXh0IGxjOwo+PiArICAgICAgIGxvbmcgbG9uZyBza2lwcGVkX3dyaXRlLCBkaXJ0eV9kYXRh
Owo+Pgo+PiAgICAgICAgICBmMmZzX2luZm8oc2JpLCAiZjJmc19lbmFibGVfY2hlY2twb2ludCgp
IHN0YXJ0cywgbWV0YTogJWxsZCwgbm9kZTogJWxsZCwgZGF0YTogJWxsZCIsCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3BhZ2VzKHNiaSwgRjJGU19ESVJU
WV9NRVRBKSwKPj4gQEAgLTI2OTgsMTcgKzI2OTksNDUgQEAgc3RhdGljIGludCBmMmZzX2VuYWJs
ZV9jaGVja3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4KPj4gICAgICAgICAgc3Rh
cnQgPSBrdGltZV9nZXQoKTsKPj4KPj4gKyAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfRU5B
QkxFX0NIRUNLUE9JTlQpOwo+PiArCj4+ICAgICAgICAgIC8qIHdlIHNob3VsZCBmbHVzaCBhbGwg
dGhlIGRhdGEgdG8ga2VlcCBkYXRhIGNvbnNpc3RlbmN5ICovCj4+ICAgICAgICAgIGRvIHsKPj4g
KyAgICAgICAgICAgICAgIHNraXBwZWRfd3JpdGUgPSBnZXRfcGFnZXMoc2JpLCBGMkZTX1NLSVBQ
RURfV1JJVEUpOwo+PiArICAgICAgICAgICAgICAgZGlydHlfZGF0YSA9IGdldF9wYWdlcyhzYmks
IEYyRlNfRElSVFlfREFUQSk7Cj4+ICsKPj4gICAgICAgICAgICAgICAgICBzeW5jX2lub2Rlc19z
YihzYmktPnNiKTsKPj4gICAgICAgICAgICAgICAgICBmMmZzX2lvX3NjaGVkdWxlX3RpbWVvdXQo
REVGQVVMVF9TQ0hFRFVMRV9USU1FT1VUKTsKPj4gLSAgICAgICB9IHdoaWxlIChnZXRfcGFnZXMo
c2JpLCBGMkZTX0RJUlRZX0RBVEEpICYmIHJldHJ5LS0pOwo+PiArCj4+ICsgICAgICAgICAgICAg
ICBmMmZzX2luZm8oc2JpLCAic3luY19pbm9kZV9zYiBkb25lLCBkaXJ0eV9kYXRhOiAlbGxkLCAl
bGxkLCAiCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInNraXBwZWQgd3JpdGU6
ICVsbGQsICVsbGQsIHJldHJ5OiAlZCIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2V0X3BhZ2VzKHNiaSwgRjJGU19ESVJUWV9EQVRBKSwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkaXJ0eV9kYXRhLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdldF9wYWdlcyhzYmksIEYyRlNfU0tJUFBFRF9XUklURSksCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2tpcHBlZF93cml0ZSwgcmV0cnkpOwo+PiArCj4+ICsgICAgICAg
ICAgICAgICAvKgo+PiArICAgICAgICAgICAgICAgICogc3luY19pbm9kZXNfc2IoKSBoYXMgcmV0
cnkgbG9naWMsIHNvIGxldCdzIGNoZWNrIGRpcnR5X2RhdGEKPj4gKyAgICAgICAgICAgICAgICAq
IGluIHByaW9yIHRvIHNraXBwZWRfd3JpdGUgaW4gY2FzZSB0aGVyZSBpcyBubyBkaXJ0eSBkYXRh
Lgo+PiArICAgICAgICAgICAgICAgICovCj4+ICsgICAgICAgICAgICAgICBpZiAoIWdldF9wYWdl
cyhzYmksIEYyRlNfRElSVFlfREFUQSkpCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+PiArICAgICAgICAgICAgICAgaWYgKGdldF9wYWdlcyhzYmksIEYyRlNfU0tJUFBFRF9XUklU
RSkgPT0gc2tpcHBlZF93cml0ZSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4+
ICsgICAgICAgfSB3aGlsZSAocmV0cnktLSk7Cj4+ICsKPj4gKyAgICAgICBjbGVhcl9zYmlfZmxh
ZyhzYmksIFNCSV9FTkFCTEVfQ0hFQ0tQT0lOVCk7Cj4+Cj4+ICAgICAgICAgIHdyaXRlYmFjayA9
IGt0aW1lX2dldCgpOwo+Pgo+PiAtICAgICAgIGlmICh1bmxpa2VseShnZXRfcGFnZXMoc2JpLCBG
MkZTX0RJUlRZX0RBVEEpKSkKPj4gLSAgICAgICAgICAgICAgIGYyZnNfd2FybihzYmksICJjaGVj
a3BvaW50PWVuYWJsZSBoYXMgc29tZSB1bndyaXR0ZW4gZGF0YTogJWxsZCIsCj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfcGFnZXMoc2JpLCBGMkZTX0RJUlRZ
X0RBVEEpKTsKPj4gKyAgICAgICBpZiAodW5saWtlbHkoZ2V0X3BhZ2VzKHNiaSwgRjJGU19ESVJU
WV9EQVRBKSB8fAo+PiArICAgICAgICAgICAgICAgICAgICAgICBnZXRfcGFnZXMoc2JpLCBGMkZT
X1NLSVBQRURfV1JJVEUpKSkKPj4gKyAgICAgICAgICAgICAgIGYyZnNfd2FybihzYmksICJjaGVj
a3BvaW50PWVuYWJsZSB1bndyaXR0ZW4gZGF0YTogJWxsZCwgc2tpcHBlZCBkYXRhOiAlbGxkLCBy
ZXRyeTogJWQiLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9wYWdlcyhz
YmksIEYyRlNfRElSVFlfREFUQSksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2V0X3BhZ2VzKHNiaSwgRjJGU19TS0lQUEVEX1dSSVRFKSwgcmV0cnkpOwo+PiArCj4+ICsgICAg
ICAgaWYgKGdldF9wYWdlcyhzYmksIEYyRlNfU0tJUFBFRF9XUklURSkpCj4+ICsgICAgICAgICAg
ICAgICBhdG9taWNfc2V0KCZzYmktPm5yX3BhZ2VzW0YyRlNfU0tJUFBFRF9XUklURV0sIDApOwo+
Pgo+PiAgICAgICAgICBmMmZzX2Rvd25fd3JpdGVfdHJhY2UoJnNiaS0+Z2NfbG9jaywgJmxjKTsK
Pj4gICAgICAgICAgZjJmc19kaXJ0eV90b19wcmVmcmVlKHNiaSk7Cj4+IC0tCj4+IDIuNDAuMQo+
Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
