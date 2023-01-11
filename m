Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFCE6651FC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 03:48:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFR9n-0007MY-9o;
	Wed, 11 Jan 2023 02:48:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhuqiandann@gmail.com>) id 1pFR9m-0007MG-Dx
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 02:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ocEkMtRJ8bZ/SWiwwRdpx68LT7h2+7yKYSWkWdMvGTw=; b=AXUICpVIM4JCl0D3xBPffNvOzZ
 hQ71BsBJivKacjmfq6Jr7NxUIY9KUQzOZt+CzdZO5GrFZwq4mOEOJKyxASk9vbfXAusbrdQfm2UqT
 Mt5b/dLScEb0LiLvDuqFe2qiZBNGyjacOKScaWtMvkNDG6uH175WiFWtF8AZ/xzh/Ts8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ocEkMtRJ8bZ/SWiwwRdpx68LT7h2+7yKYSWkWdMvGTw=; b=Wn4qsMmBlRYy4F3RnfQyWrrTVY
 IgLh8KUX1rAC0MuuvlRc3r36CjTFtnOP4y0niLipveZvCpgS2pSnum3yA+l/GisFUONMNHIqF08Cb
 ff7EXRfqaqs88cQA4+bLfZ1xYsPgMnCzDE5/5D3Gk4FXZ8cGmqDvLF+xpuu8iEnWb8wk=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pFR9k-00DUjk-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 02:48:01 +0000
Received: by mail-lf1-f41.google.com with SMTP id f34so21402003lfv.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jan 2023 18:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocEkMtRJ8bZ/SWiwwRdpx68LT7h2+7yKYSWkWdMvGTw=;
 b=CRt7yf14lf0nBZZVSZRFJBJ/YEmjkYS9W/Ftrg6T7dTeP6S8wr6L6rJZn2mNypA2AM
 V45kHPS5Oac4sWjCGxD/RzPE1AC4Lwh2WCvVQgd2O60mYyGGcK3ISbe4GtCeGogCEb6G
 qEV5qsc9JIbZbnKhWalras7vZv6JN36C5iS1TIvY6M9cSOX9fomQUjx6x8LsIcgR7ycT
 fvEVRZv2V9e6JZsUsDLrSGVzTW7dxSfz2ta1xbUtKu+pTZgpm4jCb8zD5mvYoJV78hEk
 MU6a8mEitzfwVeASdISoDUKUYBk3cBFeNK8/0+LGRW8A0hJwSw7oduPfidruiRdUrqRJ
 oSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ocEkMtRJ8bZ/SWiwwRdpx68LT7h2+7yKYSWkWdMvGTw=;
 b=FhL5exbWeRNTFOa1fCicTiQHY8RN8fAX0bKRlHsgsdVdUXmJTZIpW26WTaM156A4WP
 6zi3hz1HydMwSRIOkYrg91OeZXWGvb5D9NkBXOtG51DFdK1NIeiQuIUpOCvWWwAh1cim
 zvzW1RFv9ufT3vbpA1u99EY54CF41QRrA4W8lDf3C1bKJ9pQTXEzA7wvlkFn/o4om6hi
 vsKMSDnF5/usjyrj5gFrEZErVYU0K55ePI9YmOP6jO69kd6YjSyDQCVLHyYDWdvuN0w6
 ZRL2ZV/8h/q1HBZNVcVNCPw8Wio7M5LGVgu2Y+3V7AZwCC1i6PIYOU0jw1Equ+lN5rKF
 4p0g==
X-Gm-Message-State: AFqh2kovjw9fgSrBVP/Im/Rh5CrJZCaFerC2UVNuzDmQA0daQIbzkNOM
 uEh7Bu2K5P9AyZfPC8khq/l9QBPbxmiT0P/2CUA=
X-Google-Smtp-Source: AMrXdXsrH2ZAKAxl1stn92+zRoWzo3vjL1Qc8NMyezVHHLS1v36bTeMq9g1Z7uwA5WET+fnkvfWpfYOy8Vf6UAt8feI=
X-Received: by 2002:a05:6512:406:b0:4cb:114:ff66 with SMTP id
 u6-20020a056512040600b004cb0114ff66mr2516067lfk.422.1673405274185; Tue, 10
 Jan 2023 18:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
 <Y5OYYJYx9G2LbRmc@google.com>
 <20221212122109.GA714122@mi-ThinkStation-K> <Y5ezpOwd8sOTTaW5@google.com>
 <20221213022100.GA841758@mi-ThinkStation-K>
 <CAHDnOD7W0eo-ZMU8nXsPhXrxbpR3U+kooTVaTU8VL67QHbYH3A@mail.gmail.com>
 <Y7TkjnSbHnDj76qd@google.com>
