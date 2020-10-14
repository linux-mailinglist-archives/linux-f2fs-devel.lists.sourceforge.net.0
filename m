Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A421228D873
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Oct 2020 04:28:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kSWWE-0006PI-Fr; Wed, 14 Oct 2020 02:27:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kSWWC-0006P6-51
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 02:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qDBAWibsVMpL9uDkJTD6UsuRe4btwTbpHEP5BT5fyh4=; b=MpKTkwLSJ/f5O4SUs4ra8bePdn
 nORKPtyB1OoblooTovePoBZ6quI4cpMjEK4Bf8I+c8Ga4VdJSiOOqEEuX4MSH/Pe3SJm4RcRNpczz
 EyjeSPpLPEsuL+jN4XjjJg6gA0237p8Jn23ROehnBrfnJlUR5LmLBWoijpdxtqc/Z/Gk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qDBAWibsVMpL9uDkJTD6UsuRe4btwTbpHEP5BT5fyh4=; b=hvJfiXri+re1qBQNdH3GkCr0e0
 +hLjZYzahXzekmapnH2zmHSmTBlLvSPEWXdC+hZefREJ0eP4ICddE8qBvjzujvzKAjFCD2gQFL9lw
 7zn1dkuK4cPgxwjiKESLApNn1vkiez52wjzseIJ2dZFf5H/N6F8FarBs7v4oCvdP8oqY=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kSWW4-00EG8v-26
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Oct 2020 02:27:55 +0000
Received: by mail-lj1-f193.google.com with SMTP id m16so1513207ljo.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Oct 2020 19:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qDBAWibsVMpL9uDkJTD6UsuRe4btwTbpHEP5BT5fyh4=;
 b=SIY5SpAHAN72HhJ/xUnnLQ8qiguN3XROjuCYGqZDhegyDOIuk5n1rAJdptUhOjAczb
 763QYE6+1ratG+ilSLA4Iqi2vdBJJdWGymz2znSjTU90zJZ9JS5p8dhLobzG7spmLVZT
 LVX6vJcVBBvEmI2UVnaz1FsbWRpa4JvN3bgOS30EvdXVzpji2alGacgIsS0375TqTn3n
 V8AREtecq+6+RbPkE8DCjt1JX94okEzrDICGX8gO3RSr8tonlTDvC4WZEG96mc5qI/Bl
 9G5QyMc3eBzI+h8/1V5wgvlwwkUQV9DQsb3LW8VZlC35s3Z3UiZQL5hyAe3FpVb82rt6
 EyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qDBAWibsVMpL9uDkJTD6UsuRe4btwTbpHEP5BT5fyh4=;
 b=OjiaZzqomO5g7zzRQQRgCyuWx9Z5rg95WmWwn+zddQ+bAdUJ5lC8kiUywz9LX1fu3c
 4TJa5PIZwIptWMgGytSysHJNWAdmgCCvj/L9PVk1IHkMWRE+l78rt4Lj3T55lSLt8/Vd
 fHtpOHJK1QHQUX/nQ+P19hVwhK1OT1IX2As5kPRb9sY3oNnYkSYAQo20wUaP5rGFkpXW
 VSFfYJnJ5za+fU7yGrO18soh9VfD/z+Uih4WzQTU2WGuJjpLLmb9yn1WKoy5vbDujID0
 FZamo/8AViKV6dVTgJLVrrWqzyKaf/jEARDEfebpU7hcXpt4Uz49T4IbHetRCN73OGJm
 Rpog==
X-Gm-Message-State: AOAM530wqdlcj+LX07OctKnOdZ3qhVxlJNSTjGl8StSdR9mbL53mXMmg
 Hyrhtx6OQGafz/Fwu6rBa+dcd/ghCxVB71rXNtg=
X-Google-Smtp-Source: ABdhPJyS3IRl6z4QTbEwQtI350xF9azP/uv0HbGKCKHNW9yiGO5w4R6/PDo8gvGZnhDbl+3AruygB/bfgFnqwMCU9TM=
X-Received: by 2002:a2e:b61a:: with SMTP id r26mr923956ljn.166.1602642461301; 
 Tue, 13 Oct 2020 19:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201013022429.454161-1-daeho43@gmail.com>
 <20201013022429.454161-2-daeho43@gmail.com>
 <20201013061150.GC1062@sol.localdomain>
