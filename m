Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC7AD857C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 10:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh52QhprgAy1kKhUWqmtTM+uprTXpQVR2NQW7chMXNU=; b=gckrsvEiZDT69Ulyc+A2GTjJOy
	Dw0G26rdxYtTk0RksuHZEBCUUIz5a06+6+M2Rm698jybLGnpm1jT7Mth5qQOwr5KmItogDkwaqNjT
	eab0R92w/4B0T4RSSqOYxNrlj7u3zaOW4x3iaOFk9ECTIW3fKKZpy670SIyL6p0yr3pc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPzjq-0003iS-EE;
	Fri, 13 Jun 2025 08:26:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uPzjn-0003i6-HO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=; b=QfCtpQnKiQfVnZtiPLYVo4sD1K
 e3JwxOJGofXYT48C6F0Ie50sXu/PO0fmW2lpd6iQEkycM++a64dKk8ld463T+mD8XQPHwouBHVM/e
 ziGKkIxKnLd2HBaz1fE8IoFzKpOKFnto8SX4FEXPS+E0qgDkWIXIyPqfVdaOdYB2TxOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=; b=KAvk7ru23XsEfwqgGXeO9V/zBT
 K+1GZ/oukLg2MpAu6tQtmA+HUCzqTcRdUVPXrZw06ei0Hlj6fvkD/DwpfzxCW8PztHffB43k6KXA1
 7GOB7//3hyUR+BEHbg3Jyz8RWftCeM4/gMJfkG89ZQ7pzdOORKYoQ5CXVbAKrsZgl8K8=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPzjm-0001wi-Pu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 08:26:11 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-450cfb8b335so1605755e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Jun 2025 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749803159; x=1750407959; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=;
 b=Ehao2if3A3qrKEnGwk3EdFdlHVrZC7Y/BWDvtq3B4iG9/B+/JK/4oLxq/O5ryBITNz
 4oCFVoiOXMtCazVYEUqnYt3GZ1ggJEwdcSOzGBfFQ9ot2WQsSXsWgH/Gm6i9ngumPeXJ
 pjG/oALrFBBQaQ7QSpNWIY8k26xWl1Umru20m5FDf/9raIo3VgnUsazSWzKPlk4cLpPa
 KMFXOtm6DDFJENXIw7YzYJGW6hPNiVp+BkX8/JJovzyCu/K9KDfdMkiqrYZZnkfuAj5d
 yfQwSVwC4Z+9ViMtuNZvvDbASKvznJ/7hxX4nPEiOkRoZnio1kv/v+8cuyE5g5be0vsP
 kk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749803159; x=1750407959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=;
 b=CPC+PYT3BdhmooRYzLMO1+XkwOTXhiffgf13HnUPMg7wBYTBI0+x3j/JPwaopqMnWA
 XYqYDYHqh9uXaX8CtlfbClkT4YB4pTTgzLQkIilmJVCWCa3wwyQzQFOXSy5DvCahDWfl
 1FPTMYrOx2WWfTYoU2aZ6vzQ8LXAPGc1Sy65ZsbykwHi5F/zTHnfQbDxY2NXaBcsaHP5
 9sV4C1V8vy2sAQkPn00bnc/1esuU8CLy93MSWQOuEJ5QxcISTvTjF1CMcTkxDIx5SFsu
 5hybYdvZH6ZTU7TEcIi7NgtyjpXu9ZBnAEw3PpEhkwh9msnpn9/kbYB/CfLiSyhg7jNp
 jaUg==
X-Gm-Message-State: AOJu0Yz2c/4D3a0BIAgMG0Mnn8oMNObE+Ba1J4KYERRs191jybxYTOXX
 VoNtbjk85QBusdgqi4yrF5OOfatTmlrujzhLlQHpFoBmuxEqMSBB6BNLjRNx2naTdF9kOb0B9b1
 u+qvzih//VKSY3Zb9Te3noF6jnF593PoS+/wG
X-Gm-Gg: ASbGnctjQ875N47+SzroG83f+ePCGVkX/3RCpEPidaA9Rx3fKogl5SqqrsII1uKJWD3
 K/CLZx4iD6AresLl2EuAhQh2VdVpz4IegGYYw31IyPdwXn3QNgHn4P7fQK2uUfSv7Nuuioco/Pp
 YpJd23dxfvp/PXv7ZImdRntLHQyP85jnJ0DxiwzRa6Gk4+
