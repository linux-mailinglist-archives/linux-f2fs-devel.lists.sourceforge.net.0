Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D882FFA07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 02:37:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2lOC-0002r3-Cg; Fri, 22 Jan 2021 01:37:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1l2lOA-0002qs-TG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 01:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zSsmz7M3XSK6HCpP5SpXph6fwHlQF1RHiR3CvF0f+mQ=; b=V2mD9xSlF74BFJ1uJjlB4FuUB2
 N2TIAV8240+HqhJml15iVd5Mw1wswqPC3+cJwDgVZFoFUKzq26yTFjOVZEhfFTNS3mOpLZ4/E1VNG
 BUD7NbCZpi4jcBb0tJzYfDVvYk0sV75sw8YhCwdYq07kMKQxuA5blg86IqcQNawF0VIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zSsmz7M3XSK6HCpP5SpXph6fwHlQF1RHiR3CvF0f+mQ=; b=iSjd338Fq9kRsYJseeO4Wr15Fm
 phxUY4kTHRv+sRfUNhAIy54o2dwl+INWsIDk7oi+bvm4ozAdKxYG5ogOn9F6qzUr5ZnunGDAuvAdX
 DtE/Vmoest/aixJXvbpudL0Uzl9saToLxhig37Fm9JYjU7XulFpB+lHZv1JbBvvdlyWY=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2lO0-006vCb-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 01:37:26 +0000
Received: by mail-lj1-f182.google.com with SMTP id x23so4726437lji.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 17:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zSsmz7M3XSK6HCpP5SpXph6fwHlQF1RHiR3CvF0f+mQ=;
 b=kPdBhtV7sb5FmbpskgX47ayA3XzZpJ5sLr7ZfFQ16YmFKe3uuPeDHLlKAiKTyKbytn
 GpXdQKeYqValccp0PzOV9ES0Kap5PeiAXfaG0obsgUetZSHOd+NXcGxOELpamALCiUcw
 XmviFURFgWxBWx3eGtnH7nk9+4ttuO/h7NrKV3MDEXIKBo7dhcWlJPjTa188Y8ZSqFOv
 tVXuzdwmpaAI4wDpujmMWWMKYrzF1pjtjOhblEZdWogxYRUv4l4vsSL+mmC/HjSTyKWv
 alYQfPWGE0Ub4R36MSVmFI/V9PaBqNaftB/nmQO5/iRYAElHJwK+/+cUqfqG6ILw230T
 25LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zSsmz7M3XSK6HCpP5SpXph6fwHlQF1RHiR3CvF0f+mQ=;
 b=ozYAcGy4kF5DH9L5f+XIfiWZSp/mYcP1XNoNcty73XwxBh0FV20uGWGnJ76PC/9VCy
 kFIsOblr3GxIS5maW3cqmAqDMMF+Ew5GzodjHWOILa5Dw6EuReHoOCvbaeBSmDJU6fbY
 dS45Z1aJ8XwFP3Qqla7bss5LzLnEFsPJIU8tnYlslYMGPU2lgwCbAhbehvrl057Cmb8a
 ifVRdO5a+bFI/aeb2TJRwmwR6E6EVGN1TPmt5fSSAM36KIdo7AJmgwxs8ymrOjmuzam5
 WM/DHZP+hyNmFenb9Hy1z+R5VEkZTrsEPy7LQw979Z91dZv0PWCWTdGnurm7CxKvYtly
 5cGA==
X-Gm-Message-State: AOAM531r1wdt36EWo4xMwQyyzU6Mr7aDRIKIUJoZ9cWzwXDbM3uaVGZj
 GgbA2wkAEou9dSxj92LHH48LmMNkBOrZH2/996k=
X-Google-Smtp-Source: ABdhPJzkG8y52oDdMWe+BHOq2aGa4/Niet2z6/DpC1s6GUzZ60Uy5fGhzwpqrcf8kVyaUzS7LNejFdcL8MHbUVpQxvo=
X-Received: by 2002:a2e:b8c5:: with SMTP id s5mr19875ljp.335.1611279429763;
 Thu, 21 Jan 2021 17:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20210121134529.1201249-1-daeho43@gmail.com>
 <6e4996f8-fdf0-93dd-8253-9e8f5e6fca06@huawei.com>
In-Reply-To: <6e4996f8-fdf0-93dd-8253-9e8f5e6fca06@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 22 Jan 2021 10:36:58 +0900
Message-ID: <CACOAw_yDYWw-3f2q_3EoHu8M196KEi=4aNsbbZqXYra=d7ebng@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l2lO0-006vCb-DJ
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce checkpoint=merge
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, Sungjong Seo <sj1557.seo@samsung.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

