Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D4B4121C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Sep 2025 03:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpypymwuP3A0IGCFy/81j7dbFBF34mXa8kVgvCeOZeQ=; b=BD/9SJ7ZZKvBCbzVMkJQrRgS6f
	1KVK1atvHmVoP8NjzbrJKJ3nju3B/fDjFtUkyDTaUEboXZhpPxTjSzYzVL9Pgo+J6UAWqu68+nZq9
	AsyQq/IkE3qeL6TUErkASIyli0kHmij5QHvnn/NuZatRMVr8+2m167b7/8vr6Nskb1g0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utcjs-0002nm-Au;
	Wed, 03 Sep 2025 01:56:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1utcjq-0002ne-9b
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 01:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yQ953dkTsh0Dx4DikEan8wPpG+Hacm6lkS45eUd1Ujw=; b=Ho785h5bUW0AzIlIuBq6e1pcZz
 ar4eOw/OZTpoMdiv8vdRQdB4nM1CAFIS2RKOSinuaxR/om6G0iDt8CEThzx4SGPnMdGiV+33gczkG
 C9gvzjMRqRfBr6Z751EL0ff8ggi7a/KQtsa/E7TH9uHMGDziThWdQWZkjjJI1iTeOcaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yQ953dkTsh0Dx4DikEan8wPpG+Hacm6lkS45eUd1Ujw=; b=gK/MUdTSifH89h1L/yBtfTm0VL
 l1ibbKdD3ZbSjBHTrWDB46tThTn68oEGF1qbkOfnxL88/51fp88mPEZzCmL9rA8JIXlRafJcmjMSK
 CzyXZXCgCEhEqggVQC2bZYsInv2BL6Ple9oGlJMk/lSKUWUiDmprd1FoeXmLdAFkhePc=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1utcjp-0007Dd-Qy for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Sep 2025 01:56:42 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3cd44b9496fso774567f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Sep 2025 18:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756864595; x=1757469395; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQ953dkTsh0Dx4DikEan8wPpG+Hacm6lkS45eUd1Ujw=;
 b=TPDlIAUCaKCSt9W9KlyDs0/BJc12AyodOYO03oTClhRlem+qO+NzntmVin0YZGLMVk
 Cr+V5VMs9ML26CQGX077p9OkOnQyJu3W0bd0xB250MCzPkivG+sFKNcQz4hLEfwL5gIt
 dfgL44gz5TmPbLO3LIVEQkhygFK6bHZ9qoogL5f/Nf4R5Hqy44tL/nCQqrRoyGYUUQqc
 U0thQTT6kfXHU2RebdxNd8GwrXJdQj9c6hKNWst+1ghPZKzeotGixjBzfFuR2A5dZ7xz
 1JkaWx0YAL1c/cnyotbTuIbqcSbncRwFI0r/9I51oeH8Bm8mmUuQWhxWVaiHA6VILaJ4
 Xffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756864595; x=1757469395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yQ953dkTsh0Dx4DikEan8wPpG+Hacm6lkS45eUd1Ujw=;
 b=jt5dT4b5UkVhBr0QbxDTH5xmRbMnQHGw3DZZEnYFJnIHA1eFZD2xS3lsrk8okedWRI
 d1LsTqfNqdbie+WQCecqowrY5OTnRctGzB8fRuKe8xWyF4aqEGOpwuGmB3YQqGaaTgNL
 fo0nuT4ACilpP//mGRJ0U1iUvjhc90U1+QZGVB7Lu/IVYYulCYDS3GudgpLuzqGNxDes
 9+0zqrdG3kx6EXHEF+iFxKN2uXOfxtbMs4dNcVomobRCfOh0H5Xe6bSJVBPFlDriZbB3
 L/48kqDyG2JkyrSOH8OF01VaU8mjZTH9o5+97/8YgFos+DdVYiCmbKfGsVsf9F4TsStA
 Xygw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnGajg2JnRnHbGPJRZ7BiS4FYE1d+4+UYj71SJEA72tRLphHdqsxequfcp+/vCvwqHBFzAY3BIEfk8bmSA36SG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxE6cyZNNWJMuGmvZd6DDQquY+e69YV0+2t4Fm/snjficp33trP
 TXJ0T34muAz+P2C+mIdaiYxVIE9bMXlGXgvd7hrF6tASU0toc8who0O9HGzNnySBEZb74CMHGEy
 62/mB6+QCgiozy25v+1YjK81VrQ/z35Eb4bAY
