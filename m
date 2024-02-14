Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD58540AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Feb 2024 01:06:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ra2mm-0004eJ-Ip;
	Wed, 14 Feb 2024 00:06:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ra2ml-0004eD-FN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 00:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BSt3GiZCKaRcl2eiRYv+gZ5s1RuekrTC9HOKi3Y0FE4=; b=doKKFx8a2uitqEwQ8Z1HE/YaDU
 +HOOLGljroHyqQ6khqQww24B9zzVYs8/MjnPZlvGAq08HJ6ABWu4mrPROEMPafibVwwBrx0JvCq64
 tCsBYH+IgWj+Naimv0/P2rODykRptJr2evdyLcmXyf6MHn1j52Izp4okkw7CoebvJjYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BSt3GiZCKaRcl2eiRYv+gZ5s1RuekrTC9HOKi3Y0FE4=; b=lI/7V8qKAPwk7+N0skLiRfyxL8
 B+00sBTwBPwKf81YYofcljKPhIWWhtdc43Ck4IMF0iR47XbZ/P0CiLQJvk+lwj62v8O2RHJjaYrxL
 u14gViiq0JQkoqjg7tnV4BKnnhm+9rEWlitjMPJLusGZGBWGf/KbSugsAUEdEvOmF3lI=;
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ra2mj-0004qq-RU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Feb 2024 00:06:00 +0000
Received: by mail-ua1-f53.google.com with SMTP id
 a1e0cc1a2514c-7d5c40f874aso1984411241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Feb 2024 16:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707869152; x=1708473952; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSt3GiZCKaRcl2eiRYv+gZ5s1RuekrTC9HOKi3Y0FE4=;
 b=ZL3HPWkRLazSCksbYaJQ/a+C7+CJvBnBB/c5gUwZ7Q0cy78bzPsJWO3pLP9H8KdeRt
 8YUdUBgtxw8voTjGEAHt1CjgBRW6QBo1VLhtlXOw2SuolzjHPkXpV80Uu+wI8E4VyvcV
 ux8lB0BByn8DFYcOjGSfCOtU9PiCv5om57+kfaJFPo3DmQimoviqj/KXuV73OKh5A2zW
 Vb29uBbKvNCuAaGDJ5M/ICGQ3SZKRs50hctB+v5T3Dgpcl9zfjTn1HGpCU9ixbT2XIls
 mtqs+zom8zyDlQr5F4yp5yzT5SHxRAdfhPkaaj4GwJhFwJNnrD2lkkiICAOPQnaHxBNI
 1d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707869152; x=1708473952;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSt3GiZCKaRcl2eiRYv+gZ5s1RuekrTC9HOKi3Y0FE4=;
 b=iU3zLYbLNhbjJ99FdYaM4pswJu3Q1FvjYDddSUFiyOYJFG489OCA2pQdAF3Mc12l3x
 rRvhf2VorRGnDpcX38mtTICeoWg+BA+PGOy2MIhyRcgeEwRqak4b+YpLuRQKsf1IYYEW
 XTDtTwAOGMFoBD2KUsqeLXZK1ZHTlsIzP1h+pV63rjFl+SLHT2E/4XO9o0oh3wX9mqAV
 nw2aOANrcAKFxPCc6eSzZIByJ0U11kAOZhm9DxTAu/WjJOnHT3fMSsCd7id2+H+Y7MEs
 ESut9MKV3Qqec5AnLuycSh6jYMFhGX2d405k1Kkor9bvN0hPis7E9oofdqy/TEzngSU/
 nrqQ==
X-Gm-Message-State: AOJu0YymVVZ/9Aob/SVi3KUF6uAjVn288iTitRbpJ3bpWQYKEEtFJJLT
 V7XElM6xL/swH6FglW97MgMrN8QpfThACMtjRrqAfqeyQIDpVz/ZYYEOBXtD9rYoWhDbg0GopIc
 wjfIdmhp5415/i6K0WP27HQ/2D86MkjqoM0E=
X-Google-Smtp-Source: AGHT+IFGcf6yK1LDOs8zHwRh9EA2tD3feOVs4wOeSVMELq4dwh88xJx9YakwZ0HOplN6gmduV1T6vL2203x5iVDi9OM=
X-Received: by 2002:a67:ff02:0:b0:46e:c3d2:6e18 with SMTP id
 v2-20020a67ff02000000b0046ec3d26e18mr1176338vsp.23.1707869152614; Tue, 13 Feb
 2024 16:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20240213234100.2445417-1-jaegeuk@kernel.org>
In-Reply-To: <20240213234100.2445417-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Feb 2024 16:05:41 -0800
Message-ID: <CACOAw_xbxuc0eYEpK8n2FZS_Ad6KpqKrJewd3WOqyRAoKzfAhQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Tue, Feb 13, 2024 at 3:42 PM
    Jaegeuk Kim wrote: > > When we turn on sparse_mode, stat() will be failed,
    as the file will be > created afterwards. Let's fix. > > Fixes: 14197d546b93
    ("f2fs-tools [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.53 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ra2mj-0004qq-RU
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: fix sparse_mode case on stat
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

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBUdWUs
IEZlYiAxMywgMjAyNCBhdCAzOjQy4oCvUE0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBXaGVuIHdlIHR1cm4gb24gc3BhcnNlX21vZGUsIHN0YXQoKSB3aWxsIGJl
IGZhaWxlZCwgYXMgdGhlIGZpbGUgd2lsbCBiZQo+IGNyZWF0ZWQgYWZ0ZXJ3YXJkcy4gTGV0J3Mg
Zml4Lgo+Cj4gRml4ZXM6IDE0MTk3ZDU0NmI5MyAoImYyZnMtdG9vbHM6IGZpeCB0byBjaGVjayBs
b29wIGRldmljZSIpCj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVs
Lm9yZz4KPiAtLS0KPiAgbGliL2xpYmYyZnMuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvbGliZjJmcy5jIGIvbGliL2xpYmYy
ZnMuYwo+IGluZGV4IDVjNmM1YjdiZjhhNy4uZDUxZTQ4NTM2MWVlIDEwMDY0NAo+IC0tLSBhL2xp
Yi9saWJmMmZzLmMKPiArKysgYi9saWIvbGliZjJmcy5jCj4gQEAgLTgxNCw2ICs4MTQsOSBAQCBp
bnQgZjJmc19kZXZfaXNfdW1vdW50ZWQoY2hhciAqcGF0aCkKPiAgICAgICAgICAqIHRoZSBmaWxl
IHN5c3RlbS4gSW4gdGhpcyBjYXNlLCB3ZSBzaG91bGQgbm90IGZvcm1hdC4KPiAgICAgICAgICAq
Lwo+ICAgICAgICAgaWYgKHN0YXQocGF0aCwgJnN0X2J1ZikpIHsKPiArICAgICAgICAgICAgICAg
Lyogc3BhcnNlIGZpbGUgd2lsbCBiZSBjcmVhdGVkIGFmdGVyIHRoaXMuICovCj4gKyAgICAgICAg
ICAgICAgIGlmIChjLnNwYXJzZV9tb2RlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IHN0YXQgZmFpbGVkIGVycm5vOiVk
XG4iLCBlcnJubyk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiAgICAgICAgIH0KPiAt
LQo+IDIuNDMuMC42ODcuZzM4YWE2NTU5YjAtZ29vZwo+Cj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
