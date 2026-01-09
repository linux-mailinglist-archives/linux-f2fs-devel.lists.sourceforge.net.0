Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 160F7D07EDC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 09:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gSEchnZRYG8fwuEcn15w9ylYYF2z+5eyrRhnhMXJBA=; b=TKsazESmQmp4duy2kC0eggcoUi
	IlBWCA960XvaDmTGmZRFAOp5mD+EIJnQUq68v8D0Lm6styHhqqxisfw5EkPpIEcxHlI5yQc31wFbG
	q38tUE0RYz4B8Z+ysb+zBhB3gdCMxvgu+9KO23JKIe/kbqv7m90TKjfMokaxRQlPbWgY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ve879-0006kf-Ew;
	Fri, 09 Jan 2026 08:44:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ve872-0006kR-TV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 08:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0jYroLMk25v7BQGpFy+Ono1yBWOt/3kkfkm2VzSYC8=; b=IR1bY7baL7a+z+FUS6PbUrpWsX
 e75jnsybEEtszVggWjSPUV920iZlrwJDkZ/bxo29bEn472vu0rfQ5m7oOhos1kS40+cnPNmKoZV7j
 Y6J6Iunf7/zt5BF0EG9WA/stEnV4ZfBaCTYwvVD1WrZZdV3pyLr26palc39zOr1J3btI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c0jYroLMk25v7BQGpFy+Ono1yBWOt/3kkfkm2VzSYC8=; b=XTKf7mxwif/6/pv1UnEs/7Sidu
 wMvAk25BjmxMaEEsYXmabZ7xauUqEewpKS6HJOAy763T1CEml/gaNHDapl2w+xGVd5xttFQGQinmH
 Wk5HEGQrFGrTUzz2zXY2X6cESjlT4M6LEDQJzNLjhboDJia0TKza+omrqd7z0L6Wryp0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ve872-0003bg-8o for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 08:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBD4D417CB;
 Fri,  9 Jan 2026 08:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E36CC4CEF1;
 Fri,  9 Jan 2026 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767948281;
 bh=sazsN0oeUYHYmnMpAFAzwhhfQCumopnAD0FOsYp4zss=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AH9wqouL1l3oXd2PFe3XtJbe2E2xsGGLctqhH7OvXA5uQgtAq9VTyZ4Rro33vkMVQ
 UpYniigvaDhTxkSap0+TuvPB4gVh3RU9VWta8P/NmM84wLK5Ti3YC/xjqvwF1ELdj4
 cYxZHOJZs9dGWgmmm6hA6zaEFuP0f7kBiLIDvjh2tKOx1zYUoGgl8E+4foD8AI3jlw
 EEJvmrUEvXYxbDfHiJ/R+zTQaeIvZvoymisGBG43Y72sOgPWLh3sL1nrpO8ikkD4EM
 bPgcP5xhqFHoxHLdpKbjbbL3pLsW9amveLLkHcQO4iWBBHBK3X4gpap8FIYer8J12/
 SKwL9hS15kL3A==