X-Gm-Gg: ASbGncvrDbR6RW/2OrISCyGX37Ao4GeUcgMnC/x1nk0FH6i0uHanolxn2m4Z5xCtNiG
 PKZH2WL7WxZJhqkBV0pgvJacfUi9qcK638kDHtMF/rnCMrX3ND0D+W/VV5xPHJKGgIjNOgbp69/
 Bdg4q+JObel7/WbnavXbip/mRPXbWQYQOJj3y1DEoEw7Sc2uWtaxE4J+bmsjXh9PpQZVocoUdSg
 i4t6/l2AwgMQ3qG6sE=
X-Google-Smtp-Source: AGHT+IEyjtk0hTZKeLxSiUfd/rl4UytvosJX6XmzdLePURiXLfgCBqyw3MWbdQ/0hTsNmz+rrpatsR/ZRQZvUaEih7E=
X-Received: by 2002:a5d:64e4:0:b0:3c8:ed45:498 with SMTP id
 ffacd0b85a97d-3d0fc3b3558mr5666561f8f.9.1756864595052; Tue, 02 Sep 2025
 18:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250901020416.2172182-1-chao@kernel.org>
 <CAHJ8P3+NJfE+F-Tsbw4Rz6PyT9o2F74kyrJncLqyQv+YeOSvgA@mail.gmail.com>
 <e44dc335-dfe1-45ba-8bac-9c5f7a5f24d7@kernel.org>
