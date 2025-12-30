Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E54CE8CC8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 07:42:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DnP4weI7ZKxGj8ePD7I1AoUIqvfsccqTf6764HICMg=; b=SkJYlPenKMXnsSCsJ/sxeqWP7l
	kzWjc+LvffVBetzOFlGKRzWftyJdC00Wvhz5Fepm6I875+Du33QmyX4H8xFrVBLx1UNG5Fcut7gmx
	U+JsZrq1s/ZWXDi4f+kT8xfJ+Csyp77DVx61rpF5LSLlOKyaUjgk369b4A8If4QDm+eU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaTR0-0003MZ-Bu;
	Tue, 30 Dec 2025 06:42:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaTQy-0003MS-HY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LLqLFhHgoOl45PFKUbKV3vFsd/Quypc3inPIi/oiLRA=; b=dh5JCKrzj6biAUS+0MA6VvkHPV
 0spoGCnV632W2AdxziCCTNypuxU4RMiNRbYEoZBsSfv/LvWDT2KpC/+tvUl/Er96luLgH314gwW2l
 7hGn3B+cuPykTYwpLpAws+IbT24XHzjXJRaw9ly+Rp0vFbRcjw91LqzBh7fZq44yuLTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LLqLFhHgoOl45PFKUbKV3vFsd/Quypc3inPIi/oiLRA=; b=P9eXQ2Lz43D9fDUfMRbFq6wQsx
 +eXf6/TyWk8HZCpnPDq7xfAjSb4ViiWf3vUwrAcb4tq9jo/6vSe5E6L36V1+2pn6g9V/KGTQUI2Uu
 O6k1daIokw4kzNA+NKbg0vQ1ZeOSx4LAxKUYkPaG9d5Oaq/93eTffzLqYArdFE0F6liQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaTQy-0008OY-08 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 06:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 96D374189C;
 Tue, 30 Dec 2025 06:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682A5C4CEFB;
 Tue, 30 Dec 2025 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767076929;
 bh=pjXUgoQDM3RBEC5OA4eTxHOJ17fkJNNn1nUs7WfAjAI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Sd5uLxZYkTKtjogSMmk1iOusTXuZ69BPxJsmNwkrHJ4tqUUzJngx+pJGukbX/xRna
 +9cU49oRXtrOvnf8gIL4pk+NgWSX/wIDLqOyWbfuudy2bTMSXGORuXGJYwL9QF8Veh
 wSe0Qs0nZeMbpFbpidxS0mDLBkc9w/4vaX0eNTXBc0XpLopuZ7+HpyfFqtewbhWTWC
 n2mb/qXSCxSNH+5FyhySSvatzyRkih+hWVNz8edL88Go4Xz1NIjYifOoLl25u+YHoj
 2yeLcgeSQGa4beOPORzipdlKU4Yg2OuQC2AOrDOzl2UPWsDmSNYqln0xNFrG1rYkMN
 xA+qcvrp60lRA==
