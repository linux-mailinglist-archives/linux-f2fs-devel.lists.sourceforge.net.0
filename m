Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0DB54002
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Sep 2025 03:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsYN0naLxcQS9MrhY17B2GFluzVVvzFnXsrTLf8iZfw=; b=BPlhVgNo8OGwOvK5JxxJgJ6rRu
	muSod1YpTVP+LT4j7/XjF1lOoOxsj5iJJkegMHiWIqWWp0gVSwlP4iuxvLAna0E5uh6f2ZdgSTNwQ
	sCGepzzCT6B+C9OoDpK6jM447G2Kn60ZnWPDsw0L2V0yAY8Tz5FN/kNNfLJUtFfiGUQI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwsyP-0007zd-G6;
	Fri, 12 Sep 2025 01:53:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uwsyO-0007zW-7B
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 01:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WywGuHSExsw29dLCbVg8gQwwTPFLvXHlq+1USO+4lsI=; b=d/rD+CsGT6+5FUBaDOukn+vUt4
 1LzcY70YUEjtXxi6GZxXsuPTUZz/c7G5Q7Ww4+DQ5sKkCid7EWPjuLGRxCDuwoZb9fnuCy+mQpH/i
 Vk+rGh/rWsuasYt9EtjIlKr958mI79/RvMRvLIp3uGHatxGrrOZuW7txJIzGEb7x98r0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WywGuHSExsw29dLCbVg8gQwwTPFLvXHlq+1USO+4lsI=; b=Zi132x2cfmF8fMUta0Jt2Pc/oQ
 4aGYpi87cr70x3XI6bQkg1H5XSPkFH4h9rmEdbaN3QxFuwH56PVtC7tSKk2SVGK0rnWHtbqkKdVFV
 rKbBEGRjp0HSix1TOYyYCalMo+jq6pzVbAWqBB7OQLbEP4L1viHape/rXtoy5fVITFsI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwsyO-0003GR-Bb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Sep 2025 01:53:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B56E60147;
 Fri, 12 Sep 2025 01:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0286C4CEF0;
 Fri, 12 Sep 2025 01:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757641981;
 bh=99G4qv/3CdgX9Nxeg7q0yDGVl4TQ9oN85oPNSBy8taM=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=MoCnrmp5C9fofctJy9vANtmUS5nWhjRqVihHfHZmxd9SunHBQtUkEYqfVdi7i2U0W
 v1oFDKpn2wuxMJxuRdkhFvXE6iI5oolCRpCMnJacjUJBGfmONOvJ6rHtlFjy2HpDez
 JezhZoQHCNSuoF8+uIUwUbMgxUexhxPS62Yxoih4cv0XMubC1EH8OBS704fGeFApTX
 U3WqxjMeyjZ2moIBFerGBefsrUMZewhehuxzinKfvty8YgHlgqHg/6P3u7gD7/g6fK
 k74qTOKV1sm2GIUOZmGWayEh/eokQ8V1xHN5okV9Ztd8YbqX762B0t0vbt5xmYdbYR
 AisuqobkzpCEw==
