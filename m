Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89AAD5985
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 17:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d6DHHyGjopPZrm+eoMEGUt8GU7LJGL6i35wi/SiLSM=; b=mzvq8d7+xJ5Y/Ns3wfPsVkfHr2
	3/HY1paNE60bSy2TWyU7lqFXE7dEXV7b0odL+8Bfa6yj6XqpbWoYOIBd4LbzM7jHJXY4sTOVW8r5h
	wyANUu9HBahFwonwg/HqxNmHolatzHdnpZLcgz3M6/jtOmf3kkIa3boIkv09weJlmYMo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPN0c-0007PE-Mn;
	Wed, 11 Jun 2025 15:04:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nogikh@google.com>) id 1uPN0b-0007P6-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 15:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eMCP5+i49Ei6OGx1t9OxUl2Teswzg233SMev8hs02gA=; b=D+4Zw6qK4bsYVATHj7tcLqW4M4
 sl0vDQZ5bSV7jMGGli4FThbiw6h4I3mWnvBbD4IOTAMMbxEW4yhl+BAiDP3zHrc3h3NG4MRIE0w5G
 tdyL70HhrKCIRNMQ35W9jAs6GuWq0mRvj1psGGOwphBsRSDWqrUA4IQMO0b8qa1kkbcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eMCP5+i49Ei6OGx1t9OxUl2Teswzg233SMev8hs02gA=; b=Xc7iwh2w019Bb0bCdWvLiIlrRU
 cZJTYs1uG64QR9glF2W/BmvjnP1eIFLkYcQa7M8L8YvO1JfD/WRVz0WlJ5j/ElxnBHdVD70aWAHyM
 +1UDjWZ7SZJvkHCbpB5q/MUl7uuczArr4LNck0I1Y2pvhwD4A521pFopxRJMdnAvP1L0=;
