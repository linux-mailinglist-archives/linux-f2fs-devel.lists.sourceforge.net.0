Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E7ACE8DC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 06:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bq+L3ZBC4HLEThdpodmHd1sh1ErWRcFI7S4SxVJMkU=; b=PnbJnePeO8LwK7RS1jpXx3k4gr
	GG59O1vY8W3om0yHyVDdEPjAQUytn4ecklBiB/fM8KJkJAncT2dS/Rlfs1x5D6x0vK9gFSvjcltFy
	qGIeNj2U8jCIm1VtmACvu8EX+JbRlZDJ3gENZlcmSaRkNref9zuQGtVSnl2DTgmFboPA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uN1ts-00036E-Di;
	Thu, 05 Jun 2025 04:08:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uN1th-00035J-R8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 04:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=; b=ikS3wJ60r2dfbJTCYYXGO3A4AX
 QsKsZZcmiFsIxC6l72OZ333gSv+9UttS/FbtQ9xjV4AMlttN5HSCZQpAzsTVBq+j+s48kvhINQLAO
 ZNetdmBUVRX9/wt5XnvVKaOwW2AUZlBpigoBWt3mHGg1iwZQfkTRCMeoeKgK98iTOhfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=; b=gXUAUXQril0zlCzs+jTZxsNtUe
 vfapEcNUetEbRZcijBBQkorbAsISfG95b5NQdkx+ZUCug4RaZmON3pEm8uu/SitCp2BIv8daW5OMp
 vPnByy2sThbK7PlCTaGx/c8DarqLuU7b6w9yMci7oaYKeqBN/Th35IOcbHC+k4rshwho=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uN1th-00019z-Aw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 04:08:09 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a4e62619afso79815f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 21:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749096478; x=1749701278; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=;
 b=JXWudNTYTZtWsfj1k4QZlAn65zvvM1kQn+LzSa75IpE6ZoMXsv4bzZ9EDYu3Sz4Rk9
 ZOXug29LjeOtWWim07YgfWjq/Pc4YfTKYzQ2UMFe5uyjad91YwEDSkSW2MYj1I3tE5dy
 pqB7dHG/HtF67yNUlEO1yJswyCtdOV8TYmZOdenFPWjLNlrsPu2Qn57uNiFt67H3uJoX
 BISORhoUyEKTAW7ive2blVGlI6Zl2x6c9qZE4JiC74kvQFY0Dy/tExFgDigXQmiHDqth
 sO30+sFkLycXWcjbZUjURfRR9hODjrg+FDwbahhnab6NnHxEcavRp+E8qzB6j7mXkgYV
 tKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749096478; x=1749701278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=;
 b=rzKuanj61Y47FL9vxg9o63UFuwCBapYOcC5I+zcRIVIOv7eWd7q4AowNJH7GvTBIu+
 89tF949Bv6XOpJEpEtR3fK0/9ksVzYObAEFHnyh44q6iVwthdfFdn5NGo+U4GK5KQMjv
 SKAOZK6UvJz9nS/8kYHfsk0Qgocdou10VmofELEFjSEwZDGiov3HJhhzv7MooYQL4zx6
 1R0PZKBIHh7fVqh/JpYODB9LhA63USRvVr75rMyxpmnjyCNdZU62PFn+1Sr6T8NkYSn7
 XQfm6PifmjTYBHijdPhkI5HbaKW+RJYg2X4UFEfGcO5C7d1jRu6cqK0/K6PqNZ+FB6sR
 my3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP4d3kZ0KDs6xV4o4u9iYmZ7+y3msIl/wBrouYAnx+8Ado9XpCfWTHaJCnQ4JErnZk69jHgn3Hdqs6MaNGmnyQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxLOeknKA1n6uNF3qfHdp9g0PWohYiQPJKrNI6FXuFMTUQX1nan
 +lP4r0tQyad57Cqarhi0ZmHfkBelBp4XN7iQ0rFWuyPMqWBCUM8NYKzJwHloT537nRizmtkAUzb
 bILCDVWsQLiTLzU5iYtcOVvXJxqKE26o=
