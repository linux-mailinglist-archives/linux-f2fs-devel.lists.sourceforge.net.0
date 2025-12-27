Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EBFCDF347
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 02:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCNVyozv8JdIijeTQKSgQghwYwBqe0F5yYx/ie3BO6k=; b=GuBKYnrkwAOaX+dxpJXTd2xu+w
	3kz2rTcnNemXI0wAWb6FYmWl3TwFOcR4RCJj68mHlb6zbrg6758riVNr9WwIphoXbxQixVw5quxDS
	7S+GcsZ7XkJmnDT3aj+GKliE7AUe58W8uSWy9j3dMKDXm0PLhGFeM6a9lUtFinrqvkU0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZJI8-0000Hu-9F;
	Sat, 27 Dec 2025 01:40:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vZJI6-0000Ho-VQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A/VacIF/zXiSjFpYaiC7RgP7W+RSLZHGHUtEx4romF0=; b=g2c//Vm5hvOh062K2wxJLOtSiM
 LKN6rGbdUxWIDLkoSCxilBiu0CHnHPUQ5agMbLhnrwLliqvfkiDqyE0UESf27MsuK3KlMDhVag2co
 AfiPyHu3rEac9SnJTE19i1djV0F6Pmfi9zv4D69UB0UTyOKQ5PJGbAmYe3oF+4xzTeSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A/VacIF/zXiSjFpYaiC7RgP7W+RSLZHGHUtEx4romF0=; b=NWoDwnJH313PPZEbbwTvZFkwXr
 ZfLr/sVTCsFzPJES/A5RLlAO6pgpi8nhtoisIQALJ8RXSx3MoXlNSrW0DgYOKZAM6d6ia41rJwKa9
 PH0MAR8PeiPiE08PPJLf/YOLutUA+PeswOLloHYMca+LMnyesmtzSQV+rjaAX70qUr5M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZJI6-0001PV-CF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E654640342;
 Sat, 27 Dec 2025 01:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E729AC4CEF7;
 Sat, 27 Dec 2025 01:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766799611;
 bh=1oir5PdSCd1TcqOvgMOFu1ZchRfFE5AX/SdpNAPK+h4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FKeO8epxb9D/A+dmxqFkjxFhYMj3C4x/DvKV6FmwGnWTJ/9HLUWmwsf2g3lfPn1Os
 01tykMFgtd9s3QkAdJMrL0rBR2SU7scTNAN/ZfY4HxBtcDDQw24cv04r5hQBn79AUD
 0jdZH8iqr6qKp4EILmFWBTwNuhKLqTIccD5AHjA/8KFL2WUUHH8aTwkf3gxBeWjTFf
 uDH6rtgFgsP0VQe4a8hhDxts2rkrnTUQnv401hJiZOSgBz1/1bGR9xLyFHRcCjJWrD
 1mnHvtO/wycOofdiiMxK0fQafmgwMVT9XTgax7+sRjpZ9GCFOpIbvnwDMMysNwLn+f
 FstFiFwitHs9g==
Message-ID: <6e0d513e-b111-4693-a67c-b67a927601e6@kernel.org>
Date: Sat, 27 Dec 2025 09:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251224131634.3860115-2-yangyongpeng.storage@gmail.com>
 <c34d413c-755c-4248-8aab-c891577d4b21@kernel.org>
 <e67cb602-dbe5-4d5c-a148-69fdc23e43ef@gmail.com>
