Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE72C1E62A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Oct 2025 05:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH7LTs5HlHPMHmqwpYR+fblEMz64UzV7tNI5LF4L2zQ=; b=aMHrJ0YqaRAAMc10FXAFhdQwUG
	h02yi/Giak4gw8FMSm5USlKWWAqZ1APrakXqX6jyLlr6ys6SnrT+vbBfCNQId6FjQP1925KYU85Ne
	yzIdmDcY7XsJ6eX1lDu7QtVkp0RjJgFr+1JtnUVvO4EJ/Xavp9jGCRa5sux99k3auwrM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vEKia-000802-KV;
	Thu, 30 Oct 2025 04:57:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <joannechien@google.com>) id 1vEKiZ-0007zt-37
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 04:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkKLavbAnXGp4iDh4iuLam0UMJbgW4T/KH3f7bMUYdA=; b=GFZV9XWXUoALIZuwJAZP9PL0h8
 716vcqfW46abswyRsEVj/k6fIjn1DwnUfLkYRSwa2nsky/JhOL9nC9hvRLdNB8szQggoqyE7ZOhNa
 fw6hkMTm9Flwzu9LLQCTwi0lRvxk99MSD4lBcGboIxAFHyvE1CRN2a3EKVikXRz+ires=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MkKLavbAnXGp4iDh4iuLam0UMJbgW4T/KH3f7bMUYdA=; b=MZUjQiEqhkN1Xzdb5lbRjAYJI2
 fkDX4AjqvpNaZyKYwCea9IJCrpPeZpaDivtEhOSaNeJW4ycE780BptT89Lt35o+Hp9LhdSDJSBfGh
 MIgmaMsw0oz8PzQECVSMvaBR0gFnm4BfcWVEtjhiRcxnfuDD2EEJED+lY8s15mQ6oPWc=;
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vEKiY-00047s-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Oct 2025 04:56:59 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-59415635983so6656e87.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Oct 2025 21:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761800206; x=1762405006;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkKLavbAnXGp4iDh4iuLam0UMJbgW4T/KH3f7bMUYdA=;
 b=dqeX/OJi0+B17iYF4GJ9cZjEANxNyMpPkiJLV4/8aTD3OocW4+Je1YpnkGI2kbGN89
 SNeotmbaLs0bAf4LCbnd6kCifr7hmkyjPfYwu23T8T/d18ZlQkwpaB4lhgmTIXlNhckW
 TCYyLQjk3G2mKMpf1g1wkdYM3XOfZ45xup5PL16koTBdfzl5aXXLTA5dfKD1JFKQcTfS
 D4sk07sqCUbLesbiOBfsF7cuwNfGUOOeDmGbkVAWGmyNOu0RJUnFMDKra47zd8y4OiLN
 GoVIMulzgpvLGGWxbetfJ+ZGJYGw3hUlF0TyIUVAhT6FqAQ1v8SlSSeh1VvNziSXf/Pl
 LiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761800206; x=1762405006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkKLavbAnXGp4iDh4iuLam0UMJbgW4T/KH3f7bMUYdA=;
 b=CvoScsAoHIJGBiOmPv/rkSrCwi07P9/fh7/hmKW6LQe3dbL/szVTF/z/44jhd+d+kp
 Ibwtj3YCzCCpwW6BLXqDstxeznodbBhoglQ2mNW2Hhe2X/6walK2Gg4ClnpQlFZ0RDdL
 vlCXabUgO1JABVrrOQTkfuTBPeRlF1lJzUQ31r9K5Q0dr7pe/ZSdwq+sm7aiVHDSF2vG
 8CYVaQwRi9x61+vL7/Xg7GXGozlfHuoMTEJS9bhPb+35+dY0hFLMAzsH7s8lacAGXw1O
 mhqMBnOsJBsH2/AqW6VI9txE1ifNeJSwyMwApuTRuv5CUF1O33Au47NtSVPo65PzqhqH
 fVlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaSN5qgeTzSSRxpTjmKiGfXJFkM2gBsSc4c85+DNAcN+FxDJMMdaVhlkPXu54O26nRfyD6Q9ZywTXvCzrs6CeS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxX3pEAHyPQCCVrYiKOOa+4c0iVW6/Z/LbSz3Xl8g4rrrBYacx9
 Ym2q6zIGv6p78ay3AmvV59/mY5iNJae1EFXPfO2yv8HxFUGmhrMHa+D4NnrNc5+muxwHAHBscYt
 3cOgZdGpubSQnwt+lEoZhwVMxymfCcWJhbMOxZ2+GI5Okdr5K6zkBPlds
X-Gm-Gg: ASbGnctK851+EiVprhO+CoT3uYldN4Swi/XIpiyZjGlWSWc7AwV5P4stMNGE3FPgdi3
 uMuumuw5go9z0GS/43OIOSOSu6oe3M/gdbeeA2SXW+O8cAaPq5ZcZoHmWOizRkYsCuNsD7ztngu
 GmVLO+OIhGTbUVT/7e6FqfrkMe2DoPKCDNY4yHHiqGK7wl2t6OWaBUyJqXYtrIUx8h0erDkeFhc
 2WQkpiM+9dMH7p6lXnOLzcx5zBinaGw1CGyxBP8wi7T5q/eVahJc4ldX2Ia0D6OwFh1uDgEoPpR
 8loRDqGJAWXzGhlUvISXvqBhjRGzBz/ugLVr
