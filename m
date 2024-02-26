Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9248A8680A0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 20:15:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1regRC-0001VT-St;
	Mon, 26 Feb 2024 19:14:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1regR9-0001VJ-Pr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 19:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jv6aSpqwkNWbv+z1s8rPN96Z6OiyBRL3D8M6WOHcqqo=; b=Q+Wg1Gc6CmxzWiqeQ+ctgysitM
 dUOyMNfpyu9QUeCyZd0+v5cV96Y7F9JY+k/WB+gU8Q/BE+BmykGfd8EjWLRwI+8IQnOSflDR7Nrn/
 Iw2JAnpgEYl0BX3qstTw39BaG+/sqUgT6g/ejgmnvx7vbA4Ri6GCDw8Oowc02DHIhrhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jv6aSpqwkNWbv+z1s8rPN96Z6OiyBRL3D8M6WOHcqqo=; b=EnbAKZDvsWke1Rk6MP+NUDFWtG
 dEax0igM1qjqbUpBZ8J1j0I/EeUZoFEgoGbE1/dR1o5BusdWszb595gIDP6K1lf4VAF31NuTF/UdV
 dW6pnNW2bRZdxaEol0ocAv20PW6ZEgvlN3sDqsbqPJVfbqbcNWMaW3vOBdLj8I1qFrqw=;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1regR9-00085z-7x for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 19:14:51 +0000
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-7d2a78c49d1so1957382241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 11:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708974885; x=1709579685; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jv6aSpqwkNWbv+z1s8rPN96Z6OiyBRL3D8M6WOHcqqo=;
 b=i3QrXpuvM+qanvbC7SAuD86VelL2dVdVCfKncSogovHf70gZF0vz3iDOIEP1jQby3h
 u2bCZ2OQUdMZHNyYlm15lkL8vSkFve3rqkTgay9J8yFCCN1uH4fChdHpgio1y9zpY/Wt
 rruiPZvYJ9UE0SihmRwY5rTUtRI2sMO0OQHI7ZUZqf1YE7E3o+jo7fKMtXfA1ahOsXP1
 mGLGzwRQ5OHyLDyU/jvv7lWVXT+wahGOJEfDK98VIO6Tk6Dvka8EHvq6AB3VJk4v8xU2
 FZjxd5ByKvXP/FzsAT30zae66Sn4HAPhXo+HF5/0ZedfKvpXtiTQlXcrUmeQm+4nJfsc
 5Zww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708974885; x=1709579685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jv6aSpqwkNWbv+z1s8rPN96Z6OiyBRL3D8M6WOHcqqo=;
 b=vCagWQU37PhFEQb5zn2Nk3ePGvZZLEC4c31lCgs/Yu9QT7Uxo4X8Vq8tR3eH8wmeGI
 XwGOTqg1iNnn881e4LjEHEH6MIJtxUEu+bTB5yolXYL4Wn/horRuFZZoi5d4a53ZU8HS
 0rzR6q6CNSwgJWbMNSXuZwKD/YGzNM4hzoS9BXOoGo5ryJzvgokCMrFh7oxO/D3UboFR
 2IQUa1XCNwU+/xu34HQx/v8iCCXcAVcynS2G18+RHiQEy8xAaxTz7eLa1MfRfpBVTifg
 /KRXR7Cs3Oo4ktz8IAevgRWwQzDEpBJyUObI8KkZMB10axtY3kwDrP7AB13cYbxg8X5M
 JsHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmdXYUMxdAAE793+N2MjBFE5kCFnAb1GdF3b4UpZdz08rsMgGxPYzHhy8UtbazAQJr8EgZgNsAWVg04onvLRDcy716RfZmlU37VEFb4ss9BqMlCMYW7A==
X-Gm-Message-State: AOJu0YyTK5UPZviHnXaNswzkbVha7iqOqOwjDtKnlGvqjsUtAnOU7y0c
 4q4QKpeu8Aw/zyLtHfHMH81t04dlwTiAUMAyR73+Erfhu9TzCYys7YeAxdjC9WciMUVkx93DaXC
 Ejmw2xe30enFN9FKyHgDbnXWmzR4=
X-Google-Smtp-Source: AGHT+IG4HMyuPvsgf2ypPDH5IWt+1vACdKWfyU0vJS8MldIFTQ7IljaZ+vGZ8uAHsudvy6ILuzrJIW5aa8R3jJZ7IIw=
X-Received: by 2002:a05:6102:22d5:b0:470:62cc:6306 with SMTP id
 a21-20020a05610222d500b0047062cc6306mr5149938vsh.6.1708974885241; Mon, 26 Feb
 2024 11:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20240223205535.307307-1-jaegeuk@kernel.org>
 <20240223205535.307307-4-jaegeuk@kernel.org>
 <6b2854fd-8999-4671-a243-d78139f8a40f@kernel.org>
In-Reply-To: <6b2854fd-8999-4671-a243-d78139f8a40f@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 26 Feb 2024 11:14:34 -0800
Message-ID: <CACOAw_x6VLaR0SZQqxdPuB=oggyrq+dTQDn+w+84fHSv_Ta17Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Sun, Feb 25, 2024 at 6:59 PM
    Chao Yu wrote: > > On 2024/2/24 4:55, Jaegeuk Kim wrote: > > Don't get stuck
    in the f2fs_gc loop while disabling checkpoint. Instead, we have > > a time-based
    manag [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.41 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1regR9-00085z-7x
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: prevent an f2fs_gc loop during
 disable_checkpoint
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBTdW4s
IEZlYiAyNSwgMjAyNCBhdCA2OjU54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90
ZToKPgo+IE9uIDIwMjQvMi8yNCA0OjU1LCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IERvbid0IGdl
dCBzdHVjayBpbiB0aGUgZjJmc19nYyBsb29wIHdoaWxlIGRpc2FibGluZyBjaGVja3BvaW50LiBJ
bnN0ZWFkLCB3ZSBoYXZlCj4gPiBhIHRpbWUtYmFzZWQgbWFuYWdlbWVudC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+Cj4gUmV2aWV3ZWQt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPgo+IFRoYW5rcywKPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4g
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