Message-ID: <36698e50-2843-47d0-b0c4-2563cd0cfed8@kernel.org>
Date: Tue, 30 Dec 2025 14:42:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251226141111.119177-3-yangyongpeng.storage@gmail.com>
 <3bfe20b2-9f89-4bb9-9fbd-6ca2f780ad66@kernel.org>
 <SEZPR02MB5520184D1645593DF214428299B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB5520184D1645593DF214428299B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 1:21 PM, Yongpeng Yang wrote: > On 12/27/25
 9:42 AM, Chao Yu via Linux-f2fs-devel wrote: >> On 12/26/2025 10:11 PM,
 Yongpeng
 Yang wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaTQy-0008OY-08
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix IS_CHECKPOINTED flag
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjcvMjAyNSAxOjIxIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IE9uIDEyLzI3LzI1
IDk6NDIgQU0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDEyLzI2
LzIwMjUgMTA6MTEgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBGcm9tOiBZb25ncGVuZyBZ
YW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Cj4+PiBEdXJpbmcgU1BPIHRlc3RzLCB3
aGVuIG1vdW50aW5nIEYyRlMsIGFuIC1FSU5WQUwgZXJyb3Igd2FzIHJldHVybmVkIGZyb20KPj4+
IGYyZnNfcmVjb3Zlcl9pbm9kZV9wYWdlLiBUaGUgaXNzdWUgb2NjdXJyZWQgdW5kZXIgdGhlIGZv
bGxvd2luZyBzY2VuYXJpbwo+Pj4KPj4+IFRocmVhZCBBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRocmVhZCBC
Cj4+PiBmMmZzX2lvY19jb21taXRfYXRvbWljX3dyaXRlCj4+PiAgwqAgLSBmMmZzX2RvX3N5bmNf
ZmlsZSAvLyBhdG9taWMgPSB0cnVlCj4+PiAgwqDCoCAtIGYyZnNfZnN5bmNfbm9kZV9wYWdlcwo+
Pj4gIMKgwqDCoMKgIDogbGFzdF9mb2xpbyA9IGlub2RlIGZvbGlvCj4+PiAgwqDCoMKgwqAgOiBz
Y2hlZHVsZSBiZWZvcmUgZm9saW9fbG9jayhsYXN0X2ZvbGlvKSBmMmZzX3dyaXRlX2NoZWNrcG9p
bnQKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJsb2NrX29wZXJh
dGlvbnMvLwo+Pj4gd3JpdGViYWNrIGxhc3RfZm9saW8KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIHNjaGVkdWxlIGJlZm9yZQo+Pj4gZjJmc19mbHVzaF9uYXRfZW50
cmllcwo+Pj4gIMKgwqDCoMKgIDogc2V0X2ZzeW5jX21hcmsobGFzdF9mb2xpbywgMSkKPj4+ICDC
oMKgwqDCoCA6IHNldF9kZW50cnlfbWFyayhsYXN0X2ZvbGlvLCAxKQo+Pj4gIMKgwqDCoMKgIDog
Zm9saW9fbWFya19kaXJ0eShsYXN0X2ZvbGlvKQo+Pj4gIMKgwqDCoMKgIDogX193cml0ZV9ub2Rl
X2ZvbGlvKGxhc3RfZm9saW8pCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBmMmZzX2ZsdXNoX25hdF9lbnRyaWVzCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDoge3N0cnVjdCBuYXRfZW50cnl9LQo+Pj4+IGZsYWcgfD0gQklUKElT
X0NIRUNLUE9JTlRFRCkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BP
Cj4+Pgo+Pj4gVGhyZWFkIEEgY2FsbHMgZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vKSwg
YW5kIHRoZSBsYXN0X2ZvbGlvIGhhcwo+Pj4gYWxyZWFkeSBiZWVuIHdyaXR0ZW4gb25jZS4gSG93
ZXZlciwgdGhlIHtzdHJ1Y3QgbmF0X2VudHJ5fS0+ZmxhZyBkaWQgbm90Cj4+PiBoYXZlIHRoZSBJ
U19DSEVDS1BPSU5URUQgc2V0LCBjYXVzaW5nIHNldF9kZW50cnlfbWFyayhsYXN0X2ZvbGlvLCAx
KSBhbmQKPj4+IHdyaXRlIGxhc3RfZm9saW8gYWdhaW4uCj4+Pgo+Pj4gQWZ0ZXIgU1BPIGFuZCBy
ZWJvb3QsIGl0IHdhcyBkZXRlY3RlZCB0aGF0IHtzdHJ1Y3Qgbm9kZV9pbmZvfS0+YmxrX2FkZHIK
Pj4+IHdhcyBub3QgTlVMTF9BRERSIGJlY2F1c2UgVGhyZWFkIEIgc3VjY2Vzc2Z1bGx5IHdyaXRl
IHRoZSBjaGVja3BvaW50Lgo+Pj4KPj4+IFRoaXMgaXNzdWUgb25seSBvY2N1cnMgaW4gYXRvbWlj
IHdyaXRlIHNjZW5hcmlvcywgYW5kIGRvZXMgbm90IGFmZmVjdAo+Pj4gcmVndWxhciBmaWxlIGZz
eW5jIG9wZXJhdGlvbnMuIFRoZXJlZm9yZSwgZm9yIGF0b21pYyBmaWxlIGZzeW5jLAo+Pj4gc2Jp
LT5ub2RlX3dyaXRlIHNob3VsZCBiZSBhY3F1aXJlZCB0aHJvdWdoIF9fd3JpdGVfbm9kZV9mb2xp
byB0byBlbnN1cmUKPj4+IHRoYXQgdGhlIElTX0NIRUNLUE9JTlRFRCBmbGFnIGNvcnJlY3RseSBp
bmRpY2F0ZXMgdGhhdCB0aGUgY2hlY2twb2ludAo+Pj4gd3JpdGUgaGFzIGJlZW4gY29tcGxldGVk
Lgo+Pj4KPj4+IEZpeGVzOiA2MDg1MTRkZWJhMzggKCJmMmZzOiBzZXQgZnN5bmMgbWFyayBvbmx5
IGZvciB0aGUgbGFzdCBkbm9kZSIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxzaGVu
Z3lvbmcxQHhpYW9taS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKaW5iYW8gTGl1IDxsaXVqaW5i
YW8xQHhpYW9taS5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5nIDx5YW5neW9u
Z3BlbmdAeGlhb21pLmNvbT4KPj4+IC0tLQo+Pj4gdjI6Cj4+PiAtIHNldF9kZW50cnlfbWFyayBm
b3IgYXRvbWljIGZpbGUncyBsYXN0X2ZvbGlvIGluIF9fd3JpdGVfbm9kZV9mb2xpby4KPj4+IC0t
LQo+Pj4gIMKgIGZzL2YyZnMvbm9kZS5jIHwgMTQgKysrKysrKysrKy0tLS0KPj4+ICDCoCAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+Pj4gaW5kZXggNDgyYTM2
MmYyNjI1Li4yYzYxMDJiZWUzNDkgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+Pj4g
KysrIGIvZnMvZjJmcy9ub2RlLmMKPj4+IEBAIC0xNzc0LDggKzE3NzQsMTMgQEAgc3RhdGljIGJv
b2wgX193cml0ZV9ub2RlX2ZvbGlvKHN0cnVjdCBmb2xpbwo+Pj4gKmZvbGlvLCBib29sIGF0b21p
YywgYm9vbCAqc3VibWl0dGVkCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVkaXJ0eV9v
dXQ7Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiAtwqDCoMKgIGlmIChhdG9taWMgJiYgIXRlc3Rfb3B0
KHNiaSwgTk9CQVJSSUVSKSkKPj4+IC3CoMKgwqDCoMKgwqDCoCBmaW8ub3BfZmxhZ3MgfD0gUkVR
X1BSRUZMVVNIIHwgUkVRX0ZVQTsKPj4+ICvCoMKgwqAgaWYgKGF0b21pYykgewo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmICghdGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpKQo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZmlvLm9wX2ZsYWdzIHw9IFJFUV9QUkVGTFVTSCB8IFJFUV9GVUE7Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgaWYgKElTX0lOT0RFKGZvbGlvKSkKPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNldF9kZW50cnlfbWFyayhmb2xpbywKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vX29mX25vZGUoZm9saW8pKSk7
Cj4+PiArwqDCoMKgIH0KPj4+ICDCoMKgwqDCoMKgIC8qIHNob3VsZCBhZGQgdG8gZ2xvYmFsIGxp
c3QgYmVmb3JlIGNsZWFyaW5nIFBBR0VDQUNIRSBzdGF0dXMgKi8KPj4+ICDCoMKgwqDCoMKgIGlm
IChmMmZzX2luX3dhcm1fbm9kZV9saXN0KHNiaSwgZm9saW8pKSB7Cj4+PiBAQCAtMTkxNiw4ICsx
OTIxLDkgQEAgaW50IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+
PiAqc2JpLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsCj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEZJX0RJUlRZX0lOT0RFKSkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwZGF0ZV9pbm9kZShpbm9kZSwgZm9saW8pOwo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9kZW50cnlfbWFy
ayhmb2xpbywKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYyZnNfbmVlZF9kZW50cnlfbWFyayhzYmksIGlubykpOwo+Pgo+PiBXaGF0IGFib3V0ICFh
dG9taWMgY2FzZT8KPj4KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghYXRvbWljIHx8
IGZvbGlvID09IGxhc3RfZm9saW8pIHsKPj4KPiAKPiBGb3IgIWF0b21pYyBjYXNlLCBsYXN0X2Zv
bGlvIGlzIGFsd2F5cyBOVUxMLCBzbyB3ZSBkb24ndCBuZWVkIHRvCj4gY29uc2lkZXIgdGhhdC4K
Ckkgc2VlLCB3ZSBoYXZlIGNvbnNpZGVyZWQgIWF0b21pYyBjYXNlIGFzIGJlbG93OgoKaWYgKCFh
dG9taWMpCglzZXRfZGVudHJ5X21hcmsoZm9saW8sCgkJZjJmc19uZWVkX2RlbnRyeV9tYXJrKHNi
aSwgaW5vKSk7CgpUaGFua3MsCgo+IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+IAo+PiBUaGFua3Ms
Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFhdG9t
aWMpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
ZXRfZGVudHJ5X21hcmsoZm9saW8sCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbmVlZF9kZW50cnlfbWFyayhzYmksIGlubykp
Owo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF5IGJlIHdyaXR0ZW4gYnkgb3RoZXIgdGhy
ZWFkICovCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWZvbGlv
X3Rlc3RfZGlydHkoZm9saW8pKQo+Pgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4gCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