X-Google-Smtp-Source: AGHT+IGSu7+G4WtCEZXo5l3oENt7lnswe7xeyTRaJZa7R94EderqpzhMSFEq5yYmuNdnuUfgtwBO4ipUahHK1HUJgoQ=
X-Received: by 2002:a05:6402:3246:10b0:63c:11a5:3b24 with SMTP id
 4fb4d7f45d1cf-640647b7c7bmr33504a12.1.1761798701754; Wed, 29 Oct 2025
 21:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251029093457.183578-1-joannechien@google.com>
 <1a26766d-311c-460b-b5c3-309750b3f0a1@kernel.org>
In-Reply-To: <1a26766d-311c-460b-b5c3-309750b3f0a1@kernel.org>
Date: Thu, 30 Oct 2025 12:31:24 +0800
X-Gm-Features: AWmQ_bl9Kk7zO-zoZQjVf-Uwev0bGo-dC9FUDBDMShCUIL01t-tNuKbM2V1yDkU
Message-ID: <CACQK4XAuJc2ineHw_PbHWb6ogwac_Z4YW+Cas4UPkWEP0+mqtQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 29, 2025 at 8:02 PM Chao Yu <chao@kernel.org>
 wrote: > On 10/29/25 17:34, Joanne Chang wrote: > > --- > > tests/f2fs/011
 | 5 +++-- > > 1 file changed, 3 insertions(+), 2 deletions(-) > > > [...]
 Content analysis details:   (-7.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.44 listed in wl.mailspike.net]
X-Headers-End: 1vEKiY-00047s-Kl
Subject: Re: [f2fs-dev] [PATCH v1] f2fs/011: use random data to avoid file
 compression
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgODowMuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gT24gMTAvMjkvMjUgMTc6MzQsIEpvYW5uZSBDaGFuZyB3cm90ZToKPiA+IC0t
LQo+ID4gIHRlc3RzL2YyZnMvMDExIHwgNSArKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Yy
ZnMvMDExIGIvdGVzdHMvZjJmcy8wMTEKPiA+IGluZGV4IGMyMWNiNTg2Li43NTY3OWIzNiAxMDA3
NTUKPiA+IC0tLSBhL3Rlc3RzL2YyZnMvMDExCj4gPiArKysgYi90ZXN0cy9mMmZzLzAxMQo+ID4g
QEAgLTM1LDggKzM1LDkgQEAgX3NjcmF0Y2hfbW91bnQgLW8gY2hlY2twb2ludD1kaXNhYmxlOjEw
JQo+ID4gIHBpbmZpbGU9JFNDUkFUQ0hfTU5UL2ZpbGUKPiA+Cj4gPiAgIyBzaW11bGF0ZSBmcmFn
bWVudCBzdGF0dXMgaW4gZjJmcwo+ID4gLWZvciAoKGk9MDtpPDI1NjtpKyspKSBkbwo+ID4gLSAg
ICAgJFhGU19JT19QUk9HIC1mIC1jICJwd3JpdGUgMCAxbSIgJFNDUkFUQ0hfTU5ULyRpID4+JHNl
cXJlcy5mdWxsCj4gPiArZGQgaWY9L2Rldi91cmFuZG9tIG9mPSRTQ1JBVENIX01OVC8wIGJzPTFN
IGNvdW50PTEgMj4gL2Rldi9udWxsCj4KPiBJSVJDLCAkWEZTX0lPX1BST0cgaXMgcHJlZmVycmVk
IGluIHhmc3Rlc3RzIFsxXQo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2ZzdGVzdHMv
MjAyNTAzMjYxNDA5MzguNmxsN3llZXo2aXdhYnZnaUBkZWxsLXBlcjc1MC0wNi12bS0wOC5yaHRz
LmVuZy5wZWsyLnJlZGhhdC5jb20KPgo+IFNvLCB3aGF0IGRvIHlvdSB0aGluayBvZiB0aGlzPwo+
Cj4gZm9yICgoaT0wO2k8MjU2O2krKykpIGRvCj4gICAgICAgICAkWEZTX0lPX1BST0cgLWYgLWMg
InB3cml0ZSAtaSAvZGV2L3VyYW5kb20gMCAxbSIgJFNDUkFUQ0hfTU5ULyRpID4+JHNlcXJlcy5m
dWxsCj4gZG9uZQoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbiwgQ2hhby4gSSB3aWxsIHNlbmQg
djIgd2l0aCB0aGlzIGNoYW5nZSBzb29uLgoKPiA+ICtmb3IgKChpPTE7aTwyNTY7aSsrKSkgZG8K
PiA+ICsgICAgIGNwICRTQ1JBVENIX01OVC8wICRTQ1JBVENIX01OVC8kaQo+ID4gIGRvbmUKPiA+
ICBzeW5jCj4gPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
