Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBCB0B9A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 02:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yg/PCcM4kvDCJAnOIJ1ErCTdjoWEIDIQTQyjhrn1OIQ=; b=VIXDnDSZARVp4uOhuQZKH6Yrtg
	w8DKBeRhmXm2Kgp88C6bmhy69yV0BWAWaY14weTkXtfTTy4Dp4PKgdwN0kNXmQSlrmsX/ImK7pXDm
	wUZwPz756OVqSBe/Ih69Ft/Z4gidmUXWP/Ongn1V+uL+07AjbCRL+W/2fQk0X9O5C/78=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udedr-0007yH-G9;
	Mon, 21 Jul 2025 00:44:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1udeda-0007xw-PW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 00:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=; b=MmOLjhwRCsr/YxGfoa9nEi/OcI
 A4EhAIB9hW1OpdcRSF969DiPCXiAQ8kRPx12qbmKlH77w/NRF51IzVI9NP/HWnV+ag+9+2NztiiIr
 8TNSBJtzzBZJfzLdH+hWHF10nF62/JPi9Xv2gZdF4blmDrAN2/td+76VqbN68yY8JLSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=; b=XbWqwVKAXrvbs77ZSEnY5nNe/p
 Otu+4PUAJVrizZDn5HPGtMy2L7y2Sx0Y3dGrR+/dXbyTVUcYRc0DJtc8E9VCI0o3iMxcW0iAantro
 9zNnw1nw5pTZnN63CNzzP3gWNoLClNcwaEPWmxiBufe89FUciXogCJWsF20S13YEzLnw=;
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1udeda-0002Bn-8p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 00:44:14 +0000
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-8815049d0a8so2062263241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Jul 2025 17:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753058643; x=1753663443; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=;
 b=eMs6/2D++QuCSVUNyxNwCQcDtypg0D6iHMo3zU/FiFcM49+4gdJDc5xwlHNTotCkw5
 yywyodjir1PIcKjI8wFW3C5oHh0UnKdzfM9QS6zLEITfiezgUAbLcYA7UXfkOn4WK6VC
 dllZZQyLuA9vlU6c+kzTR6juXUfoqMefjufBMfD/2rZNWF/cLJZn44tlGbSMOszR2cwo
 /j1zDwPsByhhgXU17hPjp6xWwgQwBbruw3aZDsBQ8GlWXJ0WtP8mxtfqqDEI1lRzEKil
 Me+FS1lLnowYDmLK76+QJUO4FiOTyGj5w8fbWbXq/lgDKoVaKK+0gXq/YveUIgSOj9G7
 1X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753058643; x=1753663443;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=;
 b=cTBom7x2jr+631YZI+kuBRs1QRz5brooNFMGfzDq4Y2baHvBavTdouwqE3Nh2wEnxc
 5oId+736Fv/T58mkiqJnuZ4cG1fyZXTCGcM4zkAcgP0SM16KK7MMLYCYEvSZMup9TgSQ
 t19W4MLqLRfsrCAGgK6v0JGO9WbAG9lKrmlm+sE6CNCglE8WSW88MSZj+nIrmpO4FkdD
 0hZDEVm/M8mgXDEFNVRD/yv74jyTxmfGM28o5cLUmR/wiDzRTkkmlGemprA4gkw3hygs
 1+bN+25kFqJ6RlFrjhTGDugPvBJRZSx0RlS9As9pVlzuH9sQmN3SkuFTfpggz8IX4rvM
 dSNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFZCKzYBSbu1GEff9ZmsWiVy16AM4bJccE7NkIyIFlImwt4hzXSLynd+mAwtLth/EzD61OdwTdHc18pzp1diXr@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzrKy/sbO32y6+RXaxwLfsqwmFljh/cF0bvfGbThBtT3zz2aBOj
 /wn+1bzegoZrX6alg1yyir9oHo5p8OMY7xQLW07CkqJ0Ha2eQWrGP4t6iaLJKax7uYCCn2z6hem
 ZUSRI7fLEUfVlZ1QUrRAtTYlWhdOaFyw=
X-Gm-Gg: ASbGncs9EdTWeIQI46jAEw6mgadN52djAYQ2JjGV3DRtyqX+/0OT1+7PdS1N1yyQS5U
 5kTwOTlch0FYSbpVO9aLXM7gknAiHXZGVPfxsIWUXbU6mBd6o0Hz++pQYYC+3mpVH9cMSfOOgmZ
 GGJlCkcrBs/o7e7tC2PXv2b+c6iu2CTcR5BfGWAHoupN0NSntbDkoF5fGYtAKey28CyHzLU+2yb
 +pL1zg=
