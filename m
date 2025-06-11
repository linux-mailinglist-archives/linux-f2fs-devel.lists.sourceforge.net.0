Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D587BAD4BF3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 08:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tElX3Rp2zFFiiTBGJWgAa5GYPJ41+0jw1m+UlFwG3Xc=; b=OzpzshnQ2vJi0jYES7vOYwjZxG
	ukjwlKLZYNloOx8v4YWg08eCJhLVswTpvgKWGxfwR9TSNHN9txaLjuaYUk4CnwvO7pe33KL29nkdI
	tehgifoDwTA2cxAhQqgVrvRdQDV5hekWdEGCaD9FoQdN6C2v7+Kg5f5tMAqfjEkJkA8s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPF9v-0008ER-2h;
	Wed, 11 Jun 2025 06:42:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uPF9t-0008E9-2A
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=; b=Euuk7CT5/nqGMAqsW/hLjeWWzF
 z8YoLXAyGGMx8rkWzRcjTTkYlk9OPjl8QXeWOdRfSC8JuaYz4I0FZ2zmECVtt83YTM9EfLCAm7POt
 G0HBcp0f02dk6SsFO4RoakbrDq2BDrGdNj8TXIRai22PwORKPv2JzIPJqDXKGu3Khaag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=; b=kG7O/9PlYCmYpsBnXQmqhL+dNt
 Koy57BwmRlHhjtBkiOa/q07B6AnfJTD8VHH90FzfXJxIg10F54B6jBatlIM5fyBBL0zVyOxyz47fT
 E2KxPV+Nq4dAYjKJLJb1BHorvqvJDS+J1ThpginjNa2bhQamJUP1tjyqWZGJrYabN9lI=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPF9s-0000VA-JO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 06:42:01 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a524caf77eso28184f8f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Jun 2025 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749624114; x=1750228914; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=;
 b=D/vcvBuP7PBh+7lMV6oU2DC2t/hA+AfTAxqPj57wcxoRmn+lCYovU0U7v1zQONWlMX
 IDAhN25Mu7Wj9qoiaTqd3vJn4xG5crYMs/kyfRVVFz3DEdwWQrDds7zIctbn5FssupWB
 0oVEMR5OqP7R3mJOqNzj9V/S2VIN3uFY45xeVB8hzJsim4Tl/EID4csU7bjnUN412aI1
 AY3oJHbbo/gmirF48X2ODTKuC5Ewv/Eh12qLRiOqBaMF9Loau19LsRbLFJ6lqsqNW4XE
 2EAY6BxPaFalOtiJ0ccAxRXe1L1/m1OnJrv7/XgSbjC29SCpKDKy+xembbiUCpO7Y+2+
 4CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749624114; x=1750228914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYhs6xK44tttQEGd9alnm7cLivjv6fMj93Ib7TVFrE4=;
 b=XW8iQBQbOv8bfYZcN4HmOsCHCMzw/wocrYUNBVLxSVvWZ+EZoVCXFhd6J2g2Znsa3K
 tFhElDM4ur4rvR5Y8h0AbCnhysX4LsrUGAZad6hx16NLqOD8mJF9ZWy2Xc/+AgFHYFbW
 s0IRIfOaYc1ZVWHuOdS0MfSmkA/8ni/2karvWRHsXzmyvezKLJcr+o1y8jP0KOv+oKkm
 B8kF8ETW/JDFqqQOpjNeM0XhWZd88fIhMGlSEC8ICuKLKu7sCZxMfBy1lrP8MfJenzkW
 dscThFV8Rdib4clo1XCi/7cktVaVy3UyjBeL9jE7OoO3MbWWpyDgs8CCxzxgBiUsWQ7f
 61Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGtxwkXhDe0GK6Xbz+5Dhjp7eYSaOh1ncOE/kMvYxTX3MiaECIlzQmshzr0qezKZp49PMk4WVUc7Ize/BcDI3@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxALbcwhLvRWNCy9ZDSC+R7eXDm4sYrD2Iai9BRjZrflzQPTIBc
 BLM4g5ToZnNGYd4mkBg13p9TmLS5ed5Yhi84y8RFDqPoJhLloX34auedC9hRs3bKfXM4nhhBVRo
 wwI3uuZTNYoAgUxleHpj68GbP4GVDON0=
