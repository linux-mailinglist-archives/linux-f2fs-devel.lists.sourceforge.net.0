Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C37FCF83F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 13:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEb32lmrPo1uGlOp8JR4iIc2yw+6odWQIJ+Nz36gsJA=; b=AmzJ8hbv59b2zmZTbbrXuIz43e
	cmqWy0Ilt9AGJ/4X6mDtwzR3lwTqN+WtGnvaf+fXCQzjOViwyLLMyiOaSmdk8JotwA6Y8nVXHJGpz
	QEBRk0KlesN8lf4mW9I0ZY9edxEpzRbhQeqJRR68ukLgn3pvmPgzHr8bijSvO0I9Uz2I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd5x2-0008Ur-NI;
	Tue, 06 Jan 2026 12:14:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vd5x0-0008Ud-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 12:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r1cKh9IM97PWYBkPhw6SwMvabm5jeUPgTNobmM4AGS0=; b=F38yyxW/cQgyXFg9Y+3iPJkEJw
 N0iVk3LMXWx9l+JkTb0CEqJXsO9EfAI83/dC+VKP5cw78l0BUYWyz3qooYym8SqEcjT7jPdJ3Kyaf
 49lDcbgwF9VRrLxROxdzaHkssWdWS1ZkvJrjFqoi8LzIhu1oa6LNU0Ptlk4xbeagKqQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1cKh9IM97PWYBkPhw6SwMvabm5jeUPgTNobmM4AGS0=; b=NOZ2HmVyn6EOqPiMzLxcZfE9LK
 IEfzxUlJShRUPs5nPsax948x5j/vc6ARCy+HCt/nZJWG5KhG3B/md6YU+CoKQ00PEgsVrska9u5gq
 5NNrRuOLfTTzqlvHHsmT6E/ZURayqp/xiok3zM6Uyh8byvCZm/UvveeSPMMDGtJ0w58M=;
Received: from smtp153-166.sina.com.cn ([61.135.153.166])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd5x0-0005P4-Hk for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 12:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767701654; bh=r1cKh9IM97PWYBkPhw6SwMvabm5jeUPgTNobmM4AGS0=;
 h=Message-ID:Date:Subject:From;
 b=fEXsR1/im1ZVNKIvfeCvVI+D5GA0CYQhK4Fzlr+AvkiF6XBYyivX1bYb0fsbCKPS3
 EI+zCB33fT4T4ND+Y4DHP1g10Xme+mFPl66cNHNeA+UUwonwWNPIV0VeRnHfHixpBw
 WhXOjoIz1+UBCJzvK1F4FJuvsyMK761MiZpOGX/0=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 695CFC8C00003B4A; Tue, 6 Jan 2026 20:14:05 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9111156685183
X-SMAIL-UIID: 85E16CC23070493C9B76A52CF6BB80FA-20260106-201405-1
Message-ID: <1cbf3f3a-b073-44e2-8204-933d8faa3f08@sina.com>
Date: Tue, 6 Jan 2026 20:14:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Yongpeng Yang
 <yangyongpeng.storage@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
 <56c2f3d8-51ca-4808-8224-52ec1e6b50cd@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <56c2f3d8-51ca-4808-8224-52ec1e6b50cd@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/6/26 16:19, Chao Yu via Linux-f2fs-devel wrote: > On
 12/30/2025 4:14 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> During
 SPO tests, when mounting F2FS, an -EINVAL error was returned fr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vd5x0-0005P4-Hk