X-Gm-Gg: ASbGnctSyw26PqIi6hM6d4egFm4GAIhr1AqbDciHYXDgC6Amj4f8ss/EMH8OKbIvbfb
 X4woy64TltEb3T9mkp7qiivQqzc0XnYp50yz62sZoEJcmUyT7New44QN95QYODhcYGAjubdCvWb
 jwWTaCkawRGjwKlweuiO/jwdwgHpFOOHUdsA==
X-Google-Smtp-Source: AGHT+IEmSPI8KqN59ZHEnT3BHsvJbXgMvTKfY3B5/UO28d/mt5dsmTQN6OMmkCQtPB+7dk8uSTqbIiCnW/RzrE4TtXw=
X-Received: by 2002:a05:600c:1382:b0:439:9a40:aa1a with SMTP id
 5b1f17b1804b1-451f0b27b92mr16707885e9.6.1749096477341; Wed, 04 Jun 2025
 21:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250605032633.2744434-1-chao@kernel.org>
In-Reply-To: <20250605032633.2744434-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 12:07:46 +0800
X-Gm-Features: AX0GCFvpfdoBjZVRPiDxdtYK7pUi7tY4Ahdm2d2v_lWBBaFvMYKpaLHo_lYMFKs
Message-ID: <CAHJ8P3KmB+TocruTThpTe-YE3LH-uZ7_w_GrHqSV0B-PWwwMjg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年6月5日周四 11:29写道：
    > > fstest reports a f2fs bug: > > generic/363 42s ... [failed, exit status
    1]- output mismatch (see /share/git/fstests/results// [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
X-Headers-End: 1uN1th-00019z-Aw
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to zero post-eof page
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ25pyINeaXpeWRqOWbmyAxMToyOeWGmemBk++8mgo+Cj4g
ZnN0ZXN0IHJlcG9ydHMgYSBmMmZzIGJ1ZzoKPgo+IGdlbmVyaWMvMzYzIDQycyAuLi4gW2ZhaWxl
ZCwgZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaCAoc2VlIC9zaGFyZS9naXQvZnN0ZXN0
cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkKQo+ICAgICAtLS0gdGVzdHMvZ2VuZXJpYy8z
NjMub3V0ICAgMjAyNS0wMS0xMiAyMTo1Nzo0MC4yNzE0NDA1NDIgKzA4MDAKPiAgICAgKysrIC9z
aGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkIDIwMjUtMDUtMTkg
MTk6NTU6NTguMDAwMDAwMDAwICswODAwCj4gICAgIEBAIC0xLDIgKzEsNzggQEAKPiAgICAgIFFB
IG91dHB1dCBjcmVhdGVkIGJ5IDM2Mwo+ICAgICAgZnN4IC1xIC1TIDAgLWUgMSAtTiAxMDAwMDAK
PiAgICAgK1JFQUQgQkFEIERBVEE6IG9mZnNldCA9IDB4ZDZmYiwgc2l6ZSA9IDB4ZjA0NCwgZm5h
bWUgPSAvbW50L2YyZnMvanVuawo+ICAgICArT0ZGU0VUICAgICAgR09PRCAgICBCQUQgICAgIFJB
TkdFCj4gICAgICsweDE1NDBkICAgICAweDAwMDAgIDB4MmEyNSAgMHgwCj4gICAgICtvcGVyYXRp
b24jIChtb2QgMjU2KSBmb3IgdGhlIGJhZCBkYXRhIG1heSBiZSAzNwo+ICAgICArMHgxNTQwZSAg
ICAgMHgwMDAwICAweDI1MjcgIDB4MQo+ICAgICAuLi4KPiAgICAgKFJ1biAnZGlmZiAtdSAvc2hh
cmUvZ2l0L2ZzdGVzdHMvdGVzdHMvZ2VuZXJpYy8zNjMub3V0IC9zaGFyZS9naXQvZnN0ZXN0cy9y
ZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkJyAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKPiBS
YW46IGdlbmVyaWMvMzYzCj4gRmFpbHVyZXM6IGdlbmVyaWMvMzYzCj4gRmFpbGVkIDEgb2YgMSB0
ZXN0cwo+Cj4gVGhlIHJvb3QgY2F1c2UgaXMgdXNlciBjYW4gdXBkYXRlIHBvc3QtZW9mIHBhZ2Ug
dmlhIG1tYXAgWzFdLCBob3dldmVyLCBmMmZzCj4gbWlzc2VkIHRvIHplcm8gcG9zdC1lb2YgcGFn
ZSBpbiBiZWxvdyBvcGVyYXRpb25zLCBzbywgb25jZSBpdCBleHBhbmRzIGlfc2l6ZSwKPiB0aGVu
IGl0IHdpbGwgaW5jbHVkZSBkdW1teSBkYXRhIGxvY2F0ZXMgcHJldmlvdXMgcG9zdC1lb2YgcGFn
ZSwgc28gZHVyaW5nCj4gYmVsb3cgb3BlcmF0aW9ucywgd2UgbmVlZCB0byB6ZXJvIHBvc3QtZW9m
IHBhZ2UuCj4KPiBPcGVyYXRpb25zIHdoaWNoIGNhbiBpbmNsdWRlIGR1bW15IGRhdGEgYWZ0ZXIg
cHJldmlvdXMgaV9zaXplIGFmdGVyIGV4cGFuZGluZwo+IGlfc2l6ZToKPiAtIHdyaXRlCj4gLSBt
YXB3cml0ZSBbMV0KPiAtIHRydW5jYXRlCj4gLSBmYWxsb2NhdGUKPiAgKiBwcmVhbGxvY2F0ZQo+
ICAqIHplcm9fcmFuZ2UKPiAgKiBpbnNlcnRfcmFuZ2UKPiAgKiBjb2xsYXBzZV9yYW5nZQo+IC0g
Y2xvbmVfcmFuZ2UgKGRvZXNu4oCZdCBzdXBwb3J0IGluIGYyZnMpCj4gLSBjb3B5X3JhbmdlIChk
b2VzbuKAmXQgc3VwcG9ydCBpbiBmMmZzKQo+Cj4gWzFdIGh0dHBzOi8vbWFuNy5vcmcvbGludXgv
bWFuLXBhZ2VzL21hbjIvbW1hcC4yLmh0bWwgJ0JVRyBzZWN0aW9uJwo+Cj4gQ2M6IHN0YWJsZUBr
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKUmV2
aWV3ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KVGhhbmtzIQo+IC0t
LQo+IHYzOgo+IC0gZml4IGNoZWNrIGNvbmRpdGlvbiBpbiBmMmZzX3plcm9fcG9zdF9lb2ZfcGFn
ZSgpCj4gLSBmaXggd3JvbmcgcGFyYW1ldGVyIHBhc3NlZCBmcm9tIGYyZnNfc2V0YXR0cigpIHRv
Cj4gLSBhZGQgYSByZWZlcmVuY2UKPiBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZSgpCj4gIGZzL2Yy
ZnMvZmlsZS5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gaW5kZXggNmJkM2RlNjRmMmE4Li42OTYxMzFlNjU1
ZWQgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+
IEBAIC0zNSw2ICszNSwxNyBAQAo+ICAjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL2YyZnMuaD4KPiAg
I2luY2x1ZGUgPHVhcGkvbGludXgvZjJmcy5oPgo+Cj4gK3N0YXRpYyB2b2lkIGYyZnNfemVyb19w
b3N0X2VvZl9wYWdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBuZXdfc2l6ZSkKPiArewo+
ICsgICAgICAgbG9mZl90IG9sZF9zaXplID0gaV9zaXplX3JlYWQoaW5vZGUpOwo+ICsKPiArICAg
ICAgIGlmIChvbGRfc2l6ZSA+PSBuZXdfc2l6ZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+
ICsKPiArICAgICAgIC8qIHplcm8gb3IgZHJvcCBwYWdlcyBvbmx5IGluIHJhbmdlIG9mIFtvbGRf
c2l6ZSwgbmV3X3NpemVdICovCj4gKyAgICAgICB0cnVuY2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9s
ZF9zaXplKTsKPiArfQo+ICsKPiAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc19maWxlbWFwX2ZhdWx0
KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2Rl
ID0gZmlsZV9pbm9kZSh2bWYtPnZtYS0+dm1fZmlsZSk7Cj4gQEAgLTEwMyw4ICsxMTQsMTMgQEAg
c3RhdGljIHZtX2ZhdWx0X3QgZjJmc192bV9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2
bWYpCj4KPiAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgZjJmc19oYXNfaW5saW5lX2RhdGEoaW5v
ZGUpKTsKPgo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGlu
Zyk7Cj4gKyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgKGZvbGlvLT5pbmRl
eCArIDEpIDw8IFBBR0VfU0hJRlQpOwo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9j
ayhpbm9kZS0+aV9tYXBwaW5nKTsKPiArCj4gICAgICAgICBmaWxlX3VwZGF0ZV90aW1lKHZtZi0+
dm1hLT52bV9maWxlKTsKPiAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrX3NoYXJlZChp
bm9kZS0+aV9tYXBwaW5nKTsKPiArCj4gICAgICAgICBmb2xpb19sb2NrKGZvbGlvKTsKPiAgICAg
ICAgIGlmICh1bmxpa2VseShmb2xpby0+bWFwcGluZyAhPSBpbm9kZS0+aV9tYXBwaW5nIHx8Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fcG9zKGZvbGlvKSA+IGlfc2l6ZV9yZWFkKGlu
b2RlKSB8fAo+IEBAIC0xMTA5LDYgKzExMjUsOCBAQCBpbnQgZjJmc19zZXRhdHRyKHN0cnVjdCBt
bnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4gICAgICAgICAgICAgICAg
IGYyZnNfZG93bl93cml0ZSgmZmktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiAgICAgICAgICAgICAg
ICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4KPiArICAgICAg
ICAgICAgICAgaWYgKGF0dHItPmlhX3NpemUgPiBvbGRfc2l6ZSkKPiArICAgICAgICAgICAgICAg
ICAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgYXR0ci0+aWFfc2l6ZSk7Cj4g
ICAgICAgICAgICAgICAgIHRydW5jYXRlX3NldHNpemUoaW5vZGUsIGF0dHItPmlhX3NpemUpOwo+
Cj4gICAgICAgICAgICAgICAgIGlmIChhdHRyLT5pYV9zaXplIDw9IG9sZF9zaXplKQo+IEBAIC0x
MjI3LDYgKzEyNDUsMTAgQEAgc3RhdGljIGludCBmMmZzX3B1bmNoX2hvbGUoc3RydWN0IGlub2Rl
ICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbikKPiAgICAgICAgIGlmIChyZXQpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0
ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ICsgICAgICAgZjJmc196ZXJvX3Bvc3RfZW9mX3Bh
Z2UoaW5vZGUsIG9mZnNldCArIGxlbik7Cj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfdW5s
b2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ICsKPiAgICAgICAgIHBnX3N0YXJ0ID0gKCh1bnNpZ25l
ZCBsb25nIGxvbmcpIG9mZnNldCkgPj4gUEFHRV9TSElGVDsKPiAgICAgICAgIHBnX2VuZCA9ICgo
dW5zaWduZWQgbG9uZyBsb25nKSBvZmZzZXQgKyBsZW4pID4+IFBBR0VfU0hJRlQ7Cj4KPiBAQCAt
MTUxMCw2ICsxNTMyLDggQEAgc3RhdGljIGludCBmMmZzX2RvX2NvbGxhcHNlKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZfdCBsZW4pCj4gICAgICAgICBmMmZzX2Rvd25f
d3JpdGUoJkYyRlNfSShpbm9kZSktPmlfZ2NfcndzZW1bV1JJVEVdKTsKPiAgICAgICAgIGZpbGVt
YXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+Cj4gKyAgICAgICBmMmZzX3pl
cm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0ICsgbGVuKTsKPiArCj4gICAgICAgICBmMmZz
X2xvY2tfb3Aoc2JpKTsKPiAgICAgICAgIGYyZnNfZHJvcF9leHRlbnRfdHJlZShpbm9kZSk7Cj4g
ICAgICAgICB0cnVuY2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9mZnNldCk7Cj4gQEAgLTE2MzEsNiAr
MTY1NSwxMCBAQCBzdGF0aWMgaW50IGYyZnNfemVyb19yYW5nZShzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBsb2ZmX3Qgb2Zmc2V0LCBsb2ZmX3QgbGVuLAo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2so
bWFwcGluZyk7Cj4gKyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0
ICsgbGVuKTsKPiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2sobWFwcGluZyk7Cj4g
Kwo+ICAgICAgICAgcGdfc3RhcnQgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZykgb2Zmc2V0KSA+PiBQ
QUdFX1NISUZUOwo+ICAgICAgICAgcGdfZW5kID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpIG9mZnNl
dCArIGxlbikgPj4gUEFHRV9TSElGVDsKPgo+IEBAIC0xNzYyLDYgKzE3OTAsOCBAQCBzdGF0aWMg
aW50IGYyZnNfaW5zZXJ0X3JhbmdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQs
IGxvZmZfdCBsZW4pCj4gICAgICAgICAvKiBhdm9pZCBnYyBvcGVyYXRpb24gZHVyaW5nIGJsb2Nr
IGV4Y2hhbmdlICovCj4gICAgICAgICBmMmZzX2Rvd25fd3JpdGUoJkYyRlNfSShpbm9kZSktPmlf
Z2NfcndzZW1bV1JJVEVdKTsKPiAgICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKG1hcHBp
bmcpOwo+ICsKPiArICAgICAgIGYyZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2RlLCBvZmZzZXQg
KyBsZW4pOwo+ICAgICAgICAgdHJ1bmNhdGVfcGFnZWNhY2hlKGlub2RlLCBvZmZzZXQpOwo+Cj4g
ICAgICAgICB3aGlsZSAoIXJldCAmJiBpZHggPiBwZ19zdGFydCkgewo+IEBAIC0xODE5LDYgKzE4
NDksMTAgQEAgc3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4gICAgICAgICBpZiAoZXJyKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gZXJyOwo+Cj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhpbm9kZS0+
aV9tYXBwaW5nKTsKPiArICAgICAgIGYyZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2RlLCBvZmZz
ZXQgKyBsZW4pOwo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9t
YXBwaW5nKTsKPiArCj4gICAgICAgICBmMmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKPgo+ICAg
ICAgICAgcGdfc3RhcnQgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZylvZmZzZXQpID4+IFBBR0VfU0hJ
RlQ7Cj4gQEAgLTQ4NjAsNiArNDg5NCwxMCBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX3dyaXRlX2No
ZWNrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAgICAgICAg
IGVyciA9IGZpbGVfbW9kaWZpZWQoZmlsZSk7Cj4gICAgICAgICBpZiAoZXJyKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gZXJyOwo+ICsKPiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2Nr
KGlub2RlLT5pX21hcHBpbmcpOwo+ICsgICAgICAgZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2UoaW5v
ZGUsIGlvY2ItPmtpX3BvcyArIGlvdl9pdGVyX2NvdW50KGZyb20pKTsKPiArICAgICAgIGZpbGVt
YXBfaW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gICAgICAgICByZXR1cm4g
Y291bnQ7Cj4gIH0KPgo+IC0tCj4gMi40OS4wCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
