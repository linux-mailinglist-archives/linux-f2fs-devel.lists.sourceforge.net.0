Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL5YGBXm02n/ngcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:57:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BFE3A57EA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Apr 2026 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgtpDa6sRMLIvFTlUIMuvob1Xn0KlBhMolXkbJKl3nA=; b=IComo90L4sqj76Zg5sPsgxWZLO
	adAjdjMsUOv5Af7Yzm6cNZYW3nAUyK3dJ3dcM+9syOat1AHI1dsnYpg8CzZqPwUMl378rOnWfK2aJ
	C6uQ06I0/SK4awnpzIU0fNrFlpDrmEHNcFgg2zhP5PPm+KZhbWcXlkAUDIpLSr6ZGYts=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w9nGn-0002gZ-DF;
	Mon, 06 Apr 2026 16:57:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w9nGj-0002gQ-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsCqLxZCdmJGQTothhio/Io/8jCzhBFK2ShjqX7+O8c=; b=O+4aFY34+N2GRAvUu3j4sxJZDG
 4E6f7WhsBTQu4rbTfL3+eA12QTsNqIoMIFo84sJ4aL+NxSoCXKez8gyPkPgThNQ1+mDDT8ZDuHdSH
 ejmkvAikGi0TaMm37kXWflfsxNge7VS1bDSZMGMpHSsNmAKwC8AebsWBqZ7A4DdJyPgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wsCqLxZCdmJGQTothhio/Io/8jCzhBFK2ShjqX7+O8c=; b=IDjpC2ehxuTjWRG555oEPOmqTd
 j8fhZsg+gX2njmfxoCR8IDB7Fel6tw6bxoWZoW57e3zwMPenWktEpEZWBqVqV4fYlKwJg6vaAQnae
 OiZZjFpAr2khc5RdEP+q5opTwxWHixi5yGNc8SZHtkGhnU1ToHgxEAgT4Y3c90owYQVo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w9nGi-0004Zc-HB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Apr 2026 16:57:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2AB3600CB;
 Mon,  6 Apr 2026 16:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E03AC4CEF7;
 Mon,  6 Apr 2026 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775494658;
 bh=eUW96pLUR4wupO1v7H5z+4Xhqg02zqX6QOUXKl8i8dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J44qgZ0XUvWqRBokm/p00TxKfVWlRRpY3kHi0xc4MwW/Vu+HhSY5ISfSX1m5wsy/k
 EpkWuANaGbmQj4kharil23OAzTNQGQcLhsziOVmWRqBOz0QdrLsMEVNOhbtQqxxzG7
 qf8t9Fgsxlinv3Up4kFGGt7Skix+oma4rHq/z5URCM33MmgTSzMf43rknW5fqE09Xp
 NgqKXbQCehsfKkCRAQ5zPRcvDmnMNA/KLEy2p4Sl4TbQRzyazKb0/jlVQhk8Ap+sSm
 592M6WjXFRPi6UKTdIr2/TQPwSVFokwJKEzpHm8slHSy3cEsG3KmyW49S3CEGz3IMo
 4xBjwB1iH/wpA==
Date: Mon, 6 Apr 2026 16:57:36 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <adPmAB2H199TpADN@google.com>
References: <20260406154940.2407853-1-jaegeuk@kernel.org>
 <CACOAw_wVA1QvaWJS4ShVbEm97iK1_MpT6p4k8ZaLmTy1R7DQrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_wVA1QvaWJS4ShVbEm97iK1_MpT6p4k8ZaLmTy1R7DQrg@mail.gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/06, Daeho Jeong wrote: > On Mon, Apr 6, 2026 at 8:56
 AM Jaegeuk Kim via Linux-f2fs-devel > <linux-f2fs-devel@lists.sourceforge.net>
 wrote: > > > > Let's check mmmap writes onto the large folio. [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w9nGi-0004Zc-HB
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not support mmap write for large
 folio
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 88BFE3A57EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDQvMDYsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIE1vbiwgQXByIDYsIDIwMjYgYXQgODo1
NuKAr0FNIEphZWdldWsgS2ltIHZpYSBMaW51eC1mMmZzLWRldmVsCj4gPGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPiA+Cj4gPiBMZXQncyBjaGVjayBtbW1h
cCB3cml0ZXMgb250byB0aGUgbGFyZ2UgZm9saW8uCj4gCj4gdHlwbz8gbW1hcD8KPiAKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0t
Cj4gPiAgZnMvZjJmcy9maWxlLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5j
IGIvZnMvZjJmcy9maWxlLmMKPiA+IGluZGV4IDJjNDg4MGYyNGI1NC4uZWRmYzNhMzc0YzQwIDEw
MDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4g
PiBAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgdm1fZmF1bHRfdCBmMmZzX3ZtX3BhZ2VfbWt3cml0
ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiA+ICAgICAgICAgaW50IGVyciA9IDA7Cj4gPiAgICAg
ICAgIHZtX2ZhdWx0X3QgcmV0Owo+ID4KPiA+IC0gICAgICAgaWYgKHVubGlrZWx5KElTX0lNTVVU
QUJMRShpbm9kZSkpKQo+IAo+IERpZCB5b3UgcmVtb3ZlIHRoaXMgaW50ZW50aW9uYWxseT8KCkFo
LCBsZXQgbWUgcmVtYWluIGl0IGJhY2sgdG8gaXNvbGF0ZSB0aGUgY2hhbmdlLgoKPiAKPiA+ICsg
ICAgICAgaWYgKG1hcHBpbmdfbGFyZ2VfZm9saW9fc3VwcG9ydChpbm9kZS0+aV9tYXBwaW5nKSkK
PiA+ICAgICAgICAgICAgICAgICByZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwo+ID4KPiA+ICAgICAg
ICAgaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9DT01QUkVTU19SRUxFQVNFRCkpIHsK
PiA+IC0tCj4gPiAyLjUzLjAuMTIxMy5nZDlhMTQ5OTRkZS1nb29nCj4gPgo+ID4KPiA+Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