In-Reply-To: <20201013061150.GC1062@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 14 Oct 2020 11:27:30 +0900
Message-ID: <CACOAw_y31yAu=AGAEqvyo2Ankt-ux80E6g6m_sWnz6LyUgBXSg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kSWW4-00EG8v-26
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
 ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBmMmZzX3JlYWRvbmx5KCkgaXMgcmVkdW5kYW50IHdpdGggbW50X3dhbnRfd3JpdGVfZmlsZSgp
Lgo+Cj4gQWxzbywgc2hvdWxkbid0IHRoaXMgcmVxdWlyZSBhIHdyaXRhYmxlIGZpbGUgZGVzY3Jp
cHRvcj8gIEFzLWlzLCB0aGlzIGlvY3RsIGNhbgo+IGJlIGNhbGxlZCBvbiBhIGZpbGUgb3duZWQg
YnkgYW5vdGhlciB1c2VyLCBhcyBsb25nIGFzIHRoZSBjYWxsZXIgaGFzIHJlYWQKPiBhY2Nlc3Mu
Cj4KPiBOb3RlOiBpZiB5b3UgY2hhbmdlIHRoaXMgdG8gcmVxdWlyZSBhIHdyaXRhYmxlIGZpbGUg
ZGVzY3JpcHRvciwgdGhlbgo+IGYyZnNfcmVhZG9ubHkoKSwgbW50X3dhbnRfd3JpdGVfZmlsZSgp
LCBhbmQgSVNfSU1NVVRBQkxFKCkgYWxsIHdvdWxkIG5vIGxvbmdlcgo+IGJlIG5lZWRlZC4KCkkg
YWdyZWUgdGhhdCBmMmZzX3JlYWRvbmx5KCkgaXMgcmVkdW5kYW50LgpCdXQsIHNvcnJ5LCBJIGRv
bid0IGdldCB0aGUgcmVzdC4gSSB0aG91Z2h0IG1udF93YW50X3dyaXRlX2ZpbGUoKSBpcyBhCndh
eSB0byBjaGVjayB3aGV0aGVyIHRoZSBjYWxsZXIgaGFzIGEgcHJvcGVyIHdyaXRlIHBlcm1pc3Np
b24gb3Igbm90LgpJIHRoaW5rIGp1c3QgdXNpbmcgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGlzIGVu
b3VnaCBmb3IgdGhpcyBpb2N0bC4gQW0KSSBtaXNzaW5nIHNvbWV0aGluZz8KCj4gV2hhdCBpZiBm
MmZzX2NvcHNbb3B0aW9ucy5hbGdvcml0aG1dID09IE5VTEwsIGUuZy4gQ09NUFJFU1NfTFo0IHdp
dGhvdXQKPiBDT05GSUdfRjJGU19GU19MWjQ/ICBTaG91bGRuJ3QgdGhlIGNhbGxlciBnZXQgYW4g
ZXJyb3IgdGhlbj8KCkdvb2QgcG9pbnQhCgo+IEkgZG9uJ3QgdGhpbmsgdGhlIGNoZWNrIGZvciBp
X3dyaXRlY291bnQgPT0gMSBhY2NvbXBsaXNoZXMgYW55dGhpbmcgYmVjYXVzZSBpdAo+IGp1c3Qg
bWVhbnMgdGhlcmUgYXJlIG5vICpvdGhlciogd3JpdGFibGUgZmlsZSBkZXNjcmlwdG9ycy4gIEl0
IGRvZXNuJ3QgbWVhbiB0aGF0Cj4gc29tZSBvdGhlciB0aHJlYWQgaXNuJ3QgY29uY3VycmVudGx5
IHRyeWluZyB0byB3cml0ZSB0byB0aGlzIHNhbWUgZmlsZQo+IGRlc2NyaXB0b3IuICBTbyB0aGUg
bG9jayBuZWVkcyB0byBiZSBlbm91Z2guICBJcyBpdD8KClRoaXMgaXMgdG8gZGV0ZWN0IGFueSBw
b3NzaWJpbGl0eSBvZiBvdGhlciB0aHJlYWRzIG1tYXAtaW5nIGFuZAp3cml0aW5nIHRoZSBmaWxl
LgpVc2luZyBvbmx5IGlub2RlIGxvY2sgaXMgbm90IGVub3VnaCB0byBwcmV2ZW50IHRoZW0gZnJv
bSBtYWtpbmcgZGlydHkgcGFnZXMuCgoKCjIwMjDrhYQgMTDsm5QgMTPsnbwgKO2ZlCkg7Jik7ZuE
IDM6MTEsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+
Cj4gT24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgMTE6MjQ6MjlBTSArMDkwMCwgRGFlaG8gSmVvbmcg
d3JvdGU6Cj4gPiArc3RhdGljIGludCBmMmZzX2lvY19zZXRfY29tcHJlc3Nfb3B0aW9uKHN0cnVj
dCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qg
aW5vZGUgKmlub2RlID0gZmlsZV9pbm9kZShmaWxwKTsKPiA+ICsgICAgIHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4gPiArICAgICBzdHJ1Y3QgZjJmc19jb21w
X29wdGlvbiBvcHRpb247Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKyAgICAgaW50IHdyaXRlY291
bnQ7Cj4gPiArCj4gPiArICAgICBpZiAoIWYyZnNfc2JfaGFzX2NvbXByZXNzaW9uKHNiaSkpCj4g
PiArICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICsKPiA+ICsgICAgIGlmICgh
ZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpIHx8IElTX0lNTVVUQUJMRShpbm9kZSkpCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgaWYgKGYyZnNfcmVh
ZG9ubHkoc2JpLT5zYikpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRVJPRlM7Cj4KCj4KPiA+
ICsKPiA+ICsgICAgIGlmIChjb3B5X2Zyb21fdXNlcigmb3B0aW9uLCAoc3RydWN0IGYyZnNfY29t
cF9vcHRpb24gX191c2VyICopYXJnLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZW9mKG9wdGlvbikpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiA+ICsK
PiA+ICsgICAgIGlmIChvcHRpb24ubG9nX2NsdXN0ZXJfc2l6ZSA8IE1JTl9DT01QUkVTU19MT0df
U0laRSB8fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG9wdGlvbi5sb2dfY2x1c3Rlcl9zaXpl
ID4gTUFYX0NPTVBSRVNTX0xPR19TSVpFIHx8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgb3B0
aW9uLmFsZ29yaXRobSA+PSBDT01QUkVTU19NQVgpCj4gPiArICAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+Cj4gV2hhdCBpZiBmMmZzX2NvcHNbb3B0aW9ucy5hbGdvcml0aG1dID09IE5VTEws
IGUuZy4gQ09NUFJFU1NfTFo0IHdpdGhvdXQKPiBDT05GSUdfRjJGU19GU19MWjQ/ICBTaG91bGRu
J3QgdGhlIGNhbGxlciBnZXQgYW4gZXJyb3IgdGhlbj8KPgo+ID4gKwo+ID4gKyAgICAgcmV0ID0g
bW50X3dhbnRfd3JpdGVfZmlsZShmaWxwKTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiA+
ICsKPiA+ICsgICAgIHdyaXRlY291bnQgPSBhdG9taWNfcmVhZCgmaW5vZGUtPmlfd3JpdGVjb3Vu
dCk7Cj4gPiArICAgICBpZiAoKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dSSVRFICYmIHdyaXRlY291
bnQgIT0gMSkgfHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAoIShmaWxwLT5mX21vZGUgJiBG
TU9ERV9XUklURSkgJiYgd3JpdGVjb3VudCkpIHsKPiA+ICsgICAgICAgICAgICAgcmV0ID0gLUVC
VVNZOwo+ID4gKyAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsgICAgIH0KPgo+IEkgZG9uJ3Qg
dGhpbmsgdGhlIGNoZWNrIGZvciBpX3dyaXRlY291bnQgPT0gMSBhY2NvbXBsaXNoZXMgYW55dGhp
bmcgYmVjYXVzZSBpdAo+IGp1c3QgbWVhbnMgdGhlcmUgYXJlIG5vICpvdGhlciogd3JpdGFibGUg
ZmlsZSBkZXNjcmlwdG9ycy4gIEl0IGRvZXNuJ3QgbWVhbiB0aGF0Cj4gc29tZSBvdGhlciB0aHJl
YWQgaXNuJ3QgY29uY3VycmVudGx5IHRyeWluZyB0byB3cml0ZSB0byB0aGlzIHNhbWUgZmlsZQo+
IGRlc2NyaXB0b3IuICBTbyB0aGUgbG9jayBuZWVkcyB0byBiZSBlbm91Z2guICBJcyBpdD8KPgo+
IC0gRXJpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
