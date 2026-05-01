Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIcyMaiy9GnVDgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 16:03:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B194AD02A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 16:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuzaAoxDpyhpgVkecX6haGChg7KbtcIbaJJBJ1OB0Gw=; b=LotdI+UVSNrBmlXXRz8z/R/2Z8
	iBhYDEfWRUoKaMArm2hrB+zFk8oeEkkBTrkGwmp5zfLOlKRxBXyHscZK+i1Nk6d1/3iFNk7gPZ502
	Qj25kJKHtF4Qaip5mgcF2UWmdGQ4hmngnTIEib+jBaisz5I+o/HlOQGWLjxH6oW0QXY8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIoSY-0004Tt-GW;
	Fri, 01 May 2026 14:03:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1wIoSX-0004Tj-Rz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 14:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WE2KffefB7v/CoSvBTN8RGfCVWPkrATJQKOrcE1dQ7M=; b=HgM5hgnYP8yPmuoIqxVwByHqRC
 DReuqXqmS6wY4QtzzoECJer6anwadx72gJ04Jmuk1jLp6vUM83b0z6Eys5MNG7zTJwsIZZzKA45EI
 2G7vEjF5ho+v9URrUT2gAKNuAWw+/CS6EAPzw7B9soHwVHEz4JNcATihbhz0/q4HFRHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WE2KffefB7v/CoSvBTN8RGfCVWPkrATJQKOrcE1dQ7M=; b=XOIyEXUiDddZG0+0Xoox530rHH
 BlwwJ2WoAaFq9jBv+m8UG6/7srR4yiH2Q5f/ubD6IO3SAtZLKYe4QF/LtdPDudBPi7KZfOSqtlTXb
 bB+Xh3apFMtafeSdaYZx1t8WnXdrlYyQG8WC2ta2J0C28eOmSdZgb+zKroMRbCfg/OdA=;