X-Gm-Gg: ASbGncvYGUuX0ERdQ7QCuUTAuCTy6q+7SNmaJWk1jLiJwPzRdxWEUFb5lAvdfekxKtr
 HI9nC7AD3kjrPPq1zlLJxx7YobkP/4uwH5nVk+LZTmprHZrBBCW2l3WRsNOptFJTQhs+rTGR7xY
 3TIam4B9j66BukagKQt8kcaiS7m7PidiYXjcKX0E2EWNXH
X-Google-Smtp-Source: AGHT+IEUqCZcBZMD4HCDk8xW7KsXfbJpYiHZ1ipiPUQm8CijINYGP5+iokOyIKe2ejx1U9zxoWMwK+NBPQJAtV4RTNg=
X-Received: by 2002:a05:6000:40c9:b0:3a4:d0dc:184b with SMTP id
 ffacd0b85a97d-3a5586c5ea5mr521678f8f.6.1749624113790; Tue, 10 Jun 2025
 23:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com>
 <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
In-Reply-To: <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 11 Jun 2025 14:41:42 +0800
X-Gm-Features: AX0GCFszQVFDzNW_vueFfuzuPAF20JAWp1_i5iMDP87FAt4QDQtAxoIS95iopo0
Message-ID: <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月11日周三 14:07写道： > > On 6/11/25
    00:08, Jaegeuk Kim wrote: > > Hi Zhiguo, > > > > This patch causes CPU hang
    when running fsstress on compressed/non-compressed > > fil [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [209.85.221.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1uPF9s-0000VA-JO
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDEx5pel5ZGo5LiJIDE0OjA3
5YaZ6YGT77yaCj4KPiBPbiA2LzExLzI1IDAwOjA4LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IEhp
IFpoaWd1bywKPiA+Cj4gPiBUaGlzIHBhdGNoIGNhdXNlcyBDUFUgaGFuZyB3aGVuIHJ1bm5pbmcg
ZnNzdHJlc3Mgb24gY29tcHJlc3NlZC9ub24tY29tcHJlc3NlZAo+ID4gZmlsZXMuIFBsZWFzZSBj
aGVjay4KPgo+IE9oLCBzZWVtcyBpdCBtYXkgY2F1c2UgYmVsb3cgZGVhZGxvY2s6Cj4KPiBDUFUw
Cj4gcHJvY2VzcyBBCj4gLSBzcGluX2xvY2soaV9sb2NrKQo+IHNvZnR3YXJlIElSUQo+IC0gZW5k
X2lvCj4gIC0gaWdyYWIKPiAgIC0gc3Bpbl9sb2NrKGlfbG9jaykKPgo+IFRoYW5rcywKSGkgQ2hh
bywKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4KSSBoYXZlIHRlc3RlZCB0aGlzIHBhdGNo
IGxvY2FsbHkgYWJvdXQgc29tZSBiYXNpYyBjYXNlcyBiZWZvcmUgc3VibWlzc2lvbi4KU28gaXQg
c2VlbXMgdGhhdCBzaG91bGQgdXNlIHRoZSBmb2xsb3dpbmcgbWV0aG9kICB0byBzb2x2ZSB0aGlz
IHByb2JsZW0/CiIgc3RvcmUgaV9jb21wcmVzc19hbGdvcml0aG0vc2JpIGluIGRpYyB0byBhdm9p
ZCBpbm9kZSBhY2Nlc3M/Igp0aGFua3PvvIEKCgo+Cj4gPgo+ID4gT24gMDYvMDUsIFpoaWd1byBO
aXUgd3JvdGU6Cj4gPj4gVGhlIGRlY29tcHJlc3NfaW9fY3R4IG1heSBiZSByZWxlYXNlZCBhc3lu
Y2hyb25vdXNseSBhZnRlcgo+ID4+IEkvTyBjb21wbGV0aW9uLiBJZiB0aGlzIGZpbGUgaXMgZGVs
ZXRlZCBpbW1lZGlhdGVseSBhZnRlciByZWFkLAo+ID4+IGFuZCB0aGUga3dvcmtlciBvZiBwcm9j
ZXNzaW5nIHBvc3RfcmVhZF93cSBoYXMgbm90IGJlZW4gZXhlY3V0ZWQgeWV0Cj4gPj4gZHVlIHRv
IGhpZ2ggd29ya2xvYWRzLCBJdCBpcyBwb3NzaWJsZSB0aGF0IHRoZSBpbm9kZShmMmZzX2lub2Rl
X2luZm8pCj4gPj4gaXMgZXZpY3RlZCBhbmQgZnJlZWQgYmVmb3JlIGl0IGlzIHVzZWQgZjJmc19m
cmVlX2RpYy4KPiA+Pgo+ID4+ICAgICBUaGUgVUFGIGNhc2UgYXMgYmVsb3c6Cj4gPj4gICAgIFRo
cmVhZCBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaHJlYWQgQgo+ID4+
ICAgICAtIGYyZnNfZGVjb21wcmVzc19lbmRfaW8KPiA+PiAgICAgIC0gZjJmc19wdXRfZGljCj4g
Pj4gICAgICAgLSBxdWV1ZV93b3JrCj4gPj4gICAgICAgICBhZGQgZnJlZV9kaWMgd29yayB0byBw
b3N0X3JlYWRfd3EKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtIGRvX3VubGluawo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIGlwdXQKPiA+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZXZpY3QKPiA+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGNhbGxfcmN1Cj4gPj4g
ICAgIFRoaXMgZmlsZSBpcyBkZWxldGVkIGFmdGVyIHJlYWQuCj4gPj4KPiA+PiAgICAgVGhyZWFk
IEMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrd29ya2VyIHRvIHByb2Nlc3MgcG9z
dF9yZWFkX3dxCj4gPj4gICAgIC0gcmN1X2RvX2JhdGNoCj4gPj4gICAgICAtIGYyZnNfZnJlZV9p
bm9kZQo+ID4+ICAgICAgIC0ga21lbV9jYWNoZV9mcmVlCj4gPj4gICAgICBpbm9kZSBpcyBmcmVl
ZCBieSByY3UKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIHByb2Nlc3Nfc2NoZWR1bGVkX3dvcmtzCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19sYXRlX2ZyZWVfZGljCj4gPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfZnJlZV9kaWMKPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNf
cmVsZWFzZV9kZWNvbXBfbWVtCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWFkIChkaWMtPmlub2RlKS0+aV9jb21wcmVzc19hbGdvcml0aG0KPiA+Pgo+ID4+IFRo
aXMgcGF0Y2ggdXNlIGlncmFiIGJlZm9yZSBmMmZzX2ZyZWVfZGljIGFuZCBpcHV0IGFmdGVyIGZy
ZWUgdGhlIGRpYyB3aGVuIGRpYyBmcmVlCj4gPj4gYWN0aW9uIGlzIGRvbmUgYnkga3dvcmtlci4K
PiA+Pgo+ID4+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+IEZp
eGVzOiBiZmYxMzliNDlkOWYgKCJmMmZzOiBoYW5kbGUgZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJv
Y2Vzc2luZyBpbiBzb2Z0aXJxIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1IDx6aGln
dW8ubml1QHVuaXNvYy5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQmFvY29uZyBMaXUgPGJhb2Nv
bmcubGl1QHVuaXNvYy5jb20+Cj4gPj4gLS0tCj4gPj4gdjM6IHVzZSBpZ3JhYiB0byByZXBsYWNl
IF9faWdldAo+ID4+IHYyOiB1c2UgX19pZ2V0L2lwdXQgZnVuY3Rpb24KPiA+PiAtLS0KPiA+PiAg
ZnMvZjJmcy9jb21wcmVzcy5jIHwgMTQgKysrKysrKysrLS0tLS0KPiA+PiAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMKPiA+PiBpbmRleCBiM2Mx
ZGY5Li43MjlhZDE2IDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+ICsr
KyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+IEBAIC0xNjg3LDcgKzE2ODcsNyBAQCBzdGF0aWMg
dm9pZCBmMmZzX3JlbGVhc2VfZGVjb21wX21lbShzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRp
YywKPiA+PiAgfQo+ID4+Cj4gPj4gIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRl
Y29tcHJlc3NfaW9fY3R4ICpkaWMsCj4gPj4gLSAgICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ry
b3lfY2FsbGJhY2spOwo+ID4+ICsgICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0cm95X2NhbGxi
YWNrLCBib29sIGxhdGVfZnJlZSk7Cj4gPj4KPiA+PiAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4
ICpmMmZzX2FsbG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+PiAgewo+ID4+IEBA
IC0xNzQzLDEyICsxNzQzLDEyIEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZjJmc19hbGxv
Y19kaWMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MpCj4gPj4gICAgICByZXR1cm4gZGljOwo+ID4+
Cj4gPj4gIG91dF9mcmVlOgo+ID4+IC0gICAgZjJmc19mcmVlX2RpYyhkaWMsIHRydWUpOwo+ID4+
ICsgICAgZjJmc19mcmVlX2RpYyhkaWMsIHRydWUsIGZhbHNlKTsKPiA+PiAgICAgIHJldHVybiBF
UlJfUFRSKHJldCk7Cj4gPj4gIH0KPiA+Pgo+ID4+ICBzdGF0aWMgdm9pZCBmMmZzX2ZyZWVfZGlj
KHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+ID4+IC0gICAgICAgICAgICBib29sIGJ5
cGFzc19kZXN0cm95X2NhbGxiYWNrKQo+ID4+ICsgICAgICAgICAgICBib29sIGJ5cGFzc19kZXN0
cm95X2NhbGxiYWNrLCBib29sIGxhdGVfZnJlZSkKPiA+PiAgewo+ID4+ICAgICAgaW50IGk7Cj4g
Pj4KPiA+PiBAQCAtMTc3NSw2ICsxNzc1LDggQEAgc3RhdGljIHZvaWQgZjJmc19mcmVlX2RpYyhz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPiA+PiAgICAgIH0KPiA+Pgo+ID4+ICAgICAg
cGFnZV9hcnJheV9mcmVlKGRpYy0+aW5vZGUsIGRpYy0+cnBhZ2VzLCBkaWMtPm5yX3JwYWdlcyk7
Cj4gPj4gKyAgICBpZiAobGF0ZV9mcmVlKQo+ID4+ICsgICAgICAgICAgICBpcHV0KGRpYy0+aW5v
ZGUpOwo+ID4+ICAgICAga21lbV9jYWNoZV9mcmVlKGRpY19lbnRyeV9zbGFiLCBkaWMpOwo+ID4+
ICB9Cj4gPj4KPiA+PiBAQCAtMTc4MywxNiArMTc4NSwxOCBAQCBzdGF0aWMgdm9pZCBmMmZzX2xh
dGVfZnJlZV9kaWMoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4+ICAgICAgc3RydWN0IGRl
Y29tcHJlc3NfaW9fY3R4ICpkaWMgPQo+ID4+ICAgICAgICAgICAgICBjb250YWluZXJfb2Yod29y
aywgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4LCBmcmVlX3dvcmspOwo+ID4+Cj4gPj4gLSAgICBm
MmZzX2ZyZWVfZGljKGRpYywgZmFsc2UpOwo+ID4+ICsgICAgZjJmc19mcmVlX2RpYyhkaWMsIGZh
bHNlLCB0cnVlKTsKPiA+PiAgfQo+ID4+Cj4gPj4gIHN0YXRpYyB2b2lkIGYyZnNfcHV0X2RpYyhz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYm9vbCBpbl90YXNrKQo+ID4+ICB7Cj4gPj4g
ICAgICBpZiAocmVmY291bnRfZGVjX2FuZF90ZXN0KCZkaWMtPnJlZmNudCkpIHsKPiA+PiAgICAg
ICAgICAgICAgaWYgKGluX3Rhc2spIHsKPiA+PiAtICAgICAgICAgICAgICAgICAgICBmMmZzX2Zy
ZWVfZGljKGRpYywgZmFsc2UpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGYyZnNfZnJlZV9k
aWMoZGljLCBmYWxzZSwgZmFsc2UpOwo+ID4+ICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgIElOSVRfV09SSygmZGljLT5mcmVlX3dvcmssIGYyZnNfbGF0ZV9m
cmVlX2RpYyk7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgLyogdXNlIGlncmFiIHRvIGF2b2lk
IGlub2RlIGlzIGV2aWN0ZWQgc2ltdWx0YW5lb3VzbHkgKi8KPiA+PiArICAgICAgICAgICAgICAg
ICAgICBmMmZzX2J1Z19vbihGMkZTX0lfU0IoZGljLT5pbm9kZSksICFpZ3JhYihkaWMtPmlub2Rl
KSk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgcXVldWVfd29yayhGMkZTX0lfU0IoZGljLT5p
bm9kZSktPnBvc3RfcmVhZF93cSwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmRpYy0+ZnJlZV93b3JrKTsKPiA+PiAgICAgICAgICAgICAgfQo+ID4+IC0tCj4gPj4g
MS45LjEKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
