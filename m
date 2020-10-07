Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 297FD2857BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 06:27:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQ13I-0003MY-UN; Wed, 07 Oct 2020 04:27:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kQ13I-0003MS-9C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 04:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sUSZKx+gAK2d8TpziPDTnI010bDZH5RIn0lG0CrorxI=; b=L6Us+HbJxnzDITuDdjZhwtijIY
 oVC6dOxU4n+43p2LUrPnHkBYfNk26nYOUn9Qv80LPptmc+njXzjJLxSEHqlUghVBoGsEvLQqD/F9y
 eMJk9PpeGV3ow6T8Q8cKzHivcl6w6HHlP4V1n+Q4IROR6+dJMN0NO9443A0ANcaLdSmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sUSZKx+gAK2d8TpziPDTnI010bDZH5RIn0lG0CrorxI=; b=QsJdVvzsSZCaoFJMDpwf08F6OP
 6p6h5bV2ja9Nyen3e978zmA3JpFxAkeKxdBo10uidhfcvD8jUutasBdxMjKwvwO5pKT1nZK1c6NEU
 B7ZHXU0Dik+5mfdX1Aq99MmSaa7uiiZKbX1ZYa/OhzIHEZl1+wTNgokkfW7K70AgR2Gg=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQ135-001h7E-FI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 04:27:44 +0000
Received: by mail-lf1-f66.google.com with SMTP id b12so705479lfp.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Oct 2020 21:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sUSZKx+gAK2d8TpziPDTnI010bDZH5RIn0lG0CrorxI=;
 b=EhToGAaEsGAqO68+MxGfBW8HsmilYDiQnH5ejOkdoO8NVh2+yc/e6/7tOvK5uKE+mQ
 p30LDK2A2b8CXeCbGyLeBHGKADkuftlCwmR024aQHG81Uw6a0dWfA3mJyVSxnGfiLHS2
 zjCgpzm9BQHmxPtTB0IaaixtQgKdx7j7Ju75AnonGE/E75JyD34+PoQPrBFa0cw676eI
 1NcbK3BI2VB3Y3OKb/02Ym+diAk9Q05l0BHUTaGOScoN+Zy/pDUH0CAPgdhlEfBpZ8LY
 DQt92H++HWhYBcRWFFgx9itGkZb+jX5Ds4guywwixbPv4sLqx1ve+BPOAJNoeLnpoRTS
 m/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sUSZKx+gAK2d8TpziPDTnI010bDZH5RIn0lG0CrorxI=;
 b=tuHFKPaeqo3D4PlPJIo3rAtxMIWRJVd+CX0HwSgvp59zB0aFKe6JlMzP8kwhWySpTs
 v9YStmDAbpFAPt0OekRB61dvOCDLC2HYxigewz3ZEBiZ/jvKCPNgfNmxOIQloPOrtod4
 WwXE/8byuPJyax20k97Wd1yatSiIo804MwS1PlMDSsJPVinAeDimi/TQPwABz7Z0vmQ1
 LyQSL+S/NbeLZt2BrtJwnH7KVNqkwWQ9DwtNemQbUTPOlEEaG6twO+fzMEVn5Hm553Kh
 ZF+1lTv/HZi/O6E6BQ6bSVSYvg6WPFK51qtyXdF2DReF3D255G3jFj5KUUv9Cx0y3gsX
 eDpw==
X-Gm-Message-State: AOAM531yAoJV7L4YUlC+c6uQkLVxWvKycpG1AzgQdR+T2fyd4Yw2nzQb
 eqAAU93zZ4VJ7wxibroDDdtbBJ6WV2/0IpOKcek=
X-Google-Smtp-Source: ABdhPJyUDcHzDGEc1CwuNP8Hyo/bka2ZO6QsyZpz2VRXt7oWU2vzx59FQfJBikHOHgajYTY72TQ2Uw8SXUGTV8CsHk4=
X-Received: by 2002:a19:e042:: with SMTP id g2mr309118lfj.122.1602044844482;
 Tue, 06 Oct 2020 21:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201001002508.328866-1-ebiggers@kernel.org>
 <20201007034829.GA912@sol.localdomain>