Subject: Re: [f2fs-dev] [PATCH v4 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS82LzI2IDE2OjE5LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+IE9u
IDEyLzMwLzIwMjUgNDoxNCBQTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4gRnJvbTogWW9uZ3Bl
bmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Cj4+IER1cmluZyBTUE8gdGVzdHMs
IHdoZW4gbW91bnRpbmcgRjJGUywgYW4gLUVJTlZBTCBlcnJvciB3YXMgcmV0dXJuZWQgZnJvbQo+
PiBmMmZzX3JlY292ZXJfaW5vZGVfcGFnZS4gVGhlIGlzc3VlIG9jY3VycmVkIHVuZGVyIHRoZSBm
b2xsb3dpbmcgc2NlbmFyaW8KPj4KPj4gVGhyZWFkIEHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhyZWFkIEIK
Pj4gZjJmc19pb2NfY29tbWl0X2F0b21pY193cml0ZQo+PiDCoCAtIGYyZnNfZG9fc3luY19maWxl
IC8vIGF0b21pYyA9IHRydWUKPj4gwqDCoCAtIGYyZnNfZnN5bmNfbm9kZV9wYWdlcwo+PiDCoMKg
wqDCoCA6IGxhc3RfZm9saW8gPSBpbm9kZSBmb2xpbwo+PiDCoMKgwqDCoCA6IHNjaGVkdWxlIGJl
Zm9yZSBmb2xpb19sb2NrKGxhc3RfZm9saW8pIGYyZnNfd3JpdGVfY2hlY2twb2ludAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJsb2NrX29wZXJhdGlvbnMvLwo+PiB3
cml0ZWJhY2sgbGFzdF9mb2xpbwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIHNjaGVkdWxlIGJlZm9yZQo+PiBmMmZzX2ZsdXNoX25hdF9lbnRyaWVzCj4+IMKgwqDCoMKg
IDogc2V0X2ZzeW5jX21hcmsobGFzdF9mb2xpbywgMSkKPj4gwqDCoMKgwqAgOiBzZXRfZGVudHJ5
X21hcmsobGFzdF9mb2xpbywgMSkKPj4gwqDCoMKgwqAgOiBmb2xpb19tYXJrX2RpcnR5KGxhc3Rf
Zm9saW8pCj4+IMKgwqDCoMKgIC0gX193cml0ZV9ub2RlX2ZvbGlvKGxhc3RfZm9saW8pCj4+IMKg
wqDCoMKgwqDCoCA6IGYyZnNfZG93bl9yZWFkKCZzYmktPm5vZGVfd3JpdGUpLy9ibG9jawo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfZmx1c2hfbmF0X2VudHJp
ZXMKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDoge3N0cnVjdCBu
YXRfZW50cnl9LQo+PiA+ZmxhZyB8PSBCSVQoSVNfQ0hFQ0tQT0lOVEVEKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHVuYmxvY2tfb3BlcmF0aW9ucwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBmMmZzX3VwX3dyaXRlKCZzYmktCj4+
ID5ub2RlX3dyaXRlKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc193
cml0ZV9jaGVja3BvaW50Ly8KPj4gcmV0dXJuCj4+IMKgwqDCoMKgwqDCoCA6IGYyZnNfZG9fd3Jp
dGVfbm9kZV9wYWdlKCkKPj4gZjJmc19pb2NfY29tbWl0X2F0b21pY193cml0ZS8vcmV0dXJuCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUE8KPj4KPj4gVGhyZWFkIEEgY2Fs
bHMgZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vKSwgYW5kIHRoZSBsYXN0X2ZvbGlvIGhh
cwo+PiBhbHJlYWR5IGJlZW4gd3JpdHRlbiBvbmNlLiBIb3dldmVyLCB0aGUge3N0cnVjdCBuYXRf
ZW50cnl9LT5mbGFnIGRpZCBub3QKPj4gaGF2ZSB0aGUgSVNfQ0hFQ0tQT0lOVEVEIHNldCwgY2F1
c2luZyBzZXRfZGVudHJ5X21hcmsobGFzdF9mb2xpbywgMSkgYW5kCj4+IHdyaXRlIGxhc3RfZm9s
aW8gYWdhaW4gYWZ0ZXIgVGhyZWFkIEIgZmluaXNoZXMgZjJmc193cml0ZV9jaGVja3BvaW50Lgo+
Pgo+PiBBZnRlciBTUE8gYW5kIHJlYm9vdCwgaXQgd2FzIGRldGVjdGVkIHRoYXQge3N0cnVjdCBu
b2RlX2luZm99LT5ibGtfYWRkcgo+PiB3YXMgbm90IE5VTExfQUREUiBiZWNhdXNlIFRocmVhZCBC
IHN1Y2Nlc3NmdWxseSB3cml0ZSB0aGUgY2hlY2twb2ludC4KPj4KPj4gVGhpcyBpc3N1ZSBvbmx5
IG9jY3VycyBpbiBhdG9taWMgd3JpdGUgc2NlbmFyaW9zLiBGb3IgcmVndWxhciBmaWxlCj4+IGZz
eW5jIG9wZXJhdGlvbnMsIHRoZSBmb2xpbyBtdXN0IGJlIGRpcnR5LiBJZgo+PiBibG9ja19vcGVy
YXRpb25zLT5mMmZzX3N5bmNfbm9kZV9wYWdlcyBzdWNjZXNzZnVsbHkgc3VibWl0IHRoZSBmb2xp
bwo+PiB3cml0ZSwgdGhpcyBwYXRoIHdpbGwgbm90IGJlIGV4ZWN1dGVkLiBPdGhlcndpc2UsIHRo
ZQo+PiBmMmZzX3dyaXRlX2NoZWNrcG9pbnQgd2lsbCBuZWVkIHRvIHdhaXQgZm9yIHRoZSBmb2xp
byB3cml0ZSBzdWJtaXNzaW9uCj4+IHRvIGNvbXBsZXRlLCBhcyBzYmktPm5yX3BhZ2VzW0YyRlNf
RElSVFlfTk9ERVNdID4gMC4gVGhlcmVmb3JlLCB0aGUKPj4gc2l0dWF0aW9uIHdoZXJlIGYyZnNf
bmVlZF9kZW50cnlfbWFyayBjaGVja3MgdGhhdCB0aGUge3N0cnVjdAo+PiBuYXRfZW50cnl9LT5m
bGFnIC93byB0aGUgSVNfQ0hFQ0tQT0lOVEVEIGZsYWcsIGJ1dCB0aGUgZm9saW8gd3JpdGUgaGFz
Cj4+IGFscmVhZHkgYmVlbiBzdWJtaXR0ZWQsIHdpbGwgbm90IG9jY3VyLgo+Pgo+PiBUaGVyZWZv
cmUsIGZvciBhdG9taWMgZmlsZSBmc3luYywgc2JpLT5ub2RlX3dyaXRlIHNob3VsZCBiZSBhY3F1
aXJlZAo+PiB0aHJvdWdoIF9fd3JpdGVfbm9kZV9mb2xpbyB0byBlbnN1cmUgdGhhdCB0aGUgSVNf
Q0hFQ0tQT0lOVEVEIGZsYWcKPj4gY29ycmVjdGx5IGluZGljYXRlcyB0aGF0IHRoZSBjaGVja3Bv
aW50IHdyaXRlIGhhcyBiZWVuIGNvbXBsZXRlZC4KPj4KPj4gRml4ZXM6IDYwODUxNGRlYmEzOCAo
ImYyZnM6IHNldCBmc3luYyBtYXJrIG9ubHkgZm9yIHRoZSBsYXN0IGRub2RlIikKPiAKPiBPaCwg
bmVlZCBDYyBzdGFibGUgdGFnIHRvIG1ha2Ugc3VyZSB0aGUgcGF0Y2ggY2FuIGJlIGJhY2twb3J0
ZWQgdG8KPiBMVFMga2VybmVsLgo+IAo+IENjOiBzdGFibGVAa2VybmVsLm9yZwoKT0ssIEknbGwg
Q2MgdGhlIHN0YWJsZSBtYWlsbGluZyBsaXN0IGluIHY1IHBhdGNoLgoKVGhhbmtzCllvbmdwZW5n
LAoKPiAKPj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nMUB4aWFvbWkuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKaW5iYW8gTGl1IDxsaXVqaW5iYW8xQHhpYW9taS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+
PiAtLS0KPj4gdjQ6Cj4+IC0gQ2xhcmlmeSB3aGVuIHRoZSBsYXN0X2ZvbGlvIHdyaXRlIGNvbXBs
ZXRlcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4+IHYzOgo+PiAtIEFkZCBkZXRhaWxlZCBleHBs
YW5hdGlvbnMgZm9yIHdoeSBmc3luYyBvcGVyYXRpb25zIG9uIHJlZ3VsYXIgZmlsZXMgZG8KPj4g
bm90IGhpdCB0aGlzIGlzc3VlLgo+PiB2MjoKPj4gLSBJZiBhdG9taWMgaXMgdHJ1ZSwgc2V0X2Rl
bnRyeV9tYXJrIGluIF9fd3JpdGVfbm9kZV9mb2xpby4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvbm9k
ZS5jIHwgMTQgKysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBi
L2ZzL2YyZnMvbm9kZS5jCj4+IGluZGV4IDQ4MmEzNjJmMjYyNS4uMmM2MTAyYmVlMzQ5IDEwMDY0
NAo+PiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+PiBAQCAt
MTc3NCw4ICsxNzc0LDEzIEBAIHN0YXRpYyBib29sIF9fd3JpdGVfbm9kZV9mb2xpbyhzdHJ1Y3Qg
Zm9saW8KPj4gKmZvbGlvLCBib29sIGF0b21pYywgYm9vbCAqc3VibWl0dGVkCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIHJlZGlydHlfb3V0Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgLcKgwqDC
oCBpZiAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5PQkFSUklFUikpCj4+IC3CoMKgwqDCoMKg
wqDCoCBmaW8ub3BfZmxhZ3MgfD0gUkVRX1BSRUZMVVNIIHwgUkVRX0ZVQTsKPj4gK8KgwqDCoCBp
ZiAoYXRvbWljKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXRlc3Rfb3B0KHNiaSwgTk9CQVJS
SUVSKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlvLm9wX2ZsYWdzIHw9IFJFUV9QUkVG
TFVTSCB8IFJFUV9GVUE7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoSVNfSU5PREUoZm9saW8pKQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZGVudHJ5X21hcmsoZm9saW8sCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5v
X29mX25vZGUoZm9saW8pKSk7Cj4+ICvCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIC8qIHNob3Vs
ZCBhZGQgdG8gZ2xvYmFsIGxpc3QgYmVmb3JlIGNsZWFyaW5nIFBBR0VDQUNIRSBzdGF0dXMgKi8K
Pj4gwqDCoMKgwqDCoCBpZiAoZjJmc19pbl93YXJtX25vZGVfbGlzdChzYmksIGZvbGlvKSkgewo+
PiBAQCAtMTkxNiw4ICsxOTIxLDkgQEAgaW50IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvCj4+ICpzYmksIHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBGSV9ESVJUWV9JTk9ERSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfdXBkYXRlX2lub2RlKGlub2RlLCBm
b2xpbyk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZGVu
dHJ5X21hcmsoZm9saW8sCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGYyZnNfbmVlZF9kZW50cnlfbWFyayhzYmksIGlubykpOwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhdG9taWMpCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9kZW50cnlfbWFyayhmb2xp
bywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX25lZWRfZGVudHJ5X21hcmsoc2JpLCBpbm8pKTsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogbWF5IGJlIHdyaXR0ZW4gYnkgb3RoZXIgdGhyZWFkICovCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmb2xpb190ZXN0X2RpcnR5KGZvbGlvKSkKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