Message-ID: <8c13ca69-a08a-41c7-bbef-0a79a5f44f93@kernel.org>
Date: Fri, 9 Jan 2026 16:44:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Barry Song <21cnbao@gmail.com>
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
 <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
 <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/2026 11:57 AM, Barry Song wrote: > On Fri, Jan 9, 2026
 at 4:45 PM Chao Yu <chao@kernel.org> wrote: >> >> On 1/9/2026 11:05 AM, Barry
 Song wrote: >>> On Fri, Jan 9, 2026 at 3:47 PM Chao Yu <chao [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ve872-0003bg-8o
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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

T24gMS85LzIwMjYgMTE6NTcgQU0sIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gRnJpLCBKYW4gOSwg
MjAyNiBhdCA0OjQ14oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMS85LzIwMjYgMTE6MDUgQU0sIEJhcnJ5IFNvbmcgd3JvdGU6Cj4+PiBPbiBGcmksIEphbiA5
LCAyMDI2IGF0IDM6NDfigK9QTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+
Cj4+Pj4gQmVsb3cgdGVzdGNhc2UgY2FuIGNoYW5nZSBsYXJnZSBmb2xpbyBzdXBwb3J0ZWQgaW5v
ZGUgZnJvbSBpbW11dGFibGUKPj4+PiB0byBtdXRhYmxlLCBpdCdzIG5vdCBhcyBleHBlY3RlZCwg
bGV0J3MgYWRkIGEgbmV3IGNoZWNrIGNvbmRpdGlvbiBpbgo+Pj4+IGYyZnNfc2V0ZmxhZ3NfY29t
bW9uKCkgdG8gZGV0ZWN0IGFuZCByZWplY3QgaXQuCj4+Pj4KPj4+PiAtIGRkIGlmPS9kZXYvemVy
byBvZj0vbW50L2YyZnMvdGVzdCBicz0zMmsgY291bnQ9NAo+Pj4+IC0gZjJmc19pbyBzZXRmbGFn
cyBpbW11dGFibGUgL21udC9mMmZzL3Rlc3QKPj4+PiAtIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9k
cm9wX2NhY2hlcwo+Pj4+ICAgIDogdG8gcmVsb2FkIGlub2RlIHdpdGggbGFyZ2UgZm9saW8KPj4+
PiAtIGYyZnNfaW8gcmVhZCAzMiAwIDEgbW1hcCAwIDAgL21udC9mMmZzL3Rlc3QKPj4+PiAtIGYy
ZnNfaW8gY2xlYXJmbGFncyBpbW11dGFibGUgL21udC9mMmZzL3Rlc3QKPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgICBmcy9m
MmZzL2ZpbGUuYyB8IDYgKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxl
LmMKPj4+PiBpbmRleCBjZTI5MWYxNTJiYzMuLmY3ZjlkYTBiMjE1ZiAxMDA2NDQKPj4+PiAtLS0g
YS9mcy9mMmZzL2ZpbGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gQEAgLTIxNTUs
NiArMjE1NSwxMiBAQCBzdGF0aWMgaW50IGYyZnNfc2V0ZmxhZ3NfY29tbW9uKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIHUzMiBpZmxhZ3MsIHUzMiBtYXNrKQo+Pj4+ICAgICAgICAgICAgICAgICAgIH0K
Pj4+PiAgICAgICAgICAgfQo+Pj4+Cj4+Pj4gKyAgICAgICBpZiAoKGlmbGFncyBeIG1hc2tlZF9m
bGFncykgJiBGMkZTX0lNTVVUQUJMRV9GTCkgewo+Pj4+ICsgICAgICAgICAgICAgICBpZiAoKG1h
c2tlZF9mbGFncyAmIEYyRlNfSU1NVVRBQkxFX0ZMKSAmJgo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIG1hcHBpbmdfbGFyZ2VfZm9saW9fc3VwcG9ydChpbm9kZS0+aV9tYXBwaW5nKSkKPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Cj4+Cj4+IEJhcnJ5
LAo+Pgo+PiBJIG5vdGljZWQgdGhhdCB3ZSBhcmUgYWxsb3dlZCB0byBjbGVhciBpbW11dGFibGUg
aWYgbGFyZ2UgZm9saW8gYXJlIHN1cHBvcnRlZAo+PiBpbiB0YXJnZXQgaW5vZGUsIHNpbmNlIHdl
IGNhbiBwcmV2ZW50IHRvIG9wZW4gdy8gd3JpdGUgcGVybWlzc2lvbiBpbiAtPm9wZW4gYWZ0ZXIK
Pj4gaW1tdXRhYmxlIGlzIGNsZWFyZWQsIHNlZSBkZXRhaWxzIGluIGYyZnMgZG9jIGJlbG93Lgo+
Pgo+PiBTbywgYW55d2F5LCBJIGd1ZXNzIG15IHBhdGNoIHNob3VsZCBiZSBpZ25vcmVkLgo+Pgo+
PiBQZXItZmlsZSBSZWFkLU9ubHkgTGFyZ2UgRm9saW8gU3VwcG9ydAo+PiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pgo+PiBGMkZTIGltcGxlbWVudHMgbGFyZ2UgZm9s
aW8gc3VwcG9ydCBvbiB0aGUgcmVhZCBwYXRoIHRvIGxldmVyYWdlIGhpZ2gtb3JkZXIKPj4gcGFn
ZSBhbGxvY2F0aW9uIGZvciBzaWduaWZpY2FudCBwZXJmb3JtYW5jZSBnYWlucy4gVG8gbWluaW1p
emUgY29kZSBjb21wbGV4aXR5LAo+PiB0aGlzIHN1cHBvcnQgaXMgY3VycmVudGx5IGV4Y2x1ZGVk
IGZyb20gdGhlIHdyaXRlIHBhdGgsIHdoaWNoIHJlcXVpcmVzIGhhbmRsaW5nCj4+IGNvbXBsZXgg
b3B0aW1pemF0aW9ucyBzdWNoIGFzIGNvbXByZXNzaW9uIGFuZCBibG9jayBhbGxvY2F0aW9uIG1v
ZGVzLgo+Pgo+PiBUaGlzIG9wdGlvbmFsIGZlYXR1cmUgaXMgdHJpZ2dlcmVkIG9ubHkgd2hlbiBh
IGZpbGUncyBpbW11dGFibGUgYml0IGlzIHNldC4KPj4gQ29uc2VxdWVudGx5LCBGMkZTIHdpbGwg
cmV0dXJuIEVPUE5PVFNVUFAgaWYgYSB1c2VyIGF0dGVtcHRzIHRvIG9wZW4gYSBjYWNoZWQKPj4g
ZmlsZSB3aXRoIHdyaXRlIHBlcm1pc3Npb25zLCBldmVuIGltbWVkaWF0ZWx5IGFmdGVyIGNsZWFy
aW5nIHRoZSBiaXQuIFdyaXRlCj4+IGFjY2VzcyBpcyBvbmx5IHJlc3RvcmVkIG9uY2UgdGhlIGNh
Y2hlZCBpbm9kZSBpcyBkcm9wcGVkLiBUaGUgdXNhZ2UgZmxvdyBpcwo+PiBkZW1vbnN0cmF0ZWQg
YmVsb3c6Cj4+Cj4+IC4uIGNvZGUtYmxvY2s6Ogo+Pgo+PiAgICAgICMgZjJmc19pbyBzZXRmbGFn
cyBpbW11dGFibGUgL2RhdGEvdGVzdGZpbGVfcmVhZF9zZXEKPj4KPj4gICAgICAvKiBmbHVzaCBh
bmQgcmVsb2FkIHRoZSBpbm9kZSB0byBlbmFibGUgdGhlIGxhcmdlIGZvbGlvICovCj4+ICAgICAg
IyBzeW5jICYmIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwo+Pgo+PiAgICAgIC8q
IG1tYXAoTUFQX1BPUFVMQVRFKSArIG1sb2NrKCkgKi8KPj4gICAgICAjIGYyZnNfaW8gcmVhZCAx
MjggMCAxMDI0IG1tYXAgMSAwIC9kYXRhL3Rlc3RmaWxlX3JlYWRfc2VxCj4+Cj4+ICAgICAgLyog
bW1hcCgpICsgZmFkdmlzZShQT1NJWF9GQURWX1dJTExORUVEKSArIG1sb2NrKCkgKi8KPj4gICAg
ICAjIGYyZnNfaW8gcmVhZCAxMjggMCAxMDI0IGZhZHZpc2UgMSAwIC9kYXRhL3Rlc3RmaWxlX3Jl
YWRfc2VxCj4+Cj4+ICAgICAgLyogbW1hcCgpICsgbWxvY2syKE1MT0NLX09ORkFVTFQpICsgbWFk
dmlzZShNQURWX1BPUFVMQVRFX1JFQUQpICovCj4+ICAgICAgIyBmMmZzX2lvIHJlYWQgMTI4IDAg
MTAyNCBtYWR2aXNlIDEgMCAvZGF0YS90ZXN0ZmlsZV9yZWFkX3NlcQo+Pgo+PiAgICAgICMgZjJm
c19pbyBjbGVhcmZsYWdzIGltbXV0YWJsZSAvZGF0YS90ZXN0ZmlsZV9yZWFkX3NlcQo+Pgo+PiAg
ICAgICMgZjJmc19pbyB3cml0ZSAxIDAgMSB6ZXJvIGJ1ZmZlcmVkIC9kYXRhL3Rlc3RmaWxlX3Jl
YWRfc2VxCj4+ICAgICAgRmFpbGVkIHRvIG9wZW4gL21udC90ZXN0L3Rlc3Q6IE9wZXJhdGlvbiBu
b3Qgc3VwcG9ydGVkCj4+Cj4+ICAgICAgLyogZmx1c2ggYW5kIHJlbG9hZCB0aGUgaW5vZGUgdG8g
ZGlzYWJsZSB0aGUgbGFyZ2UgZm9saW8gKi8KPj4gICAgICAjIHN5bmMgJiYgZWNobyAzID4gL3By
b2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4gCj4gUmlnaHQsIEkgc2VlLiBUaGUgb25seSBjb25jZXJu
IGlzIHRoYXQgdGhpcyB3b3VsZCByZXF1aXJlIGRyb3BwaW5nCj4gdGhlIHBhZ2UgY2FjaGUgZm9y
IHRoZSBlbnRpcmUgc3lzdGVtLCByYXRoZXIgdGhhbiBmb3IgYSBzaW5nbGUgaW5vZGUuCgpZZXMs
IG1heWJlLCBvbmUgd2F5IHRvIGF2b2lkICJzeW5jICYmIGVjaG8gMyIgaXMgaW50cm9kdWNpbmcg
YSBuZXcgaW9jdGwKaW50ZXJmYWNlIHRvIGhvbGQgaW5vZGUncyBwYXJlbnQgbG9jaywgYW5kIGNh
bGwgZF9pbnZhbGlkYXRlKGlub2RlX2RlbnRyeSkKdG8gZXZpY3QgdGhlIGlub2RlIHdoaWNoIGlz
IG5vdCBvcGVuZWQgYnkgYW55b25lLgoKPiAKPiAKPj4KPj4gICAgICAjIGYyZnNfaW8gd3JpdGUg
MSAwIDEgemVybyBidWZmZXJlZCAvZGF0YS90ZXN0ZmlsZV9yZWFkX3NlcQo+PiAgICAgIFdyaXR0
ZW4gNDA5NiBieXRlcyB3aXRoIHBhdHRlcm4gPSB6ZXJvLCB0b3RhbF90aW1lID0gMjkgdXMsIG1h
eF9sYXRlbmN5ID0gMjggdXMKPj4KPj4gICAgICAjIHJtIC9kYXRhL3Rlc3RmaWxlX3JlYWRfc2Vx
Cj4+Cj4+PiBIaSBZdSwgSSBmaW5kIGl0IGEgYml0IG9kZCB0byBwcmV2ZW50IHVuc2V0dGluZyBp
bW11dGFibGUgc29sZWx5Cj4+PiBiZWNhdXNlIGxhcmdlIGZvbGlvcyBhcmUgaW4gdXNlLiBJZiB1
bnNldHRpbmcgaW1tdXRhYmxlIGlzIGNvbnNpZGVyZWQKPj4+IHVuZXhwZWN0ZWQgYmVoYXZpb3Is
IGl0IHNob3VsZCBiZSBkaXNhbGxvd2VkIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlcgo+Pj4gbGFyZ2Ug
Zm9saW9zIGFyZSB1c2VkLCBhbmQgYXBwbHkgZXF1YWxseSBpbiBib3RoIGNhc2VzLgo+Pgo+PiBU
byBjb25maXJtLCB5b3UgbWVhbiBpZiBjbGVhcmluZyBpbW11dGFibGUgaXMgY29uc2lkZXJlZCB1
bmV4cGVjdGVkIGJlaGF2aW9yLAo+PiB3ZSBuZWVkIHRvIHByZXZlbnQgY2xlYXJpbmcgaW1tdXRh
YmxlIGZvciBpbm9kZSB3aGljaCBkb2Vzbid0IGVuYWJsZSBsYXJnZSBmb2xpbz8KPiAKPiBSaWdo
dC4gSXQgZmVlbHMgdW5mYWlyIHRvIHByZXZlbnQgY2xlYXJpbmcgaW1tdXRhYmxlIHNvbGVseSBi
ZWNhdXNlCj4gdGhlIGZpbGUgaGFwcGVucyB0byBoYXZlIGxhcmdlIGZvbGlvcy4KPiAKPj4KPj4+
Cj4+PiBJJ20gbm90IHN1cmUgd2hldGhlciByZXZlcnRpbmcgdGhlIGxhcmdlIGZvbGlvcyBzZXR0
aW5nIGlzIHRoZQo+Pj4gYmV0dGVyIGFwcHJvYWNoOgo+Pj4gdHJ1bmNhdGVfcGFnZWNhY2hlKGlu
b2RlLCBpbm9kZS0+aV9zaXplKTsKPj4+IG1hcHBpbmdfc2V0X2ZvbGlvX29yZGVyX3JhbmdlKGlu
b2RlLT5pX21hcHBpbmcsIDAsIDApOwo+Pgo+PiBJZiB3ZSB3YW50IHRvIHN1cHBvcnQgcmV2ZXJ0
aW5nIHRoZSBsYXJnZSBmb2xpb3Mgc2V0dGluZyBkeW5hbWljYWxseSBhcyB5b3UKPj4gcHJvcG9z
ZWQgYWJvdmUsIGl0IG5lZWQgdG8gY29uc2lkZXIgbW9yZSByYWNlIGNhc2UgYW5kIGNvcm5lciBj
YXNlLCBzbywgYQo+PiBsaXR0bGUgYml0IGNvbXBsaWNhdGVkLgo+IAo+IFJpZ2h0LiBUaGUgaWRl
YSBpcyB0byB0cnVuY2F0ZSB0aGUgcGFnZSBjYWNoZSB2aWEKPiB0cnVuY2F0ZV9wYWdlY2FjaGUo
aW5vZGUsIDApIGFuZCBzZXQgdGhlIG1heGltdW0gcGFnZS1jYWNoZSBvcmRlcgo+IHRvIDAuIFRo
YXQgc2FpZCwgd2Ugc3RpbGwgbmVlZCB0byBjb25zaWRlciB3aGV0aGVyIGFueSByZWxhdGVkCj4g
bG9ja3MgYXJlIGhlbGQuCj4gCj4gIEZyb20gdGhlIGNvbW1lbnQsIGl0IHNlZW1zIHRoYXQgd2Ug
bWF5IG5lZWQgdG8gaG9sZCBpX3J3c2VtIGFuZAo+IGludmFsaWRhdGVfbG9jay4KCncvIGFib3Zl
IGxvY2tzLCBpdCBzZWVtcyB0aGVyZSBpcyBzdGlsbCBhIHJhY2UgY29uZGl0aW9uIGFzIGJlbG93
OgoKZjJmc19maWxlYXR0cl9zZXQJCQkJcmVhZAogIC0gZjJmc19zZXRmbGFnc19jb21tb24KICAg
LSB0cnVuY2F0ZV9wYWdlY2FjaGUKCQkJCQkJLSBmMmZzX3JlYWRfZGF0YV9sYXJnZV9mb2xpbwoJ
CQkJCQk6IHJlYWQgbGFyZ2UgZm9saW9zCiAgIC0gbWFwcGluZ19zZXRfZm9saW9fb3JkZXJfcmFu
Z2UKClRoYW5rcywKCj4gCj4gLyoqCj4gICAqIHRydW5jYXRlX2lub2RlX3BhZ2VzIC0gdHJ1bmNh
dGUgKmFsbCogdGhlIHBhZ2VzIGZyb20gYW4gb2Zmc2V0Cj4gICAqIEBtYXBwaW5nOiBtYXBwaW5n
IHRvIHRydW5jYXRlCj4gICAqIEBsc3RhcnQ6IG9mZnNldCBmcm9tIHdoaWNoIHRvIHRydW5jYXRl
Cj4gICAqCj4gICAqIENhbGxlZCB1bmRlciAoYW5kIHNlcmlhbGlzZWQgYnkpIGlub2RlLT5pX3J3
c2VtIGFuZAo+ICAgKiBtYXBwaW5nLT5pbnZhbGlkYXRlX2xvY2suCj4gICAqCj4gICAqIC4uLgo+
ICAgKi8KPiB2b2lkIHRydW5jYXRlX2lub2RlX3BhZ2VzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLCBsb2ZmX3QgbHN0YXJ0KQo+IHsKPiAgICAgICAgICB0cnVuY2F0ZV9pbm9kZV9wYWdl
c19yYW5nZShtYXBwaW5nLCBsc3RhcnQsIChsb2ZmX3QpLTEpOwo+IH0KPiBFWFBPUlRfU1lNQk9M
KHRydW5jYXRlX2lub2RlX3BhZ2VzKTsKPiAKPiAKPiBJZiBjbGVhcmluZyBpbW11dGFibGUgaXMg
aW5kZWVkIHJhcmUsIHdlIG1heSBsZWF2ZSB0aGlzIGFzIGlzLCBzaW5jZQo+IHdyaXRlcyBhcmUg
bm90IHN1cHBvcnRlZCB1bnRpbCB0aGUgcGFnZSBjYWNoZSBpcyBmdWxseSBkcm9wcGVkLgo+IEV2
ZW50dWFsbHksIHdlIHdpbGwgc3VwcG9ydCBsYXJnZSBmb2xpb3Mgb24gbm9uLWltbXV0YWJsZSBm
aWxlcy4KPiAKPiBUaGFua3MKPiBCYXJyeQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