In-Reply-To: <20201007034829.GA912@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 7 Oct 2020 13:27:13 +0900
Message-ID: <CACOAw_xO83YJjDoAK3O7aCK53pEihg=fTp-bMgkDsVM9_rMwEg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
X-Headers-End: 1kQ135-001h7E-FI
Subject: Re: [f2fs-dev] [PATCH 0/5] xfstests: test f2fs
 compression+encryption
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
Cc: Daeho Jeong <daehojeong@google.com>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBXZSBoYWQgYSBsb25nIGhvbGlkYXkgbGFzdCB3ZWVr
LgpUaGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZX4KClRoYW5rcywKCjIwMjDrhYQgMTDsm5QgN+yd
vCAo7IiYKSDsmKTtm4QgMTI6NDksIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz7r
i5jsnbQg7J6R7ISxOgo+Cj4gT24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDU6MjU6MDJQTSAtMDcw
MCwgRXJpYyBCaWdnZXJzIHdyb3RlOgo+ID4gQWRkIGEgdGVzdCB3aGljaCB2ZXJpZmllcyB0aGF0
IGVuY3J5cHRpb24gaXMgZG9uZSBjb3JyZWN0bHkgd2hlbiBhIGZpbGUKPiA+IG9uIGYyZnMgdXNl
cyBib3RoIGNvbXByZXNzaW9uIGFuZCBlbmNyeXB0aW9uIGF0IHRoZSBzYW1lIHRpbWUuCj4gPgo+
ID4gUGF0Y2hlcyAxLTQgYWRkIHByZXJlcXVpc2l0ZXMgZm9yIHRoZSB0ZXN0LCB3aGlsZSBwYXRj
aCA1IGFkZHMgdGhlCj4gPiBhY3R1YWwgdGVzdC4gIFBhdGNoIDIgYWxzbyBmaXhlcyBhIGJ1ZyB3
aGljaCBjb3VsZCBjYXVzZSB0aGUgZXhpc3RpbmcKPiA+IHRlc3QgZ2VuZXJpYy82MDIgdG8gZmFp
bCBpbiBleHRyZW1lbHkgcmFyZSBjYXNlcy4gIFNlZSB0aGUgY29tbWl0Cj4gPiBtZXNzYWdlcyBm
b3IgZGV0YWlscy4KPiA+Cj4gPiBUaGUgbmV3IHRlc3QgcGFzc2VzIGJvdGggd2l0aCBhbmQgd2l0
aG91dCB0aGUgaW5saW5lY3J5cHQgbW91bnQgb3B0aW9uLgo+ID4gSXQgcmVxdWlyZXMgQ09ORklH
X0YyRlNfRlNfQ09NUFJFU1NJT049eS4KPiA+Cj4gPiBJJ2QgYXBwcmVjaWF0ZSB0aGUgZjJmcyBk
ZXZlbG9wZXJzIHRha2luZyBhIGxvb2suCj4gPgo+ID4gTm90ZSwgdGhlcmUgaXMgYSBxdWlyayB3
aGVyZSB0aGUgSVZzIGluIGNvbXByZXNzZWQgZmlsZXMgYXJlIG9mZiBieSBvbmUKPiA+IGZyb20g
dGhlICJuYXR1cmFsIiB2YWx1ZXMuICBJdCdzIHN0aWxsIHNlY3VyZSwgdGhvdWdoIGl0IG1hZGUg
dGhlIHRlc3QKPiA+IHNsaWdodGx5IGhhcmRlciB0byB3cml0ZS4gIEknbSBub3Qgc3VyZSBob3cg
aW50ZW50aW9uYWwgdGhpcyBxdWlyayB3YXMuCj4gPgo+ID4gRXJpYyBCaWdnZXJzICg1KToKPiA+
ICAgZnNjcnlwdC1jcnlwdC11dGlsOiBjbGVhbiB1cCBwYXJzaW5nIC0tYmxvY2stc2l6ZSBhbmQg
LS1pbm9kZS1udW1iZXIKPiA+ICAgZnNjcnlwdC1jcnlwdC11dGlsOiBmaXggSVYgaW5jcmVtZW50
aW5nIGZvciAtLWl2LWluby1sYmxrLTMyCj4gPiAgIGZzY3J5cHQtY3J5cHQtdXRpbDogYWRkIC0t
YmxvY2stbnVtYmVyIG9wdGlvbgo+ID4gICBjb21tb24vZjJmczogYWRkIF9yZXF1aXJlX3NjcmF0
Y2hfZjJmc19jb21wcmVzc2lvbigpCj4gPiAgIGYyZnM6IHZlcmlmeSBjaXBoZXJ0ZXh0IG9mIGNv
bXByZXNzZWQrZW5jcnlwdGVkIGZpbGUKPgo+IEphZWdldWssIENoYW8sIERhZWhvOiBhbnkgY29t
bWVudHMgb24gdGhpcz8KPgo+IC0gRXJpYwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
