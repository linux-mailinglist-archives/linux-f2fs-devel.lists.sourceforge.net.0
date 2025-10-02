Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B2BB51E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Oct 2025 22:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTkJfuczAoEPIgMf1T9MIkch+SqLoE9HKONeiU8rGwY=; b=mHu6ucB1OtrLZvCh5mKmQq7Sru
	Dqjn4buwvimO63yOXOxQ0N9kvjfBWylly0v4Eo5Bgv7ZfbdXG1QJvSZdo9sC0B6fNnCNs4QtUj0Eo
	j8bBKBR1w6nJozxO5LBOR9nIO9f+p/84qwhDDvQ+0wHnt5cqMm3JDqngXSwp2dtw09EE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4PqY-00028U-85;
	Thu, 02 Oct 2025 20:24:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v4PqW-00028M-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CnqoHX1wLCr2GH1w/VXZguolFxEac8XH6B3cVkslR4w=; b=WWP+comBl1uFG4bPncLnPsl/tm
 eYgUCavVdl2T1jem4wwM1G7LljVOAraOUyvA6nrwvXOPWrpw52E15AibujGqVXs7dtXTPZr3E+6Fp
 1T4rUc5nCY+8qgD6hoo6Dm7jE4hfnPQ3XYPy3gagjCN3hR7AT4gZNEkO6CE9ZQjgl9rY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CnqoHX1wLCr2GH1w/VXZguolFxEac8XH6B3cVkslR4w=; b=YaZpslyxNSop8rEQP/TVg3bTiC
 kvoI0TMMJvtjAnxUibodsDv5mtgtqZ9wBJzVPxpH5ong8LHYyQeSl8emJSNA3P0t6ecEyEEQ0NItC
 vSuqLf9Qt7O6m+ePF0mZEahHzvf/5KGvEcuWX7+rf0Tjw+QcwxmXxBYXcO3+NKyXu2GU=;
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4PqW-0004g6-Cv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:24:12 +0000
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-51d14932f27so737500137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Oct 2025 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759436641; x=1760041441; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnqoHX1wLCr2GH1w/VXZguolFxEac8XH6B3cVkslR4w=;
 b=WyGHNvzzWtrgCjnJ3/jTvlH+HA2gb+wxSQ5E8MjKyTy3O9jgfWe71AchRLnoV3Jsx+
 mAPmJZe8sFJ+vkX+NsSMBMGh0zFmJufXG8YrXkfW967Om+TvvwMkH/ulq7uRL0K424Wn
 uZ0D9XL5MH3yV3C/bDNneFhLQNa3sLLK31xI5ST4ou9eaEod01SjcGcvT5eFXF9zSW1j
 VxBxImg4LWQWFxkxrH3rqK4OuiVN5eLisfGwpCklioIZVuKDX+zi1GBBRrNPSjc6llNa
 JBD/Lz176DdsH2a2JOg7c7bXFWAYDkO00N8Lym6y6upOtqqE430NCHft73GFoTZMTYyy
 Meyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759436641; x=1760041441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CnqoHX1wLCr2GH1w/VXZguolFxEac8XH6B3cVkslR4w=;
 b=mam0xvAdcIvIe9tLVCCwC/aHhq/U5e8tqRZcaGRGR2BThb10L3tzUydwvxFANVuJsj
 SMaL7dU6NciJx0gfPevZX3yS1DYHC+olBRzZM5nWhOwoB+mi4sdMaA8MrFnDAIOIpzsH
 YrUP2vySXrXXHTvgVOij3KyZcvawyB3jy+E+xpMQp2nttpS6JKdv5BRqBPjb68C8ShUs
 bXrb/xkkT8kwa6zbKBSZki2a/fTKPP6bn4L4nf1JrgThVvcDMof03zaaXQhmN4R31r7p
 g635P9VJKGT5gZx4KK07qkedPzgQsJIWNcBk+DZ3mJcESPm8MTDdX6U7ob5n7RzeW1Gl
 koBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnIVX0L0ZYmn0/7dw1AKmpatvf9tYzyxXdZLLBgYoZjmpXSA7Wu53mZHI7qpPdM/ylBXmFRMGUwcIyzU379PQX@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywi1TdqepB5cW2EYEWNMiqNwXpKb7c9kZQ23KhGUG2XHZAU8sAG
 dBTWXWYiqRlvN1GBOE2M3tox1Yn0LQ6pUPiINnb+F11pu5jREiFVvrXAMmjnj3fUIHIZ5dEO1yk
 fYndrbewfcl3age29kZ0NepbHlk174fo=