Received: from mail-vs1-f50.google.com ([209.85.217.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wIoSW-0006Fa-4R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 14:03:14 +0000
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-612d8a59ca0so1252508137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2026 07:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777644186; cv=none;
 d=google.com; s=arc-20240605;
 b=Zruod/uuT72lZd6znZEjNfjLuZJayl+cYMAOj27fkTSFVT56StuyGrlx7G0Yqf+E3p
 +Bt6Ejzr4C1jI/hOzRg5JY5SHJ0qdn4zQFgmMRUq/NwKMzpiPrl9vreD2oDA0jrpnu05
 T98cGXZzuCYf7dFDH1oPZpFciJz95m/HZFcaW356pSyAeM4yKExG0WouYXu2HvG6NDUK
 aOZeOL8En4foELcP4dwrlT9VYRhzYmO/YoJmXvP5+cIfJCfnXMpppXAH5Vlewu8Qd2Z1
 oS0bDA4tPOp22Sdun/CIIKhzZXMfigr5dGKvezceGrfxUErRC6w9tJPPp8aFOCeAmkfo
 AxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WE2KffefB7v/CoSvBTN8RGfCVWPkrATJQKOrcE1dQ7M=;
 fh=DpN65qerMYeNO5Q6pQGt6eduvovD2Bjr+etlqtXKc+E=;
 b=khslBXSr6d46TCtH3hMRjfIoCEkKtl1tkxP6sld8q9Y4q7SihLyhNjTLfc2xWsc/El
 sHCBoLHVPwJYq3CTkb6IktplJ/NLw2nr1+qMm4sT+n9wqHN0Z4jC3U0Z1vLisk93sk/F
 Ze8C7ZmxhEA72Q5rH893SPprI9wPRsTkheotQQdUm1POYpKX5pWooGD/DYbJDZ3owMCE
 WGCyFrqc+WAhEXQ5bu3tKyDffCF5O3uPo+I5YY2Y7IZujbuxiT7rIf0+4ILlhk723rBm
 YlRoHDJpx0s4/EUG8FjZfDBJs/vcHY1sFBx6OZDEf1ipWu/kKc3yCSliz8nuoArZ70sR
 Mbmw==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777644186; x=1778248986; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WE2KffefB7v/CoSvBTN8RGfCVWPkrATJQKOrcE1dQ7M=;
 b=PbCFZrtMzMLq4rHumm0UVgIymTl57NStlYQtMzyEXtFcDvYVLn+GQ3vus/ZV1SLbV1
 T7VEfAL517929BgcDcmZnoHauMr3Vwo66udHF4tElGt+mNUrBgtBv9SmhfVskr/dXyfn
 dxwelOAe42Gf3993gZ0I2bsC9tQbKC2gFwrT6eLhvnreFzquWTiLS5cdsC0nXNg/y327
 yGwGWxXUKAE+NNpVjTJGLMrnNaSaYRfrB01lUy+U/mBjt0zBwxYZXUUXjLkREpb0P0a9
 xoINiVCy1Jpz/0bik+LOEryb3TJOzDsGGV9tWO6c7QzVKuGFrJHjXHR7N8oJunyo5lhJ
 ALig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777644186; x=1778248986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WE2KffefB7v/CoSvBTN8RGfCVWPkrATJQKOrcE1dQ7M=;
 b=UEilBxyMfSWaQkppkkgEhYnOVCNr9felNuCKR11DJ5zb9XDsV7iwj4t7X6US8eGy1w
 q3u8o3EbFxsqJcXj+khEwBY5Bf0GzFb7/WYRVPK3DCMsB3CVoahVF+LYOWKh/ZmoDtlA
 gYgev+jsZ25F1HXo/YkdgLXLGcg7hl1kzutB8+OeDV4IsYw6Q1k9NdrO5PmIr6o34fDD
 3LpDFuDpZSdUQjfHLLMjfdHPzRMcZk1TnwWq4VTkI/+JADqArh1XzP2Oejry4EyU21yt
 IeEpG6EZTDHqc+yifl8/sq54EjRh6512Zvk3RfXWASNhGrXwibrJm00GHWnqsF2A1hp6
 CeaQ==
X-Gm-Message-State: AOJu0Ywu5GkKh5ebM0kGnQ5Pxfe5VIDpAFirtwuwCSDSWjJV2FSYZPkJ
 BrMCEh3b7RWc2RU7AQoMuv+rgaVA4mULSQT5TtHOCV6U9bAeUVO0QJlWnr+wltRNorzueUIRpwD
 QJcmdCBHDLCq5QToim0xPHOrYCM7D0Nw=
X-Gm-Gg: AeBDieskBv+Wx4UOBrkebRZD6FOsbEeJplbb9asLxDGD0Oec3X5QUfYheuWUwNrHi+O
 F7fPDoRS7bXIfDEV80lRoY2PWV458Qho20YLMWu3n3NrUEtacwGdPDFsqiNzgmIa1hsXbcUuPe7
 AzLkmyVxSotxamayKnsiwfHCrV6PNmNqNGxjk0lftotsoQkSSWziQ7Y6OA7GlhWYJfhW5pq2uEd
 dZvNiVAF/oOShSRaAqJYE62CXqTuHekfwhrf3xbrSlEjxu7vcHNYe6ynK2fskDG7vSFUCUk1q9h
 kb8cVHchgnizDK8xnOGl9YOLWRN/ZHk6ZNeAgKfB1s3TrlNhUcWaafYWTFQmBjzEYyzNmfE3Pf2
 hz+UGAh0=
X-Received: by 2002:a05:6102:5488:b0:602:9977:a4fe with SMTP id
 ada2fe7eead31-62c35546234mr1449757137.19.1777644185846; Fri, 01 May 2026
 07:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260409134630.3693274-1-jaegeuk@kernel.org>
 <20260409134630.3693274-2-jaegeuk@kernel.org>
In-Reply-To: <20260409134630.3693274-2-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 1 May 2026 07:02:55 -0700
X-Gm-Features: AVHnY4KS2QQ6iYy3fqFzk0HOOJiT3JR3J_Hxfgnz5JHYQE8frRsWdTKL4yvCYy4
Message-ID: <CACOAw_zRKLO6JV4mLXKNyRYu=jb7y2TEYpszR9YyzAFW=zCbHA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 9,
 2026 at 6:47 AM Jaegeuk Kim via Linux-f2fs-devel
 wrote: > > We don't need O_RDONLY for fadvise. We don't need O_RDWR for
 fadvise.
 > > Signed-off-by: Jaegeuk Kim > --- > tools/f2fs_io/f2fs_io.c | 2 +- > 1
 file changed, 1 insertion(+),
 1 deletion(-) > > diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c > index 8b9f9 [...] 
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
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.50 listed in wl.mailspike.net]
X-Headers-End: 1wIoSW-0006Fa-4R
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: user O_RDONLY for fadvise
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
X-Rspamd-Queue-Id: 22B194AD02A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,mail.gmail.com:mid]

T24gVGh1LCBBcHIgOSwgMjAyNiBhdCA2OjQ34oCvQU0gSmFlZ2V1ayBLaW0gdmlhIExpbnV4LWYy
ZnMtZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToK
Pgo+IFdlIGRvbid0IG5lZWQgT19SRE9OTFkgZm9yIGZhZHZpc2UuCgpXZSBkb24ndCBuZWVkIE9f
UkRXUiBmb3IgZmFkdmlzZS4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1
a0BrZXJuZWwub3JnPgo+IC0tLQo+ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgYi90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+
IGluZGV4IDhiOWY5ZWYyMmVlZi4uOTRlNjFiODUwOTIzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2Yy
ZnNfaW8vZjJmc19pby5jCj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiBAQCAtNDc0
LDcgKzQ3NCw3IEBAIHN0YXRpYyB2b2lkIGRvX2ZhZHZpc2UoaW50IGFyZ2MsIGNoYXIgKiphcmd2
LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiAgICAgICAgICAgICAgICAgZXhpdCgxKTsK
PiAgICAgICAgIH0KPgo+IC0gICAgICAgZmQgPSB4b3Blbihhcmd2WzRdLCBPX1JEV1IsIDApOwo+
ICsgICAgICAgZmQgPSB4b3Blbihhcmd2WzRdLCBPX1JET05MWSwgMCk7Cj4KPiAgICAgICAgIGlm
ICghc3RyY21wKGFyZ3ZbMV0sICJ3aWxsbmVlZCIpKSB7Cj4gICAgICAgICAgICAgICAgIGFkdmlj
ZSA9IFBPU0lYX0ZBRFZfV0lMTE5FRUQ7Cj4gLS0KPiAyLjUzLjAuMTIxMy5nZDlhMTQ5OTRkZS1n
b29nCj4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