X-Google-Smtp-Source: AGHT+IGFRYyrS35WTP3i9Qe8TXmZslY6x6nCRq1gIJA/O9dosgodOs3uPYD7WXYU49lcEb5mCGS05wblqRqGVV/3QiI=
X-Received: by 2002:a05:6102:6316:10b0:4f9:6a91:cc95 with SMTP id
 ada2fe7eead31-4f96a91cec6mr5610145137.27.1753058643165; Sun, 20 Jul 2025
 17:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
In-Reply-To: <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 08:43:51 +0800
X-Gm-Features: Ac12FXzyFbI4GjwypQZFYPLAZaBnNxcXr0fPPaJY0y3WB9_zSNUgD719YOscIeg
Message-ID: <CAGsJ_4wOeBwm2=1CbtZk+gHXe0wVyAYZuV-RZcV-wXe4Rj+h7g@mail.gmail.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 16, 2025 at 7:32 AM Gao Xiang wrote: [...] > >
 I don't see this will work for EROFS because EROFS always supports > variable
 uncompressed extent lengths and that will break typical > ERO [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.46 listed in wl.mailspike.net]
X-Headers-End: 1udeda-0002Bn-8p
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Matthew Wilcox <willy@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Phillip Lougher <phillip@squashfs.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Howells <dhowells@redhat.com>, Nicolas Pitre <nico@fluxnic.net>,
 David Woodhouse <dwmw2@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, Hailong Liu <hailong.liu@oppo.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgNzozMuKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKWy4uLl0KPgo+IEkgZG9uJ3Qgc2VlIHRoaXMgd2lsbCB3
b3JrIGZvciBFUk9GUyBiZWNhdXNlIEVST0ZTIGFsd2F5cyBzdXBwb3J0cwo+IHZhcmlhYmxlIHVu
Y29tcHJlc3NlZCBleHRlbnQgbGVuZ3RocyBhbmQgdGhhdCB3aWxsIGJyZWFrIHR5cGljYWwKPiBF
Uk9GUyB1c2UgY2FzZXMgYW5kIG9uLWRpc2sgZm9ybWF0cy4KPgo+IE90aGVyIHRoaW5nIGlzIHRo
YXQgbGFyZ2Ugb3JkZXIgZm9saW9zIChwaHlzaWNhbCBjb25zZWN1dGl2ZSkgd2lsbAo+IGNhdXNl
ZCAiaW5jcmVhc2UgdGhlIGxhdGVuY3kgb24gVVggdGFzayB3aXRoIGZpbGVtYXBfZmF1bHQoKSIK
PiBiZWNhdXNlIG9mIGhpZ2gtb3JkZXIgZGlyZWN0IHJlY2xhaW1zLCBzZWU6Cj4gaHR0cHM6Ly9h
bmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mva2VybmVsL2NvbW1vbi8rLzM2OTIzMzMK
PiBzbyBFUk9GUyB3aWxsIG5vdCBzZXQgbWluLW9yZGVyIGFuZCBhbHdheXMgc3VwcG9ydCBvcmRl
ci0wIGZvbGlvcy4KClJlZ2FyZGluZyBIYWlsb25nJ3MgQW5kcm9pZCBob29rLCBpdCdzIGVzc2Vu
dGlhbGx5IGEgY29tcGxhaW50IGFib3V0CnRoZSBHRlAgbWFzayB1c2VkIHRvIGFsbG9jYXRlIGxh
cmdlIGZvbGlvcyBmb3IgZmlsZXMuIEknbSB3b25kZXJpbmcKd2h5IHRoZSBwYWdlIGNhY2hlIGhh
c24ndCBhZG9wdGVkIHRoZSBzYW1lIGFwcHJvYWNoIHRoYXQncyB1c2VkIGZvcgphbm9uIGxhcmdl
IGZvbGlvczoKCiAgICBnZnAgPSB2bWFfdGhwX2dmcF9tYXNrKHZtYSk7CgpBbm90aGVyIGNvbmNl
cm4gbWlnaHQgYmUgdGhhdCB0aGUgYWxsb2NhdGlvbiBvcmRlciBpcyB0b28gbGFyZ2UsCndoaWNo
IGNvdWxkIGxlYWQgdG8gbWVtb3J5IGZyYWdtZW50YXRpb24gYW5kIHdhc3RlLiBJZGVhbGx5LCB3
ZSdkCmhhdmUgInNtYWxsIiBsYXJnZSBmb2xpb3PigJRzYXksIHdpdGggb3JkZXIgPD0gNOKAlHRv
IHN0cmlrZSBhIGJldHRlcgpiYWxhbmNlLgoKPgo+IEkgdGhpbmsgRVJPRlMgd2lsbCBub3QgdXNl
IHRoaXMgbmV3IGFwcHJvYWNoLCB2bWFwKCkgaW50ZXJmYWNlIGlzCj4gYWx3YXlzIHRoZSBjYXNl
IGZvciB1cy4KPgo+IFRoYW5rcywKPiBHYW8gWGlhbmcKPgo+ID4KPgoKVGhhbmtzCkJhcnJ5CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
