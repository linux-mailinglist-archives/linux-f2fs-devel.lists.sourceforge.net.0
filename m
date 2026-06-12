Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iU0TDcmDK2qe+wMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 05:58:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C16767FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 05:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="Cbo8/btz";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=e3MqBnmW;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Sc3sfezN;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=M9fNL7i0;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:google.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHl7CbOnX9IqKtBBF5mPjg7UmbGTIiPFUDqY+ApmxXg=; b=Cbo8/btzAflYoxyn34E8c4gOhD
	l8UdvSxBatxt7decLdz4LXuFWPXl3K18gPKRDO4JeDIj61R/ibGU7xEn4cY17g/yQQxa4dTpFuq7p
	1FY6Jg5PnaNQO7kBjk9RrIWvIroQMuYFC6AjiuJUqvDeNA4k8wLji8YcId9r91z2Lnq4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXt1g-0003Fx-BS;
	Fri, 12 Jun 2026 03:57:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangzhaoyang@gmail.com>) id 1wXt1f-0003Fr-Dh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 03:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0I9aBZFDwitY3nwx97QCL9W7YkzFqKeUfkDMlpUFLFI=; b=e3MqBnmWAaBcxURHfrmqu37btw
 /NGwm1z7+H5I/1PIGwFWDB534NyIrEI0Ey5Wx/nl3ZErcmYEgu9GlV+Bt0gLgatyfpCKBQY6ivHbI
 H5IhtkMfHEWf13Kn9EsxLynz0TyPVHs7mzLSWaBAWfCTkrEJL/jqKUprkxDRGMtf31ws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0I9aBZFDwitY3nwx97QCL9W7YkzFqKeUfkDMlpUFLFI=; b=Sc3sfezNBCZHuf+rSfEjGWod4d
 xWhpB/QS1mjUC/X0UYsM0NQrnbfoGrlvIHciYbW4qON/BqmHCfWFyq3hEiy1zcuKNnbfnxflhtTOx
 pEUD+KnLWKqwYWxwDmmzKrhUI4RZmBgSFQs11e2WSrG4LnoKZ4FggmXSxlMMmqRULA7g=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wXt1e-0005Rb-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 03:57:48 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-39666c7c910so794401fa.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jun 2026 20:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781236655; cv=none;
 d=google.com; s=arc-20240605;
 b=dnVtcKPZqCuLULZQBQwt4QnNvu1mxfnljiGWdNIxNf6qmTPFZEnVu6zS6KJRrFQLhE
 AoMmV7aLKaxfyfxcGWB8m6BpBuzib0NWvQwgV2QKhOXuqrJCigugiZZY9dIOHrHAuPef
 3/rvARmJpoIskaZK5tOEImypVIRwTCq71nBPMyWs9znxfXIyVhRGVy/XYmLLbCIfa6A8
 mL4i7x/48gjOoX01y7Pa6OoHfZJJy33FrdrXCXhnfEGB0gs3vrm57d/4dxvwqhF+0lWM
 F17XXjLu36qYib+QENnSSiZjgUk7xR+g+RO/oyLLgty38Dfs5gPBTxMEMXxhI6HSNkkj
 Ze5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0I9aBZFDwitY3nwx97QCL9W7YkzFqKeUfkDMlpUFLFI=;
 fh=k6Fo90fpv6g/mYhLoPzg5UkxsPaUof228DejueHRAg8=;
 b=Gw2eKycDrmfRYzOxH8vjHHIhqFI66U6SmF13sDebWvocYVrRs+cwKp9rPYOPMDiH4s
 T4avNI1U6RYixwFk9hwhTRlKupQ19uEK+kDVEKEW+WHopPcddzNmCvShfIypEyGuZywV
 GX6ywQph8jUPdhps21ARIt5CgRRZZVj+KlpQLMhgOaozqjogwQiqpdSIhlARi9MtX5Sa
 NSMpWehXaiGNjubOtFe2a45aUEqoSdmdJcEpRUhAegiQPFaXHkF+7MWz/oj2aX/MG3SY
 BMbjY9Uvt2lAz5XOrZJPpgSHR/I/Qw/XzIG5IPCdvP+TW6q3ih3c4m+/T7TR9Oi2fypb
 ovSg==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781236655; x=1781841455; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0I9aBZFDwitY3nwx97QCL9W7YkzFqKeUfkDMlpUFLFI=;
 b=M9fNL7i0ZJnpQUFJ9XYfEGeFdYHMXaw04tFvDHtFt71r9SCPit40sMFUJ8tORJ5ihS
 EM+b7urzlzJ0GnFCXpQnKeBx5k+pR8IqnZB8iQjyuw9y7jvHJPTb7U3XAi1GBt+HVWQz
 5txUDdQ2eXD1EK7FwEb9V1pdNUriGBhKln1PKsxgqd79tgaJ7vQL+NHrxnq6cz7MJhjG
 HpD3PVHjOVTIiNJqooHYF7imAZtaumeQzqjnATIV3MPsAX2prw6CW6QyDn7dIw5LS1Up
 Wq2SL8DKWYN+1mqvwMdh92vVgxeB6mvXphY/dogyQM0DStOdJi0SY1Xj1DvdkWaw5ZnG
 YRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781236655; x=1781841455;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0I9aBZFDwitY3nwx97QCL9W7YkzFqKeUfkDMlpUFLFI=;
 b=Sssr60cgdjTVIZqkR6Kde1H92rzinh3FG3jq6vls4C+NnmPFSNKAR7IPeqvTENbgGQ
 L+7LSgk0g3eKIJtPPu73PFKzg3q2wp0OEJE1dGui5IxI+WkDHQCbXjKjWIfjuLhkPR4x
 8mwSjnEy+V8lLUMVR/cX0RHzdieW82kRLZAtWrfjGK04NQ+0UICVjGLZaP2Wvht96NRK
 Z+YyjdUp3IElD2MGBJ94rqxUCUfKT71kiD64Ffp+uM+nEOFcvQVtnkbbXtJRff4Kg+XV
 yVdlMOqzd4fIF942L8gwwzI45D3j9rW70zJIlnTtFxscJcGXoHmXm7cicZcy7YKH+ked
 +CPA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+I/Yy+CzeQQ2hVsQFnuPRSF+itoQw9iXPDGTeeBvDy48LEC+wlxEDbstI0qw34uaCYkd9bO3cWbwrHm46Ng79J@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzzxpt7G9iSu/rAwHk0Z+e9PFnttTvq4K3yoXn87479Ml5R8JfY
 C3RV6sHogegyHPcVzZ9NSKc62uFQ1FeV65XHR1sKhGi2Ck/GC6XK70CeBuBvANH9PU6Ccbtd8d1
 OLSoMZkFP5oJRdjpY2VmH1lWGHF+4gBI=