R290IGl0fiEgOikKCjIwMjHrhYQgMeyblCAyMuydvCAo6riIKSDsmKTsoIQgOTo1NSwgQ2hhbyBZ
dSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBJZiB0aGVyZSBpcyBubyB1
cGRhdGUgaW4gdjUsIGl0IHdpbGwgYmUgYmV0dGVyIHRvIGluY2x1ZGUgbXkgUmV2aWV3ZWQtYnkK
PiB0YWcsIHBsZWFzZSBub3RlIHRoYXQuIDopCj4KPiBUaGFua3MsCj4KPiBPbiAyMDIxLzEvMjEg
MjE6NDUsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmc8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4KPiA+IFdlJ3ZlIGFkZGVkIGEgbmV3IG1vdW50IG9wdGlvbiAiY2hl
Y2twb2ludD1tZXJnZSIsIHdoaWNoIGNyZWF0ZXMgYQo+ID4ga2VybmVsIGRhZW1vbiBhbmQgbWFr
ZXMgaXQgdG8gbWVyZ2UgY29uY3VycmVudCBjaGVja3BvaW50IHJlcXVlc3RzIGFzCj4gPiBtdWNo
IGFzIHBvc3NpYmxlIHRvIGVsaW1pbmF0ZSByZWR1bmRhbnQgY2hlY2twb2ludCBpc3N1ZXMuIFBs
dXMsIHdlCj4gPiBjYW4gZWxpbWluYXRlIHRoZSBzbHVnZ2lzaCBpc3N1ZSBjYXVzZWQgYnkgc2xv
dyBjaGVja3BvaW50IG9wZXJhdGlvbgo+ID4gd2hlbiB0aGUgY2hlY2twb2ludCBpcyBkb25lIGlu
IGEgcHJvY2VzcyBjb250ZXh0IGluIGEgY2dyb3VwIGhhdmluZwo+ID4gbG93IGkvbyBidWRnZXQg
YW5kIGNwdSBzaGFyZXMuIFRvIG1ha2UgdGhpcyBkbyBiZXR0ZXIsIHdlIHNldCB0aGUKPiA+IGRl
ZmF1bHQgaS9vIHByaW9yaXR5IG9mIHRoZSBrZXJuZWwgZGFlbW9uIHRvICIzIiwgdG8gZ2l2ZSBv
bmUgaGlnaGVyCj4gPiBwcmlvcml0eSB0aGFuIG90aGVyIGtlcm5lbCB0aHJlYWRzLiBUaGUgYmVs
b3cgdmVyaWZpY2F0aW9uIHJlc3VsdAo+ID4gZXhwbGFpbnMgdGhpcy4KPiA+IFRoZSBiYXNpYyBp
ZGVhIGhhcyBjb21lIGZyb21odHRwczovL29wZW5zb3VyY2Uuc2Ftc3VuZy5jb20uCj4gPgo+ID4g
W1ZlcmlmaWNhdGlvbl0KPiA+IEFuZHJvaWQgUGl4ZWwgRGV2aWNlKEFSTTY0LCA3R0IgUkFNLCAy
NTZHQiBVRlMpCj4gPiBDcmVhdGUgdHdvIEkvTyBjZ3JvdXBzIChmZyB3LyB3ZWlnaHQgMTAwLCBi
ZyB3LyB3aWdodCAyMCkKPiA+IFNldCAic3RyaWN0X2d1YXJhbnRlZXMiIHRvICIxIiBpbiBCRlEg
dHVuYWJsZXMKPiA+Cj4gPiBJbiAiZmciIGNncm91cCwKPiA+IC0gdGhyZWFkIEEgPT4gdHJpZ2dl
ciAxMDAwIGNoZWNrcG9pbnQgb3BlcmF0aW9ucwo+ID4gICAgImZvciBpIGluIGBzZXEgMSAxMDAw
YDsgZG8gdG91Y2ggdGVzdF9kaXIxL2ZpbGU7IGZzeW5jIHRlc3RfZGlyMTsKPiA+ICAgICBkb25l
Igo+ID4gLSB0aHJlYWQgQiA9PiBnZXJlcmF0aW5nIGFzeW5jLiBJL08KPiA+ICAgICJmaW8gLS1y
dz13cml0ZSAtLW51bWpvYnM9MSAtLWJzPTEyOGsgLS1ydW50aW1lPTM2MDAgLS10aW1lX2Jhc2Vk
PTEKPiA+ICAgICAgICAgLS1maWxlbmFtZT10ZXN0X2ltZyAtLW5hbWU9dGVzdCIKPiA+Cj4gPiBJ
biAiYmciIGNncm91cCwKPiA+IC0gdGhyZWFkIEMgPT4gdHJpZ2dlciByZXBlYXRlZCBjaGVja3Bv
aW50IG9wZXJhdGlvbnMKPiA+ICAgICJlY2hvICQkID4gL2Rldi9ibGtpby9iZy90YXNrczsgd2hp
bGUgdHJ1ZTsgZG8gdG91Y2ggdGVzdF9kaXIyL2ZpbGU7Cj4gPiAgICAgZnN5bmMgdGVzdF9kaXIy
OyBkb25lIgo+ID4KPiA+IFdlJ3ZlIG1lYXN1cmVkIHRocmVhZCBBJ3MgZXhlY3V0aW9uIHRpbWUu
Cj4gPgo+ID4gWyB3L28gcGF0Y2ggXQo+ID4gRWxhcHNlZCBUaW1lOiBBdmcuIDY4IHNlY29uZHMK
PiA+IFsgdy8gIHBhdGNoIF0KPiA+IEVsYXBzZWQgVGltZTogQXZnLiA0OCBzZWNvbmRzCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmc8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogU3VuZ2pvbmcgU2VvPHNqMTU1Ny5zZW9Ac2Ftc3VuZy5jb20+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