X-Gm-Gg: ASbGncty9vbFhOtBqQwI7/4bblRdIm9oTN5kCPXhxCV6SrP2Wp/urwB4NK8vC+Dagw9
 2l6WuBp8Z9Ibwg/XAGcf59pmAXtt2FFWR30ZAlJ6F5e6cJz8s+78W2IRsPSucnoztl9nomwsYfd
 SPBYPV+0grzdt2aEQBTQEJCnmsxsAcAEkY5TJbmAevM6qvYiQPZYxIg3KEK5DowmnYz+kig35Na
 wD0cagDH55p/uEOSHakzpaU66Gz6/KiCibP7KVoEh36SOoQk3kcAGoPWZk=
X-Google-Smtp-Source: AGHT+IFX6XXKb8fjFQ+IV0gn4fvOAymA+u5w9F9mOKulkZ8UP3XRd7/6cCFNDpNpMO8a3jqKYd6ajo6xCAE8kRO8/vY=
X-Received: by 2002:a05:6102:3586:b0:57d:c090:dfc3 with SMTP id
 ada2fe7eead31-5d41d1313c8mr202142137.29.1759436641370; Thu, 02 Oct 2025
 13:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251002015645.3588322-1-jaegeuk@kernel.org>
In-Reply-To: <20251002015645.3588322-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 2 Oct 2025 13:23:50 -0700
X-Gm-Features: AS18NWBeh5d2oe6HSgGMtjHMr7ezQBdEvHrcctMdwLhdMAkcDhCj0Mlt8wDrHZo
Message-ID: <CACOAw_yyUJUQ6zzHYy+yFY-bOhQ_=hAnPQ_acuNk4KCaQn-Tvg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 1,
 2025 at 6:59 PM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > We missed to call dput() on the grabbed dentry. > > Fixes:
 f1a49c1b112b
 ("f2fs: show the list of donation files") > Signed- [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.44 listed in wl.mailspike.net]
X-Headers-End: 1v4PqW-0004g6-Cv
Subject: Re: [f2fs-dev] [PATCH] f2fs: add missing dput() when printing the
 donation list
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBPY3QgMSwgMjAyNSBhdCA2OjU54oCvUE0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IFdlIG1pc3NlZCB0byBjYWxsIGRwdXQoKSBvbiB0aGUgZ3JhYmJlZCBkZW50cnkuCj4KPiBG
aXhlczogZjFhNDljMWIxMTJiICgiZjJmczogc2hvdyB0aGUgbGlzdCBvZiBkb25hdGlvbiBmaWxl
cyIpCj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiAt
LS0KPiAgZnMvZjJmcy9zeXNmcy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+
IGluZGV4IDc5OTIzODZmYjllNi4uNmQyYTRmYmE2OGEyIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
c3lzZnMuYwo+ICsrKyBiL2ZzL2YyZnMvc3lzZnMuYwo+IEBAIC0xODQ1LDYgKzE4NDUsNyBAQCBz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGRvbmF0aW9uX2xpc3Rfc2VxX3Nob3coc3RydWN0IHNl
cV9maWxlICpzZXEsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAobG9mZl90KShm
aS0+ZG9uYXRlX2VuZCArIDEpIDw8IChQQUdFX1NISUZUIC0gMTApLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKGxvZmZfdClpbm9kZS0+aV9tYXBwaW5nLT5ucnBhZ2VzIDw8IChQ
QUdFX1NISUZUIC0gMTApKTsKPiAgbmV4dDoKPiArICAgICAgICAgICAgICAgZHB1dChkZW50cnkp
Owo+ICAgICAgICAgICAgICAgICBpbm9kZV91bmxvY2tfc2hhcmVkKGlub2RlKTsKPiAgICAgICAg
ICAgICAgICAgaXB1dChpbm9kZSk7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjUxLjAuNjE4Lmc5ODNm
ZDk5ZDI5LWdvb2cKPgo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KClRoYW5rcywKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