X-Gm-Gg: Acq92OG35LHawi+fBNlf4CtbCJcfsNHtxN9ts4XjdapXs/fVbdcHjobn2rFpw85pYeV
 pIDHCH2IW2ovmnpAVeX+cGTME4Ot4ea+3cUDMdlokxaVKxDYqUmTERMiVuAOHEJen8DKDjGRh6z
 0qsbQ2QW/AgM+tAQOvrxrFBlPDjC0Wc7Hoo21mEeSfL2V94j2D3Sle675IFM7/lyL7nsEkuqp/Y
 /m05LphVrna8/1wXIx8Ghk7TCnYyUADTOwEUQ9LHLNjBxosziKP7TkSFOZEPjlCNE5vMqTWvX80
 QtGe19RQ
X-Received: by 2002:a05:651c:2224:b0:396:92eb:36a0 with SMTP id
 38308e7fff4ca-3992ab81a76mr1335531fa.0.1781236655064; Thu, 11 Jun 2026
 20:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260608090939.2190185-1-zhaoyang.huang@unisoc.com>
 <f3948889-4ac3-422b-8dcf-fd3a7c27b304@kernel.org>
In-Reply-To: <f3948889-4ac3-422b-8dcf-fd3a7c27b304@kernel.org>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Fri, 12 Jun 2026 11:57:22 +0800
X-Gm-Features: AVVi8CeUVmNSWLBwrHaGkLkel36VrOfc564JIpLQqT2d6078vW6J2XKw4FSnuLc
Message-ID: <CAGWkznFAp_grS3cFJrx4tndzVULjcF8dgQ3VqFe9UAZ6R7d-jg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 12, 2026 at 11:26 AM Chao Yu wrote: > > On 6/8/26
 17:09, zhaoyang.huang wrote: > > From: Zhaoyang Huang > > > > This reverts
 commit 9609dd704725a40cd63d915f2ab6c44248a44598. > > > > Th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [huangzhaoyang(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.169 listed in wl.mailspike.net]
X-Headers-End: 1wXt1e-0005Rb-M2
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: remove non-uptodate folio from
 the page cache in move_data_block"
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:steve.kang@unisoc.com,m:zhaoyang.huang@unisoc.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[huangzhaoyang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huangzhaoyang@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,mail.gmail.com:mid,unisoc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C4C16767FB

T24gRnJpLCBKdW4gMTIsIDIwMjYgYXQgMTE6MjbigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gNi84LzI2IDE3OjA5LCB6aGFveWFuZy5odWFuZyB3cm90ZToKPiA+
IEZyb206IFpoYW95YW5nIEh1YW5nIDx6aGFveWFuZy5odWFuZ0B1bmlzb2MuY29tPgo+ID4KPiA+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgOTYwOWRkNzA0NzI1YTQwY2Q2M2Q5MTVmMmFiNmM0NDI0OGE0
NDU5OC4KPiA+Cj4gPiBUaGUga2VybmVsIHBhbmljcyBhcmUga2VlcGluZyB0byBiZSByZXBvcnRl
ZCBlc3BlY2lhbGx5IHdoZW4gdGhlIGYyZnMKPiA+IHBhcnRpdGlvbiBnZXQgYWxtb3N0IGZ1bGwu
IEJ5IGludmVzdGlnYXRpb24sIHdlIGZpbmQgdGhhdCB0aGUgcmVhc29uIGlzCj4gPiBvbmUgZjJm
cyBwYWdlIGdvdCBmcmVlZCB0byBidWRkeSB3aXRob3V0IGJlaW5nIGRlbGV0ZWQgZnJvbSBMUlUg
YW5kIHRoZQo+ID4gcm9vdCBjYXVzZSBpcyB0aGUgcmFjZSBoYXBwZW5lZCBpbiBbMl0gd2hpY2gg
aXMgZW5yb2xsZWQgYnkgdGhpcyBjb21taXQuCj4gPgo+ID4gVGhlcmUgYXJlIDMgcmFjZSBwcm9j
ZXNzZXMgaW4gdGhpcyBzY2VuYXJpbywgcGxlYXNlIGZpbmQgYmVsb3cgZm9yIHRoZWlyCj4gPiBt
YWluIGFjdGl2aXRpZXMuCj4gPgo+ID4gVGhlIGNoYW5nZWQgY29kZSBpbiBtb3ZlX2RhdGFfYmxv
Y2soKSBsZXRzIHRoZSBHQyBwYXRoIGV2aWN0IHRoZSB0YWlsLWVuZAo+ID4gZm9saW8gZnJvbSB0
aGUgcGFnZSBjYWNoZSB0aHJvdWdoIGZvbGlvX2VuZF9kcm9wYmVoaW5kKCkuICBPbmNlCj4gPiBm
b2xpb191bm1hcF9pbnZhbGlkYXRlKCkgcmVtb3ZlcyB0aGUgZm9saW8gZnJvbSBtYXBwaW5nLT5p
X3BhZ2VzLCB0aGUKPiA+IHBhZ2UtY2FjaGUgcmVmZXJlbmNlcyBmb3IgYWxsIHBhZ2VzIGluIHRo
ZSBmb2xpbyBhcmUgZHJvcHBlZC4gIFRoZSBmb2xpbwo+ID4gaXMgdGhlbiBrZXB0IGFsaXZlIG9u
bHkgYnkgdGVtcG9yYXJ5IGV4dGVybmFsIHJlZmVyZW5jZXMsIHdoaWNoIGFsbG93cyBhCj4gPiBs
YXRlciBzcGxpdCB0byBvcGVyYXRlIG9uIGEgZm9saW8gd2hvc2Ugc3VicGFnZXMgYXJlIG5vIGxv
bmdlciBwcm90ZWN0ZWQKPiA+IGJ5IHBhZ2UtY2FjaGUgcmVmZXJlbmNlcy4KPiA+Cj4gPiBBZnRl
ciB0aGUgcGFnZS1jYWNoZSByZWZlcmVuY2VzIGFyZSBnb25lLCBzcGxpdF9mb2xpb190b19vcmRl
cigpIGNhbgo+ID4gc3BsaXQgdGhlIGJpZyBmb2xpbyBpbnRvIGluZGl2aWR1YWwgcGFnZXMgYW5k
IHB1dCB0aGUgcmVzdWx0aW5nIHN1YnBhZ2VzCj4gPiBiYWNrIG9uIHRoZSBMUlUuICBGb3IgdGFp
bCBwYWdlcyBiZXlvbmQgRU9GLCBzcGxpdCByZW1vdmVzIHRoZW0gZnJvbSB0aGUKPiA+IHBhZ2Ug
Y2FjaGUgYW5kIGRyb3BzIHRoZWlyIHBhZ2UtY2FjaGUgcmVmZXJlbmNlcy4gIEEgdGFpbCBwYWdl
IGNhbiB0aGVuCj4gPiByZW1haW4gb24gdGhlIExSVSB3aXRoIFBHX2xydSBzZXQgd2hpbGUgaG9s
ZGluZyBvbmx5IHRoZSBzcGxpdCBjYWxsZXIncwo+ID4gdGVtcG9yYXJ5IHJlZmVyZW5jZS4gIFdo
ZW4gZnJlZV9mb2xpb19hbmRfc3dhcF9jYWNoZSgpIGRyb3BzIHRoYXQgZmluYWwKPiA+IHJlZmVy
ZW5jZSwgdGhlIHBhZ2UgZW50ZXJzIHRoZSBmaW5hbCBmb2xpb19wdXQoKSByZWxlYXNlIHBhdGgu
Cj4gPgo+ID4gSW4gcGFyYWxsZWwsIGZvbGlvX2lzb2xhdGVfbHJ1KCkgY2FuIG9ic2VydmUgdGhl
IHNhbWUgdGFpbCBwYWdlIHdpdGggYQo+ID4gbm9uLXplcm8gcmVmY291bnQgYW5kIFBHX2xydSBz
ZXQuICBJdCBjbGVhcnMgUEdfbHJ1IGJlZm9yZSB0YWtpbmcgaXRzIG93bgo+ID4gcmVmZXJlbmNl
LiAgSWYgdGhpcyByYWNlcyB3aXRoIHRoZSBmaW5hbCBmb2xpb19wdXQoKSBmcm9tIHRoZSBzcGxp
dCBwYXRoLAo+ID4gX19mb2xpb19wdXQoKSBzZWVzIFBHX2xydSBhbHJlYWR5IGNsZWFyZWQgYW5k
IHNraXBzIGxydXZlY19kZWxfZm9saW8oKS4KPiA+IFRoZSBwYWdlIGlzIHRoZW4gZnJlZWQgYmFj
ayB0byB0aGUgYWxsb2NhdG9yIHdoaWxlIGl0cyBscnUgbGlua3MgYXJlCj4gPiBzdGlsbCBwcmVz
ZW50IGluIHRoZSBMUlUgbGlzdC4gIEEgbGF0ZXIgTFJVIG9wZXJhdGlvbiBvbiBhIG5laWdoYm9y
aW5nCj4gPiBwYWdlIGRldGVjdHMgdGhlIHN0YWxlIGxpbmsgYW5kIHJlcG9ydHMgbGlzdCBjb3Jy
dXB0aW9uLgo+ID4KPiA+IFsxXQo+ID4gWyAgIDIyLjQ4NjA4Ml0gbGlzdF9kZWwgY29ycnVwdGlv
bi4gbmV4dC0+cHJldiBzaG91bGQgYmUgZmZmZmZmZmVjMTBlMGFjOCwgYnV0IHdhcyBkZWFkMDAw
MDAwMDAwMTIyLiAobmV4dD1mZmZmZmZmZWMxMGUwYTg4KQo+ID4gWyAgIDIyLjQ4NjEzMF0gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiBbICAgMjIuNDg2MTM0XSBrZXJu
ZWwgQlVHIGF0IGxpYi9saXN0X2RlYnVnLmM6NjchCj4gPiBbICAgMjIuNDg2MTQxXSBJbnRlcm5h
bCBlcnJvcjogT29wcyAtIEJVRzogMDAwMDAwMDBmMjAwMDgwMCBbIzFdICBTTVAKPiA+IFsgICAy
Mi40ODg1MDJdIFRhaW50ZWQ6IFtXXT1XQVJOLCBbT109T09UX01PRFVMRQo+ID4gWyAgIDIyLjQ4
ODUwNl0gSGFyZHdhcmUgbmFtZTogU3ByZWFkdHJ1bSBVTVM5MjMwIDFIMTAgU29DIChEVCkKPiA+
IFsgICAyMi40ODg1MTFdIHBzdGF0ZTogNjA0MDAwYzUgKG5aQ3YgZGFJRiArUEFOIC1VQU8gLVRD
TyAtRElUIC1TU0JTIEJUWVBFPS0tKQo+ID4gWyAgIDIyLjQ4ODUxN10gcGMgOiBfX2xpc3RfZGVs
X2VudHJ5X3ZhbGlkX29yX3JlcG9ydCsweDE0Yy8weDE1NAo+ID4gWyAgIDIyLjQ4ODUzMV0gbHIg
OiBfX2xpc3RfZGVsX2VudHJ5X3ZhbGlkX29yX3JlcG9ydCsweDE0Yy8weDE1NAo+ID4gWyAgIDIy
LjQ4ODUzOV0gc3AgOiBmZmZmZmZjMDgwMDZiODMwCj4gPiBbICAgMjIuNDg4NTQyXSB4Mjk6IGZm
ZmZmZmMwODAwNmI4NjggeDI4OiAwMDAwMDAwMDAwMDAzMDIwIHgyNzogMDAwMDAwMDAwMDAwMDAw
MAo+ID4gWyAgIDIyLjQ4ODU1M10geDI2OiAwMDAwMDAwMDAwMDAwMDAwIHgyNTogMDAwMDAwMDAw
MDAwMDAwNCB4MjQ6IGZmZmZmZmZlYzEwZTBhYzAKPiA+IFsgICAyMi40ODg1NjRdIHgyMzogMDAw
MDAwMDAwMDAwMDBlOCB4MjI6IDAwMDAwMDAwMDAwMDAwMjQgeDIxOiBkZWFkMDAwMDAwMDAwMTIy
Cj4gPiBbICAgMjIuNDg4NTc0XSB4MjA6IGZmZmZmZmZlYzEwZTBhODggeDE5OiBmZmZmZmZmZWMx
MGUwYWM4IHgxODogZmZmZmZmYzA4MDA2MTA2MAo+ID4gWyAgIDIyLjQ4ODU4NV0geDE3OiAyMDc0
NzU2MjIwMmMzODYzIHgxNjogNjEzMDY1MzAzMTYzNjU2NiB4MTU6IDAwMDAwMDAwMDAwMDAwNTgK
PiA+IFsgICAyMi40ODg1OTVdIHgxNDogMDAwMDAwMDAwMDAwMDAwNCB4MTM6IGZmZmZmZjgwZjkx
ZTAwMDAgeDEyOiAwMDAwMDAwMDAwMDAwMDAzCj4gPiBbICAgMjIuNDg4NjA1XSB4MTE6IDAwMDAw
MDAwMDAwMDAwMDMgeDEwOiAwMDAwMDAwMDAwMDAwMDAxIHg5IDogZmZlODU3MjFmMGUyNWYwMAo+
ID4gWyAgIDIyLjQ4ODYxNV0geDggOiBmZmU4NTcyMWYwZTI1ZjAwIHg3IDogMDAwMDAwMDAwMDAw
MDAwMCB4NiA6IDZjNjU2NDVmNzQ3MzY5NmMKPiA+IFsgICAyMi40ODg2MjVdIHg1IDogZmZmZmZm
ZWQzOWIyMzAyNiB4NCA6IDAwMDAwMDAwMDAwMDAwMDAgeDMgOiAwMDAwMDAwMDAwMDAwMDEwCj4g
PiBbICAgMjIuNDg4NjM2XSB4MiA6IDAwMDAwMDAwMDAwMDAwMDAgeDEgOiAwMDAwMDAwMDAwMDAw
MDAwIHgwIDogMDAwMDAwMDAwMDAwMDA2ZAo+ID4gWyAgIDIyLjQ4ODY0N10gQ2FsbCB0cmFjZToK
PiA+IFsgICAyMi40ODg2NTFdICBfX2xpc3RfZGVsX2VudHJ5X3ZhbGlkX29yX3JlcG9ydCsweDE0
Yy8weDE1NCAoUCkKPiA+IFsgICAyMi40ODg2NjFdICBfX2ZvbGlvX3B1dCsweDJiYy8weDQzNAo+
ID4gWyAgIDIyLjQ4ODY3MF0gIGZvbGlvX3B1dCsweDI4LzB4NTgKPiA+IFsgICAyMi40ODg2Nzhd
ICBkb19nYXJiYWdlX2NvbGxlY3QrMHgxYTM0LzB4MjU4NAo+ID4gWyAgIDIyLjQ4ODY4OV0gIGYy
ZnNfZ2MrMHgyMzAvMHg5YjQKPiA+IFsgICAyMi40ODg2OTddICBmMmZzX2ZhbGxvY2F0ZSsweGI5
MC8weGRmNAo+ID4gWyAgIDIyLjQ4ODcwNl0gIHZmc19mYWxsb2NhdGUrMHgxYjQvMHgyYmMKPiA+
IFsgICAyMi40ODg3MTZdICBfX2FybTY0X3N5c19mYWxsb2NhdGUrMHg0NC8weDc4Cj4gPiBbICAg
MjIuNDg4NzI1XSAgaW52b2tlX3N5c2NhbGwrMHg1OC8weGU0Cj4gPiBbICAgMjIuNDg4NzMyXSAg
ZG9fZWwwX3N2YysweDQ4LzB4ZGMKPiA+IFsgICAyMi40ODg3MzldICBlbDBfc3ZjKzB4M2MvMHg5
OAo+ID4gWyAgIDIyLjQ4ODc0N10gIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MjAvMHgxMzAKPiA+
IFsgICAyMi40ODg3NTRdICBlbDB0XzY0X3N5bmMrMHgxYzQvMHgxYzgKPiA+Cj4gPiBbMl0KPiA+
IENQVTAgKGYyZnMgR0MpICAgICAgICAgICAgICBDUFUxIChzcGxpdF9mb2xpb190b19vcmRlcikg
ICAgICAgICAgQ1BVMiAoZm9saW9faXNvbGF0ZV9scnUpCj4gPgo+ID4gRjogcGFnZWNhY2hlIHJl
ZnMgPSBuCj4gPiBGOiBleHRyYSByZWZzID0gR0MgKyBzcGxpdAo+ID4gRjogUEdfbHJ1IHNldAo+
ID4gbW92ZV9kYXRhX2Jsb2NrKCkKPiA+IGZvbGlvID0gZjJmc19ncmFiX2NhY2hlX2ZvbGlvKEYp
Cj4gPiAuLi4KPiA+IF9fZm9saW9fc2V0X2Ryb3BiZWhpbmQoRikKPiA+IGZvbGlvX3VubG9jayhG
KQo+ID4gZm9saW9fZW5kX2Ryb3BiZWhpbmQoRikKPiA+ICAgIGZvbGlvX3VubWFwX2ludmFsaWRh
dGUoRikKPiA+ICAgICAgX19maWxlbWFwX3JlbW92ZV9mb2xpbyhGKQo+ID4gICAgICBmb2xpb19w
dXRfcmVmcyhGLCBuKQo+ID4gZm9saW9fcHV0KEYpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNwbGl0X2ZvbGlvX3RvX29yZGVyKEYpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZm9saW9fcmVmX2ZyZWV6ZShGLCAxKQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC4uLgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxydV9hZGRf
c3BsaXRfZm9saW8oVCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3Rf
YWRkX3RhaWwoJlQtPmxydSwgJkYtPmxydSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZvbGlvX3NldF9scnUoVCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2ZpbGVtYXBfcmVtb3ZlX2ZvbGlvKFQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZm9saW9fcHV0X3JlZnMoVCwgMSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBUIHJlZmNvdW50ID09IDEsIFBhZ2VMUlUgc2V0ICovCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9s
aW9faXNvbGF0ZV9scnUoVCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX3Rlc3RfY2xlYXJfbHJ1KFQp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWVfZm9saW9fYW5kX3N3YXBfY2Fj
aGUoVCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19wdXQoVCkKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHJlZmNvdW50OiAxIC0+IDAgKi8K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZm9saW9fcHV0KFQpCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fcGFnZV9jYWNoZV9yZWxlYXNlKFQp
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fdGVzdF9scnUo
VCkgPT0gZmFsc2UKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBz
a2lwIGxydXZlY19kZWxfZm9saW8oVCkgKi8KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZnJlZV9mcm96ZW5fcGFnZXMoVCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19nZXQoVCkK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBscnV2ZWNfZGVsX2ZvbGlvKFQpCj4gPiBsYXRlcjoKPiA+ICAgIGxpc3Rf
ZGVsKGFkamFjZW50LT5scnUpCj4gPiAgICAgIG5leHQgPT0gJlQtPmxydQo+ID4gICAgICBuZXh0
LT5wcmV2ID09IExJU1RfUE9JU09OIC8gUENQIGZyZWVsaXN0Cj4gPiAgICAgIEJVRwo+ID4KPgo+
IE1pc3NpbmcgRml4ZXMgYW5kIENjOiBzdGFibGUgbGluZXMuCj4KPiA+IFNpZ25lZC1vZmYtYnk6
IFpoYW95YW5nIEh1YW5nIDx6aGFveWFuZy5odWFuZ0B1bmlzb2MuY29tPgo+Cj4gSSBzdXNwZWN0
IHRoaXMgaXMgYSBidWcgb2YgTU0sIHdlIGNhbiByZXZlcnQgdGhpcyBmaXJzdCwgYW5kIHJlYXBw
bHkgYWZ0ZXIgd2UKPiBmaXggdGhpcyBpdXNzZSBpbiBNTS4KWWVzLiBUaGVyZSBpcyBhbm90aGVy
IG1haWxpbmcgdGhyZWFkIHRhbGtpbmcgYWJvdXQgdGhlIE1NIHRoaW5nIG9uCnRoaXMgaXNzdWUu
IFlvdSBhcmUgb24gdGhlIHNlbmQtdG8gbGlzdC4gSSB0aGluayBpdCBpcyBubyBuZWVkIHRvCnJl
dmVydCBpdCBpbiBhIGh1cnJ5IGlmIHlvdSBhcmUgYWxzbyBjb252aW5jZWQgYWJvdXQgbXkgYW5h
bHlzaXMgb24Kc3BsaXRfZm9saW8ncyBkZWZlY3QKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzIwMjYwNjEyMDIzNDU2LjI0MjQwNDQtMS16aGFveWFuZy5odWFuZ0B1bmlzb2MuY29t
LwoKCj4KPiBUaGFua3MsCj4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2djLmMgfCA2ICstLS0tLQo+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+ID4gaW5kZXggYmE5
MzAxMDkyNGMwLi4zMDg0ZTA1ZTIyZjIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+
ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+ID4gQEAgLTE0NjgsMTEgKzE0NjgsNyBAQCBzdGF0aWMgaW50
IG1vdmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBibG9ja190IGJpZHgsCj4gPiAg
IHB1dF9vdXQ6Cj4gPiAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+ID4gICBvdXQ6Cj4gPiAt
ICAgICBpZiAoIWZvbGlvX3Rlc3RfdXB0b2RhdGUoZm9saW8pKQo+ID4gLSAgICAgICAgICAgICBf
X2ZvbGlvX3NldF9kcm9wYmVoaW5kKGZvbGlvKTsKPiA+IC0gICAgIGZvbGlvX3VubG9jayhmb2xp
byk7Cj4gPiAtICAgICBmb2xpb19lbmRfZHJvcGJlaGluZChmb2xpbyk7Cj4gPiAtICAgICBmb2xp
b19wdXQoZm9saW8pOwo+ID4gKyAgICAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+ID4g
ICAgICAgcmV0dXJuIGVycjsKPiA+ICAgfQo+ID4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
