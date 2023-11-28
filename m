Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD87FB1E6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 07:23:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7rUq-0007nX-Am;
	Tue, 28 Nov 2023 06:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7rUm-0007nO-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lw5uVCgD9Taaun1taHIguxczes1SBV0WvdTM3jUNVGA=; b=SpAa9sruimY+pjLEZIJBegF8mX
 BLAcQpcXPXkaGIRhDlspzUyFBa0qpQkrNMtqPGrRPiVejN7XPspwOwwaosknjIyGvREBpzduwpHrb
 cPROWVEcEkSElTWEzjEfJv/M6Xd4ovjYtF7Ja1uSPoxJ8Na0vhlr91LT7VSPLQB0U+ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lw5uVCgD9Taaun1taHIguxczes1SBV0WvdTM3jUNVGA=; b=IqnRAWLcdBgblVqWSiDjpHk7I5
 FzgFzL/d7qoT+OC7Gkmoxpiy+kzcKcdlPGkep2VEjEy9igjtCqOQ3IHSZrczjFTmTmzyEGxV46Hor
 83yyxx70cUPxtjZtgg1ykbzot+9n6Pnn0xMEMXcSsW0YY2g7XmdvNwZ9fJfHofpjnWmE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7rUi-0006yf-Qs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D46B7B80F98;
 Tue, 28 Nov 2023 06:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBD0C433C8;
 Tue, 28 Nov 2023 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701152563;
 bh=t5sDrTG1EJKhTRMw8UnnW33SR0iqgn47M/6dfufOzwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lKjAGk9Pubq8lOo9wuUlnV+fERNEnYW7irgo1HOlLwHCGNdaRkXmR4mGUOBpMUWDB
 mdCfyeEMDnsfXMWER7S7Zdb+DiIbiq10RO/fPrw0KFiMbvfO5RzBFR7ota7S/BOHU/
 0LhtXEN/PCppyv0XTV2LBMMRqx/mjp4aS/MLSSCXUpImVnNHHn9mE79h//8xTe4tZL
 LWfeEromkH0sXx1iw4Jcn67sMmRXgCsXuEAMAG2gtimXHkc+nxAIpB9qGUEQWaXFtw
 nR3jmm8Ugo2HWgNUlI6mP226+eBxVTkoDQV6UJfWNI6TtjK8kXZAJnFf2AkR1da6jg
 gG323YQhfrdDA==