In-Reply-To: <Y7TkjnSbHnDj76qd@google.com>
From: zhou dan <zhuqiandann@gmail.com>
Date: Wed, 11 Jan 2023 10:47:17 +0800
Message-ID: <CAHDnOD4wNVc_XKBi2qyi3oNRENidf4mSYCCTYYxCofy=iqc=Zg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, chao@kernel.org
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Android S, after the app is installed,
 it will judge whether
 the file is allowed to be compressed and release it. In the case of
 compress_mode=user, 
 the file is not compressed at this point, causin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [zhuqiandann[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFR9k-00DUjk-N7
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file
 is not compressed
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
Cc: zhoudan8@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gQW5kcm9pZCBTLCBhZnRlciB0aGUgYXBwIGlzIGluc3RhbGxlZCwgaXQgd2lsbCBqdWRnZSB3
aGV0aGVyIHRoZSBmaWxlCmlzIGFsbG93ZWQgdG8gYmUgY29tcHJlc3NlZCBhbmQgcmVsZWFzZSBp
dC4gSW4gdGhlIGNhc2Ugb2YgY29tcHJlc3NfbW9kZT11c2VyLAp0aGUgZmlsZSBpcyBub3QgY29t
cHJlc3NlZCBhdCB0aGlzIHBvaW50LCBjYXVzaW5nIEVWTkFMIHRvIGJlIHJldHVybmVkIG9uCnN1
YnNlcXVlbnQgZXhlY3V0aW9ucyB0byByZWxlYXNlLgpJbiB0aGUgbWV0aG9kICdpc0NvbXByZXNz
aW9uQWxsb3dlZCcsIHRoZXJlIGlzIGFsc28gc3VjaCBhIG5vdGljZToiTk9URToKVGhlIHJldHVy
biB2YWx1ZSBkb2VzIG5vdCBtZWFuIGlmIHRoZSBnaXZlbiBmaWxlLCBvciBhbnkgb3RoZXIgZmls
ZSBvbgp0aGUgc2FtZSBmaWxlIHN5c3RlbSwgaXMgYWN0dWFsbHkgY29tcHJlc3NlZC4gSXQgbWVy
ZWx5IGRldGVybWluZXMgd2hldGhlcgpub3QgZmlsZXMgPGVtPm1heTwvZW0+IGJlIGNvbXByZXNz
ZWQuIgoKT24gV2VkLCBKYW4gNCwgMjAyMyBhdCAxMDoyOSBBTSBKYWVnZXVrIEtpbSA8amFlZ2V1
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDEyLzE2LCB6aG91IGRhbiB3cm90ZToKPiA+IEhp
LCBhYm91dCB0aGlzIHBhdGNoLCBJIGhhdmVuJ3QgcmVjZWl2ZWQgYW55IHJlcGx5IHJlY2VudGx5
Lgo+ID4gTWF5YmUgeW91IGhhdmUgc29tZSBuZXcgaWRlYXMgdG8gc29sdmUgdGhpcyBwcm9ibGVt
Pwo+Cj4gQ291bGQgeW91IHBsZWFzZSBkZXNjcmliZSB0aGUgZXhhY3QgZmxvdyB0aGF0IHlvdSdy
ZSBzdWZmZXJpbmcgZnJvbT8KPgo+ID4KPiA+Cj4gPiB6aG91ZGFuIDx6aHVxaWFuZGFubkBnbWFp
bC5jb20+IOS6jjIwMjLlubQxMuaciDEz5pel5ZGo5LqMIDEwOjIx5YaZ6YGT77yaCj4gPiA+Cj4g
PiA+IEhvd2V2ZXIsICdmMmZzX2NvbXByZXNzZWRfZmlsZSgpJyBvbmx5IGRldGVybWluZXMgd2hl
dGhlciB0aGUgZmlsZSBjYW4KPiA+ID4gYmUgY29tcHJlc3NlZCwgbm90IHdoZXRoZXIgdGhlIGZp
bGUgaGFzIGJlZW4gY29tcHJlc3NlZC4gQXMgZmFyIGFzIEkKPiA+ID4ga25vdywgd2hlbiBjb21w
cmVzc19tb2RlIGlzIHVzZXIsIGZpbGVzIG1hcmtlZCBGSV9DT01QUkVTU0VEX0ZJTEUKPiA+ID4g
d2lsbCBiZSBjb21wcmVzc2VkIG9ubHkgYWZ0ZXIgJ2YyZnNfaW9jX2NvbXByZXNzX2ZpbGUoKScg
aXMgY2FsbGVkLgo+ID4gPiBPbiBNb24sIERlYyAxMiwgMjAyMiBhdCAwMzowNTowOFBNIC0wODAw
LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+ID4gPiBPbiAxMi8xMiwgemhvdWRhbiB3cm90ZToKPiA+
ID4gPiA+IE1heWJlIEknbSBub3QgZGVzY3JpYmluZyBpdCBjbGVhcmx5IGVub3VnaCwgYnV0IEkg
dGhpbmsgdGhlcmUgaXMKPiA+ID4gPiA+IHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBsb2dpYyBo
ZXJlLlRoZSAnZjJmc19yZWxlYXNlX2NvbXByZXNzX2Jsb2NrcycKPiA+ID4gPiA+IG1ldGhvZCBk
b2VzIG5vdCBkZXRlcm1pbmUgaWYgdGhlIGZpbGUgaXMgY29tcHJlc3NlZCwgYnV0IHNpbXBseSBh
ZGRzCj4gPiA+ID4gPiB0aGUgRklfQ09NUFJFU1NfUkVMRUFTRUQgZmxhZy4KPiA+ID4gPgo+ID4g
PiA+IEkgZmlyc3RseSBsb3N0IHlvdXIgcG9pbnQgc2luY2UgZjJmc19yZWxlYXNlX2NvbXByZXNz
X2Jsb2NrcygpIGNoZWNrZWQKPiA+ID4gPiBmMmZzX2NvbXByZXNzZWRfZmlsZSgpLgo+ID4gPiA+
Cj4gPiA+ID4gPiBJbiBwYXJ0aWN1bGFyLCBpbiB0aGUgY3VycmVudCBBbmRyb2lkIHN5c3RlbSwg
d2hlbiB0aGUgYXBwbGljYXRpb24gaXMKPiA+ID4gPiA+IGluc3RhbGxlZCwgdGhlIHJlbGVhc2Ug
aW50ZXJmYWNlIGlzIGNhbGxlZCBieSBkZWZhdWx0IHRvIHJlbGVhc2UgdGhlCj4gPiA+ID4gPiBz
dG9yYWdlIG1hcmtlZCBhcyBjb21wcmVzc2VkLCAgd2l0aG91dCBjaGVja2luZyB3aGV0aGVyIHRo
ZSBmaWxlIGlzCj4gPiA+ID4gPiBhY3R1YWxseSBjb21wcmVzc2VkLiBJbiB0aGlzIGNhc2UsIHdo
ZW4gY29tcHJlc3NfbW9kZSBpcyBzZXQgdG8gdXNlciwKPiA+ID4gPiA+IGNhbGxpbmcgdGhlIGNv
bXByZXNzIGludGVyZmFjZSByZXR1cm5zIEVOVkFMIGFuZCB0aGUgZmlsZSBjYW5ub3QgYmUKPiA+
ID4gPiA+IGNvbXByZXNzZWQuCj4gPiA+ID4gPiBTbyBJIHRoaW5rIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiByZWxlYXNlIG5lZWRzIHRvIGJlIG1vZGlmaWVkLCBhbmQKPiA+ID4gPiA+IG9ubHkgc2V0
IEZJX0NPTVBSRVNTX1JFTEVBU0VEIHdoZW4gaXQncyByZWFsbHkgY29tcHJlc3NlZCBhbmQgdGhl
Cj4gPiA+ID4gPiBzdG9yYWdlIGlzIHJlbGVhc2VkLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIEZy
aSwgRGVjIDA5LCAyMDIyIGF0IDEyOjE5OjQ0UE0gLTA4MDAsIEphZWdldWsgS2ltIHdyb3RlOgo+
ID4gPiA+ID4gPiBPbiAxMi8wOCwgemhvdWRhbjggd3JvdGU6Cj4gPiA+ID4gPiA+ID4gSW4gY29t
cHJlc3NfbW9kZT11c2VyLCBmMmZzX3JlbGVhc2VfY29tcHJlc3NfYmxvY2tzKCkKPiA+ID4gPiA+
ID4gPiAgZG9lcyBub3QgdmVyaWZ5IHdoZXRoZXIgaXQgaGFzIGJlZW4gY29tcHJlc3NlZCBhbmQK
PiA+ID4gPiA+ID4gPiAgc2V0cyBGSV9DT01QUkVTU19SRUxFQVNFRCBkaXJlY3RseS4gd2hpY2gg
d2lsbCBsZWFkIHRvCj4gPiA+ID4gPiA+ID4gcmV0dXJuIC1FSU5WQUwgYWZ0ZXIgY2FsbGluZyBj
b21wcmVzcy4KPiA+ID4gPiA+ID4gPiBUbyBmaXggaXQsbGV0J3MgZG8gbm90IHNldCBGSV9DT01Q
UkVTU19SRUxFQVNFRCBpZiBmaWxlCj4gPiA+ID4gPiA+ID4gaXMgbm90IGNvbXByZXNzZWQuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IERvIHlvdSBtZWFuIHlvdSB3YW50IHRvIGF2b2lkIEVJTlZB
TCBvbiBhIGZpbGUgaGF2aW5nIEZJX0NPTVBSRVNTX1JFTEVBU0VECj4gPiA+ID4gPiA+IHdpdGgg
emVybyBpX2NvbXByX2Jsb2tjcz8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGluayB0aGUg
Y3VycmVudCBsb2dpYyBpcyBnaXZpbmcgdGhlIGVycm9yIG9uIGEgcmVsZWFzZWQgZmlsZSBhbHJl
YWR5Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogemhvdWRhbjggPHpob3VkYW44QHhpYW9taS5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+
ID4gPiA+ID4gIGZzL2YyZnMvZmlsZS5jIHwgMyArLS0KPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiA+
ID4gPiA+ID4gPiBpbmRleCA4MmNkYTEyNTgyMjcuLmYzMjkxMDA3N2RmNiAxMDA2NDQKPiA+ID4g
PiA+ID4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gPiA+ID4gPiA+ICsrKyBiL2ZzL2YyZnMv
ZmlsZS5jCj4gPiA+ID4gPiA+ID4gQEAgLTM0NTEsMTQgKzM0NTEsMTMgQEAgc3RhdGljIGludCBm
MmZzX3JlbGVhc2VfY29tcHJlc3NfYmxvY2tzKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBs
b25nIGFyZykKPiA+ID4gPiA+ID4gPiAgICAgICAgIHJldCA9IGZpbGVtYXBfd3JpdGVfYW5kX3dh
aXRfcmFuZ2UoaW5vZGUtPmlfbWFwcGluZywgMCwgTExPTkdfTUFYKTsKPiA+ID4gPiA+ID4gPiAg
ICAgICAgIGlmIChyZXQpCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4gPiA+ID4gPiA+IC0KPiA+ID4gPiA+ID4gPiAtICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2Rl
LCBGSV9DT01QUkVTU19SRUxFQVNFRCk7Cj4gPiA+ID4gPiA+ID4gICAgICAgICBpbm9kZS0+aV9j
dGltZSA9IGN1cnJlbnRfdGltZShpbm9kZSk7Cj4gPiA+ID4gPiA+ID4gICAgICAgICBmMmZzX21h
cmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSwgdHJ1ZSk7Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiAgICAgICAgIGlmICghYXRvbWljX3JlYWQoJkYyRlNfSShpbm9kZSktPmlfY29tcHJfYmxv
Y2tzKSkKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiArICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9DT01QUkVT
U19SRUxFQVNFRCk7Cj4gPiA+ID4gPiA+ID4gICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJkYyRlNf
SShpbm9kZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiA+ID4gPiA+ID4gPiAgICAgICAgIGZpbGVt
YXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gPiAyLjM4LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