In-Reply-To: <e44dc335-dfe1-45ba-8bac-9c5f7a5f24d7@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 3 Sep 2025 09:56:23 +0800
X-Gm-Features: Ac12FXzBETk0qad4U4cyz9AjIw6DlZ-icmknEZMJ_c7mJWaI_nYnLeCf-dbYhk8
Message-ID: <CAHJ8P3+BAzDzW9GixwgXBs6NJqWm+pAUe4cCyhNKWwUx+5f+hQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年9月3日周三 09:33写道： > > On 9/3/25
    08:04, Zhiguo Niu wrote: > > Chao Yu via Linux-f2fs-devel > > 于2025年9月1日周一
    10:08写道： > >> > >> It reports a bug from [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1utcjp-0007Dd-Qy
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid migrating empty section
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
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0OeaciDPml6XlkajkuIkgMDk6MzPl
hpnpgZPvvJoKPgo+IE9uIDkvMy8yNSAwODowNCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IENoYW8g
WXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Pgo+ID4g5LqOMjAyNeW5tDnmnIgx5pel5ZGo5LiAIDEwOjA45YaZ6YGT77yaCj4gPj4K
PiA+PiBJdCByZXBvcnRzIGEgYnVnIGZyb20gZGV2aWNlIHcvIHp1ZnM6Cj4gPj4KPiA+PiBGMkZT
LWZzIChkbS02NCk6IEluY29uc2lzdGVudCBzZWdtZW50ICgxNzM4MjIpIHR5cGUgWzEsIDBdIGlu
IFNTQSBhbmQgU0lUCj4gPj4gRjJGUy1mcyAoZG0tNjQpOiBTdG9wcGVkIGZpbGVzeXN0ZW0gZHVl
IHRvIHJlYXNvbjogNAo+ID4+Cj4gPj4gVGhyZWFkIEEgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFRocmVhZCBCCj4gPj4gLSBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhCj4gPj4gIC0gZjJm
c19hbGxvY2F0ZV9waW5uaW5nX3NlY3Rpb24KPiA+PiAgIC0gZjJmc19nY19yYW5nZQo+ID4+ICAg
IC0gZG9fZ2FyYmFnZV9jb2xsZWN0IHcvIHNlZ25vICN4Cj4gPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0gd3JpdGVwYWdlCj4gPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfYWxsb2NhdGVfZGF0YV9ibG9jawo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gbmV3X2N1cnNlZwo+ID4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGFsbG9jYXRlIHNl
Z25vICN4Cj4gPj4KPiA+PiBUaGUgcm9vdCBjYXVzZSBpczogZmFsbG9jYXRlIG9uIHBpbm5pbmcg
ZmlsZSBtYXkgcmFjZSB3LyBibG9jayBhbGxvY2F0aW9uCj4gPj4gYXMgYWJvdmUsIHJlc3VsdCBp
biBkb19nYXJiYWdlX2NvbGxlY3QoKSBmcm9tIGZhbGxvY2F0ZSgpIG1heSBtaWdyYXRlCj4gPj4g
c2VnbWVudCB3aGljaCBpcyBqdXN0IGFsbG9jYXRlZCBieSBhIGxvZywgdGhlIGxvZyB3aWxsIHVw
ZGF0ZSBzZWdtZW50IHR5cGUKPiA+PiBpbiBpdHMgaW4tbWVtb3J5IHN0cnVjdHVyZSwgaG93ZXZl
ciBHQyB3aWxsIGdldCBzZWdtZW50IHR5cGUgZnJvbSBvbi1kaXNrCj4gPj4gU1NBIGJsb2NrLCBv
bmNlIHNlZ21lbnQgdHlwZSBjaGFuZ2VzIGJ5IGxvZywgd2UgY2FuIGRldGVjdCBzdWNoCj4gPj4g
aW5jb25zaXN0ZW5jeSwgdGhlbiBzaHV0ZG93biBmaWxlc3lzdGVtLgo+ID4+Cj4gPj4gSW4gdGhp
cyBjYXNlLCBvbi1kaXNrIFNTQSBzaG93cyB0eXBlIG9mIHNlZ25vICMxNzM4MjIgaXMgMSAoU1VN
X1RZUEVfTk9ERSksCj4gPj4gaG93ZXZlciBzZWdubyAjMTczODIyIHdhcyBqdXN0IGFsbG9jYXRl
ZCBhcyBkYXRhIHR5cGUgc2VnbWVudCwgc28gaW4tbWVtb3J5Cj4gPj4gU0lUIHNob3dzIHR5cGUg
b2Ygc2Vnbm8gIzE3MzgyMiBpcyAwIChTVU1fVFlQRV9EQVRBKS4KPiA+Pgo+ID4+IENoYW5nZSBh
cyBiZWxvdyB0byBmaXggdGhpcyBpc3N1ZToKPiA+PiAtIGNoZWNrIHdoZXRoZXIgY3VycmVudCBz
ZWN0aW9uIGlzIGVtcHR5IGJlZm9yZSBnYwo+ID4+IC0gYWRkIHNhbml0eSBjaGVja3Mgb24gZG9f
Z2FyYmFnZV9jb2xsZWN0KCkgdG8gYXZvaWQgYW55IHJhY2UgY2FzZSwgcmVzdWx0Cj4gPj4gaW4g
bWlncmF0aW5nIHNlZ21lbnQgdXNlZCBieSBsb2cuCj4gPj4gLSBidHcsIGl0IGZpeGVzIG1pc2Mg
aXNzdWUgaW4gcHJpbnRlZCBsb2dzOiAiU1NBIGFuZCBTSVQiIC0+ICJTSVQgYW5kIFNTQSIuCj4g
Pj4KPiA+PiBGaXhlczogOTcwM2Q2OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5pbmcg
Zm9yIHpvbmVkIGRldmljZXMiKQo+ID4+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+
PiAtLS0KPiA+PiAgZnMvZjJmcy9nYy5jIHwgMTYgKysrKysrKysrKysrKysrLQo+ID4+ICAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+ID4+IGluZGV4IGVkM2FjYmZj
ODNjYS4uYTc3MDhjZjgwYzA0IDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ID4+ICsr
KyBiL2ZzL2YyZnMvZ2MuYwo+ID4+IEBAIC0xNzk0LDYgKzE3OTQsMTMgQEAgc3RhdGljIGludCBk
b19nYXJiYWdlX2NvbGxlY3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4+ICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZm9saW8gKnN1bV9mb2xpbyA9IGZpbGVtYXBfZ2V0X2ZvbGlvKE1FVEFf
TUFQUElORyhzYmkpLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBHRVRfU1VNX0JMT0NLKHNiaSwgc2Vnbm8pKTsKPiA+Pgo+ID4+ICsgICAgICAgICAgICAgICBp
ZiAoaXNfY3Vyc2VjKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKSkpIHsKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICIlczogc2VnbWVudCAldSBpcyB1
c2VkIGJ5IGxvZyIsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgc2Vnbm8pOwo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfYnVnX29uKHNiaSwgMSk7Cj4gPiBIaSBDaGFvLAo+ID4gRG8gd2UgbmVlZCBm
MmZzX2J1Z19vbiBoZXJlPyAgb3IgaXQgaXMgZW5vdWdoIHRvIHNraXAgY3VycmVudCBzZWdubwo+
ID4gYW5kIGxldCBnYyBjb250aW51ZT8KPgo+IFpoaWd1bywKPgo+IEkgdGhpbmsgd2Ugc2hvdWxk
IG5ldmVyIHNlbGVjdCBpbi11c2Ugc2VnbWVudCBhcyBHQyB2aWN0aW0sIHNvIEkgYWRkIGEKPiBm
MmZzX2J1Z19vbigpIGhlcmUgdG8gZGV0ZWN0IGFueSBwb3RlbnRpYWwgYnVncy4gTGV0J3Mgc2Vl
IHdoYXQgd2lsbCB3ZQo+IGZpbmQgdy8gdGhpcy4KSGkgQ2hhbywKR290IGl0IGFuZCB0aGFua3Mg
Zm9yIHRoaXMuCj4KPiBUaGFua3MsCj4KPiA+IFRoYW5rcyEKPiA+PiArICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIHNraXA7Cj4gPj4gKyAgICAgICAgICAgICAgIH0KPiA+PiArCj4gPj4gICAg
ICAgICAgICAgICAgIGlmIChnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIGZhbHNlKSA9PSAw
KQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZnJlZWQ7Cj4gPj4gICAgICAgICAg
ICAgICAgIGlmIChnY190eXBlID09IEJHX0dDICYmIF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYm
Cj4gPj4gQEAgLTE4MDUsNyArMTgxMiw3IEBAIHN0YXRpYyBpbnQgZG9fZ2FyYmFnZV9jb2xsZWN0
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICBzdW0g
PSBmb2xpb19hZGRyZXNzKHN1bV9mb2xpbyk7Cj4gPj4gICAgICAgICAgICAgICAgIGlmICh0eXBl
ICE9IEdFVF9TVU1fVFlQRSgoJnN1bS0+Zm9vdGVyKSkpIHsKPiA+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBmMmZzX2VycihzYmksICJJbmNvbnNpc3RlbnQgc2VnbWVudCAoJXUpIHR5cGUgWyVk
LCAlZF0gaW4gU1NBIGFuZCBTSVQiLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGYyZnNf
ZXJyKHNiaSwgIkluY29uc2lzdGVudCBzZWdtZW50ICgldSkgdHlwZSBbJWQsICVkXSBpbiBTSVQg
YW5kIFNTQSIsCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Vnbm8sIHR5
cGUsIEdFVF9TVU1fVFlQRSgoJnN1bS0+Zm9vdGVyKSkpOwo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTVE9QX0NQX1JFQVNPTl9DT1JSVVBURURfU1VNTUFSWSk7Cj4g
Pj4gQEAgLTIwNjgsNiArMjA3NSwxMyBAQCBpbnQgZjJmc19nY19yYW5nZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgLmlyb290ID0gUkFESVhf
VFJFRV9JTklUKGdjX2xpc3QuaXJvb3QsIEdGUF9OT0ZTKSwKPiA+PiAgICAgICAgICAgICAgICAg
fTsKPiA+Pgo+ID4+ICsgICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAgICAgKiBh
dm9pZCBtaWdyYXRpbmcgZW1wdHkgc2VjdGlvbiwgYXMgaXQgY2FuIGJlIGFsbG9jYXRlZCBieQo+
ID4+ICsgICAgICAgICAgICAgICAgKiBsb2cgaW4gcGFyYWxsZWwuCj4gPj4gKyAgICAgICAgICAg
ICAgICAqLwo+ID4+ICsgICAgICAgICAgICAgICBpZiAoIWdldF92YWxpZF9ibG9ja3Moc2JpLCBz
ZWdubywgdHJ1ZSkpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPj4g
Kwo+ID4+ICAgICAgICAgICAgICAgICBpZiAoaXNfY3Vyc2VjKHNiaSwgR0VUX1NFQ19GUk9NX1NF
RyhzYmksIHNlZ25vKSkpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
Pj4KPiA+PiAtLQo+ID4+IDIuNDkuMAo+ID4+Cj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+
ID4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