Content-Language: en-US
In-Reply-To: <e67cb602-dbe5-4d5c-a148-69fdc23e43ef@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/2025 9:22 PM, Yongpeng Yang wrote: > On 12/26/25
 10:23, Chao Yu via Linux-f2fs-devel wrote: >> On 12/24/2025 9:16 PM, Yongpeng
 Yang wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vZJI6-0001PV-CF
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix IS_CHECKPOINTED flag
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Sheng Yong <shengyong1@xiaomi.com>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjAyNSA5OjIyIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IE9uIDEyLzI2LzI1
IDEwOjIzLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAxMi8yNC8y
MDI1IDk6MTYgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBGcm9tOiBZb25ncGVuZyBZYW5n
IDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gTmljZSBjYXRjaCEKPj4KPj4+Cj4+PiBE
dXJpbmcgU1BPIHRlc3RzLCB3aGVuIG1vdW50aW5nIEYyRlMsIGFuIC1FSU5WQUwgZXJyb3Igd2Fz
IHJldHVybmVkIGZyb20KPj4+IGYyZnNfcmVjb3Zlcl9pbm9kZV9wYWdlLiBUaGUgaXNzdWUgb2Nj
dXJyZWQgdW5kZXIgdGhlIGZvbGxvd2luZyBzY2VuYXJpbwo+Pj4KPj4+IFRocmVhZCBBwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFRocmVhZCBCCj4+PiBmMmZzX2lvY19jb21taXRfYXRvbWljX3dyaXRlCj4+PiAg
wqAgLSBmMmZzX2RvX3N5bmNfZmlsZSAvLyBhdG9taWMgPSB0cnVlCj4+PiAgwqDCoCAtIGYyZnNf
ZnN5bmNfbm9kZV9wYWdlcwo+Pj4gIMKgwqDCoMKgIDogbGFzdF9mb2xpbyA9IGlub2RlIGZvbGlv
Cj4+PiAgwqDCoMKgwqAgOiBzY2hlZHVsZSBiZWZvcmUgZm9saW9fbG9jayhsYXN0X2ZvbGlvKSBm
MmZzX3dyaXRlX2NoZWNrcG9pbnQKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtIGJsb2NrX29wZXJhdGlvbnMvLwo+Pj4gd3JpdGViYWNrIGxhc3RfZm9saW8KPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHNjaGVkdWxlIGJlZm9yZQo+Pj4g
ZjJmc19mbHVzaF9uYXRfZW50cmllcwo+Pj4gIMKgwqDCoMKgIDogc2V0X2ZzeW5jX21hcmsobGFz
dF9mb2xpbywgMSkKPj4+ICDCoMKgwqDCoCA6IHNldF9kZW50cnlfbWFyayhsYXN0X2ZvbGlvLCAx
KQo+Pj4gIMKgwqDCoMKgIDogZm9saW9fbWFya19kaXJ0eShsYXN0X2ZvbGlvKQo+Pj4gIMKgwqDC
oMKgIDogX193cml0ZV9ub2RlX2ZvbGlvKGxhc3RfZm9saW8pCj4+Cj4+IFdoYXQgZG8geW91IHRo
aW5rIG9mIHJlbG9jYXRpbmcgc2V0X2ZzeW5jX21hcmsgJiBzZXRfZGVudHJ5X21hcmsgbG9naWMK
Pj4gaW50byBfX3dyaXRlX25vZGVfZm9saW8oKSwgc28gdGhhdCB3ZSBjYW4gY292ZXIgdGhlbSB3
LyBleGlzdGVkIC5ub2RlX3dyaXRlCj4+IGxvY2sgaW4gX193cml0ZV9ub2RlX2ZvbGlvKCksIGl0
IGNhbiBhdm9pZCBjaGVja3BvaW50IHJhY2luZyBhcyB3ZWxsLgo+IAo+IFllcywgdGhpcyBtYWtl
cyBtb3JlIHNlbnNlLiBJJ2xsIGZpeCB0aGlzIGluIHYyIHBhdGNoLgo+IAo+Pgo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19mbHVzaF9uYXRfZW50cmllcwo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IHtzdHJ1Y3QgbmF0
X2VudHJ5fS0KPj4+PiBmbGFnIHw9IEJJVChJU19DSEVDS1BPSU5URUQpCj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQTwo+Pj4KPj4+IFRocmVhZCBBIGNhbGxzIGYyZnNf
bmVlZF9kZW50cnlfbWFyayhzYmksIGlubyksIGFuZCB0aGUgbGFzdF9mb2xpbyBoYXMKPj4+IGFs
cmVhZHkgYmVlbiB3cml0dGVuIG9uY2UuIEhvd2V2ZXIsIHRoZSB7c3RydWN0IG5hdF9lbnRyeX0t
PmZsYWcgZGlkIG5vdAo+Pj4gaGF2ZSB0aGUgSVNfQ0hFQ0tQT0lOVEVEIHNldCwgY2F1c2luZyBz
ZXRfZGVudHJ5X21hcmsobGFzdF9mb2xpbywgMSkgYW5kCj4+PiB3cml0ZSBsYXN0X2ZvbGlvIGFn
YWluLgo+Pj4KPj4+IEFmdGVyIFNQTyBhbmQgcmVib290LCBpdCB3YXMgZGV0ZWN0ZWQgdGhhdCB7
c3RydWN0IG5vZGVfaW5mb30tPmJsa19hZGRyCj4+PiB3YXMgbm90IE5VTExfQUREUiBiZWNhdXNl
IFRocmVhZCBCIHN1Y2Nlc3NmdWxseSB3cml0ZSB0aGUgY2hlY2twb2ludC4KPj4+Cj4+PiBUaGlz
IGlzc3VlIG9ubHkgb2NjdXJzIGluIGF0b21pYyB3cml0ZSBzY2VuYXJpb3MsIGFuZCBkb2VzIG5v
dCBhZmZlY3QKPj4KPj4gSWYgYXRvbWljIGlzIGZhbHNlLCB3ZSB3aWxsIGVuY291bnRlciBzdWNo
IGlzc3VlIGFzIHdlbGw/IG9yIGFtIEkgbWlzc2luZwo+PiBzb21ldGhpbmc/Cj4gCj4gSW4gdGhl
IGNhc2Ugb2YgYXRvbWljIGlzIHRydWUsIHRoZSBmb2xpbyBtdXN0IGJlIG5vbi1kaXJ0eS4KPiBG
b3IgcmVndWxhciBmaWxlIGZzeW5jIG9wZXJhdGlvbnMsIHRoZSBmb2xpbyBtdXN0IGJlIGRpcnR5
LiBJZgo+IGJsb2NrX29wZXJhdGlvbnMtPmYyZnNfc3luY19ub2RlX3BhZ2VzIHN1Y2Nlc3NmdWxs
eSBzdWJtaXQgdGhlIGZvbGlvCj4gd3JpdGUsIHRoaXMgcGF0aCB3aWxsIG5vdCBiZSBleGVjdXRl
ZC4gT3RoZXJ3aXNlLCB0aGUKPiBmMmZzX3dyaXRlX2NoZWNrcG9pbnQgd2lsbCBuZWVkIHRvIHdh
aXQgZm9yIHRoZSBmb2xpbyB3cml0ZSBzdWJtaXNzaW9uCj4gdG8gY29tcGxldGUsIGFzIHNiaS0+
bnJfcGFnZXNbRjJGU19ESVJUWV9OT0RFU10gPiAwLiBUaGVyZWZvcmUsIHRoZQo+IHNpdHVhdGlv
biB3aGVyZSBmMmZzX25lZWRfZGVudHJ5X21hcmsgY2hlY2tzIHRoYXQgdGhlIHtzdHJ1Y3QKPiBu
YXRfZW50cnl9LT5mbGFnIGRvZXMgbm90IGhhdmUgdGhlIElTX0NIRUNLUE9JTlRFRCBmbGFnLCBi
dXQgdGhlIGZvbGlvCj4gd3JpdGUgaGFzIGFscmVhZHkgYmVlbiBzdWJtaXR0ZWQsIHdpbGwgbm90
IG9jY3VyLgoKSUlVQywgeW91IG1lYW4gb25seSBhdG9taWMgd3JpdGUgd2lsbCByZWRpcnR5IGxh
c3QgZm9saW8gYWZ0ZXIgYmxvY2tfb3BlcmF0aW9ucygpLAp0aGVuLCBzZXRfZGVudHJ5X21hcmso
KSBjYW4gcmFjZSB3LyBfX2ZsdXNoX25hdF9lbnRyeV9zZXQoKT8KCglpZiAoYXRvbWljICYmICFt
YXJrZWQpIHsKCQlmMmZzX2RlYnVnKHNiaSwgIlJldHJ5IHRvIHdyaXRlIGZzeW5jIG1hcms6IGlu
bz0ldSwgaWR4PSVseCIsCgkJCSAgIGlubywgbGFzdF9mb2xpby0+aW5kZXgpOwoJCWZvbGlvX2xv
Y2sobGFzdF9mb2xpbyk7CgkJZjJmc19mb2xpb193YWl0X3dyaXRlYmFjayhsYXN0X2ZvbGlvLCBO
T0RFLCB0cnVlLCB0cnVlKTsKCQlmb2xpb19tYXJrX2RpcnR5KGxhc3RfZm9saW8pOwoJCWZvbGlv
X3VubG9jayhsYXN0X2ZvbGlvKTsKCQlnb3RvIHJldHJ5OwoJfQoKSWYgdGhhdCdzIHdoYXQgeW91
IG1lYW4sIHBsZWFzZSBhZGQgdGhlc2UgZGV0YWlscyBpbnRvIGNvbW1pdCBtZXNzYWdlLgoKVGhh
bmtzLAoKPiAKPiBUaGFua3MKPiBZb25ncGVuZywKPiAKPj4KPj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFhdG9taWMgfHwgZm9saW8gPT0gbGFzdF9mb2xpbykgewo+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9mc3luY19tYXJrKGZvbGlvLCAxKTsKPj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZXJjcHVfY291bnRlcl9pbmMoJnNiaS0+cmZfbm9k
ZV9ibG9ja19jb3VudCk7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElT
X0lOT0RFKGZvbGlvKSkgewo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLAo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRklfRElSVFlfSU5PREUp
KQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZz
X3VwZGF0ZV9pbm9kZShpbm9kZSwgZm9saW8pOwo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2V0X2RlbnRyeV9tYXJrKGZvbGlvLAo+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX25lZWRfZGVudHJ5X21hcmsoc2Jp
LCBpbm8pKTsKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF5IGJlIHdyaXR0ZW4gYnkgb3RoZXIgdGhyZWFk
ICovCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmb2xpb190ZXN0X2Rp
cnR5KGZvbGlvKSkKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZv
bGlvX21hcmtfZGlydHkoZm9saW8pOwo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Cj4+
IFRoYW5rcywKPj4KPj4+IHJlZ3VsYXIgZmlsZSBmc3luYyBvcGVyYXRpb25zLiBUaGVyZWZvcmUs
IGZvciBhdG9taWMgZmlsZSBmc3luYywKPj4+IHNiaS0+Y3BfcndzZW0gc2hvdWxkIGJlIGFjcXVp
cmVkIHRvIGVuc3VyZSB0aGF0IHRoZSBJU19DSEVDS1BPSU5URUQgZmxhZwo+Pj4gY29ycmVjdGx5
IGluZGljYXRlcyB0aGF0IHRoZSBjaGVja3BvaW50IHdyaXRlIGhhcyBiZWVuIGNvbXBsZXRlZC4K
Pj4+Cj4+PiBGaXhlczogNjA4NTE0ZGViYTM4ICgiZjJmczogc2V0IGZzeW5jIG1hcmsgb25seSBm
b3IgdGhlIGxhc3QgZG5vZGUiKQo+Pj4gU2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5
b25nMUB4aWFvbWkuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lv
bmdwZW5nQHhpYW9taS5jb20+Cj4+PiAtLS0KPj4+ICDCoCBmcy9mMmZzL25vZGUuYyB8IDggKysr
KysrKy0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMK
Pj4+IGluZGV4IDQ4MmEzNjJmMjYyNS4uZTQ4MmEzODQ0NGYxIDEwMDY0NAo+Pj4gLS0tIGEvZnMv
ZjJmcy9ub2RlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+PiBAQCAtMTg1NCw3ICsxODU0
LDcgQEAgaW50IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+PiAq
c2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGZvbGlvX2Jh
dGNoIGZiYXRjaDsKPj4+ICDCoMKgwqDCoMKgIGludCByZXQgPSAwOwo+Pj4gIMKgwqDCoMKgwqAg
c3RydWN0IGZvbGlvICpsYXN0X2ZvbGlvID0gTlVMTDsKPj4+IC3CoMKgwqAgYm9vbCBtYXJrZWQg
PSBmYWxzZTsKPj4+ICvCoMKgwqAgYm9vbCBtYXJrZWQgPSBmYWxzZSwgbG9ja2VkID0gZmFsc2U7
Cj4+PiAgwqDCoMKgwqDCoCBuaWRfdCBpbm8gPSBpbm9kZS0+aV9pbm87Cj4+PiAgwqDCoMKgwqDC
oCBpbnQgbnJfZm9saW9zOwo+Pj4gIMKgwqDCoMKgwqAgaW50IG53cml0dGVuID0gMDsKPj4+IEBA
IC0xODg5LDYgKzE4ODksMTAgQEAgaW50IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJm
c19zYl9pbmZvCj4+PiAqc2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChpbm9fb2Zfbm9kZShmb2xpbykgIT0gaW5vKQo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+PiAgwqAgK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGF0b21pYyAmJiBmb2xpbyA9PSBsYXN0X2ZvbGlvKSB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbG9ja19vcChzYmkpOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2NrZWQgPSB0cnVlOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvbGlvX2xv
Y2soZm9saW8pOwo+Pj4gIMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2Vs
eSghaXNfbm9kZV9mb2xpbyhmb2xpbykpKSB7Cj4+PiBAQCAtMTk1OSw2ICsxOTYzLDggQEAgaW50
IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+PiAqc2JpLCBzdHJ1
Y3QgaW5vZGUgKmlub2RlLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJldHJ5Owo+Pj4g
IMKgwqDCoMKgwqAgfQo+Pj4gIMKgIG91dDoKPj4+ICvCoMKgwqAgaWYgKGxvY2tlZCkKPj4+ICvC
oMKgwqDCoMKgwqDCoCBmMmZzX3VubG9ja19vcChzYmkpOwo+Pj4gIMKgwqDCoMKgwqAgaWYgKG53
cml0dGVuKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGVf
Y29uZChzYmksIE5VTEwsIE5VTEwsIGlubywgTk9ERSk7Cj4+PiAgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+PiBMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