X-Google-Smtp-Source: AGHT+IGEecZKdUrI4TPXWcW0ROqZszFyPMmn7YKGv8m8nGY5NZX4FtUA3aY7KOWD8zMGZqMAmw0CdLNPjLgipDDD6mc=
X-Received: by 2002:a5d:5f8f:0:b0:3a4:d4a0:1315 with SMTP id
 ffacd0b85a97d-3a56869d570mr771547f8f.6.1749803158868; Fri, 13 Jun 2025
 01:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org>
 <20250612123444.1779509-1-wangzijie1@honor.com>
In-Reply-To: <20250612123444.1779509-1-wangzijie1@honor.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 13 Jun 2025 16:25:47 +0800
X-Gm-Features: AX0GCFsVSnrsE293JjoIJZ4IbML9sSsMb82uoVfJnJkHnNN0Qp0HRhEhyEf5fq0
Message-ID: <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
To: wangzijie <wangzijie1@honor.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  wangzijie 于2025年6月12日周四 20:38写道： > > > On
    6/12/25 11:27, wangzijie wrote: > > > Wu Bo once mentioned a fallocate fail
    scenario in this link[1]. > > > After commit 3fdd89b452c2("f2f [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.42 listed in wl.mailspike.net]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
X-Headers-End: 1uPzjm-0001wi-Pu
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section
 when gc happens EAGAIN
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
Cc: jaegeuk@kernel.org, bo.wu@vivo.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

d2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4g5LqOMjAyNeW5tDbmnIgxMuaXpeWRqOWb
myAyMDozOOWGmemBk++8mgo+Cj4gPiBPbiA2LzEyLzI1IDExOjI3LCB3YW5nemlqaWUgd3JvdGU6
Cj4gPiA+IFd1IEJvIG9uY2UgbWVudGlvbmVkIGEgZmFsbG9jYXRlIGZhaWwgc2NlbmFyaW8gaW4g
dGhpcyBsaW5rWzFdLgo+ID4gPiBBZnRlciBjb21taXQgM2ZkZDg5YjQ1MmMyKCJmMmZzOiBwcmV2
ZW50IHdyaXRpbmcgd2l0aG91dCBmYWxsb2NhdGUoKQo+ID4gPiBmb3IgcGlubmVkIGZpbGVzIiks
IHdlIGNhbm5vdCBkaXJlY3RseSBnZW5lcmF0ZSA0SyBzaXplIGZpbGUgYW5kCj4gPiA+IHBpbiBp
dCwgYnV0IHdlIGNhbiBzdGlsbCBnZW5lcmF0ZSBub24tc2VnbWVudCBhbGlnbmVkIHBpbm5lZCBm
aWxlOgo+ID4gPgo+ID4gPiB0b3VjaCB0ZXN0X2ZpbGUKPiA+ID4gLi9mMmZzX2lvIHBpbmZpbGUg
c2V0IHRlc3RfZmlsZQo+ID4gPiAuL2YyZnNfaW8gZmFsbG9jYXRlIDAgMCA4MTkyIHRlc3RfZmls
ZQo+ID4gPiB0cnVuY2F0ZSAtcyA0MDk2IHRlc3RfZmlsZQo+ID4KPiA+IFdlbGwsIHNob3VsZG4n
dCB3ZSBhdm9pZCBzdWNoIGNhc2UgYnkgYWRkaW5nIGNoZWNrIGNvbmRpdGlvbiBpbiBzZXRhdHRy
Pwo+Cj4gTWF5YmUgbGlrZSB0aGlzPwo+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmls
ZS5jIGIvZnMvZjJmcy9maWxlLmMKPiBpbmRleCA2YmQzZGU2NGYuLjJmNjUzN2Q5YyAxMDA2NDQK
PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4gQEAgLTEwMjcs
NiArMTAyNyw4IEBAIGludCBmMmZzX3NldGF0dHIoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0
cnVjdCBkZW50cnkgKmRlbnRyeSwKPiAgICAgICAgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBkX2lu
b2RlKGRlbnRyeSk7Cj4gICAgICAgICBzdHJ1Y3QgZjJmc19pbm9kZV9pbmZvICpmaSA9IEYyRlNf
SShpbm9kZSk7Cj4gICAgICAgICBpbnQgZXJyOwo+ICsgICAgICAgc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKPiArICAgICAgIGJsb2NrX3Qgc2VjX2Jsa3MgPSBD
QVBfQkxLU19QRVJfU0VDKHNiaSk7Cj4KPiAgICAgICAgIGlmICh1bmxpa2VseShmMmZzX2NwX2Vy
cm9yKEYyRlNfSV9TQihpbm9kZSkpKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87Cj4g
QEAgLTEwNDcsNiArMTA0OSwxMSBAQCBpbnQgZjJmc19zZXRhdHRyKHN0cnVjdCBtbnRfaWRtYXAg
KmlkbWFwLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
IUlTX0FMSUdORUQoYXR0ci0+aWFfc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICBGMkZT
X0JMS19UT19CWVRFUyhmaS0+aV9jbHVzdGVyX3NpemUpKSkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgaWYgKGYyZnNfaXNfcGlubmVk
X2ZpbGUoaW5vZGUpICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXR0ci0+aWFfc2l6ZSA8
IGlfc2l6ZV9yZWFkKGlub2RlKSAmJgo+ICsgICAgICAgICAgICAgICAgICAgICAgICFJU19BTElH
TkVEKGF0dHItPmlhX3NpemUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgRjJGU19CTEtfVE9f
QllURVMoc2VjX2Jsa3MpKSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7CkhpIENoYW8gYW5kIHppamllLApFeGN1c2UgbWUgLEknbSBhIGJpdCBjb25mdXNlZCBhYm91
dCB0aGlzOgp3aGVuIGEgcGluIGZpbGUgc2l6ZSBpcyBub3QgYWxpbmdlZCB3aXRoIHNpemUgb2Yg
InNlY3Rpb24iLCBpdCBjYW4gbm90CmJlIHRydW5jYXRlZD8KdGhhbmtz77yBCj4gICAgICAgICB9
Cj4KPiAgICAgICAgIGVyciA9IHNldGF0dHJfcHJlcGFyZShpZG1hcCwgZGVudHJ5LCBhdHRyKTsK
PiAtLS0KPgo+ID4gPgo+ID4gPiBCeSBkb2luZyB0aGlzLCBwaW4rZmFsbG9jYXRlIGZhaWx1cmUo
Z2MgaGFwcGVucyBFQUdBSU4gYnV0IGYyZnMgc2hvd3MKPiA+ID4gZW5vdWdoIHNwYXJlIHNwYWNl
KSBtYXkgb2NjdXJzLgo+ID4gPgo+ID4gPiBGcm9tIG1lc3NhZ2UgaW4gY29tbWl0IDJlNDJiN2Y4
MTdhYygiZjJmczogc3RvcCBhbGxvY2F0aW5nIHBpbm5lZCBzZWN0aW9ucwo+ID4gPiBpZiBFQUdB
SU4gaGFwcGVucyIpLCBnYyBFQUdBSU4gZG9lc24ndCBndWFyYW50ZWUgYSBmcmVlIHNlY3Rpb24s
IHNvIHdlIHN0b3AKPiA+ID4gYWxsb2NhdGluZy4gQnV0IGFmdGVyIGNvbW1pdCA0OGVhOGIyMDA0
MTQgKCJmMmZzOiBmaXggdG8gYXZvaWQgcGFuaWMgb25jZQo+ID4gPiBmYWxsb2NhdGlvbiBmYWls
cyBmb3IgcGluZmlsZSIpLCB3ZSBoYXZlIGEgd2F5IHRvIGF2b2lkIHBhbmljIGNhdXNlZCBieQo+
ID4gPiBjb25jdXJyZW50IHBpbmZpbGUgYWxsb2NhdGlvbiBydW4gb3V0IG9mIGZyZWUgc2VjdGlv
biwgc28gSSB0aGluayB0aGF0IHdlCj4gPiA+IGNhbiBjb250aW51ZSB0byBhbGxvY2F0ZSBwaW5u
ZWQgc2VjdGlvbiB3aGVuIGdjIGhhcHBlbnMgRUFHQUlOLiBFdmVuIGlmIHdlCj4gPiA+IGRvbid0
IGhhdmUgZnJlZSBzZWN0aW9uLCBmMmZzX2FsbG9jYXRlX3Bpbm5pbmdfc2VjdGlvbigpIGNhbiBm
YWlsIHdpdGggRU5PU1BDLgo+ID4KPiA+IFdoYXQgZG8geW91IHRoaW5rIG9mIGludHJvZHVjZSAv
c3lzL2ZzL2YyZnMvPGRldj4vcmVzZXJ2ZWRfcGluX3NlY3Rpb24gdG8KPiA+IHR1bmUgQG5lZWRl
ZCBwYXJhbWV0ZXIgb2YgaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNzKCk/IElmIHdlIGNvbmZpZ3Vy
ZSBpdAo+ID4gdy8gemVybywgaXQgY2FuIGF2b2lkIGYyZnNfZ2MoKSBiZWZvcmUgcHJlYWxsb2Nh
dGlvbi4KPiA+Cj4gPiAtLS0KPiA+ICBmcy9mMmZzL2YyZnMuaCAgfCAzICsrKwo+ID4gIGZzL2Yy
ZnMvZmlsZS5jICB8IDUgKystLS0KPiA+ICBmcy9mMmZzL3N1cGVyLmMgfCAzICsrKwo+ID4gIGZz
L2YyZnMvc3lzZnMuYyB8IDkgKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Yy
ZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCA3ODU1Mzc1NzZhYTguLmZmYjE1ZGE1NzBk
NyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZzL2YyZnMu
aAo+ID4gQEAgLTE3MzEsNiArMTczMSw5IEBAIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+ID4gICAg
ICAgLyogZm9yIHNraXAgc3RhdGlzdGljICovCj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGxvbmcg
c2tpcHBlZF9nY19yd3NlbTsgICAgICAgICAgICAvKiBGR19HQyBvbmx5ICovCj4gPgo+ID4gKyAg
ICAgLyogZnJlZSBzZWN0aW9ucyByZXNlcnZlZCBmb3IgcGlubmVkIGZpbGUgKi8KPiA+ICsgICAg
IHVuc2lnbmVkIGludCByZXNlcnZlZF9waW5fc2VjdGlvbjsKPiA+ICsKPiA+ICAgICAgIC8qIHRo
cmVzaG9sZCBmb3IgZ2MgdHJpYWxzIG9uIHBpbm5lZCBmaWxlcyAqLwo+ID4gICAgICAgdW5zaWdu
ZWQgc2hvcnQgZ2NfcGluX2ZpbGVfdGhyZXNob2xkOwo+ID4gICAgICAgc3RydWN0IGYyZnNfcndz
ZW0gcGluX3NlbTsKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmls
ZS5jCj4gPiBpbmRleCA2OTYxMzFlNjU1ZWQuLmE5MDlmNzlkYjE3OCAxMDA2NDQKPiA+IC0tLSBh
L2ZzL2YyZnMvZmlsZS5jCj4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTE4ODcsOSAr
MTg4Nyw4IEBAIHN0YXRpYyBpbnQgZjJmc19leHBhbmRfaW5vZGVfZGF0YShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICAg
ICAgICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgaWYgKGhhc19ub3RfZW5vdWdoX2Zy
ZWVfc2VjcyhzYmksIDAsIGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgPwo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIFpPTkVEX1BJTl9TRUNfUkVRVUlSRURfQ09VTlQgOgo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgIEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBvdmVycHJvdmlzaW9uX3NlZ21lbnRz
KHNiaSkpKSkgewo+ID4gKyAgICAgICAgICAgICBpZiAoaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNz
KHNiaSwgMCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+cmVzZXJ2ZWRf
cGluX3NlY3Rpb24pKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19kb3duX3dyaXRl
KCZzYmktPmdjX2xvY2spOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIHN0YXRfaW5jX2djX2Nh
bGxfY291bnQoc2JpLCBGT1JFR1JPVU5EKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBlcnIg
PSBmMmZzX2djKHNiaSwgJmdjX2NvbnRyb2wpOwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3Vw
ZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4gaW5kZXggNTdhZGVmZjVlZjI1Li40OGI5N2E5NWZk
NjMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3Vw
ZXIuYwo+ID4gQEAgLTQ5NzUsNiArNDk3NSw5IEBAIHN0YXRpYyBpbnQgZjJmc19maWxsX3N1cGVy
KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiA+ICAgICAg
IHNiaS0+bGFzdF92YWxpZF9ibG9ja19jb3VudCA9IHNiaS0+dG90YWxfdmFsaWRfYmxvY2tfY291
bnQ7Cj4gPiAgICAgICBzYmktPnJlc2VydmVkX2Jsb2NrcyA9IDA7Cj4gPiAgICAgICBzYmktPmN1
cnJlbnRfcmVzZXJ2ZWRfYmxvY2tzID0gMDsKPiA+ICsgICAgIHNiaS0+cmVzZXJ2ZWRfcGluX3Nl
Y3Rpb24gPSBmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpID8KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBaT05FRF9QSU5fU0VDX1JFUVVJUkVEX0NPVU5UIDoKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBHRVRfU0VDX0ZST01fU0VHKHNiaSwgb3ZlcnByb3Zpc2lvbl9zZWdtZW50cyhzYmkpKTsK
PiA+ICAgICAgIGxpbWl0X3Jlc2VydmVfcm9vdChzYmkpOwo+ID4gICAgICAgYWRqdXN0X3VudXNh
YmxlX2NhcF9wZXJjKHNiaSk7Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBi
L2ZzL2YyZnMvc3lzZnMuYwo+ID4gaW5kZXggNzUxMzRkNjlhMGJkLi41MWJlN2ZmYjM4YzUgMTAw
NjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiA+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+
ID4gQEAgLTgyNCw2ICs4MjQsMTMgQEAgc3RhdGljIHNzaXplX3QgX19zYmlfc3RvcmUoc3RydWN0
IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGNvdW50Owo+ID4gICAgICAg
fQo+ID4KPiA+ICsgICAgIGlmICghc3RyY21wKGEtPmF0dHIubmFtZSwgInJlc2VydmVkX3Bpbl9z
ZWN0aW9uIikpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKHQgPiBHRVRfU0VDX0ZST01fU0VHKHNi
aSwgb3ZlcnByb3Zpc2lvbl9zZWdtZW50cyhzYmkpKSkKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICAgKnVpID0gKHVuc2lnbmVkIGludCl0
Owo+ID4gKyAgICAgICAgICAgICByZXR1cm4gY291bnQ7Cj4gPiArICAgICB9Cj4gPiArCj4gPiAg
ICAgICAqdWkgPSAodW5zaWduZWQgaW50KXQ7Cj4gPgo+ID4gICAgICAgcmV0dXJuIGNvdW50Owo+
ID4gQEAgLTExMzAsNiArMTEzNyw3IEBAIEYyRlNfU0JJX0dFTkVSQUxfUk9fQVRUUih1bnVzYWJs
ZV9ibG9ja3NfcGVyX3NlYyk7Cj4gPiAgRjJGU19TQklfR0VORVJBTF9SV19BVFRSKGJsa3pvbmVf
YWxsb2NfcG9saWN5KTsKPiA+ICAjZW5kaWYKPiA+ICBGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIo
Y2FydmVfb3V0KTsKPiA+ICtGMkZTX1NCSV9HRU5FUkFMX1JXX0FUVFIocmVzZXJ2ZWRfcGluX3Nl
Y3Rpb24pOwo+ID4KPiA+ICAvKiBTVEFUX0lORk8gQVRUUiAqLwo+ID4gICNpZmRlZiBDT05GSUdf
RjJGU19TVEFUX0ZTCj4gPiBAQCAtMTMyMyw2ICsxMzMxLDcgQEAgc3RhdGljIHN0cnVjdCBhdHRy
aWJ1dGUgKmYyZnNfYXR0cnNbXSA9IHsKPiA+ICAgICAgIEFUVFJfTElTVChsYXN0X2FnZV93ZWln
aHQpLAo+ID4gICAgICAgQVRUUl9MSVNUKG1heF9yZWFkX2V4dGVudF9jb3VudCksCj4gPiAgICAg
ICBBVFRSX0xJU1QoY2FydmVfb3V0KSwKPiA+ICsgICAgIEFUVFJfTElTVChyZXNlcnZlZF9waW5f
c2VjdGlvbiksCj4gPiAgICAgICBOVUxMLAo+ID4gIH07Cj4gPiAgQVRUUklCVVRFX0dST1VQUyhm
MmZzKTsKPiA+IC0tCj4gPiAyLjQ5LjAKPgo+IEkgdGhpbmsgaXQncyBhIGdvb2Qgd2F5IHRvIHNv
bHZlIHRoaXMgcHJvYmxlbS4gVGhhbmsgeW91IQo+Cj4KPiA+ID4KPiA+ID4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyMzEwMzAwOTQwMjQuMjYzNzA3LTEt
Ym8ud3VAdml2by5jb20vdC8jdQo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiB3YW5nemlqaWUg
PHdhbmd6aWppZTFAaG9ub3IuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGZzL2YyZnMvZmlsZS5jIHwg
MiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5j
Cj4gPiA+IGluZGV4IDZiZDNkZTY0Zi4uMDVjODBkMmI1IDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9m
MmZzL2ZpbGUuYwo+ID4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gPiBAQCAtMTg1OSw3ICsx
ODU5LDcgQEAgc3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgZjJmc19kb3du
X3dyaXRlKCZzYmktPmdjX2xvY2spOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgIHN0YXRfaW5j
X2djX2NhbGxfY291bnQoc2JpLCBGT1JFR1JPVU5EKTsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICBlcnIgPSBmMmZzX2djKHNiaSwgJmdjX2NvbnRyb2wpOwo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgIGlmIChlcnIgJiYgZXJyICE9IC1FTk9EQVRBKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgaWYgKGVyciAmJiBlcnIgIT0gLUVOT0RBVEEgJiYgZXJyICE9IC1FQUdBSU4pIHsKPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBfd3JpdGUoJnNiaS0+cGluX3NlbSk7
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9lcnI7Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgfQo+ID4KPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+
Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