Message-ID: <5d8726fc-e912-6954-3820-862eecff07b0@kernel.org>
Date: Tue, 28 Nov 2023 14:22:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
 <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
 <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/17 7:34, Wu Bo wrote: > On 2023/11/11 12:49, Chao
 Yu wrote: >> On 2023/11/8 21:48, Wu Bo wrote: >>> On 2023/11/7 22:39, Chao
 Yu wrote: >>>> On 2023/10/30 17:40, Wu Bo wrote: >>>>> If GC vic [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7rUi-0006yf-Qs
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8xMS8xNyA3OjM0LCBXdSBCbyB3cm90ZToKPiBPbiAyMDIzLzExLzExIDEyOjQ5LCBD
aGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIzLzExLzggMjE6NDgsIFd1IEJvIHdyb3RlOgo+Pj4gT24g
MjAyMy8xMS83IDIyOjM5LCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9uIDIwMjMvMTAvMzAgMTc6NDAs
IFd1IEJvIHdyb3RlOgo+Pj4+PiBJZiBHQyB2aWN0aW0gaGFzIHBpbm5lZCBibG9jaywgaXQgY2Fu
J3QgYmUgcmVjeWNsZWQuCj4+Pj4+IEFuZCBpZiBHQyBpcyBmb3JlZ3JvdW5kIHJ1bm5pbmcsIGFm
dGVyIG1hbnkgZmFpbHVyZSB0cnksIHRoZSBwaW5uZWQgZmlsZQo+Pj4+PiBpcyBleHBlY3RlZCB0
byBiZSBjbGVhciBwaW4gZmxhZy4gVG8gZW5hYmxlIHRoZSBzZWN0aW9uIGJlIHJlY3ljbGVkLgo+
Pj4+Pgo+Pj4+PiBCdXQgd2hlbiBmYWxsb2NhdGUgdHJpZ2dlciBGR19HQywgR0MgY2FuIG5ldmVy
IHJlY3ljbGUgdGhlIHBpbm5lZAo+Pj4+PiBzZWN0aW9uLiBCZWNhdXNlIEdDIHdpbGwgZ28gdG8g
c3RvcCBiZWZvcmUgdGhlIGZhaWx1cmUgdHJ5IG1lZXQgdGhlCj4+Pj4+IHRocmVzaG9sZDoKPj4+
Pj4gwqDCoMKgwqDCoGlmIChoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIHNlY19mcmVlZCwgMCkp
IHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWdjX2NvbnRyb2wtPm5vX2JnX2djICYmCj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b3RhbF9zZWNfZnJlZWQgPCBnY19jb250cm9s
LT5ucl9mcmVlX3NlY3MpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGdvX2dj
X21vcmU7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZ290byBzdG9wOwo+Pj4+PiDCoMKgwqDCoMKg
fQo+Pj4+Pgo+Pj4+PiBTbyB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2VyIEZHX0dDLCBhdCBsZWFzdCBy
ZWN5Y2xlIG9uZS4KPj4+Pgo+Pj4+IEhtbS4uLiBpdCBtYXkgYnJlYWsgcGluZmlsZSdzIHNlbWFu
dGljcyBhdCBsZWFzdCBvbiBvbmUgcGlubmVkIGZpbGU/Cj4+Pj4gSW4gdGhpcyBjYXNlLCBJIHBy
ZWZlciB0byBmYWlsIGZhbGxvY2F0ZSgpIHJhdGhlciB0aGFuIHVucGlubmluZyBmaWxlLAo+Pj4+
IGluIG9yZGVyIHRvIGF2b2lkIGxlYXZpbmcgaW52YWxpZCBMQkEgcmVmZXJlbmNlcyBvZiB1bnBp
bm5lZCBmaWxlIGhlbGQKPj4+PiBieSB1c2Vyc3BhY2UuCj4+Pgo+Pj4gQXMgZjJmcyBkZXNpZ25l
ZCBub3csIEZHX0dDIGlzIGFibGUgdG8gdW5waW4gdGhlIHBpbm5lZCBmaWxlLgo+Pj4KPj4+IGZh
bGxvY2F0ZSgpIHRyaWdnZXJlZCBGR19HQywgYnV0IGNhbid0IHJlY3ljbGUgc3BhY2UuwqAgSXQg
YnJlYWtzIHRoZQo+Pj4gZGVzaWduIGxvZ2ljIG9mIEZHX0dDLgo+Pgo+PiBZZXMsIGNvbnRyYWRp
Y3RvcmluZXNzIGV4aXN0cy4KPj4KPj4gSU1PLCB1bnBpbiBmaWxlIGJ5IEdDIGxvb2tzIG1vcmUg
ZGFuZ2Vyb3VzLCBpdCBtYXkgY2F1c2UgcG90ZW50aWFsIGRhdGEKPj4gY29ycnVwdGlvbiB3LyBi
ZWxvdyBjYXNlOgo+PiAxLiBhcHAgcGlucyBmaWxlICYgaG9sZHMgTEJBcyBvZiBkYXRhIGJsb2Nr
cy4KPj4gMi4gR0MgdW5waW5zIGZpbGUgYW5kIG1pZ3JhdGVzIGl0cyBkYXRhIHRvIG5ldyBMQkFz
Lgo+PiAzLiBvdGhlciBmaWxlIHJldXNlcyBwcmV2aW91cyBMQkFzLgo+PiA0LiBhcHAgcmVhZC93
cml0ZSBkYXRhIHZpYSBwcmV2aW91cyBMQkFzLgo+Pgo+PiBTbyBJIHN1Z2dlc3QgdG8gbm9ybWFs
aXplIHVzZSBvZiBwaW5maWxlIGFuZCBkbyBub3QgYWRkIG1vcmUgdW5waW4gY2FzZXMKPj4gaW4g
ZmlsZXN5c3RlbSBpbm5lciBwcm9jZXNzZXMuCj4+Cj4+Pgo+Pj4gVGhpcyBpc3N1ZSBpcyBoYXBw
ZW5lZCBpbiBBbmRyb2lkIE9UQSBzY2VuYXJpby7CoCBmYWxsb2NhdGUoKSBhbHdheXMKPj4+IHJl
dHVybiBmYWlsdXJlIGNhdXNlIE9UQSBmYWlsLgo+Pgo+PiBDYW4geW91IHBsZWFzZSBjaGVjayB3
aHkgb3RoZXIgcGlubmVkIGZpbGVzIHdlcmUgc28gZnJhZ21lbnRlZCB0aGF0IGYyZnNfZ2MoKQo+
PiBjYW4gbm90IHJlY3ljbGUgb25lIGZyZWUgc2VjdGlvbj8KPj4KPiBOb3QgYmVjYXVzZSBwaW5u
ZWQgZmlsZXMgd2VyZSBmcmFnbWVudGVkLCBidXQgaWYgdGhlIEdDIHZpY3RpbSBzZWN0aW9uIGhh
cyBvbmUgYmxvY2sgaXMgcGlubmVkIHdpbGwgY2F1c2UgdGhpcyBpc3N1ZS4KPiAKPiBJZiB0aGUg
c2VjdGlvbiBkb24ndCB1bnBpbiB0aGUgYmxvY2ssIGl0IGNhbid0IGJlIHJlY3ljbGVkLiBCdXQg
dGhlcmUgaXMgaGlnaCBjaGFuY2UgdGhhdCB0aGUgcGlubmVkIHNlY3Rpb24gd2lsbCBiZSBjaG9z
ZW4gbmV4dCB0aW1lIHVuZGVyIGYyZnMgY3VycmVudCB2aWN0aW0gc2VsZWN0aW9uIHN0cmF0ZWd5
Lgo+IAo+IFNvIGlmIHdlIHdhbnQgdG8gYXZvaWQgdW5waW4gZmlsZXMsIEkgdGhpbmsgY2hhbmdl
IHZpY3RpbSBzZWxlY3Rpb24gdG8gY29uc2lkZXJpbmcgcGlubmVkIGJsb2NrcyBjYW4gZml4IHRo
aXMgaXNzdWUuCgpPaCwgSSBnZXQgaXQuCgpIb3cgYWJvdXQgdGhpcz8KCmRpZmYgLS1naXQgYS9m
cy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCmluZGV4IDMyNWRhYjAxYTI5ZC4uM2ZiNTJk
ZWM1ZGY4IDEwMDY0NAotLS0gYS9mcy9mMmZzL2ZpbGUuYworKysgYi9mcy9mMmZzL2ZpbGUuYwpA
QCAtMTczMCw3ICsxNzMwLDEwIEBAIG5leHRfYWxsb2M6CiAgCQkJZjJmc19kb3duX3dyaXRlKCZz
YmktPmdjX2xvY2spOwogIAkJCXN0YXRfaW5jX2djX2NhbGxfY291bnQoc2JpLCBGT1JFR1JPVU5E
KTsKICAJCQllcnIgPSBmMmZzX2djKHNiaSwgJmdjX2NvbnRyb2wpOwotCQkJaWYgKGVyciAmJiBl
cnIgIT0gLUVOT0RBVEEpCisKKwkJCWlmIChlcnIgPT0gLUVBR0FJTikKKwkJCQlmMmZzX2JhbGFu
Y2VfZnMoc2JpLCB0cnVlKTsKKwkJCWVsc2UgaWYgKGVyciAmJiBlcnIgIT0gLUVOT0RBVEEpCiAg
CQkJCWdvdG8gb3V0X2VycjsKICAJCX0KCkhvd2V2ZXIsIHRoZSBjb2RlIHdvbid0IGZpeCBjb250
cmFkaWN0b3JpbmVzcyBpc3N1ZSwgYmVjYXVzZSB0aGUgcm9vdCBjYXVzZQppcyB3ZSBsZWZ0IGZy
YWdtZW50ZWQgcGlubmVkIGRhdGEgaW4gZmlsZXN5c3RlbSwgd2hpY2ggc2hvdWxkIGJlIGF2b2lk
ZWQgaW4KR0MtcmVsaWFuY2UgTEZTIGZpbGVzeWV0ZW0gYXMgbXVjaCBhcyBwb3NzaWJsZS4KClRo
YW5rcywKCj4gCj4+IFRoYW5rcywKPj4KPj4+Cj4+PiDCoCDCoEFuZCB0aGlzIGNvbW1pdCBjaGFu
Z2VkIHByZXZpb3VzIGJlaGF2aW9yIG9mIGZhbGxvY2F0ZSgpOgo+Pj4KPj4+IENvbW1pdCAyZTQy
YjdmODE3YWMgKCJmMmZzOiBzdG9wIGFsbG9jYXRpbmcgcGlubmVkIHNlY3Rpb25zIGlmIEVBR0FJ
Tgo+Pj4gaGFwcGVucyIpCj4+Pgo+Pj4gQmVmb3JlIHRoaXMgY29tbWl0LCBpZiBmYWxsb2NhdGUo
KSBtZWV0IHRoaXMgc2l0dWF0aW9uLCBpdCB3aWxsIHRyaWdnZXIKPj4+IEZHX0dDIHRvIHJlY3lj
bGUgcGlubmVkIHNwYWNlIGZpbmFsbHkuCj4+Pgo+Pj4gRkdfR0MgaXMgZXhwZWN0ZWQgdG8gcmVj
eWNsZSBwaW5uZWQgc3BhY2Ugd2hlbiB0aGVyZSBpcyBubyBtb3JlIGZyZWUKPj4+IHNwYWNlLsKg
IEFuZCB0aGlzIGlzIHRoZSByaWdodCB0aW1lIHRvIGRvIGl0IHdoZW4gZmFsbG9jYXRlKCkgbmVl
ZCBmcmVlCj4+PiBzcGFjZS4KPj4+Cj4+PiBJdCBpcyB3ZWlyZCB3aGVuIGYyZnMgc2hvd3MgZW5v
dWdoIHNwYXJlIHNwYWNlIGJ1dCBjYW4ndCBmYWxsb2NhdGUoKS4gU28KPj4+IEkgdGhpbmsgaXQg
c2hvdWxkIGJlIGZpeGVkLgo+Pj4KPj4+Pgo+Pj4+IFRob3VnaHRzPwo+Pj4+Cj4+Pj4gVGhhbmtz
LAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoaXMgaXNzdWUgY2FuIGJlIHJlcHJvZHVjZWQgYnkgZmlsbGlu
ZyBmMmZzIHNwYWNlIGFzIGZvbGxvd2luZyBsYXlvdXQuCj4+Pj4+IEV2ZXJ5IHNlZ21lbnQgaGFz
IG9uZSBibG9jayBpcyBwaW5uZWQ6Cj4+Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+PiB8
IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24KPj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+
Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2Vn
X24rMQo+Pj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4gLi4uCj4+Pj4+ICstKy0rLSst
Ky0rLSstLS0tLSstKwo+Pj4+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24rawo+Pj4+PiAr
LSstKy0rLSstKy0rLS0tLS0rLSsKPj4+Pj4KPj4+Pj4gQW5kIGZvbGxvd2luZyBhcmUgc3RlcHMg
dG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6Cj4+Pj4+IGRkIGlmPS9kZXYvemVybyBvZj0uL2YyZnNf
cGluLmltZyBicz0yTSBjb3VudD0xMDI0Cj4+Pj4+IG1rZnMuZjJmcyBmMmZzX3Bpbi5pbWcKPj4+
Pj4gbWtkaXIgZjJmcwo+Pj4+PiBtb3VudCBmMmZzX3Bpbi5pbWcgLi9mMmZzCj4+Pj4+IGNkIGYy
ZnMKPj4+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPS4vbGFyZ2VfcGFkZGluZyBicz0xTSBjb3VudD0x
NzYwCj4+Pj4+IC4vcGluX2ZpbGxpbmcuc2gKPj4+Pj4gcm0gcGFkZGluZyoKPj4+Pj4gc3luYwo+
Pj4+PiB0b3VjaCBmYWxsb2NhdGVfNDBtCj4+Pj4+IGYyZnNfaW8gcGluZmlsZSBzZXQgZmFsbG9j
YXRlXzQwbQo+Pj4+PiBmYWxsb2NhdGUgLWwgNDE5NDMwNDAgZmFsbG9jYXRlXzQwbQo+Pj4+Pgo+
Pj4+PiBmYWxsb2NhdGUgYWx3YXlzIGZhaWwgd2l0aCBFQUdBSU4gZXZlbiB0aGVyZSBoYXMgZW5v
dWdoIGZyZWUgc3BhY2UuCj4+Pj4+Cj4+Pj4+ICdwaW5fZmlsbGluZy5zaCcgaXM6Cj4+Pj4+IGNv
dW50PTEKPj4+Pj4gd2hpbGUgOgo+Pj4+PiBkbwo+Pj4+PiDCoMKgwqDCoMKgICMgZmlsbGluZyB0
aGUgc2VnIHNwYWNlCj4+Pj4+IMKgwqDCoMKgwqAgZm9yIGkgaW4gezEuLjUxMX06Cj4+Pj4+IMKg
wqDCoMKgwqAgZG8KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG5hbWU9cGFkZGluZ18kY291bnQt
JGkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gd3JpdGUgJG5hbWUKPj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRuYW1lIGJzPTRLIGNvdW50PTEgPiAv
ZGV2L251bGwgMj4mMQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgWyAkPyAtbmUgMCBdOyB0
aGVuCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhpdCAwCj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBmaQo+Pj4+PiDCoMKgwqDCoMKgIGRvbmUKPj4+Pj4gwqDCoMKg
wqDCoCBzeW5jCj4+Pj4+Cj4+Pj4+IMKgwqDCoMKgwqAgIyBwaW4gb25lIGJsb2NrIGluIGEgc2Vn
bWVudAo+Pj4+PiDCoMKgwqDCoMKgIG5hbWU9cGluX2ZpbGUkY291bnQKPj4+Pj4gwqDCoMKgwqDC
oCBkZCBpZj0vZGV2L3plcm8gb2Y9Li8kbmFtZSBicz00SyBjb3VudD0xID4gL2Rldi9udWxsIDI+
JjEKPj4+Pj4gwqDCoMKgwqDCoCBzeW5jCj4+Pj4+IMKgwqDCoMKgwqAgZjJmc19pbyBwaW5maWxl
IHNldCAkbmFtZQo+Pj4+PiDCoMKgwqDCoMKgIGNvdW50PSQoKCRjb3VudCArIDEpKQo+Pj4+PiBk
b25lCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFd1IEJvIDxiby53dUB2aXZvLmNvbT4KPj4+
Pj4gLS0tCj4+Pj4+IMKgwqAgZnMvZjJmcy9maWxlLmMgfCAyICstCj4+Pj4+IMKgwqAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+IGluZGV4IGNhNTkw
NDEyOWIxNi4uZThhMTM2MTY1NDNmIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+
Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiBAQCAtMTY5MCw3ICsxNjkwLDcgQEAgc3Rh
dGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZQo+Pj4+PiAqaW5vZGUs
IGxvZmZfdCBvZmZzZXQsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmluaXRf
Z2NfdHlwZSA9IEZHX0dDLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zaG91
bGRfbWlncmF0ZV9ibG9ja3MgPSBmYWxzZSwKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuZXJyX2djX3NraXBwZWQgPSB0cnVlLAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAubnJfZnJlZV9zZWNzID0gMCB9Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAubnJf
ZnJlZV9zZWNzID0gMSB9Owo+Pj4+PiDCoMKgwqDCoMKgwqAgcGdvZmZfdCBwZ19zdGFydCwgcGdf
ZW5kOwo+Pj4+PiDCoMKgwqDCoMKgwqAgbG9mZl90IG5ld19zaXplOwo+Pj4+PiDCoMKgwqDCoMKg
wqAgbG9mZl90IG9mZl9lbmQ7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