Message-ID: <c83ac24b-9997-4f2e-9e51-00c29909ad85@kernel.org>
Date: Fri, 12 Sep 2025 09:52:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <228203f5-d3bf-46fb-b990-3de2eb2ff3e8@kernel.org>
 <20250911090745.2940557-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250911090745.2940557-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/11/2025 5:07 PM, wangzijie wrote: >> On 9/10/25 21:58, 
 wangzijie wrote: >>> When the data layout is like this: >>> dnode1: dnode2:
 >>> [0] A [0] NEW_ADDR >>> [1] A+1 [1] 0x0 >>> ... .... >>> [101 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uwsyO-0003GR-Bb
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
 precache extents
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gOS8xMS8yMDI1IDU6MDcgUE0sIHdhbmd6aWppZSB3cm90ZToKPj4gT24gOS8xMC8yNSAyMTo1
OCwgd2FuZ3ppamllIHdyb3RlOgo+Pj4gV2hlbiB0aGUgZGF0YSBsYXlvdXQgaXMgbGlrZSB0aGlz
Ogo+Pj4gZG5vZGUxOiAgICAgICAgICAgICAgICAgICAgIGRub2RlMjoKPj4+IFswXSAgICAgIEEg
ICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPj4+IFsxXSAgICAgIEErMSAgICAgICAg
ICAgICAgICBbMV0gICAgMHgwCj4+PiAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgLi4uLgo+
Pj4gWzEwMTZdICAgQSsxMDE2Cj4+PiBbMTAxN10gICBCIChCIT1BKzEwMTcpICAgICAgWzEwMTdd
IDB4MAo+Pj4KPj4+IFdlIGNhbiBidWlsZCB0aGlzIGtpbmQgb2YgbGF5b3V0IGJ5IGZvbGxvd2lu
ZyBzdGVwcyh3aXRoIGlfZXh0cmFfaXNpemU6MzYpOgo+Pj4gLi9mMmZzX2lvIHdyaXRlIDEgMCAx
ODgxIHJhbmQgZHN5bmMgdGVzdGZpbGUKPj4+IC4vZjJmc19pbyB3cml0ZSAxIDE4ODEgMSByYW5k
IGJ1ZmZlcmVkIHRlc3RmaWxlCj4+PiAuL2YyZnNfaW8gZmFsbG9jYXRlIDAgNzcwODY3MiA0MDk2
IHRlc3RmaWxlCj4+Pgo+Pj4gQW5kIHdoZW4gd2UgbWFwIGZpcnN0IGRhdGEgYmxvY2sgaW4gZG5v
ZGUyLCB3ZSB3aWxsIGdldCB3cm9uZyBleHRlbnRfaW5mbyBkYXRhOgo+Pj4gbWFwLT5tX2xlbiA9
IDEKPj4+IG9mcyA9IHN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPSAxODgyIC0gMTg4MSA9IDEK
Pj4+Cj4+PiBlaS5mb2ZzID0gc3RhcnRfcGdvZnMgPSAxODgyCj4+PiBlaS5sZW4gPSBtYXAtPm1f
bGVuIC0gb2ZzID0gMSAtIDEgPSAwCj4+Pgo+Pj4gRml4IGl0IGJ5IHNraXBwaW5nIHVwZGF0aW5n
IHRoaXMga2luZCBvZiBleHRlbnQgaW5mby4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiB3YW5nemlq
aWUgPHdhbmd6aWppZTFAaG9ub3IuY29tPgo+Pj4gLS0tCj4+PiAgIGZzL2YyZnMvZGF0YS5jIHwg
MyArKysKPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBpbmRleCA3OTYxZTBk
ZGYuLmI4YmI3MTg1MiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+PiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTE2NDksNiArMTY0OSw5IEBAIGludCBmMmZzX21hcF9ibG9j
a3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQg
ZmxhZykKPj4+ICAgCj4+PiAgIAkJc3dpdGNoIChmbGFnKSB7Cj4+PiAgIAkJY2FzZSBGMkZTX0dF
VF9CTE9DS19QUkVDQUNIRToKPj4+ICsJCQlpZiAoX19pc192YWxpZF9kYXRhX2Jsa2FkZHIobWFw
LT5tX3BibGspICYmCj4+PiArCQkJCXN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGsgPT0gbWFwLT5t
X2xlbikKPj4+ICsJCQkJbWFwLT5tX2ZsYWdzICY9IH5GMkZTX01BUF9NQVBQRUQ7Cj4+Cj4+IEl0
IGxvb2tzIHdlIG1pc3NlZCB0byByZXNldCB2YWx1ZSBmb3IgbWFwIHZhcmlhYmxlIGluIGYyZnNf
cHJlY2FjaGVfZXh0ZW50cygpLAo+PiB3aGF0IGRvIHlvdSB0aGluayBvZiB0aGlzPwo+Pgo+PiAt
LS0KPj4gICBmcy9mMmZzL2ZpbGUuYyB8IDQgKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4gaW5kZXggMWFhZTQzNjFkMGE4Li4yYjE0MTUxZDQxMzAg
MTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+
IEBAIC0zNTk5LDcgKzM1OTksNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2lvX3ByaW8oc3RydWN0
IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+PiAgIGludCBmMmZzX3ByZWNhY2hlX2V4
dGVudHMoc3RydWN0IGlub2RlICppbm9kZSkKPj4gICB7Cj4+ICAgCXN0cnVjdCBmMmZzX2lub2Rl
X2luZm8gKmZpID0gRjJGU19JKGlub2RlKTsKPj4gLQlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1h
cDsKPj4gKwlzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzIG1hcCA9IHsgMCB9Owo+PiAgIAlwZ29mZl90
IG1fbmV4dF9leHRlbnQ7Cj4+ICAgCWxvZmZfdCBlbmQ7Cj4+ICAgCWludCBlcnI7Cj4+IEBAIC0z
NjE3LDYgKzM2MTcsOCBAQCBpbnQgZjJmc19wcmVjYWNoZV9leHRlbnRzKHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4+Cj4+ICAgCXdoaWxlIChtYXAubV9sYmxrIDwgZW5kKSB7Cj4+ICAgCQltYXAubV9s
ZW4gPSBlbmQgLSBtYXAubV9sYmxrOwo+PiArCQltYXAubV9wYmxrID0gMDsKPj4gKwkJbWFwLm1f
ZmxhZ3MgPSAwOwo+Pgo+PiAgIAkJZjJmc19kb3duX3dyaXRlKCZmaS0+aV9nY19yd3NlbVtXUklU
RV0pOwo+PiAgIAkJZXJyID0gZjJmc19tYXBfYmxvY2tzKGlub2RlLCAmbWFwLCBGMkZTX0dFVF9C
TE9DS19QUkVDQUNIRSk7Cj4+IC0tIAo+PiAyLjQ5LjAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gICAJ
CQlnb3RvIHN5bmNfb3V0Owo+Pj4gICAJCWNhc2UgRjJGU19HRVRfQkxPQ0tfQk1BUDoKPj4+ICAg
CQkJbWFwLT5tX3BibGsgPSAwOwo+IAo+IAo+IFdlIGhhdmUgYWxyZWFkeSByZXNldCBtX2ZsYWdz
IChtYXAtPm1fZmxhZ3MgPSAwKSBpbiBmMmZzX21hcF9ibG9ja3MoKS4KClppamllOgoKT29wcywg
dGhhdCdzIHJpZ2h0LCB0aGFua3MgZm9yIGNvcnJlY3RpbmcgbWUuCgo+IAo+IEkgdGhpbmsgdGhh
dCB0aGlzIGJ1ZyBpcyBjYXVzZWQgYnkgd2UgbWlzc2VkIHRvIHJlc2V0IG1fZmxhZ3Mgd2hlbiB3
ZQo+IGdvdG8gbmV4dF9kbm9kZSBpbiBiZWxvdyBjYXNl77yaCj4gCj4gRGF0YSBsYXlvdXQgaXMg
c29tZXRoaW5nIGxpa2UgdGhpczoKPiBkbm9kZTE6ICAgICAgICAgICAgICAgICAgICAgZG5vZGUy
Ogo+IFswXSAgICAgIEEgICAgICAgICAgICAgICAgICBbMF0gICAgTkVXX0FERFIKPiBbMV0gICAg
ICBBKzEgICAgICAgICAgICAgICAgWzFdICAgIDB4MAo+IC4uLgo+IFsxMDE2XSAgIEErMTAxNgo+
IFsxMDE3XSAgIEIgKEIhPUErMTAxNykgICAgICBbMTAxN10gMHgwCj4gCj4gd2UgbWFwIHRoZSBs
YXN0IGJsb2NrKHZhbGlkIGJsa2FkZHIpIGluIGRub2RlMToKPiBtYXAtPm1fZmxhZ3MgfD0gRjJG
U19NQVBfTUFQUEVEOwo+IG1hcC0+bV9wYmxrID0gYmxrYWRkcih2YWxpZCBibGthZGRyKTsKPiBt
YXAtPm1fbGVuID0gMTsKPiB0aGVuIHdlIGdvdG8gbmV4dF9kbm9kZSwgbWVldCB0aGUgZmlyc3Qg
YmxvY2sgaW4gZG5vZGUyKGhvbGUpLCBnb3RvIHN5bmNfb3V0Ogo+IG1hcC0+bV9mbGFncyAmIEYy
RlNfTUFQX01BUFBFRCA9PSB0cnVlLCBhbmQgd2UgbWFrZSB3cm9uZyBibGthZGRyL2xlbiBmb3Ig
ZXh0ZW50X2luZm8uCgpTbywgY2FuIHlvdSBwbGVhc2UgYWRkIGFib3ZlIGV4cGxhbmF0aW9uIGlu
dG8gY29tbWl0IG1lc3NhZ2U/IHRoYXQKc2hvdWxkIGJlIGhlbHBmdWwgZm9yIHVuZGVyc3RhbmRp
bmcgdGhlIHByb2JsZW0gbW9yZSBjbGVhcmx5LgoKUGxlYXNlIHRha2UgYSBsb29rIGF0IHRoaXMg
Y2FzZSB3LyB5b3VyIHBhdGNoOgoKbWtmcy5mMmZzIC1PIGV4dHJhX2F0dHIsY29tcHJlc3Npb24g
L2Rldi92ZGIgLWYKbW91bnQgL2Rldi92ZGIgL21udC9mMmZzIC1vIG1vZGU9bGZzCmNkIC9tbnQv
ZjJmcwpmMmZzX2lvIHdyaXRlIDEgMCAxODgzIHJhbmQgZHN5bmMgdGVzdGZpbGUKZjJmc19pbyBm
YWxsb2NhdGUgMCA3NzEyNzY4IDQwOTYgdGVzdGZpbGUKZjJmc19pbyB3cml0ZSAxIDE4ODEgMSBy
YW5kIGJ1ZmZlcmVkIHRlc3RmaWxlCnhmc19pbyB0ZXN0ZmlsZSAtYyAiZnN5bmMiCmNkIC8KdW1v
dW50IC9tbnQvZjJmcwptb3VudCAvZGV2L3ZkYiAvbW50L2YyZnMKZjJmc19pbyBwcmVjYWNoZV9l
eHRlbnRzIC9tbnQvZjJmcy90ZXN0ZmlsZQp1bW91bnQgL21udC9mMmZzCgogICAgICAgICAgZjJm
c19pby03MzMgICAgIFswMTBdIC4uLi4uICAgIDc4LjEzNDEzNjogZjJmc191cGRhdGVfcmVhZF9l
eHRlbnRfdHJlZV9yYW5nZTogZGV2ID0gKDI1MywxNiksIGlubyA9IDQsIHBnb2ZzID0gMTg4Miwg
bGVuID0gMCwgYmxrYWRkciA9IDE3NDEwLCBjX2xlbiA9IDAKCkkgc3VzcGVjdCB3ZSBuZWVkIHRo
aXM/CgpAQCAtMTc4NCw3ICsxNzgxLDggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQogICAgICAg
ICB9CgogICAgICAgICBpZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSkgewotICAg
ICAgICAgICAgICAgaWYgKG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkgeworICAgICAg
ICAgICAgICAgaWYgKChtYXAtPm1fZmxhZ3MgJiBGMkZTX01BUF9NQVBQRUQpICYmCisgICAgICAg
ICAgICAgICAgICAgICAgIChtYXAtPm1fbGVuIC0gb2ZzKSkgewogICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IG9mcyA9IHN0YXJ0X3Bnb2ZzIC0gbWFwLT5tX2xibGs7CgogICAg
ICAgICAgICAgICAgICAgICAgICAgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2Uo
JmRuLAoKQlRXLCBJIGZpbmQgYW5vdGhlciBidWcsIGlmIG9uZSBibGthZGRyIGlzIGFkamNlbnQg
dG8gcHJldmlvdXMgZXh0ZW50LApidXQgYW5kIGl0IGlzIHZhbGlkLCB3ZSBuZWVkIHRvIHNldCBt
X25leHRfZXh0ZW50IHRvIHBnb2ZzIHJhdGhlciB0aGFuCnBnb2ZzICsgMS4KCmRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCmluZGV4IGNiZjg4NDE2NDJjNy4uYWM4
OGVkNjgwNTljIDEwMDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEu
YwpAQCAtMTc4OSw4ICsxNzg5LDExIEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2Rl
ICppbm9kZSwgc3RydWN0IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLCBpbnQgZmxhZykKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnRfcGdvZnMsIG1hcC0+bV9wYmxrICsgb2ZzLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAtPm1fbGVuIC0gb2ZzKTsKICAgICAg
ICAgICAgICAgICB9Ci0gICAgICAgICAgICAgICBpZiAobWFwLT5tX25leHRfZXh0ZW50KQotICAg
ICAgICAgICAgICAgICAgICAgICAqbWFwLT5tX25leHRfZXh0ZW50ID0gcGdvZnMgKyAxOworICAg
ICAgICAgICAgICAgaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkgeworICAgICAgICAgICAgICAgICAg
ICAgICAqbWFwLT5tX25leHRfZXh0ZW50ID0gcGdvZnM7CisgICAgICAgICAgICAgICAgICAgICAg
IGlmICghX19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpCisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKm1hcC0+bV9uZXh0X2V4dGVudCArPSAxOworICAgICAgICAgICAgICAg
fQogICAgICAgICB9CiAgICAgICAgIGYyZnNfcHV0X2Rub2RlKCZkbik7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