Received: from mail-yb1-f173.google.com ([209.85.219.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uPN0a-0004ON-Jb for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 15:04:57 +0000
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e740a09eb00so5268639276.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jun 2025 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749654286; x=1750259086;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMCP5+i49Ei6OGx1t9OxUl2Teswzg233SMev8hs02gA=;
 b=YuY/3mYShkRdmcpKC0iwsPgjbVCuc/CyNLrfDXKLbF5Ar6X42DGRdMGtAbXi3A2SEr
 96BMlCVoSZwTbLT2r+wq0gx0WV/RjQYwKu5k3o5lbsGGsQQX/FCkZZNdd73O/NjE7Pfe
 UiCOd5K/RLS6dI+hmMery964qR83VwiZXEQ8OXgP50w5Fc4X3XxAPEzV6reDFg5Vru8+
 s5wdSXYfN4Ltx1hSyaJwrNIvkqwi/SYpE+KjYPLLqXRHu7tQoAztFhoEDaB9l1GGFXUF
 XKCuZFOyynHclM6ABR5SlVqSjM5YMn8QWyFARaOJBXfTW5Kko6ITt8f3yJeJo7mH1g8h
 JjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749654286; x=1750259086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eMCP5+i49Ei6OGx1t9OxUl2Teswzg233SMev8hs02gA=;
 b=I278BOQOFW+7LwqwJx3XKRJzt5DdlSYngk5svqcriK1icGGzIkmonWziKOG43WQDUE
 +Up0J/k9rZxSCcgVCn84RlP2IDXjLPeOMTIhAh1i06g3nJUfH6NxRDR3Pt3QMs9bn7NN
 xGgKNtX9j6XVsHBahz3LkTJQIYymeOj3vYsFic2ZYmq2I/TLrMkkFRv3rlpL3SP77n95
 24t6290hSdGQxvckAudTAbBDhXZ8xqmnyPg2MfA8JQ5xdxyxFtlzuF4zjE9wudHQnaFu
 A75u18nLfkMbq+v+zwdSGV/hN0av3pFOek6o8KHvVbrew5PphWw5o22BOpqLabvYZ7TO
 Z3kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/IiF0IAdSmymDioYGu3Kw5bOH89MRI0KubaHOwljpo6rL1TNF0bk/qlkGm1iIcWoXE7XhD8LJiCIAwzKxoXzG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxofRgb0LyayL0QEmQCUOAwBycEMndekA4Nlww8+l4brg2H1EXN
 PMsr3ModkDfFleAmXgBFKUhputWTfHG99S2G2cPATCNGKnqONct1lRr2SRMaA8LR82T9r78C0SF
 LK6m44/TXxEj1f3OOBuc+SqPkbfDWA6eJb/zmmhOmHaAHl1tC42IT2V32Nw23Yg==
X-Gm-Gg: ASbGncsAQvPOCompOo7cJtN8fEV4zGTBp13usXTftdfhCGN6o5bUp7AhL029EtBH8Jv
 uG1c7K+Zxq+tx5dAtV79i9XT4JtT7ji/gwUoNXqVr48s5WEs0V9UYP6sF35xzM3oJNUlkbTiULj
 rf5PBDKHvpQS0JuEF/9X2uyA14ZdKI+WlSvtzdG9KRRAYjQsCwcnvcrgKYKarujE//fynKGjFIW
 Q==
X-Google-Smtp-Source: AGHT+IE/zvALO/G36bMoEv9R3dBG9othx0hsbt6Wq2S7X1wCHNt0X1XpaAnFyLsBZjSEIc47LngfEr1Y5l2TxATtW/4=
X-Received: by 2002:a17:90b:3c0b:b0:312:1dc9:9f64 with SMTP id
 98e67ed59e1d1-313af26720fmr4514767a91.31.1749650910565; Wed, 11 Jun 2025
 07:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <67b75198.050a0220.14d86d.02e2.GAE@google.com>
 <683b8ea2.a00a0220.d8eae.0020.GAE@google.com>
 <aDueHCMDLPs2UtY2@casper.infradead.org>
In-Reply-To: <aDueHCMDLPs2UtY2@casper.infradead.org>
Date: Wed, 11 Jun 2025 16:08:18 +0200
X-Gm-Features: AX0GCFtUWXqinF3FxOk9yB1Et5-WWvCDPttaSsMJxKkZJmtGttcHC7lVof6yARE
Message-ID: <CANp29Y5H3VTZAVZjde5bVRajDUESAnCX+6H1wD90ArpT=EiU3Q@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jun 1,
 2025 at 2:26 AM Matthew Wilcox <willy@infradead.org>
 wrote: > > On Sat, May 31, 2025 at 04:20:02PM -0700, syzbot wrote: > > syzbot
 has bisected this issue to: > > > > commit 80f31d2a7e5 [...] 
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.173 listed in wl.mailspike.net]
X-Headers-End: 1uPN0a-0004ON-Jb
Subject: Re: [f2fs-dev] [syzbot] [netfs?] kernel BUG in folio_unlock (3)
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
From: Aleksandr Nogikh via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Aleksandr Nogikh <nogikh@google.com>
Cc: v9fs@lists.linux.dev, hdanton@sina.com, syzkaller-bugs@googlegroups.com,
 asmadeus@codewreck.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, dhowells@redhat.com,
 syzbot <syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com>,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBKdW4gMSwgMjAyNSBhdCAyOjI24oCvQU0gTWF0dGhldyBXaWxjb3ggPHdpbGx5QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMzEsIDIwMjUgYXQgMDQ6MjA6MDJQ
TSAtMDcwMCwgc3l6Ym90IHdyb3RlOgo+ID4gc3l6Ym90IGhhcyBiaXNlY3RlZCB0aGlzIGlzc3Vl
IHRvOgo+ID4KPiA+IGNvbW1pdCA4MGYzMWQyYTdlNWY0ZWZhNzE1MGM5NTEyNjgyMzZjNjcwYmNi
MDY4Cj4gPiBBdXRob3I6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gRGF0ZTog
ICBUaHUgTWF5IDggMDU6MTQ6MzIgMjAyNSArMDAwMAo+Cj4gVGhhdCdzIG5vdCBwb3NzaWJsZTsg
dGhpcyBjb21taXQgaXMgYWZ0ZXIgdGhlIG9yaWdpbmFsIHJlcG9ydC4KPgo+IFRoYXQgc2FpZCwg
dGhlcmUgX2lzXyBhIGRvdWJsZSBmb2xpb191bmxvY2soKSBpbiB0aGlzIHBhdGNoLCB3aGljaAo+
IEknbSBhYm91dCB0byBzZW5kIGEgZml4IGZvci4gIEl0J3MganVzdCBub3QgZml4aW5nIHRoZSBv
cmlnaW5hbCByZXBvcnQuCj4KClRoYW5rcyBmb3IgYnJpbmdpbmcgdGhpcyB1cCEKVGhlIHVuZGVy
bHlpbmcgcHJvYmxlbSBpcyB0aGF0IHN5emJvdCBoYXMgbWVyZ2VkIHNldmVyYWwgdW5yZWxhdGVk
Cmtlcm5lbCBjcmFzaGVzIGludG8gb25lIGJ1ZyByZXBvcnQgKGBrZXJuZWwgQlVHIGluIGZvbGlv
X3VubG9ja2AgaXMKanVzdCBhIHRvbyBnZW5lcmljIHRpdGxlKS4gVGhlIHJlcG9ydGVkIGJpc2Vj
dGlvbiByZXN1bHQgc2VlbXMgdG8gYmUKY29ycmVjdCwgYnV0IGl0IHJlZmVycyB0byBvbmx5IG9u
ZSBvZiB0aG9zZSBpbmNvcnJlY3RseSBtZXJnZWQgYnVncy4KCkkndmUganVzdCBzZW50IGEgZml4
IGZvciB0aGUgc3l6Ym90J3MgY3Jhc2ggcmVwb3J0IHBhcnNpbmcgY29kZSBbMV0uCkl0IHdvbid0
IGFmZmVjdCB0aGlzIHNwZWNpZmljIGJ1ZyByZXBvcnQsIGJ1dCBvbmNlIHRoZSBuZXcgY29kZSBp
cwpkZXBsb3llZCwgc3l6Ym90IHdpbGwgcmUtcmVwb3J0IHRoZSB0d28gdW5kZXJseWluZyBmaW5k
aW5ncwpzZXBhcmF0ZWx5LgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUvc3l6a2FsbGVy
L3B1bGwvNjA4MQoKLS0gCkFsZWtzYW5kcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
