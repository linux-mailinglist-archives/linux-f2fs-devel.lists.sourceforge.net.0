Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6C215367
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 09:42:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsLm9-0004Z2-Oy; Mon, 06 Jul 2020 07:42:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jsLm8-0004Yk-65
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pENYfYAQF+8npVfVkVul/DAhNT5a/udz5MXDPHzE0/E=; b=kiCxrxZ4PRGbdqkI6LA8Fac8qQ
 xwrLodSQQi++tiFx+2HlT4jQYpR4Hqg+rM8DuV3lQuPjqgmOBQkYfythzP08LKR5ArctLCue3a8m3
 CYhBThu8SFHk2qLltots8DwEOcOSHL8frd8c9X8unb8zCSjk9Z7nVTaUOTU7YocQ52P8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pENYfYAQF+8npVfVkVul/DAhNT5a/udz5MXDPHzE0/E=; b=goFmQrpqERYPbQhp9p0ZMqkRB2
 1Or98u6D2lZiW8yQkpz54/quChU+B0Jmc9kz8fguCs3VMB9cg99WnjaUz3hxfbZrwthtj+REi1Is1
 0b1Z3dge38qKOFZ1FgW72VytzhoeIe4/50u0i7ds58+JEM+HSrhHRFQC6jqw/iWJEhIc=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsLlz-0091Jv-PK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 07:42:51 +0000
Received: by mail-ej1-f65.google.com with SMTP id n26so27440140ejx.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jul 2020 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pENYfYAQF+8npVfVkVul/DAhNT5a/udz5MXDPHzE0/E=;
 b=sxw/b3IdmNHFdpiFJ9tHsU/eJ8Py+gGNc/oQ6YNwelbQMvfql+kcG4G1R/SRH1huAP
 DITAX5skiBsHuu6Q3ctj5YUGm4Zssiwz86Np0QI1HG55eW6IXQ+l15pq2dkCHXOFR8wC
 5adT1cgFEd1R9ow/PmwfVXznXpFvd1dLunPGJmnDSp9XTcc5KQvw3xZV5LQzQyqyeO5G
 qEA51eTStZ/LB2nM7w4KtO+xP1sySzQMbqeBFqXWOv8fwK5PUMeMzhKOTkXiYrwB3jOr
 nyyP1hYOJZXllqVsgwzTK4S3YR2G7ppEArJNm8vF+Wr2onNQ5qUeHrVcu9EJQipb3r26
 3cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pENYfYAQF+8npVfVkVul/DAhNT5a/udz5MXDPHzE0/E=;
 b=Z/FsbLzZr746lM+XVJRYqsl7T/YVLbf3bSjRrqsJfEqNQWTPlSd7GCxmHnZw1o+TyE
 7oHddTMxLowQW36zyKJboFuoX8IwxcRM8gjkL3CFeZuB4O0Faw10sIJQsX3CCmsd/+vB
 /DzEXTlxHHm3P/iBBWn1ZMrbaUe9ByHy35jRHpsw03U6b6ZA4ZBQ9jsOVY72Y0vRRXnf
 MEybGbVVWTv2Whvd6AiBluX9Vl+VFZbi+TWLCw8tfOQptsRGe6JKN9jkaFUlhOqt0m4l
 jIBTk6UsJzjruECQsotApALneYTxSbCUkumakR9c8w4Jz3c4fPAMop9twZ6OOz3m3vmq
 3wsw==
X-Gm-Message-State: AOAM531WkUH632PhwW2bIH46Qp0/DLjiI6bugcNKjcjNNsBBUz53rbEL
 0paF3EStkgUlthO9MISxheIuonsxo6O6EikBeDT0Kbl1
X-Google-Smtp-Source: ABdhPJwU/WBehe6R2pU7PDlBBmWMokE0ldQpXDwkQJ2tzqPvX1FYTreRXHnyalvzP5NBwjiZyBzoYzIcpg0oG+f+2YU=
X-Received: by 2002:a50:9e2e:: with SMTP id z43mr55551064ede.385.1594020902599; 
 Mon, 06 Jul 2020 00:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
In-Reply-To: <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
From: lampahome <pahome.chen@mirlab.org>
Date: Mon, 6 Jul 2020 15:34:54 +0800
Message-ID: <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsLlz-0091Jv-PK
Subject: Re: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPiDmlrwgMjAyMOW5tDfmnIg25pelIOmAseS4gCDk
uIvljYgzOjI55a+r6YGT77yaCj4KPiBPbiAyMDIwLzcvNiAxNToxMCwgbGFtcGFob21lIHdyb3Rl
Ogo+ID4gSSB0cmllZCB0byB0ZXN0ICBwZXJmb3JtYW5jZSB3aXRoIGYyZnMgYW5kIGNyZWF0ZSBt
YW55IGZpbyB0byB0ZXN0IGl0Lgo+ID4KPiA+IEkgZm91bmQgd2hlbiBmaW8gcmVhY2ggYSBudW1i
ZXIoZS5nLiAyNSBmaW8pLCB0aGUgcGVyZm9ybWFuY2UgZGVncmFkZQo+ID4gbm90IGluIHByb3Bv
cnRpb25hbCB3aXRoIHNtYWxsIG51bWJlcgo+ID4KPiA+IEVYOgo+ID4gNSBmaW86IGJhbmR3aWR0
aCAzMDBNQi9zCj4gPiAxMCBmaW86IGJhbmR3aWR0aCAxNTBNQi9zCj4gPiAyNSBmaW86IGJhbmR3
aWR0aCAzME1CL3MKPgo+IFdoYXQncyB5b3VyIGJ1ZmZlciBzaXplIGZvciBlYWNoIGZsdXNoPwo+
CkVhY2ggZmlvIHN1Ym1pdCBibG9ja3NpemU9NGssIGRpcmVjdD0wLCAxR0IgZmlsZS4gU28gYnVm
ZmVyIHNpemUgaXMgNGs/CgpXaGVuIGdyZXAgR0MgYW5kIENQIGluIGYyZnMgc3RhdHVzLCBpdCBz
aG93cyBkaWQgR0MgYW5kIENQIHNvbWUgdGltZXMuCkJ1dCBteSBkaXNrIGhhcyAxMjhHQiBhbmQg
ZWFjaCBmaW8gb25seSB3cml0ZSAxR0IgZmlsZS4KV2h5IGRvZXMgdGhlIGJlaGF2aW9yIHRyaWdn
ZXIgR0MgYW5kIENQPwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
